	.section .mdebug.abiO64
	.previous
	.section .gcc_compiled_long32
	.previous
	.nan	legacy
	.module	fp=64
	.module	oddspreg
	.module	arch=vr4300

 # -G value = 8, Arch = vr4300, ISA = 3
 # GNU C99 (GCC) version 14.2.0 (mips64-elf)
 #	compiled by GNU C version 11.4.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version none
 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -march=vr4300 -mtune=vr4300 -mips3 -g -O2 -O0 -std=gnu99 -falign-functions=32 -ffunction-sections -fdata-sections -ffast-math -ftrapping-math -fno-associative-math -fno-dwarf2-cfi-asm -fno-inline -fno-builtin
	.text
$Ltext0:
	.file 1 "src/main.c"
	.section	.rodata.RESOLUTION_256x240,"a"
	.align	3
	.type	RESOLUTION_256x240, @object
	.size	RESOLUTION_256x240, 12
RESOLUTION_256x240:
 # width:
	.word	256
 # height:
	.word	240
 # interlaced:
	.byte	0
	.space	3
	.section	.rodata.RESOLUTION_320x240,"a"
	.align	3
	.type	RESOLUTION_320x240, @object
	.size	RESOLUTION_320x240, 12
RESOLUTION_320x240:
 # width:
	.word	320
 # height:
	.word	240
 # interlaced:
	.byte	0
	.space	3
	.section	.rodata.RESOLUTION_512x240,"a"
	.align	3
	.type	RESOLUTION_512x240, @object
	.size	RESOLUTION_512x240, 12
RESOLUTION_512x240:
 # width:
	.word	512
 # height:
	.word	240
 # interlaced:
	.byte	0
	.space	3
	.section	.rodata.RESOLUTION_640x240,"a"
	.align	3
	.type	RESOLUTION_640x240, @object
	.size	RESOLUTION_640x240, 12
RESOLUTION_640x240:
 # width:
	.word	640
 # height:
	.word	240
 # interlaced:
	.byte	0
	.space	3
	.section	.rodata.RESOLUTION_512x480,"a"
	.align	3
	.type	RESOLUTION_512x480, @object
	.size	RESOLUTION_512x480, 12
RESOLUTION_512x480:
 # width:
	.word	512
 # height:
	.word	480
 # interlaced:
	.byte	1
	.space	3
	.section	.rodata.RESOLUTION_640x480,"a"
	.align	3
	.type	RESOLUTION_640x480, @object
	.size	RESOLUTION_640x480, 12
RESOLUTION_640x480:
 # width:
	.word	640
 # height:
	.word	480
 # interlaced:
	.byte	1
	.space	3
 #APP
	.pushsection ".debug_gdb_scripts", "MS",@progbits,1
.byte 4
.ascii "gdb.inlined-script-dso-autoload\n"
.ascii "import gdb\n"
.ascii "class BreakpointDsoLoad(gdb.Breakpoint):\n"
.ascii "  def stop(self):\n"
.ascii "    frame = gdb.selected_frame()\n"
.ascii "    src_elf = gdb.execute('printf \"%s\", module->src_elf', False, True)\n"
.ascii "    prog_base = int(gdb.execute('printf \"%x\", module->prog_base', False, True), 16)\n"
.ascii "    print(\"Loading overlay: \", src_elf, \"(text:\", hex(prog_base), \")\")\n"
.ascii "    gdb.execute(\"add-symbol-file -readnow \" + src_elf + \" \" + hex(prog_base), False, True)\n"
.ascii "    return False\n"
.ascii "class BreakpointDsoFree(gdb.Breakpoint):\n"
.ascii "  def stop(self):\n"
.ascii "    frame = gdb.selected_frame()\n"
.ascii "    src_elf = gdb.execute('printf \"%s\", module->src_elf', False, True)\n"
.ascii "    prog_base = int(gdb.execute('printf \"%x\", module->prog_base', False, True), 16)\n"
.ascii "    print(\"Unloading overlay: \", src_elf, \"(text:\", hex(prog_base), \")\")\n"
.ascii "    gdb.execute(\"remove-symbol-file -a \" + hex(prog_base), False, True)\n"
.ascii "    return False\n"
.ascii "bp_load = BreakpointDsoLoad(\"__dl_insert_module\")\n"
.ascii "bp_load.silent = True\n"
.ascii "bl_free = BreakpointDsoFree(\"__dl_remove_module\")\n"
.ascii "bl_free.silent = True\n"
.byte 0
.popsection

 #NO_APP
	.section	.sbss.g_game_state,"aw",@nobits
	.align	2
	.type	g_game_state, @object
	.size	g_game_state, 4
g_game_state:
	.space	4
	.section	.text.vec2_scale,"ax",@progbits
	.align	2
	.align	5
	.globl	vec2_scale
$LFB97 = .
	.loc 1 73 1
	.set	nomips16
	.set	nomicromips
	.ent	vec2_scale
	.type	vec2_scale, @function
vec2_scale:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24	 #,,
$LCFI0 = .
	sd	$fp,16($sp)	 #,
$LCFI1 = .
	move	$fp,$sp	 #,
$LCFI2 = .
	sw	$4,24($fp)	 # .result_ptr, .result_ptr
	sd	$5,32($fp)	 #, v
	sw	$6,40($fp)	 # scale, scale
 # src/main.c:74:     f32 const x = v.x * scale;
	.loc 1 74 20
	lwc1	$f0,32($fp)	 # _1, v.D.5971.x
 # src/main.c:74:     f32 const x = v.x * scale;
	.loc 1 74 15
	lwc1	$f1,40($fp)	 # tmp197, scale
	mul.s	$f0,$f1,$f0	 # x_5, tmp197, _1
	swc1	$f0,0($fp)	 # x_5, x
 # src/main.c:75:     f32 const y = v.y * scale;
	.loc 1 75 20
	lwc1	$f0,36($fp)	 # _2, v.D.5971.y
 # src/main.c:75:     f32 const y = v.y * scale;
	.loc 1 75 15
	lwc1	$f1,40($fp)	 # tmp199, scale
	mul.s	$f0,$f1,$f0	 # y_6, tmp199, _2
	swc1	$f0,4($fp)	 # y_6, y
 # src/main.c:76:     return (Vector2){.x = x, .y = y};
	.loc 1 76 12
	lw	$2,24($fp)		 # tmp200, .result_ptr
	lwc1	$f0,0($fp)	 # tmp201, x
	swc1	$f0,0($2)	 # tmp201, <retval>.D.5971.x
	lw	$2,24($fp)		 # tmp202, .result_ptr
	lwc1	$f0,4($fp)	 # tmp203, y
	swc1	$f0,4($2)	 # tmp203, <retval>.D.5971.y
 # src/main.c:77: }
	.loc 1 77 1
	lw	$2,24($fp)		 #, .result_ptr
	move	$sp,$fp	 #,
$LCFI3 = .
	ld	$fp,16($sp)		 #,
	addiu	$sp,$sp,24	 #,,
$LCFI4 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	vec2_scale
$LFE97:
	.size	vec2_scale, .-vec2_scale
	.section	.text.vec2_add,"ax",@progbits
	.align	2
	.align	5
	.globl	vec2_add
$LFB98 = .
	.loc 1 80 1
	.set	nomips16
	.set	nomicromips
	.ent	vec2_add
	.type	vec2_add, @function
vec2_add:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24	 #,,
$LCFI5 = .
	sd	$fp,16($sp)	 #,
$LCFI6 = .
	move	$fp,$sp	 #,
$LCFI7 = .
	sw	$4,24($fp)	 # .result_ptr, .result_ptr
	sd	$5,32($fp)	 #, a
	sd	$6,40($fp)	 #, b
 # src/main.c:81:     f32 const x = a.x + b.x;
	.loc 1 81 20
	lwc1	$f1,32($fp)	 # _1, a.D.5971.x
 # src/main.c:81:     f32 const x = a.x + b.x;
	.loc 1 81 26
	lwc1	$f0,40($fp)	 # _2, b.D.5971.x
 # src/main.c:81:     f32 const x = a.x + b.x;
	.loc 1 81 15
	add.s	$f0,$f1,$f0	 # x_6, _1, _2
	swc1	$f0,0($fp)	 # x_6, x
 # src/main.c:82:     f32 const y = a.y + b.y;
	.loc 1 82 20
	lwc1	$f1,36($fp)	 # _3, a.D.5971.y
 # src/main.c:82:     f32 const y = a.y + b.y;
	.loc 1 82 26
	lwc1	$f0,44($fp)	 # _4, b.D.5971.y
 # src/main.c:82:     f32 const y = a.y + b.y;
	.loc 1 82 15
	add.s	$f0,$f1,$f0	 # y_7, _3, _4
	swc1	$f0,4($fp)	 # y_7, y
 # src/main.c:83:     return (Vector2){.x = x, .y = y};
	.loc 1 83 12
	lw	$2,24($fp)		 # tmp200, .result_ptr
	lwc1	$f0,0($fp)	 # tmp201, x
	swc1	$f0,0($2)	 # tmp201, <retval>.D.5971.x
	lw	$2,24($fp)		 # tmp202, .result_ptr
	lwc1	$f0,4($fp)	 # tmp203, y
	swc1	$f0,4($2)	 # tmp203, <retval>.D.5971.y
 # src/main.c:84: }
	.loc 1 84 1
	lw	$2,24($fp)		 #, .result_ptr
	move	$sp,$fp	 #,
$LCFI8 = .
	ld	$fp,16($sp)		 #,
	addiu	$sp,$sp,24	 #,,
$LCFI9 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	vec2_add
$LFE98:
	.size	vec2_add, .-vec2_add
	.section	.text.AABB,"ax",@progbits
	.align	2
	.align	5
	.globl	AABB
$LFB99 = .
	.loc 1 90 1
	.set	nomips16
	.set	nomicromips
	.ent	AABB
	.type	AABB, @function
AABB:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8	 #,,
$LCFI10 = .
	sd	$fp,0($sp)	 #,
$LCFI11 = .
	move	$fp,$sp	 #,
$LCFI12 = .
	swc1	$f12,8($fp)	 # x0, x0
	swc1	$f13,16($fp)	 # y0, y0
	sw	$6,24($fp)	 # w0, w0
	sw	$7,32($fp)	 # h0, h0
 # src/main.c:91:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 91 16
	lwc1	$f1,8($fp)	 # tmp201, x0
	lwc1	$f0,24($fp)	 # tmp202, w0
	add.s	$f0,$f1,$f0	 # _1, tmp201, tmp202
 # src/main.c:91:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 91 45
	lwc1	$f1,44($fp)	 # tmp203, x1
	c.le.s	$f1,$f0	 #, tmp203, _1
	nop	
	bc1f	$L6
	nop
	 #,,
 # src/main.c:91:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 91 33 discriminator 1
	lwc1	$f1,44($fp)	 # tmp204, x1
	lwc1	$f0,60($fp)	 # tmp205, w1
	add.s	$f0,$f1,$f0	 # _2, tmp204, tmp205
 # src/main.c:91:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 91 27 discriminator 1
	lwc1	$f1,8($fp)	 # tmp206, x0
	c.le.s	$f1,$f0	 #, tmp206, _2
	nop	
	bc1f	$L6
	nop
	 #,,
 # src/main.c:92:            (y0 + h0 >= y1 && y1 + h1 >= y0);
	.loc 1 92 16
	lwc1	$f1,16($fp)	 # tmp207, y0
	lwc1	$f0,32($fp)	 # tmp208, h0
	add.s	$f0,$f1,$f0	 # _3, tmp207, tmp208
 # src/main.c:91:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 91 45 discriminator 3
	lwc1	$f1,52($fp)	 # tmp209, y1
	c.le.s	$f1,$f0	 #, tmp209, _3
	nop	
	bc1f	$L6
	nop
	 #,,
 # src/main.c:92:            (y0 + h0 >= y1 && y1 + h1 >= y0);
	.loc 1 92 33
	lwc1	$f1,52($fp)	 # tmp210, y1
	lwc1	$f0,68($fp)	 # tmp211, h1
	add.s	$f0,$f1,$f0	 # _4, tmp210, tmp211
 # src/main.c:92:            (y0 + h0 >= y1 && y1 + h1 >= y0);
	.loc 1 92 27
	lwc1	$f1,16($fp)	 # tmp212, y0
	c.le.s	$f1,$f0	 #, tmp212, _4
	nop	
	bc1f	$L6
	nop
	 #,,
 # src/main.c:91:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 91 45
	li	$2,1			# 0x1	 # iftmp.0_5,
	b	$L11
	nop
	 #
$L6:
 # src/main.c:91:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 91 45 is_stmt 0 discriminator 5
	move	$2,$0	 # iftmp.0_5,
$L11:
 # src/main.c:91:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 91 45 discriminator 7
	andi	$2,$2,0x1	 # tmp214, tmp213,
	andi	$2,$2,0x00ff	 # _16, tmp214
 # src/main.c:93: }
	.loc 1 93 1 is_stmt 1
	move	$sp,$fp	 #,
$LCFI13 = .
	ld	$fp,0($sp)		 #,
	addiu	$sp,$sp,8	 #,,
$LCFI14 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	AABB
$LFE99:
	.size	AABB, .-AABB
	.section	.text.draw_rect,"ax",@progbits
	.align	2
	.align	5
	.globl	draw_rect
$LFB100 = .
	.loc 1 96 1
	.set	nomips16
	.set	nomicromips
	.ent	draw_rect
	.type	draw_rect, @function
draw_rect:
	.frame	$fp,48,$31		# vars= 0, regs= 2/0, args= 32, gp= 0
	.mask	0xc0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48	 #,,
$LCFI15 = .
	sd	$31,40($sp)	 #,
	sd	$fp,32($sp)	 #,
$LCFI16 = .
	move	$fp,$sp	 #,
$LCFI17 = .
	sw	$4,48($fp)	 # x, x
	sw	$5,56($fp)	 # y, y
	sw	$6,64($fp)	 # width, width
	sw	$7,72($fp)	 # height, height
 # src/main.c:97:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 97 5
	lw	$2,48($fp)		 # tmp200, x
	sll	$4,$2,2	 # _1, tmp200,
	lw	$2,56($fp)		 # tmp201, y
	sll	$5,$2,2	 # _2, tmp201,
 # src/main.c:97:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 97 45
	lw	$3,48($fp)		 # tmp202, x
	lw	$2,64($fp)		 # tmp203, width
	addu	$2,$3,$2	 # _3, tmp202, tmp203
 # src/main.c:97:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 97 5
	sll	$6,$2,2	 # _4, _3,
 # src/main.c:97:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 97 60
	lw	$3,56($fp)		 # tmp204, y
	lw	$2,72($fp)		 # tmp205, height
	addu	$2,$3,$2	 # _5, tmp204, tmp205
 # src/main.c:97:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 97 5
	sll	$2,$2,2	 # _6, _5,
	move	$7,$2	 #, _6
	jal	__rdpq_fill_rectangle_fx
	nop
	 #
 # src/main.c:98: }
	.loc 1 98 1
	nop	
	move	$sp,$fp	 #,
$LCFI18 = .
	ld	$31,40($sp)		 #,
	ld	$fp,32($sp)		 #,
	addiu	$sp,$sp,48	 #,,
$LCFI19 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	draw_rect
$LFE100:
	.size	draw_rect, .-draw_rect
	.section	.text.draw_digit,"ax",@progbits
	.align	2
	.align	5
	.globl	draw_digit
$LFB101 = .
	.loc 1 101 1
	.set	nomips16
	.set	nomicromips
	.ent	draw_digit
	.type	draw_digit, @function
draw_digit:
	.frame	$fp,64,$31		# vars= 16, regs= 2/0, args= 32, gp= 0
	.mask	0xc0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64	 #,,
$LCFI20 = .
	sd	$31,56($sp)	 #,
	sd	$fp,48($sp)	 #,
$LCFI21 = .
	move	$fp,$sp	 #,
$LCFI22 = .
	sw	$4,64($fp)	 # x, x
	sw	$5,72($fp)	 # y, y
	move	$2,$6	 # tmp208, digit
	sb	$2,80($fp)	 # tmp209, digit
 # src/main.c:102:     if (digit > 9) {
	.loc 1 102 8
	lbu	$2,80($fp)	 # tmp210, digit
	sltu	$2,$2,10	 # tmp211, tmp210,
	beq	$2,$0,$L26
	nop
	 #, tmp211,,
$LBB2 = .
 # src/main.c:179:     for (u32 row = 0; row < FONT_PIXEL_HEIGHT; row++) {
	.loc 1 179 14
	sw	$0,32($fp)	 #, row
 # src/main.c:179:     for (u32 row = 0; row < FONT_PIXEL_HEIGHT; row++) {
	.loc 1 179 5
	b	$L21
	nop
	 #
$L25:
$LBB3 = .
 # src/main.c:180:         for (u32 col = 0; col < FONT_PIXEL_WIDTH; col++) {
	.loc 1 180 18
	sw	$0,36($fp)	 #, col
 # src/main.c:180:         for (u32 col = 0; col < FONT_PIXEL_WIDTH; col++) {
	.loc 1 180 9
	b	$L22
	nop
	 #
$L24:
$LBB4 = .
 # src/main.c:181:             u8 const bit = (digits_font[digit][row] >> (3 - col)) & 1;
	.loc 1 181 47
	lbu	$3,80($fp)	 # _1, digit
	lui	$4,%hi(digits_font.0)	 # tmp212,
	move	$2,$3	 # tmp213, _1
	sll	$2,$2,2	 # tmp214, tmp213,
	addu	$2,$2,$3	 # tmp213, tmp213, _1
	addiu	$3,$4,%lo(digits_font.0)	 # tmp216, tmp212,
	addu	$3,$2,$3	 # tmp215, tmp213, tmp216
	lw	$2,32($fp)		 # tmp218, row
	addu	$2,$3,$2	 # tmp217, tmp215, tmp218
	lbu	$2,0($2)	 # _2, digits_font[_1][row_15]
	move	$4,$2	 # _3, _2
 # src/main.c:181:             u8 const bit = (digits_font[digit][row] >> (3 - col)) & 1;
	.loc 1 181 59
	li	$3,3			# 0x3	 # tmp219,
	lw	$2,36($fp)		 # tmp220, col
	subu	$2,$3,$2	 # _4, tmp219, tmp220
 # src/main.c:181:             u8 const bit = (digits_font[digit][row] >> (3 - col)) & 1;
	.loc 1 181 53
	sra	$2,$4,$2	 # _5, _3, _4
 # src/main.c:181:             u8 const bit = (digits_font[digit][row] >> (3 - col)) & 1;
	.loc 1 181 67
	andi	$2,$2,0x00ff	 # _6, _5
 # src/main.c:181:             u8 const bit = (digits_font[digit][row] >> (3 - col)) & 1;
	.loc 1 181 22
	andi	$2,$2,0x1	 # tmp221, _6,
	sb	$2,40($fp)	 # tmp221, bit
 # src/main.c:182:             if (bit == 1) {
	.loc 1 182 16
	lbu	$3,40($fp)	 # tmp222, bit
	li	$2,1			# 0x1	 # tmp223,
	bne	$3,$2,$L23
	nop
	 #, tmp222, tmp223,
 # src/main.c:183:                 draw_rect(x+col*FONT_SIZE, y+row*FONT_SIZE, FONT_SIZE, FONT_SIZE);
	.loc 1 183 32
	lw	$2,36($fp)		 # tmp224, col
	sll	$3,$2,1	 # _7, tmp224,
 # src/main.c:183:                 draw_rect(x+col*FONT_SIZE, y+row*FONT_SIZE, FONT_SIZE, FONT_SIZE);
	.loc 1 183 28
	lw	$2,64($fp)		 # x.1_8, x
	addu	$2,$3,$2	 # _9, _7, x.1_8
 # src/main.c:183:                 draw_rect(x+col*FONT_SIZE, y+row*FONT_SIZE, FONT_SIZE, FONT_SIZE);
	.loc 1 183 17
	move	$4,$2	 # _10, _9
 # src/main.c:183:                 draw_rect(x+col*FONT_SIZE, y+row*FONT_SIZE, FONT_SIZE, FONT_SIZE);
	.loc 1 183 49
	lw	$2,32($fp)		 # tmp225, row
	sll	$3,$2,1	 # _11, tmp225,
 # src/main.c:183:                 draw_rect(x+col*FONT_SIZE, y+row*FONT_SIZE, FONT_SIZE, FONT_SIZE);
	.loc 1 183 45
	lw	$2,72($fp)		 # y.2_12, y
	addu	$2,$3,$2	 # _13, _11, y.2_12
 # src/main.c:183:                 draw_rect(x+col*FONT_SIZE, y+row*FONT_SIZE, FONT_SIZE, FONT_SIZE);
	.loc 1 183 17
	li	$7,2			# 0x2	 #,
	li	$6,2			# 0x2	 #,
	move	$5,$2	 #, _14
	jal	draw_rect
	nop
	 #
$L23:
$LBE4 = .
 # src/main.c:180:         for (u32 col = 0; col < FONT_PIXEL_WIDTH; col++) {
	.loc 1 180 54 discriminator 2
	lw	$2,36($fp)		 # tmp227, col
	addiu	$2,$2,1	 # col_30, tmp227,
	sw	$2,36($fp)	 # col_30, col
$L22:
 # src/main.c:180:         for (u32 col = 0; col < FONT_PIXEL_WIDTH; col++) {
	.loc 1 180 31 discriminator 1
	lw	$2,36($fp)		 # tmp228, col
	sltu	$2,$2,4	 # tmp229, tmp228,
	bne	$2,$0,$L24
	nop
	 #, tmp229,,
$LBE3 = .
 # src/main.c:179:     for (u32 row = 0; row < FONT_PIXEL_HEIGHT; row++) {
	.loc 1 179 51 discriminator 2
	lw	$2,32($fp)		 # tmp231, row
	addiu	$2,$2,1	 # row_25, tmp231,
	sw	$2,32($fp)	 # row_25, row
$L21:
 # src/main.c:179:     for (u32 row = 0; row < FONT_PIXEL_HEIGHT; row++) {
	.loc 1 179 27 discriminator 1
	lw	$2,32($fp)		 # tmp232, row
	sltu	$2,$2,5	 # tmp233, tmp232,
	bne	$2,$0,$L25
	nop
	 #, tmp233,,
	b	$L18
	nop
	 #
$L26:
$LBE2 = .
 # src/main.c:103:         return;
	.loc 1 103 9
	nop	
$L18:
 # src/main.c:187: }
	.loc 1 187 1
	move	$sp,$fp	 #,
$LCFI23 = .
	ld	$31,56($sp)		 #,
	ld	$fp,48($sp)		 #,
	addiu	$sp,$sp,64	 #,,
$LCFI24 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	draw_digit
$LFE101:
	.size	draw_digit, .-draw_digit
	.section	.text.draw_u32,"ax",@progbits
	.align	2
	.align	5
	.globl	draw_u32
$LFB102 = .
	.loc 1 190 1
	.set	nomips16
	.set	nomicromips
	.ent	draw_u32
	.type	draw_u32, @function
draw_u32:
	.frame	$fp,64,$31		# vars= 16, regs= 2/0, args= 32, gp= 0
	.mask	0xc0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64	 #,,
$LCFI25 = .
	sd	$31,56($sp)	 #,
	sd	$fp,48($sp)	 #,
$LCFI26 = .
	move	$fp,$sp	 #,
$LCFI27 = .
	sw	$4,64($fp)	 # x, x
	sw	$5,72($fp)	 # y, y
	sw	$6,80($fp)	 # number, number
	sw	$7,88($fp)	 # number_digit_count, number_digit_count
$LBB5 = .
 # src/main.c:191:     for (u32 i = 0; i < number_digit_count; i++) {
	.loc 1 191 14
	sw	$0,32($fp)	 #, i
 # src/main.c:191:     for (u32 i = 0; i < number_digit_count; i++) {
	.loc 1 191 5
	b	$L28
	nop
	 #
$L31:
$LBB6 = .
 # src/main.c:192:         u8 const digit = (number / (u32)pow(10, i)) % 10;
	.loc 1 192 41
	lwu	$2,32($fp)	 # tmp201, i
	dmtc1	$2,$f0	 # tmp201, tmp201
	nop	
	cvt.d.l	$f1,$f0	 # _1, tmp201
	ldc1	$f0,%gp_rel($LC6)($28)	 # tmp202,
	mov.d	$f13,$f1	 #, _1
	mov.d	$f12,$f0	 #, tmp202
	jal	pow
	nop
	 #
 # src/main.c:192:         u8 const digit = (number / (u32)pow(10, i)) % 10;
	.loc 1 192 36 discriminator 1
	ldc1	$f1,%gp_rel($LC7)($28)	 # tmp203,
	c.le.d	$f1,$f0	 #, tmp203, _2
	nop	
	bc1t	$L29
	nop
	 #,,
	trunc.w.d $f0,$f0	 # _3, _2
	mfc1	$2,$f0	 # _3, _3
	b	$L30
	nop
	 #
$L29:
	sub.d	$f0,$f0,$f1	 # tmp204, _2, tmp203
	li	$3,-2147483648			# 0xffffffff80000000	 # tmp205,
	trunc.w.d $f0,$f0	 # _3, tmp204
	mfc1	$2,$f0	 # _3, _3
	nop	
	or	$2,$2,$3	 # _3, _3, tmp205
$L30:
 # src/main.c:192:         u8 const digit = (number / (u32)pow(10, i)) % 10;
	.loc 1 192 34 discriminator 1
	lw	$3,80($fp)		 # tmp208, number
	divu	$0,$3,$2	 # tmp208, _3
	teq	$2,$0,7	 # _3
	mfhi	$2		 # tmp207
	mflo	$5		 # _4
 # src/main.c:192:         u8 const digit = (number / (u32)pow(10, i)) % 10;
	.loc 1 192 53 discriminator 1
	dsll	$3,$5,32	 # tmp209, _4,
	dsrl	$3,$3,32	 # tmp209, tmp209,
	move	$2,$3	 # tmp210, tmp209
	dsll	$2,$2,1	 # tmp211, tmp210,
	daddu	$2,$2,$3	 # tmp210, tmp210, tmp209
	dsll	$4,$2,4	 # tmp212, tmp210,
	daddu	$2,$2,$4	 # tmp210, tmp210, tmp212
	dsll	$4,$2,8	 # tmp213, tmp210,
	daddu	$2,$2,$4	 # tmp210, tmp210, tmp213
	dsll	$4,$2,16	 # tmp214, tmp210,
	daddu	$2,$2,$4	 # tmp210, tmp210, tmp214
	dsll	$2,$2,2	 # tmp215, tmp210,
	daddu	$2,$2,$3	 # tmp210, tmp210, tmp209
	dsrl	$2,$2,32	 # tmp216, tmp210,
	sll	$2,$2,0	 # tmp217, tmp216
	srl	$3,$2,3	 # _5, tmp217,
	move	$2,$3	 # tmp218, _5
	sll	$2,$2,2	 # tmp219, tmp218,
	addu	$2,$2,$3	 # tmp218, tmp218, _5
	sll	$2,$2,1	 # tmp220, tmp218,
	subu	$3,$5,$2	 # _5, _4, tmp218
 # src/main.c:192:         u8 const digit = (number / (u32)pow(10, i)) % 10;
	.loc 1 192 18 discriminator 1
	sb	$3,36($fp)	 # _5, digit
 # src/main.c:193:         i32 const x_offset = (FONT_PIXEL_WIDTH + 1) * i * FONT_SIZE;
	.loc 1 193 57
	lw	$3,32($fp)		 # tmp221, i
	move	$2,$3	 # _6, tmp221
	sll	$2,$2,2	 # tmp223, _6,
	addu	$2,$2,$3	 # _6, _6, tmp221
	sll	$2,$2,1	 # tmp224, _6,
 # src/main.c:193:         i32 const x_offset = (FONT_PIXEL_WIDTH + 1) * i * FONT_SIZE;
	.loc 1 193 19
	sw	$2,40($fp)	 # _6, x_offset
 # src/main.c:194:         draw_digit(x - x_offset, y, digit);
	.loc 1 194 9
	lw	$3,64($fp)		 # tmp225, x
	lw	$2,40($fp)		 # tmp226, x_offset
	subu	$2,$3,$2	 # _7, tmp225, tmp226
	lbu	$3,36($fp)	 # tmp227, digit
	move	$6,$3	 #, tmp227
	lw	$5,72($fp)		 #, y
	move	$4,$2	 #, _7
	jal	draw_digit
	nop
	 #
$LBE6 = .
 # src/main.c:191:     for (u32 i = 0; i < number_digit_count; i++) {
	.loc 1 191 46 discriminator 3
	lw	$2,32($fp)		 # tmp229, i
	addiu	$2,$2,1	 # i_20, tmp229,
	sw	$2,32($fp)	 # i_20, i
$L28:
 # src/main.c:191:     for (u32 i = 0; i < number_digit_count; i++) {
	.loc 1 191 23 discriminator 1
	lw	$3,32($fp)		 # tmp230, i
	lw	$2,88($fp)		 # tmp231, number_digit_count
	sltu	$2,$3,$2	 # tmp232, tmp230, tmp231
	bne	$2,$0,$L31
	nop
	 #, tmp232,,
$LBE5 = .
 # src/main.c:196: }
	.loc 1 196 1
	nop	
	nop	
	move	$sp,$fp	 #,
$LCFI28 = .
	ld	$31,56($sp)		 #,
	ld	$fp,48($sp)		 #,
	addiu	$sp,$sp,64	 #,,
$LCFI29 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	draw_u32
$LFE102:
	.size	draw_u32, .-draw_u32
	.section	.text.get_digit_count,"ax",@progbits
	.align	2
	.align	5
	.globl	get_digit_count
$LFB103 = .
	.loc 1 199 1
	.set	nomips16
	.set	nomicromips
	.ent	get_digit_count
	.type	get_digit_count, @function
get_digit_count:
	.frame	$fp,48,$31		# vars= 0, regs= 2/0, args= 32, gp= 0
	.mask	0xc0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48	 #,,
$LCFI30 = .
	sd	$31,40($sp)	 #,
	sd	$fp,32($sp)	 #,
$LCFI31 = .
	move	$fp,$sp	 #,
$LCFI32 = .
	sw	$4,48($fp)	 # number, number
 # src/main.c:200:     if (number == 0) {
	.loc 1 200 8
	lw	$2,48($fp)		 # tmp199, number
	bne	$2,$0,$L33
	nop
	 #, tmp199,,
 # src/main.c:201:         return 1;
	.loc 1 201 16
	li	$2,1			# 0x1	 # _4,
	b	$L34
	nop
	 #
$L33:
 # src/main.c:203:     return (u32)log10((f64)number) + 1;
	.loc 1 203 17
	lwu	$2,48($fp)	 # tmp200, number
	dmtc1	$2,$f0	 # tmp200, tmp200
	nop	
	cvt.d.l	$f0,$f0	 # _1, tmp200
	mov.d	$f12,$f0	 #, _1
	jal	log10
	nop
	 #
 # src/main.c:203:     return (u32)log10((f64)number) + 1;
	.loc 1 203 12 discriminator 1
	ldc1	$f1,%gp_rel($LC7)($28)	 # tmp201,
	c.le.d	$f1,$f0	 #, tmp201, _2
	nop	
	bc1t	$L35
	nop
	 #,,
	trunc.w.d $f0,$f0	 # _3, _2
	mfc1	$2,$f0	 # _3, _3
	b	$L36
	nop
	 #
$L35:
	sub.d	$f0,$f0,$f1	 # tmp202, _2, tmp201
	li	$3,-2147483648			# 0xffffffff80000000	 # tmp203,
	trunc.w.d $f0,$f0	 # _3, tmp202
	mfc1	$2,$f0	 # _3, _3
	nop	
	or	$2,$2,$3	 # _3, _3, tmp203
$L36:
 # src/main.c:203:     return (u32)log10((f64)number) + 1;
	.loc 1 203 36 discriminator 1
	addiu	$2,$2,1	 # _4, _3,
$L34:
 # src/main.c:204: }
	.loc 1 204 1
	move	$sp,$fp	 #,
$LCFI33 = .
	ld	$31,40($sp)		 #,
	ld	$fp,32($sp)		 #,
	addiu	$sp,$sp,48	 #,,
$LCFI34 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	get_digit_count
$LFE103:
	.size	get_digit_count, .-get_digit_count
	.section	.text.draw_scores,"ax",@progbits
	.align	2
	.align	5
$LFB104 = .
	.loc 1 207 1
	.set	nomips16
	.set	nomicromips
	.ent	draw_scores
	.type	draw_scores, @function
draw_scores:
	.frame	$fp,64,$31		# vars= 16, regs= 2/0, args= 32, gp= 0
	.mask	0xc0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-64	 #,,
$LCFI35 = .
	sd	$31,56($sp)	 #,
	sd	$fp,48($sp)	 #,
$LCFI36 = .
	move	$fp,$sp	 #,
$LCFI37 = .
	sw	$4,64($fp)	 # score1, score1
	sw	$5,72($fp)	 # score2, score2
 # src/main.c:208:     u32 const score1_digit_count = get_digit_count(score1);
	.loc 1 208 36
	lw	$4,64($fp)		 #, score1
	jal	get_digit_count
	nop
	 #
	sw	$2,32($fp)	 #, score1_digit_count
 # src/main.c:209:     i32 const score1_offset = 2 * FONT_PIXEL_WIDTH * FONT_SIZE;
	.loc 1 209 15
	li	$2,16			# 0x10	 # tmp197,
	sw	$2,36($fp)	 # tmp197, score1_offset
 # src/main.c:211:     u32 const score2_digit_count = get_digit_count(score2);
	.loc 1 211 36
	lw	$4,72($fp)		 #, score2
	jal	get_digit_count
	nop
	 #
	sw	$2,40($fp)	 #, score2_digit_count
 # src/main.c:212:     i32 const score2_offset = score2_digit_count * FONT_PIXEL_WIDTH * FONT_SIZE;
	.loc 1 212 69
	lw	$2,40($fp)		 # tmp198, score2_digit_count
	sll	$2,$2,3	 # _1, tmp198,
 # src/main.c:212:     i32 const score2_offset = score2_digit_count * FONT_PIXEL_WIDTH * FONT_SIZE;
	.loc 1 212 15
	sw	$2,44($fp)	 # _1, score2_offset
 # src/main.c:214:     draw_u32(SCREEN_WIDTH/2 - score1_offset, 10, score1, score1_digit_count);
	.loc 1 214 5
	li	$3,160			# 0xa0	 # tmp199,
	lw	$2,36($fp)		 # tmp200, score1_offset
	subu	$2,$3,$2	 # _2, tmp199, tmp200
	lw	$7,32($fp)		 #, score1_digit_count
	lw	$6,64($fp)		 #, score1
	li	$5,10			# 0xa	 #,
	move	$4,$2	 #, _2
	jal	draw_u32
	nop
	 #
 # src/main.c:215:     draw_u32(SCREEN_WIDTH/2 + score2_offset, 10, score2, score2_digit_count);
	.loc 1 215 5
	lw	$2,44($fp)		 # tmp201, score2_offset
	addiu	$2,$2,160	 # _3, tmp201,
	lw	$7,40($fp)		 #, score2_digit_count
	lw	$6,72($fp)		 #, score2
	li	$5,10			# 0xa	 #,
	move	$4,$2	 #, _3
	jal	draw_u32
	nop
	 #
 # src/main.c:216: }
	.loc 1 216 1
	nop	
	move	$sp,$fp	 #,
$LCFI38 = .
	ld	$31,56($sp)		 #,
	ld	$fp,48($sp)		 #,
	addiu	$sp,$sp,64	 #,,
$LCFI39 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	draw_scores
$LFE104:
	.size	draw_scores, .-draw_scores
	.section	.text.draw_middle_line,"ax",@progbits
	.align	2
	.align	5
$LFB105 = .
	.loc 1 219 1
	.set	nomips16
	.set	nomicromips
	.ent	draw_middle_line
	.type	draw_middle_line, @function
draw_middle_line:
	.frame	$fp,96,$31		# vars= 48, regs= 2/0, args= 32, gp= 0
	.mask	0xc0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-96	 #,,
$LCFI40 = .
	sd	$31,88($sp)	 #,
	sd	$fp,80($sp)	 #,
$LCFI41 = .
	move	$fp,$sp	 #,
$LCFI42 = .
 # src/main.c:220:     i32 const width = 2;
	.loc 1 220 15
	li	$2,2			# 0x2	 # tmp199,
	sw	$2,36($fp)	 # tmp199, width
 # src/main.c:221:     i32 const height = 10;
	.loc 1 221 15
	li	$2,10			# 0xa	 # tmp200,
	sw	$2,40($fp)	 # tmp200, height
 # src/main.c:222:     i32 const padding = 5;
	.loc 1 222 15
	li	$2,5			# 0x5	 # tmp201,
	sw	$2,44($fp)	 # tmp201, padding
 # src/main.c:223:     i32 const x = (SCREEN_WIDTH - width) / 2;
	.loc 1 223 33
	li	$3,320			# 0x140	 # tmp202,
	lw	$2,36($fp)		 # tmp203, width
	subu	$2,$3,$2	 # _1, tmp202, tmp203
 # src/main.c:223:     i32 const x = (SCREEN_WIDTH - width) / 2;
	.loc 1 223 15
	srl	$3,$2,31	 # tmp204, _1,
	addu	$2,$3,$2	 # tmp205, tmp204, _1
	sra	$2,$2,1	 # x_11, tmp205,
	sw	$2,48($fp)	 # x_11, x
 # src/main.c:224:     i32 const segments = 15;
	.loc 1 224 15
	li	$2,15			# 0xf	 # tmp207,
	sw	$2,52($fp)	 # tmp207, segments
$LBB7 = .
 # src/main.c:226:     rdpq_set_mode_fill(RGBA32(255, 255, 255, 50));
	.loc 1 226 5
	li	$2,-1			# 0xffffffffffffffff	 # tmp208,
	sb	$2,64($fp)	 # tmp208, D.6068.r
	li	$2,-1			# 0xffffffffffffffff	 # tmp209,
	sb	$2,65($fp)	 # tmp209, D.6068.g
	li	$2,-1			# 0xffffffffffffffff	 # tmp210,
	sb	$2,66($fp)	 # tmp210, D.6068.b
	li	$2,50			# 0x32	 # tmp211,
	sb	$2,67($fp)	 # tmp211, D.6068.a
$LBE7 = .
	ld	$4,64($fp)		 #, D.6068
	jal	rdpq_set_mode_fill
	nop
	 #
$LBB8 = .
 # src/main.c:228:     for (i32 i = 0; i < segments; i++) {
	.loc 1 228 14
	sw	$0,32($fp)	 #, i
 # src/main.c:228:     for (i32 i = 0; i < segments; i++) {
	.loc 1 228 5
	b	$L39
	nop
	 #
$L40:
$LBB9 = .
 # src/main.c:229:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 229 23
	lw	$3,32($fp)		 # tmp212, i
	lw	$2,40($fp)		 # tmp213, height
	mult	$3,$2	 # tmp212, tmp213
 # src/main.c:229:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 229 19
	mflo	$2		 # _2
	addiu	$2,$2,5	 # _3, _2,
 # src/main.c:229:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 229 47
	lw	$3,32($fp)		 # tmp214, i
	addiu	$4,$3,1	 # _4, tmp214,
 # src/main.c:229:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 229 42
	lw	$3,44($fp)		 # tmp215, padding
	mult	$4,$3	 # _4, tmp215
 # src/main.c:229:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 229 13
	mflo	$3		 # _5
	addu	$2,$2,$3	 # y_21, _3, _5
	sw	$2,56($fp)	 # y_21, y
 # src/main.c:230:         draw_rect(x, y, width, height);
	.loc 1 230 9
	lw	$7,40($fp)		 #, height
	lw	$6,36($fp)		 #, width
	lw	$5,56($fp)		 #, y
	lw	$4,48($fp)		 #, x
	jal	draw_rect
	nop
	 #
$LBE9 = .
 # src/main.c:228:     for (i32 i = 0; i < segments; i++) {
	.loc 1 228 36 discriminator 3
	lw	$2,32($fp)		 # tmp218, i
	addiu	$2,$2,1	 # i_23, tmp218,
	sw	$2,32($fp)	 # i_23, i
$L39:
 # src/main.c:228:     for (i32 i = 0; i < segments; i++) {
	.loc 1 228 23 discriminator 1
	lw	$3,32($fp)		 # tmp219, i
	lw	$2,52($fp)		 # tmp220, segments
	slt	$2,$3,$2	 # tmp221, tmp219, tmp220
	bne	$2,$0,$L40
	nop
	 #, tmp221,,
$LBE8 = .
 # src/main.c:232: }
	.loc 1 232 1
	nop	
	nop	
	move	$sp,$fp	 #,
$LCFI43 = .
	ld	$31,88($sp)		 #,
	ld	$fp,80($sp)		 #,
	addiu	$sp,$sp,96	 #,,
$LCFI44 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	draw_middle_line
$LFE105:
	.size	draw_middle_line, .-draw_middle_line
	.section	.sdata,"aw"
	.align	3
$LC0:
 # <anonymous>:
 # x:
	.word	1092616192
 # y:
	.word	1121320960
	.align	3
$LC1:
 # <anonymous>:
 # x:
	.word	1134067712
 # y:
	.word	1121320960
	.align	3
$LC2:
 # <anonymous>:
 # x:
	.word	1126006784
 # y:
	.word	1122697216
	.align	3
$LC3:
 # <anonymous>:
 # x:
	.word	1065353216
 # y:
	.word	1065353216
	.section	.text.transition_to_serving,"ax",@progbits
	.align	2
	.align	5
$LFB106 = .
	.loc 1 235 1
	.set	nomips16
	.set	nomicromips
	.ent	transition_to_serving
	.type	transition_to_serving, @function
transition_to_serving:
	.frame	$fp,40,$31		# vars= 32, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40	 #,,
$LCFI45 = .
	sd	$fp,32($sp)	 #,
$LCFI46 = .
	move	$fp,$sp	 #,
$LCFI47 = .
	sw	$4,40($fp)	 # paddles, paddles
	sw	$5,48($fp)	 # ball, ball
 # src/main.c:236:     paddles[0].pos = (Vector2){.x = PADDLE_0_STARTING_X, .y = PADDLE_0_STARTING_Y};
	.loc 1 236 20
	lw	$2,40($fp)		 # tmp195, paddles
	ld	$3,%gp_rel($LC0)($28)		 # tmp196,
	sdl	$3,0($2)	 # tmp196, paddles_3(D)->pos
	sdr	$3,7($2)	 # tmp196, paddles_3(D)->pos
 # src/main.c:237:     paddles[1].pos = (Vector2){.x = PADDLE_1_STARTING_X, .y = PADDLE_1_STARTING_Y};
	.loc 1 237 12
	lw	$2,40($fp)		 # tmp197, paddles
	addiu	$2,$2,12	 # _1, tmp197,
 # src/main.c:237:     paddles[1].pos = (Vector2){.x = PADDLE_1_STARTING_X, .y = PADDLE_1_STARTING_Y};
	.loc 1 237 20
	ld	$3,%gp_rel($LC1)($28)		 # tmp198,
	sdl	$3,0($2)	 # tmp198, _1->pos
	sdr	$3,7($2)	 # tmp198, _1->pos
 # src/main.c:239:     ball->pos = (Vector2){.x = BALL_STARTING_X, .y = BALL_STARTING_Y};
	.loc 1 239 15
	lw	$2,48($fp)		 # tmp199, ball
	ld	$3,%gp_rel($LC2)($28)		 # tmp200,
	sdl	$3,0($2)	 # tmp200, ball_6(D)->pos
	sdr	$3,7($2)	 # tmp200, ball_6(D)->pos
 # src/main.c:240:     ball->vel = (Vector2){.x = 1.0f, .y = 1.0f};
	.loc 1 240 15
	lw	$2,48($fp)		 # tmp201, ball
	ld	$3,%gp_rel($LC3)($28)		 # tmp202,
	sdl	$3,8($2)	 # tmp202, ball_6(D)->vel
	sdr	$3,15($2)	 # tmp202, ball_6(D)->vel
 # src/main.c:241:     ball->speed = 1.0f;
	.loc 1 241 17
	lw	$2,48($fp)		 # tmp203, ball
	lwc1	$f0,%gp_rel($LC8)($28)	 # tmp204,
	swc1	$f0,16($2)	 # tmp204, ball_6(D)->speed
 # src/main.c:243:     g_game_state = Game_State_Serving;
	.loc 1 243 18
	sw	$0,%gp_rel(g_game_state)($28)	 #, g_game_state
 # src/main.c:244: }
	.loc 1 244 1
	nop	
	move	$sp,$fp	 #,
$LCFI48 = .
	ld	$fp,32($sp)		 #,
	addiu	$sp,$sp,40	 #,,
$LCFI49 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	transition_to_serving
$LFE106:
	.size	transition_to_serving, .-transition_to_serving
	.rdata
	.align	3
$LC4:
 # pos:
 # <anonymous>:
 # x:
	.word	1092616192
 # y:
	.word	1121320960
 # score:
	.word	0
 # pos:
 # <anonymous>:
 # x:
	.word	1134067712
 # y:
	.word	1121320960
 # score:
	.word	0
	.align	3
$LC5:
 # pos:
 # <anonymous>:
 # x:
	.word	1126006784
 # y:
	.word	1122697216
 # vel:
 # <anonymous>:
 # x:
	.word	1065353216
 # y:
	.word	1065353216
 # speed:
	.word	1065353216
	.section	.text.main,"ax",@progbits
	.align	2
	.align	5
	.globl	main
$LFB107 = .
	.loc 1 247 1
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,240,$31		# vars= 160, regs= 2/0, args= 64, gp= 0
	.mask	0xc0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-240	 #,,
$LCFI50 = .
	sd	$31,232($sp)	 #,
	sd	$fp,224($sp)	 #,
$LCFI51 = .
	move	$fp,$sp	 #,
$LCFI52 = .
 # src/main.c:248:     display_init(RESOLUTION, DEPTH_32_BPP, 3, GAMMA_CORRECT_DITHER, FILTERS_RESAMPLE_ANTIALIAS);
	.loc 1 248 5
	lui	$2,%hi(RESOLUTION_320x240)	 # tmp261,
	li	$3,3			# 0x3	 # tmp262,
	sw	$3,44($sp)	 # tmp262,
	li	$3,2			# 0x2	 # tmp263,
	sw	$3,36($sp)	 # tmp263,
	li	$7,3			# 0x3	 #,
	li	$6,1			# 0x1	 #,
	ld	$4,%lo(RESOLUTION_320x240)($2)		 #, RESOLUTION_320x240
	addiu	$2,$2,%lo(RESOLUTION_320x240)	 # tmp264, tmp261,
	ld	$5,8($2)		 #, RESOLUTION_320x240
	jal	display_init
	nop
	 #
 # src/main.c:249:     controller_init();
	.loc 1 249 5
	jal	controller_init
	nop
	 #
 # src/main.c:250:     rdpq_init();
	.loc 1 250 5
	jal	rdpq_init
	nop
	 #
$LBB10 = .
 # src/main.c:252:     color_t const COLOR_WHITE = RGBA32(255, 255, 255, 255);
	.loc 1 252 5
	li	$2,-1			# 0xffffffffffffffff	 # tmp265,
	sb	$2,80($fp)	 # tmp265, D.6088.r
	li	$2,-1			# 0xffffffffffffffff	 # tmp266,
	sb	$2,81($fp)	 # tmp266, D.6088.g
	li	$2,-1			# 0xffffffffffffffff	 # tmp267,
	sb	$2,82($fp)	 # tmp267, D.6088.b
	li	$2,-1			# 0xffffffffffffffff	 # tmp268,
	sb	$2,83($fp)	 # tmp268, D.6088.a
$LBE10 = .
 # src/main.c:252:     color_t const COLOR_WHITE = RGBA32(255, 255, 255, 255);
	.loc 1 252 19
	lw	$2,80($fp)		 # tmp269, D.6088
	sw	$2,88($fp)	 # tmp269, COLOR_WHITE
 # src/main.c:254:     Paddle paddles[2] = {
	.loc 1 254 12
	lui	$2,%hi($LC4)	 # tmp270,
	ld	$4,%lo($LC4)($2)		 # tmp271,
	addiu	$3,$2,%lo($LC4)	 # tmp273, tmp270,
	ld	$3,8($3)		 # tmp272,
	addiu	$2,$2,%lo($LC4)	 # tmp275, tmp270,
	ld	$2,16($2)		 # tmp274,
	sd	$4,96($fp)	 # tmp271, paddles
	sd	$3,104($fp)	 # tmp272, paddles
	sd	$2,112($fp)	 # tmp274, paddles
 # src/main.c:265:     Ball ball = {
	.loc 1 265 10
	lui	$2,%hi($LC5)	 # tmp276,
	ld	$4,%lo($LC5)($2)		 # tmp277,
	addiu	$3,$2,%lo($LC5)	 # tmp279, tmp276,
	ld	$3,8($3)		 # tmp278,
	sd	$4,120($fp)	 # tmp277, ball
	sd	$3,128($fp)	 # tmp278, ball
	addiu	$2,$2,%lo($LC5)	 # tmp280, tmp276,
	lw	$2,16($2)		 # tmp281,
	sw	$2,136($fp)	 # tmp281, ball
$L68:
$LBB11 = .
 # src/main.c:272:         surface_t *disp = display_get();
	.loc 1 272 27
	jal	display_get
	nop
	 #
	sw	$2,68($fp)	 #, disp
 # src/main.c:273:         rdpq_attach_clear(disp, NULL);
	.loc 1 273 9
	move	$5,$0	 #,
	lw	$4,68($fp)		 #, disp
	jal	rdpq_attach_clear
	nop
	 #
 # src/main.c:275:         draw_middle_line();
	.loc 1 275 9
	jal	draw_middle_line
	nop
	 #
 # src/main.c:277:         rdpq_set_mode_fill(COLOR_WHITE);
	.loc 1 277 9
	ld	$4,88($fp)		 #, COLOR_WHITE
	jal	rdpq_set_mode_fill
	nop
	 #
 # src/main.c:278:         draw_scores(paddles[0].score, paddles[1].score);
	.loc 1 278 9
	lw	$2,104($fp)		 # _1, paddles[0].score
	lw	$3,116($fp)		 # _2, paddles[1].score
	move	$5,$3	 #, _2
	move	$4,$2	 #, _1
	jal	draw_scores
	nop
	 #
 # src/main.c:279:         draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
	.loc 1 279 27
	lwc1	$f0,120($fp)	 # _3, ball.pos.D.5971.x
 # src/main.c:279:         draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
	.loc 1 279 9
	trunc.w.s $f1,$f0	 # _4, _3
 # src/main.c:279:         draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
	.loc 1 279 39
	lwc1	$f0,124($fp)	 # _5, ball.pos.D.5971.y
 # src/main.c:279:         draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
	.loc 1 279 9
	trunc.w.s $f0,$f0	 # _6, _5
	li	$7,5			# 0x5	 #,
	li	$6,5			# 0x5	 #,
	mfc1	$5,$f0	 #, _6
	mfc1	$4,$f1	 #, _4
	jal	draw_rect
	nop
	 #
 # src/main.c:280:         draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 280 33
	lwc1	$f0,96($fp)	 # _7, paddles[0].pos.D.5971.x
 # src/main.c:280:         draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 280 9
	trunc.w.s $f1,$f0	 # _8, _7
 # src/main.c:280:         draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 280 51
	lwc1	$f0,100($fp)	 # _9, paddles[0].pos.D.5971.y
 # src/main.c:280:         draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 280 9
	trunc.w.s $f0,$f0	 # _10, _9
	li	$7,25			# 0x19	 #,
	li	$6,5			# 0x5	 #,
	mfc1	$5,$f0	 #, _10
	mfc1	$4,$f1	 #, _8
	jal	draw_rect
	nop
	 #
 # src/main.c:281:         draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 281 33
	lwc1	$f0,108($fp)	 # _11, paddles[1].pos.D.5971.x
 # src/main.c:281:         draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 281 9
	trunc.w.s $f1,$f0	 # _12, _11
 # src/main.c:281:         draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 281 51
	lwc1	$f0,112($fp)	 # _13, paddles[1].pos.D.5971.y
 # src/main.c:281:         draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 281 9
	trunc.w.s $f0,$f0	 # _14, _13
	li	$7,25			# 0x19	 #,
	li	$6,5			# 0x5	 #,
	mfc1	$5,$f0	 #, _14
	mfc1	$4,$f1	 #, _12
	jal	draw_rect
	nop
	 #
 # src/main.c:283:         controller_scan();
	.loc 1 283 9
	jal	controller_scan
	nop
	 #
 # src/main.c:284:         struct controller_data keys = get_keys_held();
	.loc 1 284 39
	addiu	$2,$fp,152	 # tmp282,,
	move	$4,$2	 #, tmp282
	jal	get_keys_held
	nop
	 #
 # src/main.c:286:         switch (g_game_state) {
	.loc 1 286 9
	lw	$2,%gp_rel(g_game_state)($28)		 # g_game_state.3_15, g_game_state
	beq	$2,$0,$L43
	nop
	 #, g_game_state.3_15,,
	li	$3,1			# 0x1	 # tmp283,
	bne	$2,$3,$L44
	nop
	 #, g_game_state.3_15, tmp283,
 # src/main.c:289:                 ball.pos = vec2_add(ball.pos, vec2_scale(ball.vel, ball.speed));
	.loc 1 289 28
	lwc1	$f0,136($fp)	 # _16, ball.speed
	addiu	$2,$fp,72	 # tmp284,,
	mfc1	$6,$f0	 #, _16
	ld	$5,128($fp)		 #, ball.vel
	move	$4,$2	 #, tmp284
	jal	vec2_scale
	nop
	 #
 # src/main.c:289:                 ball.pos = vec2_add(ball.pos, vec2_scale(ball.vel, ball.speed));
	.loc 1 289 28 is_stmt 0 discriminator 1
	addiu	$2,$fp,216	 # tmp285,,
	ld	$6,72($fp)		 #, D.6135
	ld	$5,120($fp)		 #, ball.pos
	move	$4,$2	 #, tmp285
	jal	vec2_add
	nop
	 #
	ldl	$2,216($fp)	 # tmp287,
	ldr	$2,223($fp)	 # tmp286,
	sd	$2,120($fp)	 # tmp286, ball.pos
 # src/main.c:292:                 if (keys.c[0].up) {
	.loc 1 292 21 is_stmt 1
	lw	$3,156($fp)		 # _17, keys.c[0].D.3018.D.3017
	li	$2,134217728			# 0x8000000	 # tmp288,
	and	$2,$3,$2	 # _18, _17, tmp288
 # src/main.c:292:                 if (keys.c[0].up) {
	.loc 1 292 20
	beq	$2,$0,$L45
	nop
	 #, _18,,
 # src/main.c:293:                     paddles[0].pos.y -= PADDLE_SPEED;
	.loc 1 293 35
	lwc1	$f1,100($fp)	 # _19, paddles[0].pos.D.5971.y
 # src/main.c:293:                     paddles[0].pos.y -= PADDLE_SPEED;
	.loc 1 293 38
	lwc1	$f0,%gp_rel($LC9)($28)	 # tmp289,
	sub.s	$f0,$f1,$f0	 # _20, _19, tmp289
	swc1	$f0,100($fp)	 # _20, paddles[0].pos.D.5971.y
$L45:
 # src/main.c:295:                 if (keys.c[0].down) {
	.loc 1 295 21
	lw	$3,156($fp)		 # _21, keys.c[0].D.3018.D.3017
	li	$2,67108864			# 0x4000000	 # tmp290,
	and	$2,$3,$2	 # _22, _21, tmp290
 # src/main.c:295:                 if (keys.c[0].down) {
	.loc 1 295 20
	beq	$2,$0,$L46
	nop
	 #, _22,,
 # src/main.c:296:                     paddles[0].pos.y += PADDLE_SPEED;
	.loc 1 296 35
	lwc1	$f1,100($fp)	 # _23, paddles[0].pos.D.5971.y
 # src/main.c:296:                     paddles[0].pos.y += PADDLE_SPEED;
	.loc 1 296 38
	lwc1	$f0,%gp_rel($LC9)($28)	 # tmp291,
	add.s	$f0,$f1,$f0	 # _24, _23, tmp291
	swc1	$f0,100($fp)	 # _24, paddles[0].pos.D.5971.y
$L46:
 # src/main.c:300:                 if (keys.c[0].C_up) {
	.loc 1 300 21
	lw	$3,156($fp)		 # _25, keys.c[0].D.3018.D.3017
	li	$2,524288			# 0x80000	 # tmp292,
	and	$2,$3,$2	 # _26, _25, tmp292
 # src/main.c:300:                 if (keys.c[0].C_up) {
	.loc 1 300 20
	beq	$2,$0,$L47
	nop
	 #, _26,,
 # src/main.c:301:                     paddles[1].pos.y -= PADDLE_SPEED;
	.loc 1 301 35
	lwc1	$f1,112($fp)	 # _27, paddles[1].pos.D.5971.y
 # src/main.c:301:                     paddles[1].pos.y -= PADDLE_SPEED;
	.loc 1 301 38
	lwc1	$f0,%gp_rel($LC9)($28)	 # tmp293,
	sub.s	$f0,$f1,$f0	 # _28, _27, tmp293
	swc1	$f0,112($fp)	 # _28, paddles[1].pos.D.5971.y
$L47:
 # src/main.c:303:                 if (keys.c[0].C_down) {
	.loc 1 303 21
	lw	$3,156($fp)		 # _29, keys.c[0].D.3018.D.3017
	li	$2,262144			# 0x40000	 # tmp294,
	and	$2,$3,$2	 # _30, _29, tmp294
 # src/main.c:303:                 if (keys.c[0].C_down) {
	.loc 1 303 20
	beq	$2,$0,$L48
	nop
	 #, _30,,
 # src/main.c:304:                     paddles[1].pos.y += PADDLE_SPEED;
	.loc 1 304 35
	lwc1	$f1,112($fp)	 # _31, paddles[1].pos.D.5971.y
 # src/main.c:304:                     paddles[1].pos.y += PADDLE_SPEED;
	.loc 1 304 38
	lwc1	$f0,%gp_rel($LC9)($28)	 # tmp295,
	add.s	$f0,$f1,$f0	 # _32, _31, tmp295
	swc1	$f0,112($fp)	 # _32, paddles[1].pos.D.5971.y
$L48:
 # src/main.c:308:                 paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 308 36
	lwc1	$f0,100($fp)	 # _33, paddles[0].pos.D.5971.y
	mtc1	$0,$f1	 #, tmp296
	nop	
	c.lt.s	$f0,$f1	 #, _33, tmp296
	nop	
	bc1f	$L73
	nop
	 #,,
 # src/main.c:308:                 paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 308 36 is_stmt 0 discriminator 1
	mtc1	$0,$f0	 #, iftmp.4_66
	b	$L51
	nop
	 #
$L73:
 # src/main.c:308:                 paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 308 36 discriminator 2
	lwc1	$f0,100($fp)	 # _34, paddles[0].pos.D.5971.y
	lwc1	$f1,%gp_rel($LC10)($28)	 # tmp297,
	c.le.s	$f0,$f1	 #, iftmp.4_66, tmp297
	nop	
	bc1t	$L51
	nop
	 #,,
	lwc1	$f0,%gp_rel($LC10)($28)	 # iftmp.4_66,
$L51:
 # src/main.c:308:                 paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 308 34 is_stmt 1 discriminator 4
	swc1	$f0,100($fp)	 # iftmp.4_66, paddles[0].pos.D.5971.y
 # src/main.c:309:                 paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 309 36
	lwc1	$f0,112($fp)	 # _35, paddles[1].pos.D.5971.y
	mtc1	$0,$f1	 #, tmp298
	nop	
	c.lt.s	$f0,$f1	 #, _35, tmp298
	nop	
	bc1f	$L74
	nop
	 #,,
 # src/main.c:309:                 paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 309 36 is_stmt 0 discriminator 1
	mtc1	$0,$f0	 #, iftmp.5_67
	b	$L55
	nop
	 #
$L74:
 # src/main.c:309:                 paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 309 36 discriminator 2
	lwc1	$f0,112($fp)	 # _36, paddles[1].pos.D.5971.y
	lwc1	$f1,%gp_rel($LC10)($28)	 # tmp299,
	c.le.s	$f0,$f1	 #, iftmp.5_67, tmp299
	nop	
	bc1t	$L55
	nop
	 #,,
	lwc1	$f0,%gp_rel($LC10)($28)	 # iftmp.5_67,
$L55:
 # src/main.c:309:                 paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 309 34 is_stmt 1 discriminator 4
	swc1	$f0,112($fp)	 # iftmp.5_67, paddles[1].pos.D.5971.y
 # src/main.c:312:                 if (ball.pos.y + BALL_SIZE >= SCREEN_HEIGHT ||
	.loc 1 312 29
	lwc1	$f1,124($fp)	 # _37, ball.pos.D.5971.y
 # src/main.c:312:                 if (ball.pos.y + BALL_SIZE >= SCREEN_HEIGHT ||
	.loc 1 312 20
	lwc1	$f0,%gp_rel($LC11)($28)	 # tmp300,
	c.le.s	$f0,$f1	 #, tmp300, _37
	nop	
	bc1t	$L57
	nop
	 #,,
 # src/main.c:313:                     ball.pos.y <= 0)
	.loc 1 313 29
	lwc1	$f0,124($fp)	 # _38, ball.pos.D.5971.y
 # src/main.c:312:                 if (ball.pos.y + BALL_SIZE >= SCREEN_HEIGHT ||
	.loc 1 312 61 discriminator 1
	mtc1	$0,$f1	 #, tmp301
	nop	
	c.le.s	$f0,$f1	 #, _38, tmp301
	nop	
	bc1f	$L58
	nop
	 #,,
$L57:
 # src/main.c:315:                     ball.vel.y *= -1;
	.loc 1 315 29
	lwc1	$f0,132($fp)	 # _39, ball.vel.D.5971.y
 # src/main.c:315:                     ball.vel.y *= -1;
	.loc 1 315 32
	neg.s	$f0,$f0	 # _40, _39
	swc1	$f0,132($fp)	 # _40, ball.vel.D.5971.y
 # src/main.c:316:                     ball.speed *= 1.05;
	.loc 1 316 25
	lwc1	$f0,136($fp)	 # _41, ball.speed
	cvt.d.s	$f1,$f0	 # _42, _41
 # src/main.c:316:                     ball.speed *= 1.05;
	.loc 1 316 32
	ldc1	$f0,%gp_rel($LC12)($28)	 # tmp302,
	mul.d	$f0,$f1,$f0	 # _43, _42, tmp302
	cvt.s.d	$f0,$f0	 # _44, _43
	swc1	$f0,136($fp)	 # _44, ball.speed
$L58:
$LBB12 = .
 # src/main.c:320:                 for (int i = 0; i < ArrayCount(paddles); i++) {
	.loc 1 320 26
	sw	$0,64($fp)	 #, i
 # src/main.c:320:                 for (int i = 0; i < ArrayCount(paddles); i++) {
	.loc 1 320 17
	b	$L60
	nop
	 #
$L62:
 # src/main.c:321:                     if (HasCollision(
	.loc 1 321 25
	lwc1	$f3,120($fp)	 # _45, ball.pos.D.5971.x
	lwc1	$f4,124($fp)	 # _46, ball.pos.D.5971.y
	lw	$3,64($fp)		 # tmp303, i
	move	$2,$3	 # tmp305, tmp303
	sll	$2,$2,1	 # tmp306, tmp305,
	addu	$2,$2,$3	 # tmp305, tmp305, tmp303
	sll	$2,$2,2	 # tmp307, tmp305,
	addiu	$3,$fp,64	 # tmp330,,
	addu	$2,$3,$2	 # tmp304, tmp330, tmp305
	lwc1	$f0,32($2)	 # _47, paddles[i_65].pos.D.5971.x
	lw	$3,64($fp)		 # tmp308, i
	move	$2,$3	 # tmp310, tmp308
	sll	$2,$2,1	 # tmp311, tmp310,
	addu	$2,$2,$3	 # tmp310, tmp310, tmp308
	sll	$2,$2,2	 # tmp312, tmp310,
	addiu	$3,$fp,64	 # tmp331,,
	addu	$2,$3,$2	 # tmp309, tmp331, tmp310
	lwc1	$f1,36($2)	 # _48, paddles[i_65].pos.D.5971.y
	lwc1	$f6,%gp_rel($LC13)($28)	 # tmp313,
	lwc1	$f5,%gp_rel($LC13)($28)	 # tmp314,
	lwc1	$f2,%gp_rel($LC14)($28)	 # tmp315,
	swc1	$f2,60($sp)	 # tmp315,
	lwc1	$f2,%gp_rel($LC13)($28)	 # tmp316,
	swc1	$f2,52($sp)	 # tmp316,
	swc1	$f1,44($sp)	 # _48,
	swc1	$f0,36($sp)	 # _47,
	mfc1	$7,$f6	 #, tmp313
	mfc1	$6,$f5	 #, tmp314
	mov.s	$f13,$f4	 #, _46
	mov.s	$f12,$f3	 #, _45
	jal	AABB
	nop
	 #
 # src/main.c:321:                     if (HasCollision(
	.loc 1 321 24 discriminator 1
	beq	$2,$0,$L61
	nop
	 #, _49,,
 # src/main.c:325:                         ball.vel.x *= -1;
	.loc 1 325 33
	lwc1	$f0,128($fp)	 # _50, ball.vel.D.5971.x
 # src/main.c:325:                         ball.vel.x *= -1;
	.loc 1 325 36
	neg.s	$f0,$f0	 # _51, _50
	swc1	$f0,128($fp)	 # _51, ball.vel.D.5971.x
 # src/main.c:326:                         ball.speed *= 1.05;
	.loc 1 326 29
	lwc1	$f0,136($fp)	 # _52, ball.speed
	cvt.d.s	$f1,$f0	 # _53, _52
 # src/main.c:326:                         ball.speed *= 1.05;
	.loc 1 326 36
	ldc1	$f0,%gp_rel($LC12)($28)	 # tmp318,
	mul.d	$f0,$f1,$f0	 # _54, _53, tmp318
	cvt.s.d	$f0,$f0	 # _55, _54
	swc1	$f0,136($fp)	 # _55, ball.speed
$L61:
 # src/main.c:320:                 for (int i = 0; i < ArrayCount(paddles); i++) {
	.loc 1 320 59 discriminator 2
	lw	$2,64($fp)		 # tmp320, i
	addiu	$2,$2,1	 # i_125, tmp320,
	sw	$2,64($fp)	 # i_125, i
$L60:
 # src/main.c:320:                 for (int i = 0; i < ArrayCount(paddles); i++) {
	.loc 1 320 35 discriminator 1
	lw	$2,64($fp)		 # i.6_56, i
	sltu	$2,$2,2	 # tmp321, i.6_56,
	bne	$2,$0,$L62
	nop
	 #, tmp321,,
$LBE12 = .
 # src/main.c:331:                 if (ball.pos.x + BALL_SIZE >= SCREEN_WIDTH) {
	.loc 1 331 29
	lwc1	$f1,120($fp)	 # _57, ball.pos.D.5971.x
 # src/main.c:331:                 if (ball.pos.x + BALL_SIZE >= SCREEN_WIDTH) {
	.loc 1 331 20
	lwc1	$f0,%gp_rel($LC15)($28)	 # tmp322,
	c.le.s	$f0,$f1	 #, tmp322, _57
	nop	
	bc1f	$L63
	nop
	 #,,
 # src/main.c:332:                     paddles[0].score++;
	.loc 1 332 31
	lw	$2,104($fp)		 # _58, paddles[0].score
 # src/main.c:332:                     paddles[0].score++;
	.loc 1 332 37
	addiu	$2,$2,1	 # _59, _58,
	sw	$2,104($fp)	 # _59, paddles[0].score
 # src/main.c:333:                     transition_to_serving(paddles, &ball);
	.loc 1 333 21
	addiu	$3,$fp,120	 # tmp323,,
	addiu	$2,$fp,96	 # tmp324,,
	move	$5,$3	 #, tmp323
	move	$4,$2	 #, tmp324
	jal	transition_to_serving
	nop
	 #
$L63:
 # src/main.c:337:                 if (ball.pos.x <= 0) {
	.loc 1 337 29
	lwc1	$f0,120($fp)	 # _60, ball.pos.D.5971.x
 # src/main.c:337:                 if (ball.pos.x <= 0) {
	.loc 1 337 20
	mtc1	$0,$f1	 #, tmp325
	nop	
	c.le.s	$f0,$f1	 #, _60, tmp325
	nop	
	bc1t	$L72
	nop
	 #,,
 # src/main.c:341:             } break;
	.loc 1 341 15
	b	$L44
	nop
	 #
$L72:
 # src/main.c:338:                     paddles[1].score++;
	.loc 1 338 31
	lw	$2,116($fp)		 # _61, paddles[1].score
 # src/main.c:338:                     paddles[1].score++;
	.loc 1 338 37
	addiu	$2,$2,1	 # _62, _61,
	sw	$2,116($fp)	 # _62, paddles[1].score
 # src/main.c:339:                     transition_to_serving(paddles, &ball);
	.loc 1 339 21
	addiu	$3,$fp,120	 # tmp326,,
	addiu	$2,$fp,96	 # tmp327,,
	move	$5,$3	 #, tmp326
	move	$4,$2	 #, tmp327
	jal	transition_to_serving
	nop
	 #
 # src/main.c:341:             } break;
	.loc 1 341 15
	b	$L44
	nop
	 #
$L43:
 # src/main.c:345:                 if (keys.c[0].A) {
	.loc 1 345 21
	lw	$3,156($fp)		 # _63, keys.c[0].D.3018.D.3017
	li	$2,-2147483648			# 0xffffffff80000000	 # tmp328,
	and	$2,$3,$2	 # _64, _63, tmp328
 # src/main.c:345:                 if (keys.c[0].A) {
	.loc 1 345 20
	beq	$2,$0,$L75
	nop
	 #, _64,,
 # src/main.c:346:                     g_game_state = Game_State_Playing;
	.loc 1 346 34
	li	$2,1			# 0x1	 # tmp329,
	sw	$2,%gp_rel(g_game_state)($28)	 # tmp329, g_game_state
$L75:
 # src/main.c:348:             } break;
	.loc 1 348 15
	nop	
$L44:
 # src/main.c:351:         rdpq_detach_show();
	.loc 1 351 9
	jal	rdpq_detach_show
	nop
	 #
$LBE11 = .
 # src/main.c:271:     while (1) {
	.loc 1 271 15
	b	$L68
	nop
	 #
	.set	macro
	.set	reorder
	.end	main
$LFE107:
	.size	main, .-main
	.section	.data.digits_font.0,"aw"
	.align	3
	.type	digits_font.0, @object
	.size	digits_font.0, 50
digits_font.0:
	.ascii	"\017\011\011\011\017"
	.ascii	"\006\002\002\002\007"
	.ascii	"\017\001\017\010\017"
	.ascii	"\017\001\017\001\017"
	.ascii	"\011\011\017\001\001"
	.ascii	"\017\010\017\001\017"
	.ascii	"\017\010\017\011\017"
	.ascii	"\017\001\001\001\001"
	.ascii	"\017\011\017\011\017"
	.ascii	"\017\011\017\001\001"
	.section	.sdata
	.align	3
$LC6:
	.word	1076101120
	.word	0
	.align	3
$LC7:
	.word	1105199104
	.word	0
	.align	2
$LC8:
	.word	1065353216
	.align	2
$LC9:
	.word	1075838976
	.align	2
$LC10:
	.word	1129775104
	.align	2
$LC11:
	.word	1131085824
	.align	3
$LC12:
	.word	1072745676
	.word	-858993459
	.align	2
$LC13:
	.word	1084227584
	.align	2
$LC14:
	.word	1103626240
	.align	2
$LC15:
	.word	1134395392
	.section	.debug_frame,"",@progbits
$Lframe0:
	.4byte	$LECIE0-$LSCIE0
$LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0x1f
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0
	.align	2
$LECIE0:
$LSFDE0:
	.4byte	$LEFDE0-$LASFDE0
$LASFDE0:
	.4byte	$Lframe0
	.4byte	$LFB97
	.4byte	$LFE97-$LFB97
	.byte	0x4
	.4byte	$LCFI0-$LFB97
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	$LCFI1-$LCFI0
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	$LCFI2-$LCFI1
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI3-$LCFI2
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI4-$LCFI3
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE0:
$LSFDE2:
	.4byte	$LEFDE2-$LASFDE2
$LASFDE2:
	.4byte	$Lframe0
	.4byte	$LFB98
	.4byte	$LFE98-$LFB98
	.byte	0x4
	.4byte	$LCFI5-$LFB98
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	$LCFI6-$LCFI5
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	$LCFI7-$LCFI6
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI8-$LCFI7
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI9-$LCFI8
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE2:
$LSFDE4:
	.4byte	$LEFDE4-$LASFDE4
$LASFDE4:
	.4byte	$Lframe0
	.4byte	$LFB99
	.4byte	$LFE99-$LFB99
	.byte	0x4
	.4byte	$LCFI10-$LFB99
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	$LCFI11-$LCFI10
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	$LCFI12-$LCFI11
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI13-$LCFI12
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI14-$LCFI13
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE4:
$LSFDE6:
	.4byte	$LEFDE6-$LASFDE6
$LASFDE6:
	.4byte	$Lframe0
	.4byte	$LFB100
	.4byte	$LFE100-$LFB100
	.byte	0x4
	.4byte	$LCFI15-$LFB100
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	$LCFI16-$LCFI15
	.byte	0x9f
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI17-$LCFI16
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI18-$LCFI17
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI19-$LCFI18
	.byte	0xde
	.byte	0xdf
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE6:
$LSFDE8:
	.4byte	$LEFDE8-$LASFDE8
$LASFDE8:
	.4byte	$Lframe0
	.4byte	$LFB101
	.4byte	$LFE101-$LFB101
	.byte	0x4
	.4byte	$LCFI20-$LFB101
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	$LCFI21-$LCFI20
	.byte	0x9f
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI22-$LCFI21
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI23-$LCFI22
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI24-$LCFI23
	.byte	0xde
	.byte	0xdf
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE8:
$LSFDE10:
	.4byte	$LEFDE10-$LASFDE10
$LASFDE10:
	.4byte	$Lframe0
	.4byte	$LFB102
	.4byte	$LFE102-$LFB102
	.byte	0x4
	.4byte	$LCFI25-$LFB102
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	$LCFI26-$LCFI25
	.byte	0x9f
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI27-$LCFI26
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI28-$LCFI27
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI29-$LCFI28
	.byte	0xde
	.byte	0xdf
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE10:
$LSFDE12:
	.4byte	$LEFDE12-$LASFDE12
$LASFDE12:
	.4byte	$Lframe0
	.4byte	$LFB103
	.4byte	$LFE103-$LFB103
	.byte	0x4
	.4byte	$LCFI30-$LFB103
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	$LCFI31-$LCFI30
	.byte	0x9f
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI32-$LCFI31
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI33-$LCFI32
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI34-$LCFI33
	.byte	0xde
	.byte	0xdf
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE12:
$LSFDE14:
	.4byte	$LEFDE14-$LASFDE14
$LASFDE14:
	.4byte	$Lframe0
	.4byte	$LFB104
	.4byte	$LFE104-$LFB104
	.byte	0x4
	.4byte	$LCFI35-$LFB104
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	$LCFI36-$LCFI35
	.byte	0x9f
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI37-$LCFI36
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI38-$LCFI37
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI39-$LCFI38
	.byte	0xde
	.byte	0xdf
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE14:
$LSFDE16:
	.4byte	$LEFDE16-$LASFDE16
$LASFDE16:
	.4byte	$Lframe0
	.4byte	$LFB105
	.4byte	$LFE105-$LFB105
	.byte	0x4
	.4byte	$LCFI40-$LFB105
	.byte	0xe
	.uleb128 0x60
	.byte	0x4
	.4byte	$LCFI41-$LCFI40
	.byte	0x9f
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI42-$LCFI41
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI43-$LCFI42
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI44-$LCFI43
	.byte	0xde
	.byte	0xdf
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE16:
$LSFDE18:
	.4byte	$LEFDE18-$LASFDE18
$LASFDE18:
	.4byte	$Lframe0
	.4byte	$LFB106
	.4byte	$LFE106-$LFB106
	.byte	0x4
	.4byte	$LCFI45-$LFB106
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	$LCFI46-$LCFI45
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	$LCFI47-$LCFI46
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	$LCFI48-$LCFI47
	.byte	0xd
	.uleb128 0x1d
	.byte	0x4
	.4byte	$LCFI49-$LCFI48
	.byte	0xde
	.byte	0xe
	.uleb128 0
	.align	2
$LEFDE18:
$LSFDE20:
	.4byte	$LEFDE20-$LASFDE20
$LASFDE20:
	.4byte	$Lframe0
	.4byte	$LFB107
	.4byte	$LFE107-$LFB107
	.byte	0x4
	.4byte	$LCFI50-$LFB107
	.byte	0xe
	.uleb128 0xf0
	.byte	0x4
	.4byte	$LCFI51-$LCFI50
	.byte	0x9f
	.uleb128 0x2
	.byte	0x9e
	.uleb128 0x4
	.byte	0x4
	.4byte	$LCFI52-$LCFI51
	.byte	0xd
	.uleb128 0x1e
	.align	2
$LEFDE20:
	.text
$Letext0:
	.file 2 "/n64_toolchain/mips64-elf/include/machine/_default_types.h"
	.file 3 "/n64_toolchain/mips64-elf/include/sys/_stdint.h"
	.file 4 "/n64_toolchain/mips64-elf/include/display.h"
	.file 5 "/n64_toolchain/mips64-elf/include/surface.h"
	.file 6 "/n64_toolchain/mips64-elf/include/controller.h"
	.file 7 "/n64_toolchain/mips64-elf/include/graphics.h"
	.file 8 "/n64_toolchain/mips64-elf/include/rdpq_attach.h"
	.file 9 "/n64_toolchain/mips64-elf/include/rdpq.h"
	.file 10 "/n64_toolchain/mips64-elf/include/rdpq_mode.h"
	.file 11 "/n64_toolchain/mips64-elf/include/rdpq_rect.h"
	.file 12 "/n64_toolchain/mips64-elf/include/math.h"
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.4byte	0xc62
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	$Ldebug_abbrev0
	.uleb128 0x24
	.4byte	$LASF124
	.byte	0xc
	.4byte	$LASF125
	.ascii	"\000"
	.4byte	$LLRL0
	.4byte	0
	.4byte	$Ldebug_line0
	.uleb128 0x25
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.4byte	$LASF0
	.uleb128 0x7
	.byte	0x1
	.byte	0x6
	.4byte	$LASF1
	.uleb128 0x2
	.4byte	$LASF4
	.byte	0x2
	.byte	0x2b
	.byte	0x18
	.4byte	0x44
	.uleb128 0x7
	.byte	0x1
	.byte	0x8
	.4byte	$LASF2
	.uleb128 0x7
	.byte	0x2
	.byte	0x5
	.4byte	$LASF3
	.uleb128 0x2
	.4byte	$LASF5
	.byte	0x2
	.byte	0x39
	.byte	0x19
	.4byte	0x5e
	.uleb128 0x7
	.byte	0x2
	.byte	0x7
	.4byte	$LASF6
	.uleb128 0x2
	.4byte	$LASF7
	.byte	0x2
	.byte	0x4d
	.byte	0x18
	.4byte	0x71
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.4byte	$LASF8
	.uleb128 0x2
	.4byte	$LASF9
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x84
	.uleb128 0x7
	.byte	0x4
	.byte	0x7
	.4byte	$LASF10
	.uleb128 0x7
	.byte	0x8
	.byte	0x5
	.4byte	$LASF11
	.uleb128 0x2
	.4byte	$LASF12
	.byte	0x2
	.byte	0x69
	.byte	0x19
	.4byte	0x9e
	.uleb128 0x7
	.byte	0x8
	.byte	0x7
	.4byte	$LASF13
	.uleb128 0x26
	.byte	0x4
	.uleb128 0x7
	.byte	0x1
	.byte	0x6
	.4byte	$LASF14
	.uleb128 0x7
	.byte	0x4
	.byte	0x4
	.4byte	$LASF15
	.uleb128 0x7
	.byte	0x8
	.byte	0x4
	.4byte	$LASF16
	.uleb128 0x2
	.4byte	$LASF17
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x38
	.uleb128 0x2
	.4byte	$LASF18
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x52
	.uleb128 0x2
	.4byte	$LASF19
	.byte	0x3
	.byte	0x2c
	.byte	0x13
	.4byte	0x65
	.uleb128 0x2
	.4byte	$LASF20
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LASF21
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x92
	.uleb128 0x2
	.4byte	$LASF22
	.byte	0x4
	.byte	0x27
	.byte	0x1a
	.4byte	0x109
	.uleb128 0xe
	.4byte	0xf8
	.uleb128 0x14
	.4byte	$LASF59
	.byte	0xc
	.byte	0x5
	.byte	0x89
	.4byte	0x157
	.uleb128 0x9
	.4byte	$LASF23
	.byte	0x5
	.byte	0x8b
	.byte	0xe
	.4byte	0xc8
	.byte	0
	.uleb128 0x9
	.4byte	$LASF24
	.byte	0x5
	.byte	0x8c
	.byte	0xe
	.4byte	0xc8
	.byte	0x2
	.uleb128 0x9
	.4byte	$LASF25
	.byte	0x5
	.byte	0x8d
	.byte	0xe
	.4byte	0xc8
	.byte	0x4
	.uleb128 0x9
	.4byte	$LASF26
	.byte	0x5
	.byte	0x8e
	.byte	0xe
	.4byte	0xc8
	.byte	0x6
	.uleb128 0x9
	.4byte	$LASF27
	.byte	0x5
	.byte	0x8f
	.byte	0xb
	.4byte	0xa5
	.byte	0x8
	.byte	0
	.uleb128 0x15
	.byte	0xc
	.byte	0x4
	.byte	0x35
	.4byte	0x187
	.uleb128 0x9
	.4byte	$LASF24
	.byte	0x4
	.byte	0x37
	.byte	0xd
	.4byte	0xd4
	.byte	0
	.uleb128 0x9
	.4byte	$LASF25
	.byte	0x4
	.byte	0x39
	.byte	0xd
	.4byte	0xd4
	.byte	0x4
	.uleb128 0x9
	.4byte	$LASF28
	.byte	0x4
	.byte	0x3b
	.byte	0xa
	.4byte	0x187
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.byte	0x2
	.4byte	$LASF29
	.uleb128 0x2
	.4byte	$LASF30
	.byte	0x4
	.byte	0x3c
	.byte	0x3
	.4byte	0x157
	.uleb128 0xe
	.4byte	0x18e
	.uleb128 0x3
	.4byte	$LASF31
	.byte	0x4
	.byte	0x42
	.byte	0x14
	.4byte	0x19a
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_256x240
	.uleb128 0x3
	.4byte	$LASF32
	.byte	0x4
	.byte	0x44
	.byte	0x14
	.4byte	0x19a
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_320x240
	.uleb128 0x3
	.4byte	$LASF33
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.4byte	0x19a
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_512x240
	.uleb128 0x3
	.4byte	$LASF34
	.byte	0x4
	.byte	0x48
	.byte	0x14
	.4byte	0x19a
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_640x240
	.uleb128 0x3
	.4byte	$LASF35
	.byte	0x4
	.byte	0x4a
	.byte	0x14
	.4byte	0x19a
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_512x480
	.uleb128 0x3
	.4byte	$LASF36
	.byte	0x4
	.byte	0x4c
	.byte	0x14
	.4byte	0x19a
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_640x480
	.uleb128 0x16
	.4byte	0x2a
	.byte	0x4
	.byte	0x51
	.byte	0x1
	.4byte	0x224
	.uleb128 0x8
	.4byte	$LASF37
	.byte	0
	.uleb128 0x8
	.4byte	$LASF38
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.4byte	$LASF39
	.byte	0x4
	.byte	0x56
	.byte	0x3
	.4byte	0x20b
	.uleb128 0x16
	.4byte	0x2a
	.byte	0x4
	.byte	0x5a
	.byte	0x1
	.4byte	0x24f
	.uleb128 0x8
	.4byte	$LASF40
	.byte	0
	.uleb128 0x8
	.4byte	$LASF41
	.byte	0x1
	.uleb128 0x8
	.4byte	$LASF42
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.4byte	$LASF43
	.byte	0x4
	.byte	0x62
	.byte	0x3
	.4byte	0x230
	.uleb128 0x16
	.4byte	0x2a
	.byte	0x4
	.byte	0x6f
	.byte	0x1
	.4byte	0x286
	.uleb128 0x8
	.4byte	$LASF44
	.byte	0
	.uleb128 0x8
	.4byte	$LASF45
	.byte	0x1
	.uleb128 0x8
	.4byte	$LASF46
	.byte	0x2
	.uleb128 0x8
	.4byte	$LASF47
	.byte	0x3
	.uleb128 0x8
	.4byte	$LASF48
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.4byte	$LASF49
	.byte	0x4
	.byte	0x82
	.byte	0x3
	.4byte	0x25b
	.uleb128 0x17
	.4byte	0xf8
	.uleb128 0x10
	.byte	0x4
	.byte	0x6
	.byte	0x4d
	.byte	0x9
	.4byte	0x2ae
	.uleb128 0x1
	.4byte	$LASF50
	.byte	0x50
	.byte	0x1a
	.4byte	0x2a
	.byte	0x20
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x4
	.byte	0x6
	.byte	0x52
	.byte	0x9
	.4byte	0x379
	.uleb128 0x4
	.ascii	"A\000"
	.byte	0x55
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0
	.uleb128 0x4
	.ascii	"B\000"
	.byte	0x57
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x1
	.uleb128 0x4
	.ascii	"Z\000"
	.byte	0x59
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x2
	.uleb128 0x1
	.4byte	$LASF51
	.byte	0x5b
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x3
	.uleb128 0x4
	.ascii	"up\000"
	.byte	0x5d
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x4
	.uleb128 0x1
	.4byte	$LASF52
	.byte	0x5f
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x5
	.uleb128 0x1
	.4byte	$LASF53
	.byte	0x61
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x6
	.uleb128 0x1
	.4byte	$LASF54
	.byte	0x63
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x7
	.uleb128 0x4
	.ascii	"L\000"
	.byte	0x67
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xa
	.uleb128 0x4
	.ascii	"R\000"
	.byte	0x69
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xb
	.uleb128 0x1
	.4byte	$LASF55
	.byte	0x6b
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xc
	.uleb128 0x1
	.4byte	$LASF56
	.byte	0x6d
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xd
	.uleb128 0x1
	.4byte	$LASF57
	.byte	0x6f
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xe
	.uleb128 0x1
	.4byte	$LASF58
	.byte	0x71
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xf
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x73
	.byte	0x14
	.4byte	0x23
	.byte	0x8
	.byte	0x10
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x75
	.byte	0x14
	.4byte	0x23
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0x1d
	.byte	0x4
	.byte	0x4b
	.4byte	0x38b
	.uleb128 0x11
	.4byte	0x297
	.uleb128 0x11
	.4byte	0x2ae
	.byte	0
	.uleb128 0x14
	.4byte	$LASF60
	.byte	0x8
	.byte	0x6
	.byte	0x42
	.4byte	0x3ab
	.uleb128 0x4
	.ascii	"err\000"
	.byte	0x47
	.byte	0xe
	.4byte	0x2a
	.byte	0x2
	.byte	0x10
	.uleb128 0x1e
	.4byte	0x379
	.byte	0x4
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.byte	0x6
	.byte	0x83
	.byte	0x9
	.4byte	0x3c2
	.uleb128 0x9
	.4byte	$LASF50
	.byte	0x6
	.byte	0x86
	.byte	0x16
	.4byte	0xec
	.byte	0
	.byte	0
	.uleb128 0x10
	.byte	0x8
	.byte	0x6
	.byte	0x88
	.byte	0x9
	.4byte	0x4ce
	.uleb128 0x4
	.ascii	"err\000"
	.byte	0x8a
	.byte	0x16
	.4byte	0x2a
	.byte	0x2
	.byte	0
	.uleb128 0x1
	.4byte	$LASF61
	.byte	0x8b
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x2
	.uleb128 0x1
	.4byte	$LASF51
	.byte	0x8c
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x3
	.uleb128 0x4
	.ascii	"y\000"
	.byte	0x8d
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x4
	.uleb128 0x4
	.ascii	"x\000"
	.byte	0x8e
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x5
	.uleb128 0x4
	.ascii	"b\000"
	.byte	0x8f
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x6
	.uleb128 0x4
	.ascii	"a\000"
	.byte	0x90
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x7
	.uleb128 0x1
	.4byte	$LASF62
	.byte	0x91
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x8
	.uleb128 0x4
	.ascii	"l\000"
	.byte	0x92
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x9
	.uleb128 0x4
	.ascii	"r\000"
	.byte	0x93
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xa
	.uleb128 0x4
	.ascii	"z\000"
	.byte	0x94
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xb
	.uleb128 0x4
	.ascii	"up\000"
	.byte	0x95
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xc
	.uleb128 0x1
	.4byte	$LASF52
	.byte	0x96
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xd
	.uleb128 0x1
	.4byte	$LASF54
	.byte	0x97
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xe
	.uleb128 0x1
	.4byte	$LASF53
	.byte	0x98
	.byte	0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0xf
	.uleb128 0x1
	.4byte	$LASF63
	.byte	0x99
	.byte	0x16
	.4byte	0x2a
	.byte	0x8
	.byte	0x10
	.uleb128 0x1
	.4byte	$LASF64
	.byte	0x9a
	.byte	0x16
	.4byte	0x2a
	.byte	0x8
	.byte	0x18
	.uleb128 0x1
	.4byte	$LASF65
	.byte	0x9c
	.byte	0x16
	.4byte	0x2a
	.byte	0x8
	.byte	0x20
	.uleb128 0x1
	.4byte	$LASF66
	.byte	0x9d
	.byte	0x16
	.4byte	0x2a
	.byte	0x8
	.byte	0x28
	.uleb128 0x1
	.4byte	$LASF67
	.byte	0x9e
	.byte	0x16
	.4byte	0x2a
	.byte	0x8
	.byte	0x30
	.uleb128 0x1
	.4byte	$LASF68
	.byte	0x9f
	.byte	0x16
	.4byte	0x2a
	.byte	0x8
	.byte	0x38
	.byte	0
	.uleb128 0x1d
	.byte	0x8
	.byte	0x81
	.4byte	0x4e0
	.uleb128 0x11
	.4byte	0x3ab
	.uleb128 0x11
	.4byte	0x3c2
	.byte	0
	.uleb128 0x14
	.4byte	$LASF69
	.byte	0x8
	.byte	0x6
	.byte	0x7f
	.4byte	0x4f3
	.uleb128 0x1e
	.4byte	0x4ce
	.byte	0
	.byte	0
	.uleb128 0x14
	.4byte	$LASF70
	.byte	0x40
	.byte	0x6
	.byte	0xb5
	.4byte	0x517
	.uleb128 0xa
	.ascii	"c\000"
	.byte	0x6
	.byte	0xb8
	.byte	0x16
	.4byte	0x517
	.byte	0
	.uleb128 0xa
	.ascii	"gc\000"
	.byte	0x6
	.byte	0xba
	.byte	0x19
	.4byte	0x527
	.byte	0x20
	.byte	0
	.uleb128 0x12
	.4byte	0x38b
	.4byte	0x527
	.uleb128 0xf
	.4byte	0x2a
	.byte	0x3
	.byte	0
	.uleb128 0x12
	.4byte	0x4e0
	.4byte	0x537
	.uleb128 0xf
	.4byte	0x2a
	.byte	0x3
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.byte	0x7
	.byte	0x33
	.4byte	0x56c
	.uleb128 0xa
	.ascii	"r\000"
	.byte	0x7
	.byte	0x36
	.byte	0xd
	.4byte	0xbc
	.byte	0
	.uleb128 0xa
	.ascii	"g\000"
	.byte	0x7
	.byte	0x38
	.byte	0xd
	.4byte	0xbc
	.byte	0x1
	.uleb128 0xa
	.ascii	"b\000"
	.byte	0x7
	.byte	0x3a
	.byte	0xd
	.4byte	0xbc
	.byte	0x2
	.uleb128 0xa
	.ascii	"a\000"
	.byte	0x7
	.byte	0x3c
	.byte	0xd
	.4byte	0xbc
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.4byte	$LASF71
	.byte	0x7
	.byte	0x3d
	.byte	0x3
	.4byte	0x537
	.uleb128 0xe
	.4byte	0x56c
	.uleb128 0x17
	.4byte	0x104
	.uleb128 0x13
	.ascii	"u8\000"
	.byte	0x4
	.byte	0x12
	.4byte	0xbc
	.uleb128 0xe
	.4byte	0x582
	.uleb128 0x13
	.ascii	"u32\000"
	.byte	0x6
	.byte	0x12
	.4byte	0xe0
	.uleb128 0xe
	.4byte	0x591
	.uleb128 0x13
	.ascii	"i32\000"
	.byte	0xb
	.byte	0x11
	.4byte	0xd4
	.uleb128 0xe
	.4byte	0x5a1
	.uleb128 0x13
	.ascii	"f32\000"
	.byte	0xe
	.byte	0x10
	.4byte	0xae
	.uleb128 0xe
	.4byte	0x5b1
	.uleb128 0x13
	.ascii	"f64\000"
	.byte	0xf
	.byte	0x10
	.4byte	0xb5
	.uleb128 0x10
	.byte	0x8
	.byte	0x1
	.byte	0x12
	.byte	0x5
	.4byte	0x5ec
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x1
	.byte	0x13
	.byte	0xd
	.4byte	0x5b1
	.byte	0
	.uleb128 0xa
	.ascii	"y\000"
	.byte	0x1
	.byte	0x14
	.byte	0xd
	.4byte	0x5b1
	.byte	0x4
	.byte	0
	.uleb128 0x27
	.byte	0x8
	.byte	0x1
	.byte	0x11
	.byte	0x9
	.4byte	0x605
	.uleb128 0x11
	.4byte	0x5cc
	.uleb128 0x28
	.ascii	"v\000"
	.byte	0x1
	.byte	0x16
	.byte	0x9
	.4byte	0x605
	.byte	0
	.uleb128 0x12
	.4byte	0x5b1
	.4byte	0x615
	.uleb128 0xf
	.4byte	0x2a
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.4byte	$LASF72
	.byte	0x1
	.byte	0x17
	.byte	0x3
	.4byte	0x5ec
	.uleb128 0xe
	.4byte	0x615
	.uleb128 0x15
	.byte	0x14
	.byte	0x1
	.byte	0x1f
	.4byte	0x656
	.uleb128 0xa
	.ascii	"pos\000"
	.byte	0x1
	.byte	0x20
	.byte	0xd
	.4byte	0x615
	.byte	0
	.uleb128 0xa
	.ascii	"vel\000"
	.byte	0x1
	.byte	0x21
	.byte	0xd
	.4byte	0x615
	.byte	0x8
	.uleb128 0x9
	.4byte	$LASF73
	.byte	0x1
	.byte	0x22
	.byte	0x9
	.4byte	0x5b1
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.4byte	$LASF74
	.byte	0x1
	.byte	0x23
	.byte	0x3
	.4byte	0x626
	.uleb128 0x15
	.byte	0xc
	.byte	0x1
	.byte	0x25
	.4byte	0x685
	.uleb128 0xa
	.ascii	"pos\000"
	.byte	0x1
	.byte	0x26
	.byte	0xd
	.4byte	0x615
	.byte	0
	.uleb128 0x9
	.4byte	$LASF75
	.byte	0x1
	.byte	0x27
	.byte	0x9
	.4byte	0x591
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.4byte	$LASF76
	.byte	0x1
	.byte	0x28
	.byte	0x3
	.4byte	0x662
	.uleb128 0x16
	.4byte	0x2a
	.byte	0x1
	.byte	0x2a
	.byte	0xe
	.4byte	0x6aa
	.uleb128 0x8
	.4byte	$LASF77
	.byte	0
	.uleb128 0x8
	.4byte	$LASF78
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.4byte	$LASF79
	.byte	0x1
	.byte	0x2d
	.byte	0x3
	.4byte	0x691
	.uleb128 0x3
	.4byte	$LASF80
	.byte	0x1
	.byte	0x2f
	.byte	0x13
	.4byte	0x6aa
	.uleb128 0x5
	.byte	0x3
	.4byte	g_game_state
	.uleb128 0x19
	.4byte	$LASF81
	.byte	0x8
	.byte	0xa5
	.uleb128 0x1f
	.4byte	$LASF83
	.byte	0x6
	.byte	0xd1
	.byte	0x18
	.4byte	0x4f3
	.uleb128 0x19
	.4byte	$LASF82
	.byte	0x6
	.byte	0xce
	.uleb128 0x20
	.4byte	$LASF87
	.byte	0x8
	.byte	0x4d
	.4byte	0x6f8
	.uleb128 0x6
	.4byte	0x57d
	.uleb128 0x6
	.4byte	0x57d
	.byte	0
	.uleb128 0x1f
	.4byte	$LASF84
	.byte	0x4
	.byte	0xdc
	.byte	0xc
	.4byte	0x292
	.uleb128 0x21
	.4byte	$LASF85
	.byte	0x9
	.2byte	0x132
	.byte	0x6
	.uleb128 0x19
	.4byte	$LASF86
	.byte	0x6
	.byte	0xc8
	.uleb128 0x20
	.4byte	$LASF88
	.byte	0x4
	.byte	0xc2
	.4byte	0x739
	.uleb128 0x6
	.4byte	0x18e
	.uleb128 0x6
	.4byte	0x224
	.uleb128 0x6
	.4byte	0xe0
	.uleb128 0x6
	.4byte	0x24f
	.uleb128 0x6
	.4byte	0x286
	.byte	0
	.uleb128 0x29
	.4byte	$LASF89
	.byte	0xc
	.byte	0x6e
	.byte	0xf
	.4byte	0xb5
	.4byte	0x74f
	.uleb128 0x6
	.4byte	0xb5
	.byte	0
	.uleb128 0x2a
	.ascii	"pow\000"
	.byte	0xc
	.byte	0x6f
	.byte	0xf
	.4byte	0xb5
	.4byte	0x76a
	.uleb128 0x6
	.4byte	0xb5
	.uleb128 0x6
	.4byte	0xb5
	.byte	0
	.uleb128 0x22
	.4byte	$LASF106
	.byte	0xf6
	.byte	0x5
	.4byte	0x23
	.4byte	$LFB107
	.4byte	$LFE107-$LFB107
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7f7
	.uleb128 0x3
	.4byte	$LASF90
	.byte	0x1
	.byte	0xfc
	.byte	0x13
	.4byte	0x578
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x3
	.4byte	$LASF91
	.byte	0x1
	.byte	0xfe
	.byte	0xc
	.4byte	0x7f7
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x1a
	.4byte	$LASF92
	.2byte	0x109
	.byte	0xa
	.4byte	0x656
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0xd
	.4byte	$LBB11
	.4byte	$LBE11-$LBB11
	.uleb128 0x1a
	.4byte	$LASF93
	.2byte	0x110
	.byte	0x14
	.4byte	0x292
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x1a
	.4byte	$LASF94
	.2byte	0x11c
	.byte	0x20
	.4byte	0x4f3
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0xd
	.4byte	$LBB12
	.4byte	$LBE12-$LBB12
	.uleb128 0x2b
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x140
	.byte	0x1a
	.4byte	0x23
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	0x685
	.4byte	0x807
	.uleb128 0xf
	.4byte	0x2a
	.byte	0x1
	.byte	0
	.uleb128 0x2c
	.4byte	$LASF95
	.byte	0x1
	.byte	0xea
	.byte	0x17
	.4byte	$LFB106
	.4byte	$LFE106-$LFB106
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x83a
	.uleb128 0xb
	.4byte	$LASF91
	.byte	0xea
	.byte	0x34
	.4byte	0x83a
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.4byte	$LASF92
	.byte	0xea
	.byte	0x46
	.4byte	0x83f
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0x17
	.4byte	0x685
	.uleb128 0x17
	.4byte	0x656
	.uleb128 0x23
	.4byte	$LASF96
	.byte	0xda
	.4byte	$LFB105
	.4byte	$LFE105-$LFB105
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8cd
	.uleb128 0x3
	.4byte	$LASF24
	.byte	0x1
	.byte	0xdc
	.byte	0xf
	.4byte	0x5ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x3
	.4byte	$LASF25
	.byte	0x1
	.byte	0xdd
	.byte	0xf
	.4byte	0x5ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x3
	.4byte	$LASF97
	.byte	0x1
	.byte	0xde
	.byte	0xf
	.4byte	0x5ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xc
	.ascii	"x\000"
	.byte	0xdf
	.byte	0xf
	.4byte	0x5ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3
	.4byte	$LASF98
	.byte	0x1
	.byte	0xe0
	.byte	0xf
	.4byte	0x5ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xd
	.4byte	$LBB8
	.4byte	$LBE8-$LBB8
	.uleb128 0xc
	.ascii	"i\000"
	.byte	0xe4
	.byte	0xe
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xd
	.4byte	$LBB9
	.4byte	$LBE9-$LBB9
	.uleb128 0xc
	.ascii	"y\000"
	.byte	0xe5
	.byte	0xd
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x23
	.4byte	$LASF99
	.byte	0xce
	.4byte	$LFB104
	.4byte	$LFE104-$LFB104
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x93a
	.uleb128 0xb
	.4byte	$LASF100
	.byte	0xce
	.byte	0x27
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.4byte	$LASF101
	.byte	0xce
	.byte	0x33
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x3
	.4byte	$LASF102
	.byte	0x1
	.byte	0xd0
	.byte	0xf
	.4byte	0x59c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.4byte	$LASF103
	.byte	0x1
	.byte	0xd1
	.byte	0xf
	.4byte	0x5ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3
	.4byte	$LASF104
	.byte	0x1
	.byte	0xd3
	.byte	0xf
	.4byte	0x59c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.4byte	$LASF105
	.byte	0x1
	.byte	0xd4
	.byte	0xf
	.4byte	0x5ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x22
	.4byte	$LASF107
	.byte	0xc6
	.byte	0xf
	.4byte	0x591
	.4byte	$LFB103
	.4byte	$LFE103-$LFB103
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x962
	.uleb128 0xb
	.4byte	$LASF108
	.byte	0xc6
	.byte	0x23
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x1b
	.4byte	$LASF112
	.byte	0xbd
	.4byte	$LFB102
	.4byte	$LFE102-$LFB102
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9e9
	.uleb128 0x5
	.ascii	"x\000"
	.byte	0xbd
	.byte	0x1d
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.ascii	"y\000"
	.byte	0xbd
	.byte	0x24
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xb
	.4byte	$LASF108
	.byte	0xbd
	.byte	0x2b
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xb
	.4byte	$LASF109
	.byte	0xbd
	.byte	0x37
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0xd
	.4byte	$LBB5
	.4byte	$LBE5-$LBB5
	.uleb128 0xc
	.ascii	"i\000"
	.byte	0xbf
	.byte	0xe
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.4byte	$LBB6
	.4byte	$LBE6-$LBB6
	.uleb128 0x3
	.4byte	$LASF110
	.byte	0x1
	.byte	0xc0
	.byte	0x12
	.4byte	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x3
	.4byte	$LASF111
	.byte	0x1
	.byte	0xc1
	.byte	0x13
	.4byte	0x5ac
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.4byte	$LASF113
	.byte	0x64
	.4byte	$LFB101
	.4byte	$LFE101-$LFB101
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa7e
	.uleb128 0x5
	.ascii	"x\000"
	.byte	0x64
	.byte	0x1f
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.ascii	"y\000"
	.byte	0x64
	.byte	0x26
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xb
	.4byte	$LASF110
	.byte	0x64
	.byte	0x2c
	.4byte	0x582
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x3
	.4byte	$LASF114
	.byte	0x1
	.byte	0x6a
	.byte	0xf
	.4byte	0xa7e
	.uleb128 0x5
	.byte	0x3
	.4byte	digits_font.0
	.uleb128 0xd
	.4byte	$LBB2
	.4byte	$LBE2-$LBB2
	.uleb128 0xc
	.ascii	"row\000"
	.byte	0xb3
	.byte	0xe
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xd
	.4byte	$LBB3
	.4byte	$LBE3-$LBB3
	.uleb128 0xc
	.ascii	"col\000"
	.byte	0xb4
	.byte	0x12
	.4byte	0x591
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xd
	.4byte	$LBB4
	.4byte	$LBE4-$LBB4
	.uleb128 0xc
	.ascii	"bit\000"
	.byte	0xb5
	.byte	0x16
	.4byte	0x58c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	0x582
	.4byte	0xa94
	.uleb128 0xf
	.4byte	0x2a
	.byte	0x9
	.uleb128 0xf
	.4byte	0x2a
	.byte	0x4
	.byte	0
	.uleb128 0x1b
	.4byte	$LASF115
	.byte	0x5f
	.4byte	$LFB100
	.4byte	$LFE100-$LFB100
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xadd
	.uleb128 0x5
	.ascii	"x\000"
	.byte	0x5f
	.byte	0x1e
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.ascii	"y\000"
	.byte	0x5f
	.byte	0x25
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xb
	.4byte	$LASF24
	.byte	0x5f
	.byte	0x2c
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xb
	.4byte	$LASF25
	.byte	0x5f
	.byte	0x37
	.4byte	0x5a1
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.byte	0
	.uleb128 0x1c
	.4byte	$LASF116
	.byte	0x58
	.byte	0x10
	.4byte	0x187
	.4byte	$LFB99
	.4byte	$LFE99-$LFB99
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb5f
	.uleb128 0x5
	.ascii	"x0\000"
	.byte	0x58
	.byte	0x19
	.4byte	0x5b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.ascii	"y0\000"
	.byte	0x58
	.byte	0x21
	.4byte	0x5b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5
	.ascii	"w0\000"
	.byte	0x58
	.byte	0x29
	.4byte	0x5b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x5
	.ascii	"h0\000"
	.byte	0x58
	.byte	0x31
	.4byte	0x5b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x5
	.ascii	"x1\000"
	.byte	0x59
	.byte	0x19
	.4byte	0x5b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x5
	.ascii	"y1\000"
	.byte	0x59
	.byte	0x21
	.4byte	0x5b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x5
	.ascii	"w1\000"
	.byte	0x59
	.byte	0x29
	.4byte	0x5b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 52
	.uleb128 0x5
	.ascii	"h1\000"
	.byte	0x59
	.byte	0x31
	.4byte	0x5b1
	.uleb128 0x2
	.byte	0x91
	.sleb128 60
	.byte	0
	.uleb128 0x1c
	.4byte	$LASF117
	.byte	0x4f
	.byte	0x13
	.4byte	0x615
	.4byte	$LFB98
	.4byte	$LFE98-$LFB98
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xba9
	.uleb128 0x5
	.ascii	"a\000"
	.byte	0x4f
	.byte	0x2a
	.4byte	0x621
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x5
	.ascii	"b\000"
	.byte	0x4f
	.byte	0x3b
	.4byte	0x621
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xc
	.ascii	"x\000"
	.byte	0x51
	.byte	0xf
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.ascii	"y\000"
	.byte	0x52
	.byte	0xf
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x1c
	.4byte	$LASF118
	.byte	0x48
	.byte	0x13
	.4byte	0x615
	.4byte	$LFB97
	.4byte	$LFE97-$LFB97
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xbf5
	.uleb128 0x5
	.ascii	"v\000"
	.byte	0x48
	.byte	0x2c
	.4byte	0x621
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xb
	.4byte	$LASF119
	.byte	0x48
	.byte	0x39
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xc
	.ascii	"x\000"
	.byte	0x4a
	.byte	0xf
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.ascii	"y\000"
	.byte	0x4b
	.byte	0xf
	.4byte	0x5bc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x2d
	.4byte	$LASF122
	.byte	0xa
	.2byte	0x12d
	.byte	0xd
	.4byte	0xc19
	.uleb128 0x2e
	.4byte	$LASF121
	.byte	0xa
	.2byte	0x12d
	.byte	0x28
	.4byte	0x56c
	.uleb128 0x21
	.4byte	$LASF120
	.byte	0xa
	.2byte	0x12e
	.byte	0x11
	.byte	0
	.uleb128 0x2f
	.4byte	$LASF126
	.byte	0xb
	.byte	0x7f
	.byte	0xd
	.uleb128 0x18
	.ascii	"x0\000"
	.byte	0x2e
	.4byte	0xd4
	.uleb128 0x18
	.ascii	"y0\000"
	.byte	0x3a
	.4byte	0xd4
	.uleb128 0x18
	.ascii	"x1\000"
	.byte	0x46
	.4byte	0xd4
	.uleb128 0x18
	.ascii	"y1\000"
	.byte	0x52
	.4byte	0xd4
	.uleb128 0x30
	.uleb128 0x31
	.4byte	$LASF123
	.byte	0xb
	.byte	0x84
	.byte	0x15
	.uleb128 0x6
	.4byte	0xd4
	.uleb128 0x6
	.4byte	0xd4
	.uleb128 0x6
	.4byte	0xd4
	.uleb128 0x6
	.4byte	0xd4
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
$Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x89
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0x21
	.sleb128 7
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 127
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x89
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 23
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x6c
	.2byte	0x2
	.4byte	$Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	$LFB97
	.4byte	$LFE97-$LFB97
	.4byte	$LFB98
	.4byte	$LFE98-$LFB98
	.4byte	$LFB99
	.4byte	$LFE99-$LFB99
	.4byte	$LFB100
	.4byte	$LFE100-$LFB100
	.4byte	$LFB101
	.4byte	$LFE101-$LFB101
	.4byte	$LFB102
	.4byte	$LFE102-$LFB102
	.4byte	$LFB103
	.4byte	$LFE103-$LFB103
	.4byte	$LFB104
	.4byte	$LFE104-$LFB104
	.4byte	$LFB105
	.4byte	$LFE105-$LFB105
	.4byte	$LFB106
	.4byte	$LFE106-$LFB106
	.4byte	$LFB107
	.4byte	$LFE107-$LFB107
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
$Ldebug_ranges0:
	.4byte	$Ldebug_ranges3-$Ldebug_ranges2
$Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
$LLRL0:
	.byte	0x7
	.4byte	$LFB97
	.uleb128 $LFE97-$LFB97
	.byte	0x7
	.4byte	$LFB98
	.uleb128 $LFE98-$LFB98
	.byte	0x7
	.4byte	$LFB99
	.uleb128 $LFE99-$LFB99
	.byte	0x7
	.4byte	$LFB100
	.uleb128 $LFE100-$LFB100
	.byte	0x7
	.4byte	$LFB101
	.uleb128 $LFE101-$LFB101
	.byte	0x7
	.4byte	$LFB102
	.uleb128 $LFE102-$LFB102
	.byte	0x7
	.4byte	$LFB103
	.uleb128 $LFE103-$LFB103
	.byte	0x7
	.4byte	$LFB104
	.uleb128 $LFE104-$LFB104
	.byte	0x7
	.4byte	$LFB105
	.uleb128 $LFE105-$LFB105
	.byte	0x7
	.4byte	$LFB106
	.uleb128 $LFE106-$LFB106
	.byte	0x7
	.4byte	$LFB107
	.uleb128 $LFE107-$LFB107
	.byte	0
$Ldebug_ranges3:
	.section	.debug_line,"",@progbits
$Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
$LASF119:
	.ascii	"scale\000"
$LASF62:
	.ascii	"unused2\000"
$LASF85:
	.ascii	"rdpq_init\000"
$LASF125:
	.ascii	"src/main.c\000"
$LASF21:
	.ascii	"uint64_t\000"
$LASF4:
	.ascii	"__uint8_t\000"
$LASF72:
	.ascii	"Vector2\000"
$LASF102:
	.ascii	"score1_digit_count\000"
$LASF39:
	.ascii	"bitdepth_t\000"
$LASF13:
	.ascii	"long long unsigned int\000"
$LASF74:
	.ascii	"Ball\000"
$LASF44:
	.ascii	"FILTERS_DISABLED\000"
$LASF28:
	.ascii	"interlaced\000"
$LASF90:
	.ascii	"COLOR_WHITE\000"
$LASF69:
	.ascii	"SI_condat_gc\000"
$LASF56:
	.ascii	"C_down\000"
$LASF112:
	.ascii	"draw_u32\000"
$LASF108:
	.ascii	"number\000"
$LASF61:
	.ascii	"origin_unchecked\000"
$LASF123:
	.ascii	"__rdpq_fill_rectangle_offline\000"
$LASF54:
	.ascii	"right\000"
$LASF11:
	.ascii	"long long int\000"
$LASF1:
	.ascii	"signed char\000"
$LASF79:
	.ascii	"Game_State\000"
$LASF115:
	.ascii	"draw_rect\000"
$LASF110:
	.ascii	"digit\000"
$LASF113:
	.ascii	"draw_digit\000"
$LASF8:
	.ascii	"long int\000"
$LASF126:
	.ascii	"__rdpq_fill_rectangle_fx\000"
$LASF96:
	.ascii	"draw_middle_line\000"
$LASF118:
	.ascii	"vec2_scale\000"
$LASF18:
	.ascii	"uint16_t\000"
$LASF16:
	.ascii	"double\000"
$LASF42:
	.ascii	"GAMMA_CORRECT_DITHER\000"
$LASF27:
	.ascii	"buffer\000"
$LASF75:
	.ascii	"score\000"
$LASF5:
	.ascii	"__uint16_t\000"
$LASF52:
	.ascii	"down\000"
$LASF37:
	.ascii	"DEPTH_16_BPP\000"
$LASF9:
	.ascii	"__uint32_t\000"
$LASF30:
	.ascii	"resolution_t\000"
$LASF91:
	.ascii	"paddles\000"
$LASF97:
	.ascii	"padding\000"
$LASF82:
	.ascii	"controller_scan\000"
$LASF0:
	.ascii	"unsigned int\000"
$LASF104:
	.ascii	"score2_digit_count\000"
$LASF124:
	.ascii	"GNU C99 14.2.0 -march=vr4300 -mtune=vr4300 -mips3 -g -O2"
	.ascii	" -O0 -std=gnu99 -falign-functions=32 -ffunction-sections"
	.ascii	" -fdata-sections -ffast-math -ftrapping-math -fno-associ"
	.ascii	"ative-math -fno-dwarf2-cfi-asm -fno-inline -fno-builtin\000"
$LASF89:
	.ascii	"log10\000"
$LASF10:
	.ascii	"long unsigned int\000"
$LASF60:
	.ascii	"SI_condat\000"
$LASF116:
	.ascii	"AABB\000"
$LASF24:
	.ascii	"width\000"
$LASF50:
	.ascii	"data\000"
$LASF6:
	.ascii	"short unsigned int\000"
$LASF45:
	.ascii	"FILTERS_RESAMPLE\000"
$LASF99:
	.ascii	"draw_scores\000"
$LASF31:
	.ascii	"RESOLUTION_256x240\000"
$LASF55:
	.ascii	"C_up\000"
$LASF40:
	.ascii	"GAMMA_NONE\000"
$LASF111:
	.ascii	"x_offset\000"
$LASF67:
	.ascii	"analog_l\000"
$LASF68:
	.ascii	"analog_r\000"
$LASF3:
	.ascii	"short int\000"
$LASF7:
	.ascii	"__int32_t\000"
$LASF122:
	.ascii	"rdpq_set_mode_fill\000"
$LASF71:
	.ascii	"color_t\000"
$LASF32:
	.ascii	"RESOLUTION_320x240\000"
$LASF105:
	.ascii	"score2_offset\000"
$LASF86:
	.ascii	"controller_init\000"
$LASF46:
	.ascii	"FILTERS_DEDITHER\000"
$LASF81:
	.ascii	"rdpq_detach_show\000"
$LASF114:
	.ascii	"digits_font\000"
$LASF98:
	.ascii	"segments\000"
$LASF43:
	.ascii	"gamma_t\000"
$LASF58:
	.ascii	"C_right\000"
$LASF65:
	.ascii	"cstick_x\000"
$LASF66:
	.ascii	"cstick_y\000"
$LASF92:
	.ascii	"ball\000"
$LASF34:
	.ascii	"RESOLUTION_640x240\000"
$LASF94:
	.ascii	"keys\000"
$LASF12:
	.ascii	"__uint64_t\000"
$LASF15:
	.ascii	"float\000"
$LASF95:
	.ascii	"transition_to_serving\000"
$LASF117:
	.ascii	"vec2_add\000"
$LASF29:
	.ascii	"_Bool\000"
$LASF19:
	.ascii	"int32_t\000"
$LASF2:
	.ascii	"unsigned char\000"
$LASF107:
	.ascii	"get_digit_count\000"
$LASF33:
	.ascii	"RESOLUTION_512x240\000"
$LASF78:
	.ascii	"Game_State_Playing\000"
$LASF83:
	.ascii	"get_keys_held\000"
$LASF76:
	.ascii	"Paddle\000"
$LASF26:
	.ascii	"stride\000"
$LASF20:
	.ascii	"uint32_t\000"
$LASF59:
	.ascii	"surface_s\000"
$LASF36:
	.ascii	"RESOLUTION_640x480\000"
$LASF22:
	.ascii	"surface_t\000"
$LASF84:
	.ascii	"display_get\000"
$LASF49:
	.ascii	"filter_options_t\000"
$LASF77:
	.ascii	"Game_State_Serving\000"
$LASF14:
	.ascii	"char\000"
$LASF109:
	.ascii	"number_digit_count\000"
$LASF100:
	.ascii	"score1\000"
$LASF101:
	.ascii	"score2\000"
$LASF87:
	.ascii	"rdpq_attach_clear\000"
$LASF103:
	.ascii	"score1_offset\000"
$LASF70:
	.ascii	"controller_data\000"
$LASF88:
	.ascii	"display_init\000"
$LASF35:
	.ascii	"RESOLUTION_512x480\000"
$LASF57:
	.ascii	"C_left\000"
$LASF48:
	.ascii	"FILTERS_RESAMPLE_ANTIALIAS_DEDITHER\000"
$LASF93:
	.ascii	"disp\000"
$LASF80:
	.ascii	"g_game_state\000"
$LASF121:
	.ascii	"color\000"
$LASF120:
	.ascii	"__rdpq_set_mode_fill\000"
$LASF47:
	.ascii	"FILTERS_RESAMPLE_ANTIALIAS\000"
$LASF17:
	.ascii	"uint8_t\000"
$LASF23:
	.ascii	"flags\000"
$LASF73:
	.ascii	"speed\000"
$LASF63:
	.ascii	"stick_x\000"
$LASF64:
	.ascii	"stick_y\000"
$LASF41:
	.ascii	"GAMMA_CORRECT\000"
$LASF51:
	.ascii	"start\000"
$LASF25:
	.ascii	"height\000"
$LASF38:
	.ascii	"DEPTH_32_BPP\000"
$LASF106:
	.ascii	"main\000"
$LASF53:
	.ascii	"left\000"
	.ident	"GCC: (GNU) 14.2.0"
