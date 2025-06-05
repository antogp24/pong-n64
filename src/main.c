#include <math.h>
#include <libdragon.h>

typedef uint8_t  u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

typedef int8_t  i8;
typedef int16_t i16;
typedef int32_t i32;
typedef int64_t i64;

typedef float  f32;
typedef double f64;

typedef union {
    struct {
        f32 x;
        f32 y;
    };
    f32 v[2];
} Vector2;

#define Sign(x) ((x) >= 0 ? 1 : -1)
#define ArrayCount(arr) (sizeof(arr)/sizeof(*(arr)))
#define Clamp(x, min, max) ((x) < (min) ? (min) : ((x) > (max) ? (max) : (x)))

#define no_inline __attribute__((noinline))

typedef struct {
    Vector2 pos;
    Vector2 vel;
    f32 speed;
} Ball;

typedef struct {
    Vector2 pos;
    u32 score;
} Paddle;

typedef enum {
    Game_State_Serving,
    Game_State_Playing,
} Game_State;

static Game_State g_game_state = Game_State_Serving;

#define SCREEN_WIDTH  320
#define SCREEN_HEIGHT 240
#define RESOLUTION RESOLUTION_320x240

#define FONT_SIZE 2
#define FONT_PIXEL_WIDTH  4
#define FONT_PIXEL_HEIGHT 5

#define BALL_SIZE 5
#define BALL_STARTING_X ((SCREEN_WIDTH - BALL_SIZE) / 2.0f)
#define BALL_STARTING_Y ((SCREEN_HEIGHT - BALL_SIZE) / 2.0f)

#define PADDLE_WIDTH  5
#define PADDLE_HEIGHT 25
#define PADDLE_SPEED  2.5f

#define PADDLE_0_STARTING_X 10
#define PADDLE_0_STARTING_Y ((SCREEN_HEIGHT - PADDLE_HEIGHT) / 2)

#define PADDLE_1_STARTING_X (SCREEN_WIDTH - PADDLE_WIDTH - PADDLE_0_STARTING_X)
#define PADDLE_1_STARTING_Y PADDLE_0_STARTING_Y


no_inline Vector2 vec2_scale(Vector2 const v, f32 const scale)
{
    return (Vector2){.x = v.x * scale, .y = v.y * scale};
}

no_inline Vector2 vec2_add(Vector2 const a, Vector2 const b)
{
    return (Vector2){.x = a.x + b.x, .y = a.y + b.y};
}

#define HasCollision(v0, w0, h0, v1, w1, h1) AABB((v0).x, (v0).y, w0, h0, (v1).x, (v1).y, w1, h1)

no_inline bool AABB(f32 x0, f32 y0, f32 w0, f32 h0,
                    f32 x1, f32 y1, f32 w1, f32 h1)
{
    return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
           (y0 + h0 >= y1 && y1 + h1 >= y0);
}

no_inline void draw_rect(i32 x, i32 y, i32 width, i32 height)
{
    __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
}

no_inline void draw_digit(i32 x, i32 y, u8 digit)
{
    if (digit > 9) {
        return;
    }

    static u8 digits_font[10][FONT_PIXEL_HEIGHT] = {
        [0] = {
            0b1111,
            0b1001,
            0b1001,
            0b1001,
            0b1111,
        },
        [1] = {
            0b0110,
            0b0010,
            0b0010,
            0b0010,
            0b0111,
        },
        [2] = {
            0b1111,
            0b0001,
            0b1111,
            0b1000,
            0b1111,
        },
        [3] = {
            0b1111,
            0b0001,
            0b1111,
            0b0001,
            0b1111,
        },
        [4] = {
            0b1001,
            0b1001,
            0b1111,
            0b0001,
            0b0001,
        },
        [5] = {
            0b1111,
            0b1000,
            0b1111,
            0b0001,
            0b1111,
        },
        [6] = {
            0b1111,
            0b1000,
            0b1111,
            0b1001,
            0b1111,
        },
        [7] = {
            0b1111,
            0b0001,
            0b0001,
            0b0001,
            0b0001,
        },
        [8] = {
            0b1111,
            0b1001,
            0b1111,
            0b1001,
            0b1111,
        },
        [9] = {
            0b1111,
            0b1001,
            0b1111,
            0b0001,
            0b0001,
        },
    };

    for (int row = 0; row < FONT_PIXEL_HEIGHT; row++) {
        for (int col = 0; col < FONT_PIXEL_WIDTH; col++) {
            u8 const bit = (digits_font[digit][row] >> (3 - col)) & 1;
            if (bit == 1) {
                draw_rect(x+col*FONT_SIZE, y+row*FONT_SIZE, FONT_SIZE, FONT_SIZE);
            }
        }
    }
}

no_inline void draw_u32(i32 x, i32 y, u32 number, u32 number_digit_count)
{
    for (u32 i = 0; i < number_digit_count; i++) {
        u8 const digit = (number / (u32)pow(10, i)) % 10;
        i32 const x_offset = (FONT_PIXEL_WIDTH + 1) * i * FONT_SIZE;
        draw_digit(x - x_offset, y, digit);
    }
}

no_inline u32 get_digit_count(u32 number)
{
    if (number == 0) {
        return 1;
    }
    return (u32)log10((f64)number) + 1;
}

no_inline static void draw_scores(u32 score1, u32 score2)
{
    u32 const score1_digit_count = get_digit_count(score1);
    i32 const score1_offset = 2 * FONT_PIXEL_WIDTH * FONT_SIZE;

    u32 const score2_digit_count = get_digit_count(score2);
    i32 const score2_offset = score2_digit_count * FONT_PIXEL_WIDTH * FONT_SIZE;

    draw_u32(SCREEN_WIDTH/2 - score1_offset, 10, score1, score1_digit_count);
    draw_u32(SCREEN_WIDTH/2 + score2_offset, 10, score2, score2_digit_count);
}

no_inline static void draw_middle_line(void)
{
    i32 const width = 2;
    i32 const height = 10;
    i32 const padding = 5;
    i32 const x = (SCREEN_WIDTH - width) / 2;
    i32 const segments = 15;

    rdpq_set_mode_fill(RGBA32(255, 255, 255, 50));

    for (i32 i = 0; i < segments; i++) {
        i32 y = 5 + i * height + padding * (i + 1);
        draw_rect(x, y, width, height);
    }
}

no_inline static void transition_to_serving(Paddle paddles[2], Ball *ball)
{
    paddles[0].pos = (Vector2){.x = PADDLE_0_STARTING_X, .y = PADDLE_0_STARTING_Y};
    paddles[1].pos = (Vector2){.x = PADDLE_1_STARTING_X, .y = PADDLE_1_STARTING_Y};

    ball->pos = (Vector2){.x = BALL_STARTING_X, .y = BALL_STARTING_Y};
    ball->vel = (Vector2){.x = 1.0f, .y = 1.0f};
    ball->speed = 1.0f;

    g_game_state = Game_State_Serving;
}

int main(void)
{
    display_init(RESOLUTION, DEPTH_32_BPP, 3, GAMMA_CORRECT_DITHER, FILTERS_RESAMPLE_ANTIALIAS);
    controller_init();
    rdpq_init();

    color_t const COLOR_WHITE = RGBA32(255, 255, 255, 255);

    Paddle paddles[2] = {
        {
            .pos = {.x = PADDLE_0_STARTING_X, .y = PADDLE_0_STARTING_Y},
            .score = 0,
        },
        {
            .pos = {.x = PADDLE_1_STARTING_X, .y = PADDLE_1_STARTING_Y},
            .score = 0,
        },
    };

    Ball ball = {
        .pos = {.x = BALL_STARTING_X, .y = BALL_STARTING_Y},
        .vel = {.x = 1.0f, .y = 1.0f},
        .speed = 1.0f,
    };

    while (1) {
        surface_t *disp = display_get();
        rdpq_attach_clear(disp, NULL);

        draw_middle_line();

        rdpq_set_mode_fill(COLOR_WHITE);
        draw_scores(paddles[0].score, paddles[1].score);
        draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
        draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
        draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);

        controller_scan();
        struct controller_data keys = get_keys_held();

        switch (g_game_state) {
            case Game_State_Playing:
            {
                ball.pos = vec2_add(ball.pos, vec2_scale(ball.vel, ball.speed));

                // Player 0 moves with Up and Down on the left D-Pad.
                if (keys.c[0].up) {
                    paddles[0].pos.y -= PADDLE_SPEED;
                } 
                if (keys.c[0].down) {
                    paddles[0].pos.y += PADDLE_SPEED;
                } 

                // Player 1 moves with Up and Down on the right D-Pad (C Keys).
                if (keys.c[0].C_up) {
                    paddles[1].pos.y -= PADDLE_SPEED;
                } 
                if (keys.c[0].C_down) {
                    paddles[1].pos.y += PADDLE_SPEED;
                } 

                // Ensuring the paddles don't go out of bounds.
                paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
                paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);

                // Ball collision with the ceiling or the floor.
                if (ball.pos.y + BALL_SIZE >= SCREEN_HEIGHT ||
                    ball.pos.y <= 0)
                {
                    ball.vel.y *= -1;
                    ball.speed *= 1.05;
                }

                // On paddle collision change direction and increase ball speed.
                for (int i = 0; i < ArrayCount(paddles); i++) {
                    if (HasCollision(
                            ball.pos, BALL_SIZE, BALL_SIZE,
                            paddles[i].pos, PADDLE_WIDTH, PADDLE_HEIGHT))
                    {
                        ball.vel.x *= -1;
                        ball.speed *= 1.05;
                    }
                }

                // Player 0 scored.
                if (ball.pos.x + BALL_SIZE >= SCREEN_WIDTH) {
                    paddles[0].score++;
                    transition_to_serving(paddles, &ball);
                }

                // Player 1 scored.
                if (ball.pos.x <= 0) {
                    paddles[1].score++;
                    transition_to_serving(paddles, &ball);
                }
            } break;

            case Game_State_Serving:
            {
                if (keys.c[0].A) {
                    g_game_state = Game_State_Playing;
                }
            } break;
        }

        rdpq_detach_show();
    }
}
