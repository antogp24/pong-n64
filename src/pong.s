
# C libdragon structs and enums that I use
# ----------------------------------------------- #
#
# //NOTE: sizeof(SI_condat) == 8 bytes == 64 bits
# typedef struct SI_condat {
#     unsigned     : 16; // unused padding
#     unsigned err :  2; // status of the last command
#     unsigned     : 14; // unused padding
#
#     union {
#         struct { unsigned int data : 32; };
#         struct {
#             unsigned A : 1;       // Bit 32
#             unsigned B : 1;       // Bit 31
#             unsigned Z : 1;       // Bit 30
#             unsigned start : 1;   // Bit 29
#             unsigned up : 1;      // Bit 28
#             unsigned down : 1;    // Bit 27
#             unsigned left : 1;    // Bit 26
#             unsigned right : 1;   // Bit 25
#             unsigned : 2;         // Bits 24 to 23
#             unsigned L : 1;       // Bit 22
#             unsigned R : 1;       // Bit 21
#             unsigned C_up : 1;    // Bit 20
#             unsigned C_down : 1;  // Bit 19
#             unsigned C_left : 1;  // Bit 18
#             unsigned C_right : 1; // Bit 17
#             signed x : 8;         // Bits 16 to 8
#             signed y : 8;         // Bits 7 to 0
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

# Data Section
# ----------------------------------------------- #
.section .data
    .equ SCREEN_WIDTH,  320
    .equ SCREEN_HEIGHT, 240

    RESOLUTION:
        .word SCREEN_WIDTH
        .word SCREEN_HEIGHT

    # This gets modified by `get_keys_held`.
    KEYS_HELD:
        KEYS_HELD_CONTROLLER_0:          .double 0
        KEYS_HELD_CONTROLLER_1:          .double 0
        KEYS_HELD_CONTROLLER_2:          .double 0
        KEYS_HELD_CONTROLLER_3:          .double 0
        KEYS_HELD_GAMECUBE_CONTROLLER_0: .double 0
        KEYS_HELD_GAMECUBE_CONTROLLER_1: .double 0
        KEYS_HELD_GAMECUBE_CONTROLLER_2: .double 0
        KEYS_HELD_GAMECUBE_CONTROLLER_3: .double 0

    .equ BALL_SIZE, 5
    .equ BALL_STARTING_X,     ((SCREEN_WIDTH  - BALL_SIZE) / 2)
    .equ BALL_STARTING_Y,     ((SCREEN_HEIGHT - BALL_SIZE) / 2)
    .equ BALL_STARTING_SPEED, 1

    ball:
        ball_x:     .word BALL_STARTING_X
        ball_y:     .word BALL_STARTING_Y
        ball_vel_x: .word 1
        ball_vel_y: .word 1
        ball_speed: .word BALL_STARTING_SPEED

    .equ PADDLE_WIDTH,  5
    .equ PADDLE_HEIGHT, 25
    .equ PADDLE_SPEED,  3

    .equ PADDLE_0_STARTING_X, 10
    .equ PADDLE_0_STARTING_Y, ((SCREEN_HEIGHT - PADDLE_HEIGHT) / 2)

    paddle_0:
        paddle_0_x:     .word PADDLE_0_STARTING_X
        paddle_0_y:     .word PADDLE_0_STARTING_Y
        paddle_0_score: .word 0

    .equ PADDLE_1_STARTING_X, (SCREEN_WIDTH - PADDLE_WIDTH - PADDLE_0_STARTING_X)
    .equ PADDLE_1_STARTING_Y, PADDLE_0_STARTING_Y

    paddle_1:
        paddle_1_x:     .word PADDLE_1_STARTING_X
        paddle_1_y:     .word PADDLE_1_STARTING_Y
        paddle_1_score: .word 0

    .equ Game_State_Serving, 0
    .equ Game_State_Playing, 1
    game_state:
        .word Game_State_Serving

    .equ FONT_SIZE,         2
    .equ FONT_PIXEL_WIDTH,  4
    .equ FONT_PIXEL_HEIGHT, 5
    digits_font:
        digits_font_char_0:
            .byte 0b1111
            .byte 0b1001
            .byte 0b1001
            .byte 0b1001
            .byte 0b1111
        digits_font_char_1:
            .byte 0b0110
            .byte 0b0010
            .byte 0b0010
            .byte 0b0010
            .byte 0b0111
        digits_font_char_2:
            .byte 0b1111
            .byte 0b0001
            .byte 0b1111
            .byte 0b1000
            .byte 0b1111
        digits_font_char_3:
            .byte 0b1111
            .byte 0b0001
            .byte 0b1111
            .byte 0b0001
            .byte 0b1111
        digits_font_char_4:
            .byte 0b1001
            .byte 0b1001
            .byte 0b1111
            .byte 0b0001
            .byte 0b0001
        digits_font_char_5:
            .byte 0b1111
            .byte 0b1000
            .byte 0b1111
            .byte 0b0001
            .byte 0b1111
        digits_font_char_6:
            .byte 0b1111
            .byte 0b1000
            .byte 0b1111
            .byte 0b1001
            .byte 0b1111
        digits_font_char_7:
            .byte 0b1111
            .byte 0b0001
            .byte 0b0001
            .byte 0b0001
            .byte 0b0001
        digits_font_char_8:
            .byte 0b1111
            .byte 0b1001
            .byte 0b1111
            .byte 0b1001
            .byte 0b1111
        digits_font_char_9:
            .byte 0b1111
            .byte 0b1001
            .byte 0b1111
            .byte 0b0001
            .byte 0b0001


# Text Section
# ----------------------------------------------- #
.section .text

# args:
#     - a0: value
#     - a1: min
#     - a2: max
# returns:
#     - v0: min <= result <= max
clamp:
        slt $t0, $a0, $a1 # t0 = 1 if (value < min) else 0
        bne $t0, $zero, clamp__return_min
        slt $t0, $a0, $a2 # t0 = 0 if (value >= max) else 1
        beq $t0, $zero, clamp__return_max
        move $v0, $a0
        jr $ra
        clamp__return_min:
            move $v0, $a1
            jr $ra
        clamp__return_max:
            move $v0, $a2
            jr $ra


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


transition_to_serving:
    li $t0, PADDLE_0_STARTING_X
    sw $t0, paddle_0_x
    li $t0, PADDLE_0_STARTING_Y
    sw $t0, paddle_0_y

    li $t0, PADDLE_1_STARTING_X
    sw $t0, paddle_1_x
    li $t0, PADDLE_1_STARTING_Y
    sw $t0, paddle_1_y

    li $t0, BALL_STARTING_X
    sw $t0, ball_x
    li $t0, BALL_STARTING_Y
    sw $t0, ball_y

    li $t0, 1
    sw $t0, ball_vel_x
    sw $t0, ball_vel_y

    li $t0, BALL_STARTING_SPEED
    sw $t0, ball_speed

    li $t0, Game_State_Serving
    sw $t0, game_state

    jr $ra


# args:
#     - a0: paddle_x
#     - a1: paddle_y
# returns:
#     - v0: boolean result
does_ball_collide_with_paddle:
    lw $t0, ball_x
    lw $t1, ball_y

    # Check (ball_x + BALL_SIZE >= paddle_x)
    addi $t2, $t0, BALL_SIZE
    slt  $t2, $t2, $a0 # $t2 = 0 if (ball_x + BALL_SIZE >= paddle_x) else 1
    bne  $t2, $zero, ball_collided_with_paddle_false

    # Check (paddle_x + PADDLE_WIDTH >= ball_x)
    addi $t2, $a0, PADDLE_WIDTH
    slt  $t2, $t2, $t0 # $t2 = 0 if (paddle_x + PADDLE_WIDTH >= ball_x) else 1
    bne  $t2, $zero, ball_collided_with_paddle_false

    # Check (ball_y + BALL_SIZE >= paddle_y)
    addi $t2, $t1, BALL_SIZE
    slt  $t2, $t2, $a1 # $t2 = 0 if (ball_y + BALL_SIZE >= paddle_y) else 1
    bne  $t2, $zero, ball_collided_with_paddle_false

    # Check (paddle_y + PADDLE_HEIGHT >= ball_y)
    addi $t2, $a1, PADDLE_HEIGHT
    slt  $t2, $t2, $t1 # $t2 = 0 if (paddle_y + PADDLE_HEIGHT >= ball_y) else 1
    bne  $t2, $zero, ball_collided_with_paddle_false

    # Return true
    li $v0, 1
    jr $ra

    # Return false
    ball_collided_with_paddle_false:
    li $v0, 0
    jr $ra


# args:
#     - a0: la ball_vel_(x or y)
bounce_ball:
    # ball_vel_? *= -1
    lw  $t0, 0($a0)
    mul $t0, $t0, -1
    sw  $t0, 0($a0)
    jr $ra


accelerate_ball:
    # TODO: USE FLOATS (With integers the ball goes very fast).
    lw   $t0, ball_speed
    addi $t0, $t0, 1
    sw   $t0, ball_speed
    jr $ra


.equ MIDDLE_LINE_WIDTH, 2
.equ MIDDLE_LINE_HEIGHT, 10
.equ MIDDLE_LINE_PADDING, 5
.equ MIDDLE_LINE_OFFSET, 5
.equ MIDDLE_LINE_SEGMENTS, 15
draw_middle_line:
    add $sp, $sp, -16
    sd  $ra, 0($sp)
    sd  $s0, 8($sp)

    li $s0, 0
    draw_middle_line_loop:
        li   $a0, (SCREEN_WIDTH - MIDDLE_LINE_WIDTH) / 2
        mul  $a1, $s0, MIDDLE_LINE_HEIGHT  # y = i * height
        addi $s0, $s0, 1                   # i++
        mul  $t0, $s0, MIDDLE_LINE_PADDING #
        add  $a1, $a1, $t0                 # y += i * padding
        addi $a1, $a1, MIDDLE_LINE_OFFSET  # y += offset
        li   $a2, MIDDLE_LINE_WIDTH
        li   $a3, MIDDLE_LINE_HEIGHT
        jal  draw_rect

        slti $t0, $s0,   MIDDLE_LINE_SEGMENTS
        bne  $t0, $zero, draw_middle_line_loop

    ld  $ra, 0($sp)
    ld  $s0, 8($sp)
    add $sp, $sp, 16
    jr $ra


# args:
#     - a0: x
#     - a1: y
#     - a2: digit
draw_digit:
    slti $t0, $a2, 10
    #    $t0 = 0 if (digit >= 10) else 1
    beq  $t0, $zero, draw_digit__exit

    addi $sp, $sp, -48
    sd   $s0,  0($sp)
    sd   $s1,  8($sp)
    sd   $s2, 16($sp)
    sd   $s3, 24($sp)
    sd   $s4, 32($sp)
    sd   $ra, 40($sp)

    move $s2, $a0 # x
    move $s3, $a1 # y
    move $s4, $a2 # digit

    li $s0, 0 # row
    draw_digit__loop_row:
        li $s1, 0 # col
        draw_digit__loop_col:
            mul $t0, $s0, FONT_SIZE # row * font_size
            mul $t1, $s1, FONT_SIZE # col * font_size
            mul $t2, $s4, FONT_PIXEL_HEIGHT # digit * font_height

            la  $t3, digits_font
            add $t3, $t3, $t2 # += digit * font_height
            add $t3, $t3, $s0 # += row
            lb  $t3, 0($t3)   # digits_font[digit * font_height + row]

            li   $t4, 3
            sub  $t4, $t4, $s1 # (3 - col)
            srlv $t4, $t3, $t4 # digits_font[digit * font_height + row] >> (3 - col)
            andi $t4, $t4, 1
            beq  $t4, $zero, draw_digit__bit_is_NOT_set
                add  $a0, $s2, $t1  # x + col * font_size
                add  $a1, $s3, $t0  # y + row * font_size
                li   $a2, FONT_SIZE # width
                li   $a3, FONT_SIZE # height
                jal  draw_rect
            draw_digit__bit_is_NOT_set:
            addi $s1, $s1, 1
            slti $t0, $s1, FONT_PIXEL_WIDTH
            #    $t0 = 1 if (col < FONT_PIXEL_WIDTH) else 0
            bne  $t0, $zero, draw_digit__loop_col
        addi $s0, $s0, 1
        slti $t0, $s0, FONT_PIXEL_HEIGHT
        #    $t0 = 1 if (row < FONT_PIXEL_HEIGHT) else 0
        bne  $t0, $zero, draw_digit__loop_row

    ld   $s0,  0($sp)
    ld   $s1,  8($sp)
    ld   $s2, 16($sp)
    ld   $s3, 24($sp)
    ld   $s4, 32($sp)
    ld   $ra, 40($sp)
    addi $sp, $sp, 48

    draw_digit__exit:
    jr $ra


# args:
#     - a0: x where (x >= 0)
# returns:
#     - v0: number of digits in x
get_digit_count:
    li $v0, 0 # count
    get_digit_count__loop:
        beq  $a0, $zero, get_digit_count__exit
        divu $a0, $a0, 10
        addi $v0, $v0, 1
        j get_digit_count__loop
    get_digit_count__exit:
    jr $ra


# args:
#     - a0: x where (x >= 0)
# returns:
#     - v0: pow(10, x)
power_of_10:
    li $t0, 1  # i
    li $v0, 10 # result
    slti $t1, $a0, 1
    #    $t1 = 0 if (x >= 1) else 1
    bne  $t1, $zero, power_of_10__exit
    power_of_10__loop:
        mul  $v0, $v0, 10 # result *= 10
        addi $t0, $t0, 1  # i++
        slt  $t1, $t0, $a0
        #    $t1 = 1 if (i < x) else 0
        bne  $t1, $zero, power_of_10__loop
    power_of_10__exit:
    jr $ra


# args:
#     - a0: x
#     - a1: y
#     - a2: number
#     - a3: digit_count
draw_u32:
    addi $sp, $sp, -48
    sd   $s0,  0($sp)
    sd   $s1,  8($sp)
    sd   $s2, 16($sp)
    sd   $s3, 24($sp)
    sd   $s4, 32($sp)
    sd   $ra, 40($sp)

    move $s1, $a0 # x
    move $s2, $a1 # y
    move $s3, $a2 # number
    move $s4, $a3 # digit_count

    li $s0, 0 # i
    draw_u32__loop:
        move $a0, $s0
        jal  power_of_10   #           pow(10, i)
        div  $t0, $s3, $v0 #  number / pow(10, i)
        li   $t1, 10
        div  $t0, $t1      
        mfhi $t0           # (number / pow(10, i)) % 10

        mul $t1, $s0, FONT_SIZE            # i * font_size
        mul $t1, $t1, FONT_PIXEL_WIDTH + 1 # i * font_size * (font_width + 1)

        add  $a0, $s1, $t1 # x - (i * font_size * (font_width + 1))
        move $a1, $s2      # y
        move $a2, $t0      # digit
        jal draw_digit

        addi $s0, $s0, 1
        slt  $t0, $s0, $s4
        #    $t0 = 1 if (i < digit_count) else 0
        bne  $t0, $zero, draw_u32__loop

    ld   $s0,  0($sp)
    ld   $s1,  8($sp)
    ld   $s2, 16($sp)
    ld   $s3, 24($sp)
    ld   $s4, 32($sp)
    ld   $ra, 40($sp)
    addi $sp, $sp, 48
    jr $ra


draw_scores:
    addi $sp, $sp, -8
    sd   $ra, 0($sp)

    lw   $a0, paddle_0_score
    jal  get_digit_count

    li   $a0, SCREEN_WIDTH/2 - (2 * FONT_PIXEL_WIDTH * FONT_SIZE)
    li   $a1, 10
    lw   $a2, paddle_0_score
    move $a3, $v0
    jal  draw_u32

    lw   $a0, paddle_1_score
    jal  get_digit_count

    mul $t0, $v0, FONT_PIXEL_WIDTH * FONT_SIZE
    sub $t0, $zero, $t0

    addi $a0, $t0, SCREEN_WIDTH/2
    li   $a1, 10
    lw   $a2, paddle_1_score
    move $a3, $v0
    jal  draw_u32

    ld   $ra, 0($sp)
    addi $sp, $sp, 8
    jr $ra


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

        li  $t0, -1
        sb  $t0, 0($a0)
        sb  $t0, 1($a0)
        sb  $t0, 2($a0)
        li  $t0, 50
        sb  $t0, 3($a0)
        ld  $a0, 0($a0)
        jal rdpq_set_mode_fill
        jal draw_middle_line

        li  $a0, 0xFFFFFFFF
        jal rdpq_set_mode_fill

        jal draw_scores

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
        la $a0, KEYS_HELD
        jal get_keys_held

        lw $t0, game_state
        li $t1, Game_State_Serving
        beq $t0, $t1, case_serving

        case_playing:
            lw  $t1, ball_speed
            # Move the ball on the X Axis.
            lw  $t2, ball_vel_x
            mul $t2, $t2, $t1
            lw  $t0, ball_x
            add $t0, $t0, $t2
            sw  $t0, ball_x
            # Move the ball on the Y Axis.
            lw  $t2, ball_vel_y
            mul $t2, $t2, $t1
            lw  $t0, ball_y
            add $t0, $t0, $t2
            sw  $t0, ball_y

            # Checking if Player 0 moves up.
            lw   $t0, (4 + KEYS_HELD_CONTROLLER_0)($0)
            srl  $t0, $t0, 27 # Button (up) on bit 28
            andi $t0, $t0, 1
            beq  $t0, $zero, key_up_is_NOT_held
                lw   $t0, paddle_0_y
                addi $t0, $t0, -PADDLE_SPEED
                sw   $t0, paddle_0_y
            key_up_is_NOT_held:

            # Checking if Player 0 moves down.
            lw   $t0, (4 + KEYS_HELD_CONTROLLER_0)($0)
            srl  $t0, $t0, 26 # Button (down) on bit 27
            andi $t0, $t0, 1
            beq  $t0, $zero, key_down_is_NOT_held
                lw   $t0, paddle_0_y
                addi $t0, $t0, PADDLE_SPEED
                sw   $t0, paddle_0_y
            key_down_is_NOT_held:

            # Checking if Player 1 moves up.
            lw   $t0, (4 + KEYS_HELD_CONTROLLER_0)($0)
            srl  $t0, $t0, 19 # Button (C_up) on bit 20
            andi $t0, $t0, 1
            beq  $t0, $zero, key_C_up_is_NOT_held
                lw   $t0, paddle_1_y
                addi $t0, $t0, -PADDLE_SPEED
                sw   $t0, paddle_1_y
            key_C_up_is_NOT_held:

            # Checking if Player 1 moves down.
            lw   $t0, (4 + KEYS_HELD_CONTROLLER_0)($0)
            srl  $t0, $t0, 18 # Button (C_down) on bit 19
            andi $t0, $t0, 1
            beq  $t0, $zero, key_C_down_is_NOT_held
                lw   $t0, paddle_1_y
                addi $t0, $t0, PADDLE_SPEED
                sw   $t0, paddle_1_y
            key_C_down_is_NOT_held:

            # Clamping the first paddle's position to always appear in the screen.
            lw $a0, paddle_0_y
            li $a1, 0
            li $a2, SCREEN_HEIGHT - PADDLE_HEIGHT
            jal clamp
            sw $v0, paddle_0_y

            # Clamping the second paddle's position to always appear in the screen.
            lw $a0, paddle_1_y
            li $a1, 0
            li $a2, SCREEN_HEIGHT - PADDLE_HEIGHT
            jal clamp
            sw $v0, paddle_1_y

            # Ball collision with the ceiling or floor
            lw   $t0, ball_y
            slti $t1, $t0, 1
            #    $t1 = 1 if (ball_y <= 0) else 0
            bne  $t1, $zero, collided_with_ceiling_OR_floor
            slti $t1, $t0, SCREEN_HEIGHT - BALL_SIZE
            #    $t1 = 0 if (ball_y + BALL_SIZE >= SCREEN_HEIGHT) else 1
            bne  $t1, $zero, did_NOT_collide_with_ceiling_OR_floor
            collided_with_ceiling_OR_floor:
                la  $a0, ball_vel_y
                jal bounce_ball
            did_NOT_collide_with_ceiling_OR_floor:

            # Ball collision with the paddles.
            lw  $a0, paddle_0_x
            lw  $a1, paddle_0_y
            jal does_ball_collide_with_paddle
            bne $v0, $zero, ball_collided_with_paddle
            lw  $a0, paddle_1_x
            lw  $a1, paddle_1_y
            jal does_ball_collide_with_paddle
            beq $v0, $zero, ball_did_NOT_collide_with_paddle
            ball_collided_with_paddle:
                la  $a0, ball_vel_x
                jal bounce_ball
                jal accelerate_ball
            ball_did_NOT_collide_with_paddle:

            # Player 0 scored.
            lw   $t0, ball_x
            slti $t0, $t0, SCREEN_WIDTH - BALL_SIZE
            #    $t0 = 0 if (ball_x + BALL_SIZE >= SCREEN_WIDTH) else 1
            bne  $t0, $zero, player_0_did_not_score
                lw   $t0, paddle_0_score
                addi $t0, $t0, 1
                sw   $t0, paddle_0_score
                jal  transition_to_serving
            player_0_did_not_score:

            # Player 1 scored.
            lw   $t0, ball_x
            slti $t0, $t0, 1
            #    $t0 = 1 if (ball_x <= 0) else 0
            beq  $t0, $zero, player_1_did_not_score
                lw   $t0, paddle_1_score
                addi $t0, $t0, 1
                sw   $t0, paddle_1_score
                jal  transition_to_serving
            player_1_did_not_score:

            j case_none

        case_serving:
            # Checking for (A) being held (On lower bit position 32).
            lw   $t0, (4 + KEYS_HELD_CONTROLLER_0)($0)
            srl  $t0, $t0, 31
            andi $t0, $t0, 1
            beq $t0, $zero, case_none
                li $t0, Game_State_Playing
                sw $t0, game_state

        case_none:
        jal rdpq_detach_show
        j   main_loop

    addiu $sp, $sp, 240
