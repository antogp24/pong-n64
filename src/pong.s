
#>>table:normal
# +----------+--------+--------+--------+
# | 0  $zero | 8  $t0 | 16 $s0 | 24 $t8 |
# | 1  $at   | 9  $t1 | 17 $s1 | 25 $t9 |
# | 2  $v0   | 10 $t2 | 18 $s2 | 26 $k0 |
# | 3  $v1   | 11 $t3 | 19 $s3 | 27 $k1 |
# | 4  $a0   | 12 $t4 | 20 $s4 | 28 $gp |
# | 5  $a1   | 13 $t5 | 21 $s5 | 29 $sp |
# | 6  $a2   | 14 $t6 | 22 $s6 | 30 $fp |
# | 7  $a3   | 15 $t7 | 23 $s7 | 31 $ra |
# +----------+--------+--------+--------+

# >> C libdragon structs and enums that we use
# ----------------------------------------------- #
#
#
# //NOTE: sizeof(SI_condat) == 8 bytes == 64 bits
# typedef struct SI_condat {
#     unsigned : 16;    // unused padding
#     unsigned err : 2; // status of the last command
#     unsigned : 14;    // unused padding
#
#     union {
#         struct { unsigned int data : 32; };
#         struct {
#             unsigned A : 1;
#             unsigned B : 1;
#             unsigned Z : 1;
#             unsigned start : 1;
#             unsigned up : 1;
#             unsigned down : 1;
#             unsigned left : 1;
#             unsigned right : 1;
#             unsigned : 2;
#             unsigned L : 1;
#             unsigned R : 1;
#             unsigned C_up : 1;
#             unsigned C_down : 1;
#             unsigned C_left : 1;
#             unsigned C_right : 1;
#             signed x : 8;
#             signed y : 8;
#         };
#     };
# } _SI_condat;
#
# //NOTE: The memory of the return value of get_keys_down() is static (controller.o)
# //NOTE: Only care about keys.c[0]
# //NOTE: sizeof(controller) == 8*4*2 bytes == 64 bytes = 512 bits
# typedef struct controller_data {
#     struct SI_condat     c[4];
#     struct SI_condat_gc gc[4];
# } SI_controllers_state_t;
#
# typedef struct { int32_t width, height; bool interlaced; } resolution_t;
#
# typedef struct __attribute__((packed)) {
#     uint8_t r, g, b, a;
# } color_t;
#
# typedef enum {
#     DEPTH_16_BPP, // 0
#     DEPTH_32_BPP, // 1
# } bitdepth_t;
#
# typedef enum {
#     GAMMA_NONE,           // 0
#     GAMMA_CORRECT,        // 1
#     GAMMA_CORRECT_DITHER, // 2
# } gamma_t;
#
# typedef enum {
#     FILTERS_DISABLED,                    // 0
#     FILTERS_RESAMPLE,                    // 1
#     FILTERS_DEDITHER,                    // 2
#     FILTERS_RESAMPLE_ANTIALIAS,          // 3
#     FILTERS_RESAMPLE_ANTIALIAS_DEDITHER, // 4
# } filter_options_t;

.section .data
    .equ SCREEN_WIDTH,  320
    .equ SCREEN_HEIGHT, 240

    RESOLUTION:
        .word SCREEN_WIDTH
        .word SCREEN_HEIGHT

    .equ BALL_SIZE, 5
    .equ BALL_STARTING_X, ((SCREEN_WIDTH  - BALL_SIZE) / 2)
    .equ BALL_STARTING_Y, ((SCREEN_HEIGHT - BALL_SIZE) / 2)

    ball:
        ball_x: .word BALL_STARTING_X
        ball_y: .word BALL_STARTING_Y
        ball_vel_x: .word 1
        ball_vel_y: .word 1
        ball_speed: .word 1

    .equ PADDLE_WIDTH,  5
    .equ PADDLE_HEIGHT, 25
    .equ PADDLE_SPEED,  3

    .equ PADDLE_0_STARTING_X, 10
    .equ PADDLE_0_STARTING_Y, ((SCREEN_HEIGHT - PADDLE_HEIGHT) / 2)

    paddle_0:
        paddle_0_x: .word PADDLE_0_STARTING_X
        paddle_0_y: .word PADDLE_0_STARTING_Y
        paddle_0_score: .word 0

    .equ PADDLE_1_STARTING_X, (SCREEN_WIDTH - PADDLE_WIDTH - PADDLE_0_STARTING_X)
    .equ PADDLE_1_STARTING_Y, PADDLE_0_STARTING_Y

    paddle_1:
        paddle_1_x: .word PADDLE_1_STARTING_X
        paddle_1_y: .word PADDLE_1_STARTING_Y
        paddle_1_score: .word 0

    .equ Game_State_Serving, 0
    .equ Game_State_Playing, 1
    game_state:
        .word Game_State_Serving

.section .text

# args:
#     - a0: x coordinate
#     - a1: y coordinate
#     - a2: width
#     - a3: height
draw_rect:
    add $sp, $sp, -8
    sd  $ra, 0($sp)

    sll $a0, $a0, 2   # start_x: (x *= 4)
    sll $a1, $a1, 2   # start_y: (y *= 4)
    sll $a2, $a2, 2   # width  *= 4
    sll $a3, $a3, 2   # height *= 4
    add $a2, $a2, $a0 # end_x: (4x + 4*width)
    add $a3, $a3, $a1 # end_y: (4y + 4*height)
    jal __rdpq_fill_rectangle_fx

    ld  $ra, 0($sp)
    add $sp, $sp, 8
    jr  $ra


.globl main
main:
    addiu $sp, $sp, -240

    la  $t0, RESOLUTION
    ld  $a0, 0($t0) # res: first  8 bytes
    li  $a1, 0      # res.interlaced: false
    li  $a2, 1      # bit: DEPTH_32_BPP
    li  $a3, 3      # num_buffers: 3
    li  $t0, 2      # gamma: GAMMA_CORRECT_DITHER
    sw  $t0, 36($sp)
    li  $t0, 3      # filters: FILTERS_RESAMPLE_ANTIALIAS
    sw  $t0, 44($sp)
    jal display_init

    li $a0, 0 # DFS_DEFAULT_LOCATION
    jal dfs_init

    jal controller_init
    jal rdpq_init

    main_loop:
        jal display_get
        move $a0, $v0 # Move the result (surface_t*) into $a0
        move $a1, $0  # There is no Z-Buffer
        jal rdpq_attach_clear

        li  $a0, 0xFFFFFFFF
        jal rdpq_set_mode_fill

        lw $a0, ball_x
        lw $a1, ball_y
        li $a2, BALL_SIZE
        li $a3, BALL_SIZE
        jal draw_rect

        lw $a0, paddle_0_x
        lw $a1, paddle_0_y
        li $a2, PADDLE_WIDTH
        li $a3, PADDLE_HEIGHT
        jal draw_rect

        lw $a0, paddle_1_x
        lw $a1, paddle_1_y
        li $a2, PADDLE_WIDTH
        li $a3, PADDLE_HEIGHT
        jal draw_rect

        jal controller_scan
        # FIXME: This causes null pointer dereference at `ld t2, 0(a0)`
        # jal get_keys_held # returns `struct controller_data`

        lw $t0, game_state
        li $t1, Game_State_Serving
        beq $t0, $t1, case_serving
        case_playing:
            j case_none
        case_serving:
            # TODO: Should only be doing this if (keys.c[0].A)
            li $t0, Game_State_Playing
            sw $t0, game_state
        case_none:

        jal rdpq_detach_show
    j main_loop

    addiu $sp, $sp, 240
