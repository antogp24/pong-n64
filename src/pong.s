.globl main

.section .data
    # Libdragon Constants
    # ------------------------------------------------------------------------------------------------- #
    # const resolution_t RESOLUTION_320x240 = {320, 240, false};
    RESOLUTION_320x240:
        .word   320 # width
        .word   240 # height
        .byte   0   # false
        .space  3   # Padding for alignment
    # ------------------------------------------------------------------------------------------------- #

.section .text

main:

    la $a0, RESOLUTION_320x240
    lw $a0, 0($a0)
    la $a1, RESOLUTION_320x240 + 4
    lw $a1, 0($a1)
    la $a2, RESOLUTION_320x240 + 8
    lb $a2, 0($a2)
    li $a3, 1 # DEPTH_32_BPP
    li $a4, 2 # 2 buffers
    li $a5, 2 # GAMMA_CORRECT_DITHER
    li $t0, 3 # FILTERS_RESAMPLE_ANTIALIAS
    jal display_init

    li $a0, 0 # DFS_DEFAULT_LOCATION
    jal dfs_init

    jal controller_init
    jal rdpq_init

main_loop:
    jal display_get
    move $a0, $v0 # Move the result (surface_t*) into $a0

    move $a1, $zero # There is no Z-Buffer
    jal rdpq_attach_clear

    jal rdpq_detach_show
    j main_loop
