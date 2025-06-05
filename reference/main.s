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
	.loc 1 70 1
	.set	nomips16
	.set	nomicromips
	.ent	vec2_scale
	.type	vec2_scale, @function
vec2_scale:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16	 #,,
$LCFI0 = .
	sd	$fp,8($sp)	 #,
$LCFI1 = .
	move	$fp,$sp	 #,
$LCFI2 = .
	sw	$4,16($fp)	 # .result_ptr, .result_ptr
	sd	$5,24($fp)	 #, v
	sw	$6,32($fp)	 # scale, scale
 # src/main.c:71:     return (Vector2){.x = v.x * scale, .y = v.y * scale};
	.loc 1 71 28
	lwc1	$f1,24($fp)	 # _1, v.D.5971.x
 # src/main.c:71:     return (Vector2){.x = v.x * scale, .y = v.y * scale};
	.loc 1 71 31
	lwc1	$f0,32($fp)	 # tmp198, scale
	mul.s	$f1,$f1,$f0	 # _2, _1, tmp198
 # src/main.c:71:     return (Vector2){.x = v.x * scale, .y = v.y * scale};
	.loc 1 71 46
	lwc1	$f2,28($fp)	 # _3, v.D.5971.y
 # src/main.c:71:     return (Vector2){.x = v.x * scale, .y = v.y * scale};
	.loc 1 71 49
	lwc1	$f0,32($fp)	 # tmp199, scale
	mul.s	$f0,$f2,$f0	 # _4, _3, tmp199
 # src/main.c:71:     return (Vector2){.x = v.x * scale, .y = v.y * scale};
	.loc 1 71 12
	lw	$2,16($fp)		 # tmp200, .result_ptr
	swc1	$f1,0($2)	 # _2, <retval>.D.5971.x
	lw	$2,16($fp)		 # tmp201, .result_ptr
	swc1	$f0,4($2)	 # _4, <retval>.D.5971.y
 # src/main.c:72: }
	.loc 1 72 1
	lw	$2,16($fp)		 #, .result_ptr
	move	$sp,$fp	 #,
$LCFI3 = .
	ld	$fp,8($sp)		 #,
	addiu	$sp,$sp,16	 #,,
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
	.loc 1 75 1
	.set	nomips16
	.set	nomicromips
	.ent	vec2_add
	.type	vec2_add, @function
vec2_add:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16	 #,,
$LCFI5 = .
	sd	$fp,8($sp)	 #,
$LCFI6 = .
	move	$fp,$sp	 #,
$LCFI7 = .
	sw	$4,16($fp)	 # .result_ptr, .result_ptr
	sd	$5,24($fp)	 #, a
	sd	$6,32($fp)	 #, b
 # src/main.c:76:     return (Vector2){.x = a.x + b.x, .y = a.y + b.y};
	.loc 1 76 28
	lwc1	$f1,24($fp)	 # _1, a.D.5971.x
 # src/main.c:76:     return (Vector2){.x = a.x + b.x, .y = a.y + b.y};
	.loc 1 76 34
	lwc1	$f0,32($fp)	 # _2, b.D.5971.x
 # src/main.c:76:     return (Vector2){.x = a.x + b.x, .y = a.y + b.y};
	.loc 1 76 31
	add.s	$f1,$f1,$f0	 # _3, _1, _2
 # src/main.c:76:     return (Vector2){.x = a.x + b.x, .y = a.y + b.y};
	.loc 1 76 44
	lwc1	$f2,28($fp)	 # _4, a.D.5971.y
 # src/main.c:76:     return (Vector2){.x = a.x + b.x, .y = a.y + b.y};
	.loc 1 76 50
	lwc1	$f0,36($fp)	 # _5, b.D.5971.y
 # src/main.c:76:     return (Vector2){.x = a.x + b.x, .y = a.y + b.y};
	.loc 1 76 47
	add.s	$f0,$f2,$f0	 # _6, _4, _5
 # src/main.c:76:     return (Vector2){.x = a.x + b.x, .y = a.y + b.y};
	.loc 1 76 12
	lw	$2,16($fp)		 # tmp200, .result_ptr
	swc1	$f1,0($2)	 # _3, <retval>.D.5971.x
	lw	$2,16($fp)		 # tmp201, .result_ptr
	swc1	$f0,4($2)	 # _6, <retval>.D.5971.y
 # src/main.c:77: }
	.loc 1 77 1
	lw	$2,16($fp)		 #, .result_ptr
	move	$sp,$fp	 #,
$LCFI8 = .
	ld	$fp,8($sp)		 #,
	addiu	$sp,$sp,16	 #,,
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
	.loc 1 83 1
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
 # src/main.c:84:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 84 16
	lwc1	$f1,8($fp)	 # tmp201, x0
	lwc1	$f0,24($fp)	 # tmp202, w0
	add.s	$f0,$f1,$f0	 # _1, tmp201, tmp202
 # src/main.c:84:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 84 45
	lwc1	$f1,44($fp)	 # tmp203, x1
	c.le.s	$f1,$f0	 #, tmp203, _1
	nop	
	bc1f	$L6
	nop
	 #,,
 # src/main.c:84:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 84 33 discriminator 1
	lwc1	$f1,44($fp)	 # tmp204, x1
	lwc1	$f0,60($fp)	 # tmp205, w1
	add.s	$f0,$f1,$f0	 # _2, tmp204, tmp205
 # src/main.c:84:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 84 27 discriminator 1
	lwc1	$f1,8($fp)	 # tmp206, x0
	c.le.s	$f1,$f0	 #, tmp206, _2
	nop	
	bc1f	$L6
	nop
	 #,,
 # src/main.c:85:            (y0 + h0 >= y1 && y1 + h1 >= y0);
	.loc 1 85 16
	lwc1	$f1,16($fp)	 # tmp207, y0
	lwc1	$f0,32($fp)	 # tmp208, h0
	add.s	$f0,$f1,$f0	 # _3, tmp207, tmp208
 # src/main.c:84:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 84 45 discriminator 3
	lwc1	$f1,52($fp)	 # tmp209, y1
	c.le.s	$f1,$f0	 #, tmp209, _3
	nop	
	bc1f	$L6
	nop
	 #,,
 # src/main.c:85:            (y0 + h0 >= y1 && y1 + h1 >= y0);
	.loc 1 85 33
	lwc1	$f1,52($fp)	 # tmp210, y1
	lwc1	$f0,68($fp)	 # tmp211, h1
	add.s	$f0,$f1,$f0	 # _4, tmp210, tmp211
 # src/main.c:85:            (y0 + h0 >= y1 && y1 + h1 >= y0);
	.loc 1 85 27
	lwc1	$f1,16($fp)	 # tmp212, y0
	c.le.s	$f1,$f0	 #, tmp212, _4
	nop	
	bc1f	$L6
	nop
	 #,,
 # src/main.c:84:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 84 45
	li	$2,1			# 0x1	 # iftmp.0_5,
	b	$L11
	nop
	 #
$L6:
 # src/main.c:84:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 84 45 is_stmt 0 discriminator 5
	move	$2,$0	 # iftmp.0_5,
$L11:
 # src/main.c:84:     return (x0 + w0 >= x1 && x1 + w1 >= x0) &&
	.loc 1 84 45 discriminator 7
	andi	$2,$2,0x1	 # tmp214, tmp213,
	andi	$2,$2,0x00ff	 # _16, tmp214
 # src/main.c:86: }
	.loc 1 86 1 is_stmt 1
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
	.loc 1 89 1
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
 # src/main.c:90:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 90 5
	lw	$2,48($fp)		 # tmp200, x
	sll	$4,$2,2	 # _1, tmp200,
	lw	$2,56($fp)		 # tmp201, y
	sll	$5,$2,2	 # _2, tmp201,
 # src/main.c:90:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 90 45
	lw	$3,48($fp)		 # tmp202, x
	lw	$2,64($fp)		 # tmp203, width
	addu	$2,$3,$2	 # _3, tmp202, tmp203
 # src/main.c:90:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 90 5
	sll	$6,$2,2	 # _4, _3,
 # src/main.c:90:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 90 60
	lw	$3,56($fp)		 # tmp204, y
	lw	$2,72($fp)		 # tmp205, height
	addu	$2,$3,$2	 # _5, tmp204, tmp205
 # src/main.c:90:     __rdpq_fill_rectangle_fx(4*x, 4*y, 4*(x + width), 4*(y + height));
	.loc 1 90 5
	sll	$2,$2,2	 # _6, _5,
	move	$7,$2	 #, _6
	jal	__rdpq_fill_rectangle_fx
	nop
	 #
 # src/main.c:91: }
	.loc 1 91 1
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
	.rdata
	.align	3
$LC6:
	.ascii	"%lu\000"
	.section	.text.draw_scores,"ax",@progbits
	.align	2
	.align	5
$LFB101 = .
	.loc 1 94 1
	.set	nomips16
	.set	nomicromips
	.ent	draw_scores
	.type	draw_scores, @function
draw_scores:
	.frame	$fp,48,$31		# vars= 0, regs= 2/0, args= 32, gp= 0
	.mask	0xc0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48	 #,,
$LCFI20 = .
	sd	$31,40($sp)	 #,
	sd	$fp,32($sp)	 #,
$LCFI21 = .
	move	$fp,$sp	 #,
$LCFI22 = .
	sw	$4,48($fp)	 # disp, disp
	sw	$5,56($fp)	 # score1, score1
	sw	$6,64($fp)	 # score2, score2
 # src/main.c:96:     sprintf(p1, "%lu", score1);
	.loc 1 96 5
	lw	$6,56($fp)		 #, score1
	lui	$2,%hi($LC6)	 # tmp194,
	addiu	$5,$2,%lo($LC6)	 #, tmp194,
	addiu	$4,$28,%gp_rel(p1.1)	 #,,
	jal	sprintf
	nop
	 #
 # src/main.c:97:     graphics_draw_text(disp, SCREEN_WIDTH/2 - 20, 10, p1);
	.loc 1 97 5
	addiu	$7,$28,%gp_rel(p1.1)	 #,,
	li	$6,10			# 0xa	 #,
	li	$5,140			# 0x8c	 #,
	lw	$4,48($fp)		 #, disp
	jal	graphics_draw_text
	nop
	 #
 # src/main.c:100:     sprintf(p2, "%lu", score2);
	.loc 1 100 5
	lw	$6,64($fp)		 #, score2
	lui	$2,%hi($LC6)	 # tmp195,
	addiu	$5,$2,%lo($LC6)	 #, tmp195,
	addiu	$4,$28,%gp_rel(p2.0)	 #,,
	jal	sprintf
	nop
	 #
 # src/main.c:101:     graphics_draw_text(disp, SCREEN_WIDTH/2 + 20*.75, 10, p2);
	.loc 1 101 5
	addiu	$7,$28,%gp_rel(p2.0)	 #,,
	li	$6,10			# 0xa	 #,
	li	$5,175			# 0xaf	 #,
	lw	$4,48($fp)		 #, disp
	jal	graphics_draw_text
	nop
	 #
 # src/main.c:102: }
	.loc 1 102 1
	nop	
	move	$sp,$fp	 #,
$LCFI23 = .
	ld	$31,40($sp)		 #,
	ld	$fp,32($sp)		 #,
	addiu	$sp,$sp,48	 #,,
$LCFI24 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	draw_scores
$LFE101:
	.size	draw_scores, .-draw_scores
	.section	.text.draw_middle_line,"ax",@progbits
	.align	2
	.align	5
$LFB102 = .
	.loc 1 106 1
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
$LCFI25 = .
	sd	$31,88($sp)	 #,
	sd	$fp,80($sp)	 #,
$LCFI26 = .
	move	$fp,$sp	 #,
$LCFI27 = .
 # src/main.c:107:     i32 const width = 2;
	.loc 1 107 15
	li	$2,2			# 0x2	 # tmp199,
	sw	$2,36($fp)	 # tmp199, width
 # src/main.c:108:     i32 const height = 10;
	.loc 1 108 15
	li	$2,10			# 0xa	 # tmp200,
	sw	$2,40($fp)	 # tmp200, height
 # src/main.c:109:     i32 const padding = 5;
	.loc 1 109 15
	li	$2,5			# 0x5	 # tmp201,
	sw	$2,44($fp)	 # tmp201, padding
 # src/main.c:110:     i32 const x = (SCREEN_WIDTH - width) / 2;
	.loc 1 110 33
	li	$3,320			# 0x140	 # tmp202,
	lw	$2,36($fp)		 # tmp203, width
	subu	$2,$3,$2	 # _1, tmp202, tmp203
 # src/main.c:110:     i32 const x = (SCREEN_WIDTH - width) / 2;
	.loc 1 110 15
	srl	$3,$2,31	 # tmp204, _1,
	addu	$2,$3,$2	 # tmp205, tmp204, _1
	sra	$2,$2,1	 # x_11, tmp205,
	sw	$2,48($fp)	 # x_11, x
 # src/main.c:111:     i32 const segments = 15;
	.loc 1 111 15
	li	$2,15			# 0xf	 # tmp207,
	sw	$2,52($fp)	 # tmp207, segments
$LBB2 = .
 # src/main.c:113:     rdpq_set_mode_fill(RGBA32(255, 255, 255, 50));
	.loc 1 113 5
	li	$2,-1			# 0xffffffffffffffff	 # tmp208,
	sb	$2,64($fp)	 # tmp208, D.6029.r
	li	$2,-1			# 0xffffffffffffffff	 # tmp209,
	sb	$2,65($fp)	 # tmp209, D.6029.g
	li	$2,-1			# 0xffffffffffffffff	 # tmp210,
	sb	$2,66($fp)	 # tmp210, D.6029.b
	li	$2,50			# 0x32	 # tmp211,
	sb	$2,67($fp)	 # tmp211, D.6029.a
$LBE2 = .
	ld	$4,64($fp)		 #, D.6029
	jal	rdpq_set_mode_fill
	nop
	 #
$LBB3 = .
 # src/main.c:115:     for (i32 i = 0; i < segments; i++) {
	.loc 1 115 14
	sw	$0,32($fp)	 #, i
 # src/main.c:115:     for (i32 i = 0; i < segments; i++) {
	.loc 1 115 5
	b	$L20
	nop
	 #
$L21:
$LBB4 = .
 # src/main.c:116:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 116 23
	lw	$3,32($fp)		 # tmp212, i
	lw	$2,40($fp)		 # tmp213, height
	mult	$3,$2	 # tmp212, tmp213
 # src/main.c:116:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 116 19
	mflo	$2		 # _2
	addiu	$2,$2,5	 # _3, _2,
 # src/main.c:116:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 116 47
	lw	$3,32($fp)		 # tmp214, i
	addiu	$4,$3,1	 # _4, tmp214,
 # src/main.c:116:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 116 42
	lw	$3,44($fp)		 # tmp215, padding
	mult	$4,$3	 # _4, tmp215
 # src/main.c:116:         i32 y = 5 + i * height + padding * (i + 1);
	.loc 1 116 13
	mflo	$3		 # _5
	addu	$2,$2,$3	 # y_21, _3, _5
	sw	$2,56($fp)	 # y_21, y
 # src/main.c:117:         draw_rect(x, y, width, height);
	.loc 1 117 9
	lw	$7,40($fp)		 #, height
	lw	$6,36($fp)		 #, width
	lw	$5,56($fp)		 #, y
	lw	$4,48($fp)		 #, x
	jal	draw_rect
	nop
	 #
$LBE4 = .
 # src/main.c:115:     for (i32 i = 0; i < segments; i++) {
	.loc 1 115 36 discriminator 3
	lw	$2,32($fp)		 # tmp218, i
	addiu	$2,$2,1	 # i_23, tmp218,
	sw	$2,32($fp)	 # i_23, i
$L20:
 # src/main.c:115:     for (i32 i = 0; i < segments; i++) {
	.loc 1 115 23 discriminator 1
	lw	$3,32($fp)		 # tmp219, i
	lw	$2,52($fp)		 # tmp220, segments
	slt	$2,$3,$2	 # tmp221, tmp219, tmp220
	bne	$2,$0,$L21
	nop
	 #, tmp221,,
$LBE3 = .
 # src/main.c:119: }
	.loc 1 119 1
	nop	
	nop	
	move	$sp,$fp	 #,
$LCFI28 = .
	ld	$31,88($sp)		 #,
	ld	$fp,80($sp)		 #,
	addiu	$sp,$sp,96	 #,,
$LCFI29 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	draw_middle_line
$LFE102:
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
$LFB103 = .
	.loc 1 122 1
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
$LCFI30 = .
	sd	$fp,32($sp)	 #,
$LCFI31 = .
	move	$fp,$sp	 #,
$LCFI32 = .
	sw	$4,40($fp)	 # paddles, paddles
	sw	$5,48($fp)	 # ball, ball
 # src/main.c:123:     paddles[0].pos = (Vector2){.x = PADDLE_0_STARTING_X, .y = PADDLE_0_STARTING_Y};
	.loc 1 123 20
	lw	$2,40($fp)		 # tmp195, paddles
	ld	$3,%gp_rel($LC0)($28)		 # tmp196,
	sdl	$3,0($2)	 # tmp196, paddles_3(D)->pos
	sdr	$3,7($2)	 # tmp196, paddles_3(D)->pos
 # src/main.c:124:     paddles[1].pos = (Vector2){.x = PADDLE_1_STARTING_X, .y = PADDLE_1_STARTING_Y};
	.loc 1 124 12
	lw	$2,40($fp)		 # tmp197, paddles
	addiu	$2,$2,12	 # _1, tmp197,
 # src/main.c:124:     paddles[1].pos = (Vector2){.x = PADDLE_1_STARTING_X, .y = PADDLE_1_STARTING_Y};
	.loc 1 124 20
	ld	$3,%gp_rel($LC1)($28)		 # tmp198,
	sdl	$3,0($2)	 # tmp198, _1->pos
	sdr	$3,7($2)	 # tmp198, _1->pos
 # src/main.c:126:     ball->pos = (Vector2){.x = BALL_STARTING_X, .y = BALL_STARTING_Y};
	.loc 1 126 15
	lw	$2,48($fp)		 # tmp199, ball
	ld	$3,%gp_rel($LC2)($28)		 # tmp200,
	sdl	$3,0($2)	 # tmp200, ball_6(D)->pos
	sdr	$3,7($2)	 # tmp200, ball_6(D)->pos
 # src/main.c:127:     ball->vel = (Vector2){.x = 1.0f, .y = 1.0f};
	.loc 1 127 15
	lw	$2,48($fp)		 # tmp201, ball
	ld	$3,%gp_rel($LC3)($28)		 # tmp202,
	sdl	$3,8($2)	 # tmp202, ball_6(D)->vel
	sdr	$3,15($2)	 # tmp202, ball_6(D)->vel
 # src/main.c:128:     ball->speed = 1.0f;
	.loc 1 128 17
	lw	$2,48($fp)		 # tmp203, ball
	lwc1	$f0,%gp_rel($LC7)($28)	 # tmp204,
	swc1	$f0,16($2)	 # tmp204, ball_6(D)->speed
 # src/main.c:130:     g_game_state = Game_State_Serving;
	.loc 1 130 18
	sw	$0,%gp_rel(g_game_state)($28)	 #, g_game_state
 # src/main.c:131: }
	.loc 1 131 1
	nop	
	move	$sp,$fp	 #,
$LCFI33 = .
	ld	$fp,32($sp)		 #,
	addiu	$sp,$sp,40	 #,,
$LCFI34 = .
	jr	$31
	nop
	 #
	.set	macro
	.set	reorder
	.end	transition_to_serving
$LFE103:
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
$LFB104 = .
	.loc 1 134 1
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
$LCFI35 = .
	sd	$31,232($sp)	 #,
	sd	$fp,224($sp)	 #,
$LCFI36 = .
	move	$fp,$sp	 #,
$LCFI37 = .
 # src/main.c:135:     display_init(RESOLUTION, DEPTH_32_BPP, 2, GAMMA_CORRECT_DITHER, FILTERS_RESAMPLE_ANTIALIAS);
	.loc 1 135 5
	lui	$2,%hi(RESOLUTION_320x240)	 # tmp257,
	li	$3,3			# 0x3	 # tmp258,
	sw	$3,44($sp)	 # tmp258,
	li	$3,2			# 0x2	 # tmp259,
	sw	$3,36($sp)	 # tmp259,
	li	$7,2			# 0x2	 #,
	li	$6,1			# 0x1	 #,
	ld	$4,%lo(RESOLUTION_320x240)($2)		 #, RESOLUTION_320x240
	addiu	$2,$2,%lo(RESOLUTION_320x240)	 # tmp260, tmp257,
	ld	$5,8($2)		 #, RESOLUTION_320x240
	jal	display_init
	nop
	 #
 # src/main.c:136:     controller_init();
	.loc 1 136 5
	jal	controller_init
	nop
	 #
 # src/main.c:137:     rdpq_init();
	.loc 1 137 5
	jal	rdpq_init
	nop
	 #
$LBB5 = .
 # src/main.c:139:     color_t const COLOR_WHITE = RGBA32(255, 255, 255, 255);
	.loc 1 139 5
	li	$2,-1			# 0xffffffffffffffff	 # tmp261,
	sb	$2,80($fp)	 # tmp261, D.6049.r
	li	$2,-1			# 0xffffffffffffffff	 # tmp262,
	sb	$2,81($fp)	 # tmp262, D.6049.g
	li	$2,-1			# 0xffffffffffffffff	 # tmp263,
	sb	$2,82($fp)	 # tmp263, D.6049.b
	li	$2,-1			# 0xffffffffffffffff	 # tmp264,
	sb	$2,83($fp)	 # tmp264, D.6049.a
$LBE5 = .
 # src/main.c:139:     color_t const COLOR_WHITE = RGBA32(255, 255, 255, 255);
	.loc 1 139 19
	lw	$2,80($fp)		 # tmp265, D.6049
	sw	$2,88($fp)	 # tmp265, COLOR_WHITE
 # src/main.c:141:     Paddle paddles[2] = {
	.loc 1 141 12
	lui	$2,%hi($LC4)	 # tmp266,
	ld	$4,%lo($LC4)($2)		 # tmp267,
	addiu	$3,$2,%lo($LC4)	 # tmp269, tmp266,
	ld	$3,8($3)		 # tmp268,
	addiu	$2,$2,%lo($LC4)	 # tmp271, tmp266,
	ld	$2,16($2)		 # tmp270,
	sd	$4,96($fp)	 # tmp267, paddles
	sd	$3,104($fp)	 # tmp268, paddles
	sd	$2,112($fp)	 # tmp270, paddles
 # src/main.c:152:     Ball ball = {
	.loc 1 152 10
	lui	$2,%hi($LC5)	 # tmp272,
	ld	$4,%lo($LC5)($2)		 # tmp273,
	addiu	$3,$2,%lo($LC5)	 # tmp275, tmp272,
	ld	$3,8($3)		 # tmp274,
	sd	$4,120($fp)	 # tmp273, ball
	sd	$3,128($fp)	 # tmp274, ball
	addiu	$2,$2,%lo($LC5)	 # tmp276, tmp272,
	lw	$2,16($2)		 # tmp277,
	sw	$2,136($fp)	 # tmp277, ball
$L49:
$LBB6 = .
 # src/main.c:159:         surface_t *disp = display_get();
	.loc 1 159 27
	jal	display_get
	nop
	 #
	sw	$2,68($fp)	 #, disp
 # src/main.c:160:         rdpq_attach_clear(disp, NULL);
	.loc 1 160 9
	move	$5,$0	 #,
	lw	$4,68($fp)		 #, disp
	jal	rdpq_attach_clear
	nop
	 #
 # src/main.c:162:         draw_scores(disp, paddles[0].score, paddles[1].score);
	.loc 1 162 9
	lw	$2,104($fp)		 # _1, paddles[0].score
	lw	$3,116($fp)		 # _2, paddles[1].score
	move	$6,$3	 #, _2
	move	$5,$2	 #, _1
	lw	$4,68($fp)		 #, disp
	jal	draw_scores
	nop
	 #
 # src/main.c:163:         draw_middle_line(disp);
	.loc 1 163 9
	lw	$4,68($fp)		 #, disp
	jal	draw_middle_line
	nop
	 #
 # src/main.c:165:         rdpq_set_mode_fill(COLOR_WHITE);
	.loc 1 165 9
	ld	$4,88($fp)		 #, COLOR_WHITE
	jal	rdpq_set_mode_fill
	nop
	 #
 # src/main.c:166:         draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
	.loc 1 166 27
	lwc1	$f0,120($fp)	 # _3, ball.pos.D.5971.x
 # src/main.c:166:         draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
	.loc 1 166 9
	trunc.w.s $f1,$f0	 # _4, _3
 # src/main.c:166:         draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
	.loc 1 166 39
	lwc1	$f0,124($fp)	 # _5, ball.pos.D.5971.y
 # src/main.c:166:         draw_rect(ball.pos.x, ball.pos.y, BALL_SIZE, BALL_SIZE);
	.loc 1 166 9
	trunc.w.s $f0,$f0	 # _6, _5
	li	$7,5			# 0x5	 #,
	li	$6,5			# 0x5	 #,
	mfc1	$5,$f0	 #, _6
	mfc1	$4,$f1	 #, _4
	jal	draw_rect
	nop
	 #
 # src/main.c:167:         draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 167 33
	lwc1	$f0,96($fp)	 # _7, paddles[0].pos.D.5971.x
 # src/main.c:167:         draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 167 9
	trunc.w.s $f1,$f0	 # _8, _7
 # src/main.c:167:         draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 167 51
	lwc1	$f0,100($fp)	 # _9, paddles[0].pos.D.5971.y
 # src/main.c:167:         draw_rect(paddles[0].pos.x, paddles[0].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 167 9
	trunc.w.s $f0,$f0	 # _10, _9
	li	$7,25			# 0x19	 #,
	li	$6,5			# 0x5	 #,
	mfc1	$5,$f0	 #, _10
	mfc1	$4,$f1	 #, _8
	jal	draw_rect
	nop
	 #
 # src/main.c:168:         draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 168 33
	lwc1	$f0,108($fp)	 # _11, paddles[1].pos.D.5971.x
 # src/main.c:168:         draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 168 9
	trunc.w.s $f1,$f0	 # _12, _11
 # src/main.c:168:         draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 168 51
	lwc1	$f0,112($fp)	 # _13, paddles[1].pos.D.5971.y
 # src/main.c:168:         draw_rect(paddles[1].pos.x, paddles[1].pos.y, PADDLE_WIDTH, PADDLE_HEIGHT);
	.loc 1 168 9
	trunc.w.s $f0,$f0	 # _14, _13
	li	$7,25			# 0x19	 #,
	li	$6,5			# 0x5	 #,
	mfc1	$5,$f0	 #, _14
	mfc1	$4,$f1	 #, _12
	jal	draw_rect
	nop
	 #
 # src/main.c:170:         controller_scan();
	.loc 1 170 9
	jal	controller_scan
	nop
	 #
 # src/main.c:171:         struct controller_data keys = get_keys_held();
	.loc 1 171 39
	addiu	$2,$fp,152	 # tmp278,,
	move	$4,$2	 #, tmp278
	jal	get_keys_held
	nop
	 #
 # src/main.c:173:         switch (g_game_state) {
	.loc 1 173 9
	lw	$2,%gp_rel(g_game_state)($28)		 # g_game_state.1_15, g_game_state
	beq	$2,$0,$L24
	nop
	 #, g_game_state.1_15,,
	li	$3,1			# 0x1	 # tmp279,
	bne	$2,$3,$L25
	nop
	 #, g_game_state.1_15, tmp279,
 # src/main.c:176:                 ball.pos = vec2_add(ball.pos, vec2_scale(ball.vel, ball.speed));
	.loc 1 176 28
	lwc1	$f0,136($fp)	 # _16, ball.speed
	addiu	$2,$fp,72	 # tmp280,,
	mfc1	$6,$f0	 #, _16
	ld	$5,128($fp)		 #, ball.vel
	move	$4,$2	 #, tmp280
	jal	vec2_scale
	nop
	 #
 # src/main.c:176:                 ball.pos = vec2_add(ball.pos, vec2_scale(ball.vel, ball.speed));
	.loc 1 176 28 is_stmt 0 discriminator 1
	addiu	$2,$fp,216	 # tmp281,,
	ld	$6,72($fp)		 #, D.6087
	ld	$5,120($fp)		 #, ball.pos
	move	$4,$2	 #, tmp281
	jal	vec2_add
	nop
	 #
	ldl	$2,216($fp)	 # tmp283,
	ldr	$2,223($fp)	 # tmp282,
	sd	$2,120($fp)	 # tmp282, ball.pos
 # src/main.c:179:                 if (keys.c[0].up) {
	.loc 1 179 21 is_stmt 1
	lw	$3,156($fp)		 # _17, keys.c[0].D.3018.D.3017
	li	$2,134217728			# 0x8000000	 # tmp284,
	and	$2,$3,$2	 # _18, _17, tmp284
 # src/main.c:179:                 if (keys.c[0].up) {
	.loc 1 179 20
	beq	$2,$0,$L26
	nop
	 #, _18,,
 # src/main.c:180:                     paddles[0].pos.y -= PADDLE_SPEED;
	.loc 1 180 35
	lwc1	$f1,100($fp)	 # _19, paddles[0].pos.D.5971.y
 # src/main.c:180:                     paddles[0].pos.y -= PADDLE_SPEED;
	.loc 1 180 38
	lwc1	$f0,%gp_rel($LC8)($28)	 # tmp285,
	sub.s	$f0,$f1,$f0	 # _20, _19, tmp285
	swc1	$f0,100($fp)	 # _20, paddles[0].pos.D.5971.y
$L26:
 # src/main.c:182:                 if (keys.c[0].down) {
	.loc 1 182 21
	lw	$3,156($fp)		 # _21, keys.c[0].D.3018.D.3017
	li	$2,67108864			# 0x4000000	 # tmp286,
	and	$2,$3,$2	 # _22, _21, tmp286
 # src/main.c:182:                 if (keys.c[0].down) {
	.loc 1 182 20
	beq	$2,$0,$L27
	nop
	 #, _22,,
 # src/main.c:183:                     paddles[0].pos.y += PADDLE_SPEED;
	.loc 1 183 35
	lwc1	$f1,100($fp)	 # _23, paddles[0].pos.D.5971.y
 # src/main.c:183:                     paddles[0].pos.y += PADDLE_SPEED;
	.loc 1 183 38
	lwc1	$f0,%gp_rel($LC8)($28)	 # tmp287,
	add.s	$f0,$f1,$f0	 # _24, _23, tmp287
	swc1	$f0,100($fp)	 # _24, paddles[0].pos.D.5971.y
$L27:
 # src/main.c:187:                 if (keys.c[0].C_up) {
	.loc 1 187 21
	lw	$3,156($fp)		 # _25, keys.c[0].D.3018.D.3017
	li	$2,524288			# 0x80000	 # tmp288,
	and	$2,$3,$2	 # _26, _25, tmp288
 # src/main.c:187:                 if (keys.c[0].C_up) {
	.loc 1 187 20
	beq	$2,$0,$L28
	nop
	 #, _26,,
 # src/main.c:188:                     paddles[1].pos.y -= PADDLE_SPEED;
	.loc 1 188 35
	lwc1	$f1,112($fp)	 # _27, paddles[1].pos.D.5971.y
 # src/main.c:188:                     paddles[1].pos.y -= PADDLE_SPEED;
	.loc 1 188 38
	lwc1	$f0,%gp_rel($LC8)($28)	 # tmp289,
	sub.s	$f0,$f1,$f0	 # _28, _27, tmp289
	swc1	$f0,112($fp)	 # _28, paddles[1].pos.D.5971.y
$L28:
 # src/main.c:190:                 if (keys.c[0].C_down) {
	.loc 1 190 21
	lw	$3,156($fp)		 # _29, keys.c[0].D.3018.D.3017
	li	$2,262144			# 0x40000	 # tmp290,
	and	$2,$3,$2	 # _30, _29, tmp290
 # src/main.c:190:                 if (keys.c[0].C_down) {
	.loc 1 190 20
	beq	$2,$0,$L29
	nop
	 #, _30,,
 # src/main.c:191:                     paddles[1].pos.y += PADDLE_SPEED;
	.loc 1 191 35
	lwc1	$f1,112($fp)	 # _31, paddles[1].pos.D.5971.y
 # src/main.c:191:                     paddles[1].pos.y += PADDLE_SPEED;
	.loc 1 191 38
	lwc1	$f0,%gp_rel($LC8)($28)	 # tmp291,
	add.s	$f0,$f1,$f0	 # _32, _31, tmp291
	swc1	$f0,112($fp)	 # _32, paddles[1].pos.D.5971.y
$L29:
 # src/main.c:195:                 paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 195 36
	lwc1	$f0,100($fp)	 # _33, paddles[0].pos.D.5971.y
	mtc1	$0,$f1	 #, tmp292
	nop	
	c.lt.s	$f0,$f1	 #, _33, tmp292
	nop	
	bc1f	$L54
	nop
	 #,,
 # src/main.c:195:                 paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 195 36 is_stmt 0 discriminator 1
	mtc1	$0,$f0	 #, iftmp.2_62
	b	$L32
	nop
	 #
$L54:
 # src/main.c:195:                 paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 195 36 discriminator 2
	lwc1	$f0,100($fp)	 # _34, paddles[0].pos.D.5971.y
	lwc1	$f1,%gp_rel($LC9)($28)	 # tmp293,
	c.le.s	$f0,$f1	 #, iftmp.2_62, tmp293
	nop	
	bc1t	$L32
	nop
	 #,,
	lwc1	$f0,%gp_rel($LC9)($28)	 # iftmp.2_62,
$L32:
 # src/main.c:195:                 paddles[0].pos.y = Clamp(paddles[0].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 195 34 is_stmt 1 discriminator 4
	swc1	$f0,100($fp)	 # iftmp.2_62, paddles[0].pos.D.5971.y
 # src/main.c:196:                 paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 196 36
	lwc1	$f0,112($fp)	 # _35, paddles[1].pos.D.5971.y
	mtc1	$0,$f1	 #, tmp294
	nop	
	c.lt.s	$f0,$f1	 #, _35, tmp294
	nop	
	bc1f	$L55
	nop
	 #,,
 # src/main.c:196:                 paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 196 36 is_stmt 0 discriminator 1
	mtc1	$0,$f0	 #, iftmp.3_63
	b	$L36
	nop
	 #
$L55:
 # src/main.c:196:                 paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 196 36 discriminator 2
	lwc1	$f0,112($fp)	 # _36, paddles[1].pos.D.5971.y
	lwc1	$f1,%gp_rel($LC9)($28)	 # tmp295,
	c.le.s	$f0,$f1	 #, iftmp.3_63, tmp295
	nop	
	bc1t	$L36
	nop
	 #,,
	lwc1	$f0,%gp_rel($LC9)($28)	 # iftmp.3_63,
$L36:
 # src/main.c:196:                 paddles[1].pos.y = Clamp(paddles[1].pos.y, 0, SCREEN_HEIGHT - PADDLE_HEIGHT);
	.loc 1 196 34 is_stmt 1 discriminator 4
	swc1	$f0,112($fp)	 # iftmp.3_63, paddles[1].pos.D.5971.y
 # src/main.c:199:                 if (ball.pos.y + BALL_SIZE >= SCREEN_HEIGHT ||
	.loc 1 199 29
	lwc1	$f1,124($fp)	 # _37, ball.pos.D.5971.y
 # src/main.c:199:                 if (ball.pos.y + BALL_SIZE >= SCREEN_HEIGHT ||
	.loc 1 199 20
	lwc1	$f0,%gp_rel($LC10)($28)	 # tmp296,
	c.le.s	$f0,$f1	 #, tmp296, _37
	nop	
	bc1t	$L38
	nop
	 #,,
 # src/main.c:200:                     ball.pos.y <= 0)
	.loc 1 200 29
	lwc1	$f0,124($fp)	 # _38, ball.pos.D.5971.y
 # src/main.c:199:                 if (ball.pos.y + BALL_SIZE >= SCREEN_HEIGHT ||
	.loc 1 199 61 discriminator 1
	mtc1	$0,$f1	 #, tmp297
	nop	
	c.le.s	$f0,$f1	 #, _38, tmp297
	nop	
	bc1f	$L39
	nop
	 #,,
$L38:
 # src/main.c:202:                     ball.vel.y *= -1;
	.loc 1 202 29
	lwc1	$f0,132($fp)	 # _39, ball.vel.D.5971.y
 # src/main.c:202:                     ball.vel.y *= -1;
	.loc 1 202 32
	neg.s	$f0,$f0	 # _40, _39
	swc1	$f0,132($fp)	 # _40, ball.vel.D.5971.y
$L39:
$LBB7 = .
 # src/main.c:206:                 for (int i = 0; i < ArrayCount(paddles); i++) {
	.loc 1 206 26
	sw	$0,64($fp)	 #, i
 # src/main.c:206:                 for (int i = 0; i < ArrayCount(paddles); i++) {
	.loc 1 206 17
	b	$L41
	nop
	 #
$L43:
 # src/main.c:207:                     if (HasCollision(
	.loc 1 207 25
	lwc1	$f3,120($fp)	 # _41, ball.pos.D.5971.x
	lwc1	$f4,124($fp)	 # _42, ball.pos.D.5971.y
	lw	$3,64($fp)		 # tmp298, i
	move	$2,$3	 # tmp300, tmp298
	sll	$2,$2,1	 # tmp301, tmp300,
	addu	$2,$2,$3	 # tmp300, tmp300, tmp298
	sll	$2,$2,2	 # tmp302, tmp300,
	addiu	$3,$fp,64	 # tmp325,,
	addu	$2,$3,$2	 # tmp299, tmp325, tmp300
	lwc1	$f0,32($2)	 # _43, paddles[i_61].pos.D.5971.x
	lw	$3,64($fp)		 # tmp303, i
	move	$2,$3	 # tmp305, tmp303
	sll	$2,$2,1	 # tmp306, tmp305,
	addu	$2,$2,$3	 # tmp305, tmp305, tmp303
	sll	$2,$2,2	 # tmp307, tmp305,
	addiu	$3,$fp,64	 # tmp326,,
	addu	$2,$3,$2	 # tmp304, tmp326, tmp305
	lwc1	$f1,36($2)	 # _44, paddles[i_61].pos.D.5971.y
	lwc1	$f6,%gp_rel($LC11)($28)	 # tmp308,
	lwc1	$f5,%gp_rel($LC11)($28)	 # tmp309,
	lwc1	$f2,%gp_rel($LC12)($28)	 # tmp310,
	swc1	$f2,60($sp)	 # tmp310,
	lwc1	$f2,%gp_rel($LC11)($28)	 # tmp311,
	swc1	$f2,52($sp)	 # tmp311,
	swc1	$f1,44($sp)	 # _44,
	swc1	$f0,36($sp)	 # _43,
	mfc1	$7,$f6	 #, tmp308
	mfc1	$6,$f5	 #, tmp309
	mov.s	$f13,$f4	 #, _42
	mov.s	$f12,$f3	 #, _41
	jal	AABB
	nop
	 #
 # src/main.c:207:                     if (HasCollision(
	.loc 1 207 24 discriminator 1
	beq	$2,$0,$L42
	nop
	 #, _45,,
 # src/main.c:211:                         ball.vel.x *= -1;
	.loc 1 211 33
	lwc1	$f0,128($fp)	 # _46, ball.vel.D.5971.x
 # src/main.c:211:                         ball.vel.x *= -1;
	.loc 1 211 36
	neg.s	$f0,$f0	 # _47, _46
	swc1	$f0,128($fp)	 # _47, ball.vel.D.5971.x
 # src/main.c:212:                         ball.speed *= 1.05;
	.loc 1 212 29
	lwc1	$f0,136($fp)	 # _48, ball.speed
	cvt.d.s	$f1,$f0	 # _49, _48
 # src/main.c:212:                         ball.speed *= 1.05;
	.loc 1 212 36
	ldc1	$f0,%gp_rel($LC13)($28)	 # tmp313,
	mul.d	$f0,$f1,$f0	 # _50, _49, tmp313
	cvt.s.d	$f0,$f0	 # _51, _50
	swc1	$f0,136($fp)	 # _51, ball.speed
$L42:
 # src/main.c:206:                 for (int i = 0; i < ArrayCount(paddles); i++) {
	.loc 1 206 59 discriminator 2
	lw	$2,64($fp)		 # tmp315, i
	addiu	$2,$2,1	 # i_120, tmp315,
	sw	$2,64($fp)	 # i_120, i
$L41:
 # src/main.c:206:                 for (int i = 0; i < ArrayCount(paddles); i++) {
	.loc 1 206 35 discriminator 1
	lw	$2,64($fp)		 # i.4_52, i
	sltu	$2,$2,2	 # tmp316, i.4_52,
	bne	$2,$0,$L43
	nop
	 #, tmp316,,
$LBE7 = .
 # src/main.c:217:                 if (ball.pos.x + BALL_SIZE >= SCREEN_WIDTH) {
	.loc 1 217 29
	lwc1	$f1,120($fp)	 # _53, ball.pos.D.5971.x
 # src/main.c:217:                 if (ball.pos.x + BALL_SIZE >= SCREEN_WIDTH) {
	.loc 1 217 20
	lwc1	$f0,%gp_rel($LC14)($28)	 # tmp317,
	c.le.s	$f0,$f1	 #, tmp317, _53
	nop	
	bc1f	$L44
	nop
	 #,,
 # src/main.c:218:                     paddles[0].score++;
	.loc 1 218 31
	lw	$2,104($fp)		 # _54, paddles[0].score
 # src/main.c:218:                     paddles[0].score++;
	.loc 1 218 37
	addiu	$2,$2,1	 # _55, _54,
	sw	$2,104($fp)	 # _55, paddles[0].score
 # src/main.c:219:                     transition_to_serving(paddles, &ball);
	.loc 1 219 21
	addiu	$3,$fp,120	 # tmp318,,
	addiu	$2,$fp,96	 # tmp319,,
	move	$5,$3	 #, tmp318
	move	$4,$2	 #, tmp319
	jal	transition_to_serving
	nop
	 #
$L44:
 # src/main.c:223:                 if (ball.pos.x <= 0) {
	.loc 1 223 29
	lwc1	$f0,120($fp)	 # _56, ball.pos.D.5971.x
 # src/main.c:223:                 if (ball.pos.x <= 0) {
	.loc 1 223 20
	mtc1	$0,$f1	 #, tmp320
	nop	
	c.le.s	$f0,$f1	 #, _56, tmp320
	nop	
	bc1t	$L53
	nop
	 #,,
 # src/main.c:227:             } break;
	.loc 1 227 15
	b	$L25
	nop
	 #
$L53:
 # src/main.c:224:                     paddles[1].score++;
	.loc 1 224 31
	lw	$2,116($fp)		 # _57, paddles[1].score
 # src/main.c:224:                     paddles[1].score++;
	.loc 1 224 37
	addiu	$2,$2,1	 # _58, _57,
	sw	$2,116($fp)	 # _58, paddles[1].score
 # src/main.c:225:                     transition_to_serving(paddles, &ball);
	.loc 1 225 21
	addiu	$3,$fp,120	 # tmp321,,
	addiu	$2,$fp,96	 # tmp322,,
	move	$5,$3	 #, tmp321
	move	$4,$2	 #, tmp322
	jal	transition_to_serving
	nop
	 #
 # src/main.c:227:             } break;
	.loc 1 227 15
	b	$L25
	nop
	 #
$L24:
 # src/main.c:231:                 if (keys.c[0].A) {
	.loc 1 231 21
	lw	$3,156($fp)		 # _59, keys.c[0].D.3018.D.3017
	li	$2,-2147483648			# 0xffffffff80000000	 # tmp323,
	and	$2,$3,$2	 # _60, _59, tmp323
 # src/main.c:231:                 if (keys.c[0].A) {
	.loc 1 231 20
	beq	$2,$0,$L56
	nop
	 #, _60,,
 # src/main.c:232:                     g_game_state = Game_State_Playing;
	.loc 1 232 34
	li	$2,1			# 0x1	 # tmp324,
	sw	$2,%gp_rel(g_game_state)($28)	 # tmp324, g_game_state
$L56:
 # src/main.c:234:             } break;
	.loc 1 234 15
	nop	
$L25:
 # src/main.c:237:         rdpq_detach_show();
	.loc 1 237 9
	jal	rdpq_detach_show
	nop
	 #
$LBE6 = .
 # src/main.c:158:     while (1) {
	.loc 1 158 15
	b	$L49
	nop
	 #
	.set	macro
	.set	reorder
	.end	main
$LFE104:
	.size	main, .-main
	.section	.sbss.p1.1,"aw",@nobits
	.align	3
	.type	p1.1, @object
	.size	p1.1, 8
p1.1:
	.space	8
	.section	.sbss.p2.0,"aw",@nobits
	.align	3
	.type	p2.0, @object
	.size	p2.0, 8
p2.0:
	.space	8
	.section	.sdata
	.align	2
$LC7:
	.word	1065353216
	.align	2
$LC8:
	.word	1075838976
	.align	2
$LC9:
	.word	1129775104
	.align	2
$LC10:
	.word	1131085824
	.align	2
$LC11:
	.word	1084227584
	.align	2
$LC12:
	.word	1103626240
	.align	3
$LC13:
	.word	1072745676
	.word	-858993459
	.align	2
$LC14:
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
	.uleb128 0x10
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
	.uleb128 0x10
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
	.uleb128 0x30
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
	.uleb128 0x60
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
	.uleb128 0x28
	.byte	0x4
	.4byte	$LCFI31-$LCFI30
	.byte	0x9e
	.uleb128 0x2
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
	.uleb128 0xf0
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
	.align	2
$LEFDE14:
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
	.file 12 "/n64_toolchain/mips64-elf/include/stdio.h"
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.4byte	0xaeb
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	$Ldebug_abbrev0
	.uleb128 0x21
	.4byte	$LASF110
	.byte	0xc
	.4byte	$LASF111
	.ascii	"\000"
	.4byte	$LLRL0
	.4byte	0
	.4byte	$Ldebug_line0
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	$LASF0
	.uleb128 0x2
	.4byte	$LASF3
	.byte	0x2
	.byte	0x2b
	.byte	0x18
	.4byte	0x36
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.4byte	$LASF1
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.4byte	$LASF2
	.uleb128 0x2
	.4byte	$LASF4
	.byte	0x2
	.byte	0x39
	.byte	0x19
	.4byte	0x50
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.4byte	$LASF5
	.uleb128 0x2
	.4byte	$LASF6
	.byte	0x2
	.byte	0x4d
	.byte	0x18
	.4byte	0x63
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.4byte	$LASF7
	.uleb128 0x2
	.4byte	$LASF8
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x76
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	$LASF9
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.4byte	$LASF10
	.uleb128 0x2
	.4byte	$LASF11
	.byte	0x2
	.byte	0x69
	.byte	0x19
	.4byte	0x90
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.4byte	$LASF12
	.uleb128 0x22
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.4byte	$LASF13
	.uleb128 0x23
	.byte	0x4
	.uleb128 0xd
	.4byte	0xb1
	.uleb128 0x1b
	.4byte	0xa7
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.4byte	$LASF14
	.uleb128 0xb
	.4byte	0xb1
	.uleb128 0xd
	.4byte	0xb8
	.uleb128 0xb
	.4byte	0xbd
	.uleb128 0x1b
	.4byte	0xbd
	.uleb128 0xf
	.4byte	0xb1
	.4byte	0xdc
	.uleb128 0x10
	.4byte	0x9e
	.byte	0x7
	.byte	0
	.uleb128 0x2
	.4byte	$LASF15
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x2a
	.uleb128 0x2
	.4byte	$LASF16
	.byte	0x3
	.byte	0x24
	.byte	0x14
	.4byte	0x44
	.uleb128 0x2
	.4byte	$LASF17
	.byte	0x3
	.byte	0x2c
	.byte	0x13
	.4byte	0x57
	.uleb128 0x2
	.4byte	$LASF18
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x6a
	.uleb128 0x2
	.4byte	$LASF19
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x84
	.uleb128 0x6
	.byte	0x4
	.byte	0x4
	.4byte	$LASF20
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.4byte	$LASF21
	.uleb128 0x2
	.4byte	$LASF22
	.byte	0x4
	.byte	0x27
	.byte	0x1a
	.4byte	0x137
	.uleb128 0xb
	.4byte	0x126
	.uleb128 0x13
	.4byte	$LASF59
	.byte	0xc
	.byte	0x5
	.byte	0x89
	.4byte	0x185
	.uleb128 0x9
	.4byte	$LASF23
	.byte	0x5
	.byte	0x8b
	.byte	0xe
	.4byte	0xe8
	.byte	0
	.uleb128 0x9
	.4byte	$LASF24
	.byte	0x5
	.byte	0x8c
	.byte	0xe
	.4byte	0xe8
	.byte	0x2
	.uleb128 0x9
	.4byte	$LASF25
	.byte	0x5
	.byte	0x8d
	.byte	0xe
	.4byte	0xe8
	.byte	0x4
	.uleb128 0x9
	.4byte	$LASF26
	.byte	0x5
	.byte	0x8e
	.byte	0xe
	.4byte	0xe8
	.byte	0x6
	.uleb128 0x9
	.4byte	$LASF27
	.byte	0x5
	.byte	0x8f
	.byte	0xb
	.4byte	0xa5
	.byte	0x8
	.byte	0
	.uleb128 0x14
	.byte	0xc
	.byte	0x4
	.byte	0x35
	.4byte	0x1b5
	.uleb128 0x9
	.4byte	$LASF24
	.byte	0x4
	.byte	0x37
	.byte	0xd
	.4byte	0xf4
	.byte	0
	.uleb128 0x9
	.4byte	$LASF25
	.byte	0x4
	.byte	0x39
	.byte	0xd
	.4byte	0xf4
	.byte	0x4
	.uleb128 0x9
	.4byte	$LASF28
	.byte	0x4
	.byte	0x3b
	.byte	0xa
	.4byte	0x1b5
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x1
	.byte	0x2
	.4byte	$LASF29
	.uleb128 0x2
	.4byte	$LASF30
	.byte	0x4
	.byte	0x3c
	.byte	0x3
	.4byte	0x185
	.uleb128 0xb
	.4byte	0x1bc
	.uleb128 0x5
	.4byte	$LASF31
	.byte	0x4
	.byte	0x42
	.byte	0x14
	.4byte	0x1c8
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_256x240
	.uleb128 0x5
	.4byte	$LASF32
	.byte	0x4
	.byte	0x44
	.byte	0x14
	.4byte	0x1c8
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_320x240
	.uleb128 0x5
	.4byte	$LASF33
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.4byte	0x1c8
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_512x240
	.uleb128 0x5
	.4byte	$LASF34
	.byte	0x4
	.byte	0x48
	.byte	0x14
	.4byte	0x1c8
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_640x240
	.uleb128 0x5
	.4byte	$LASF35
	.byte	0x4
	.byte	0x4a
	.byte	0x14
	.4byte	0x1c8
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_512x480
	.uleb128 0x5
	.4byte	$LASF36
	.byte	0x4
	.byte	0x4c
	.byte	0x14
	.4byte	0x1c8
	.uleb128 0x5
	.byte	0x3
	.4byte	RESOLUTION_640x480
	.uleb128 0x15
	.4byte	0x9e
	.byte	0x4
	.byte	0x51
	.byte	0x1
	.4byte	0x252
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
	.4byte	0x239
	.uleb128 0x15
	.4byte	0x9e
	.byte	0x4
	.byte	0x5a
	.byte	0x1
	.4byte	0x27d
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
	.4byte	0x25e
	.uleb128 0x15
	.4byte	0x9e
	.byte	0x4
	.byte	0x6f
	.byte	0x1
	.4byte	0x2b4
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
	.4byte	0x289
	.uleb128 0xd
	.4byte	0x126
	.uleb128 0x11
	.byte	0x4
	.byte	0x6
	.byte	0x4d
	.byte	0x9
	.4byte	0x2dc
	.uleb128 0x1
	.4byte	$LASF50
	.byte	0x50
	.byte	0x1a
	.4byte	0x9e
	.byte	0x20
	.byte	0
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.byte	0x6
	.byte	0x52
	.byte	0x9
	.4byte	0x3a7
	.uleb128 0x3
	.ascii	"A\000"
	.byte	0x55
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.ascii	"B\000"
	.byte	0x57
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x1
	.uleb128 0x3
	.ascii	"Z\000"
	.byte	0x59
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x2
	.uleb128 0x1
	.4byte	$LASF51
	.byte	0x5b
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x3
	.uleb128 0x3
	.ascii	"up\000"
	.byte	0x5d
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x4
	.uleb128 0x1
	.4byte	$LASF52
	.byte	0x5f
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x5
	.uleb128 0x1
	.4byte	$LASF53
	.byte	0x61
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x6
	.uleb128 0x1
	.4byte	$LASF54
	.byte	0x63
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x7
	.uleb128 0x3
	.ascii	"L\000"
	.byte	0x67
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xa
	.uleb128 0x3
	.ascii	"R\000"
	.byte	0x69
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xb
	.uleb128 0x1
	.4byte	$LASF55
	.byte	0x6b
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xc
	.uleb128 0x1
	.4byte	$LASF56
	.byte	0x6d
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xd
	.uleb128 0x1
	.4byte	$LASF57
	.byte	0x6f
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xe
	.uleb128 0x1
	.4byte	$LASF58
	.byte	0x71
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xf
	.uleb128 0x3
	.ascii	"x\000"
	.byte	0x73
	.byte	0x14
	.4byte	0x97
	.byte	0x8
	.byte	0x10
	.uleb128 0x3
	.ascii	"y\000"
	.byte	0x75
	.byte	0x14
	.4byte	0x97
	.byte	0x8
	.byte	0x18
	.byte	0
	.uleb128 0x1c
	.byte	0x4
	.byte	0x4b
	.4byte	0x3b9
	.uleb128 0x12
	.4byte	0x2c5
	.uleb128 0x12
	.4byte	0x2dc
	.byte	0
	.uleb128 0x13
	.4byte	$LASF60
	.byte	0x8
	.byte	0x6
	.byte	0x42
	.4byte	0x3d9
	.uleb128 0x3
	.ascii	"err\000"
	.byte	0x47
	.byte	0xe
	.4byte	0x9e
	.byte	0x2
	.byte	0x10
	.uleb128 0x1d
	.4byte	0x3a7
	.byte	0x4
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.byte	0x6
	.byte	0x83
	.byte	0x9
	.4byte	0x3f0
	.uleb128 0x9
	.4byte	$LASF50
	.byte	0x6
	.byte	0x86
	.byte	0x16
	.4byte	0x10c
	.byte	0
	.byte	0
	.uleb128 0x11
	.byte	0x8
	.byte	0x6
	.byte	0x88
	.byte	0x9
	.4byte	0x4fc
	.uleb128 0x3
	.ascii	"err\000"
	.byte	0x8a
	.byte	0x16
	.4byte	0x9e
	.byte	0x2
	.byte	0
	.uleb128 0x1
	.4byte	$LASF61
	.byte	0x8b
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x2
	.uleb128 0x1
	.4byte	$LASF51
	.byte	0x8c
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x3
	.uleb128 0x3
	.ascii	"y\000"
	.byte	0x8d
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x4
	.uleb128 0x3
	.ascii	"x\000"
	.byte	0x8e
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x5
	.uleb128 0x3
	.ascii	"b\000"
	.byte	0x8f
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x6
	.uleb128 0x3
	.ascii	"a\000"
	.byte	0x90
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x7
	.uleb128 0x1
	.4byte	$LASF62
	.byte	0x91
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x8
	.uleb128 0x3
	.ascii	"l\000"
	.byte	0x92
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0x9
	.uleb128 0x3
	.ascii	"r\000"
	.byte	0x93
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xa
	.uleb128 0x3
	.ascii	"z\000"
	.byte	0x94
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xb
	.uleb128 0x3
	.ascii	"up\000"
	.byte	0x95
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xc
	.uleb128 0x1
	.4byte	$LASF52
	.byte	0x96
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xd
	.uleb128 0x1
	.4byte	$LASF54
	.byte	0x97
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xe
	.uleb128 0x1
	.4byte	$LASF53
	.byte	0x98
	.byte	0x16
	.4byte	0x9e
	.byte	0x1
	.byte	0xf
	.uleb128 0x1
	.4byte	$LASF63
	.byte	0x99
	.byte	0x16
	.4byte	0x9e
	.byte	0x8
	.byte	0x10
	.uleb128 0x1
	.4byte	$LASF64
	.byte	0x9a
	.byte	0x16
	.4byte	0x9e
	.byte	0x8
	.byte	0x18
	.uleb128 0x1
	.4byte	$LASF65
	.byte	0x9c
	.byte	0x16
	.4byte	0x9e
	.byte	0x8
	.byte	0x20
	.uleb128 0x1
	.4byte	$LASF66
	.byte	0x9d
	.byte	0x16
	.4byte	0x9e
	.byte	0x8
	.byte	0x28
	.uleb128 0x1
	.4byte	$LASF67
	.byte	0x9e
	.byte	0x16
	.4byte	0x9e
	.byte	0x8
	.byte	0x30
	.uleb128 0x1
	.4byte	$LASF68
	.byte	0x9f
	.byte	0x16
	.4byte	0x9e
	.byte	0x8
	.byte	0x38
	.byte	0
	.uleb128 0x1c
	.byte	0x8
	.byte	0x81
	.4byte	0x50e
	.uleb128 0x12
	.4byte	0x3d9
	.uleb128 0x12
	.4byte	0x3f0
	.byte	0
	.uleb128 0x13
	.4byte	$LASF69
	.byte	0x8
	.byte	0x6
	.byte	0x7f
	.4byte	0x521
	.uleb128 0x1d
	.4byte	0x4fc
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	$LASF70
	.byte	0x40
	.byte	0x6
	.byte	0xb5
	.4byte	0x545
	.uleb128 0xa
	.ascii	"c\000"
	.byte	0x6
	.byte	0xb8
	.byte	0x16
	.4byte	0x545
	.byte	0
	.uleb128 0xa
	.ascii	"gc\000"
	.byte	0x6
	.byte	0xba
	.byte	0x19
	.4byte	0x555
	.byte	0x20
	.byte	0
	.uleb128 0xf
	.4byte	0x3b9
	.4byte	0x555
	.uleb128 0x10
	.4byte	0x9e
	.byte	0x3
	.byte	0
	.uleb128 0xf
	.4byte	0x50e
	.4byte	0x565
	.uleb128 0x10
	.4byte	0x9e
	.byte	0x3
	.byte	0
	.uleb128 0x14
	.byte	0x4
	.byte	0x7
	.byte	0x33
	.4byte	0x59a
	.uleb128 0xa
	.ascii	"r\000"
	.byte	0x7
	.byte	0x36
	.byte	0xd
	.4byte	0xdc
	.byte	0
	.uleb128 0xa
	.ascii	"g\000"
	.byte	0x7
	.byte	0x38
	.byte	0xd
	.4byte	0xdc
	.byte	0x1
	.uleb128 0xa
	.ascii	"b\000"
	.byte	0x7
	.byte	0x3a
	.byte	0xd
	.4byte	0xdc
	.byte	0x2
	.uleb128 0xa
	.ascii	"a\000"
	.byte	0x7
	.byte	0x3c
	.byte	0xd
	.4byte	0xdc
	.byte	0x3
	.byte	0
	.uleb128 0x2
	.4byte	$LASF71
	.byte	0x7
	.byte	0x3d
	.byte	0x3
	.4byte	0x565
	.uleb128 0xb
	.4byte	0x59a
	.uleb128 0xd
	.4byte	0x132
	.uleb128 0x18
	.ascii	"u32\000"
	.byte	0x7
	.byte	0x12
	.4byte	0x100
	.uleb128 0x18
	.ascii	"i32\000"
	.byte	0xc
	.byte	0x11
	.4byte	0xf4
	.uleb128 0xb
	.4byte	0x5bb
	.uleb128 0x18
	.ascii	"f32\000"
	.byte	0xf
	.byte	0x10
	.4byte	0x118
	.uleb128 0xb
	.4byte	0x5cb
	.uleb128 0x11
	.byte	0x8
	.byte	0x1
	.byte	0x13
	.byte	0x5
	.4byte	0x5fb
	.uleb128 0xa
	.ascii	"x\000"
	.byte	0x1
	.byte	0x14
	.byte	0xd
	.4byte	0x5cb
	.byte	0
	.uleb128 0xa
	.ascii	"y\000"
	.byte	0x1
	.byte	0x15
	.byte	0xd
	.4byte	0x5cb
	.byte	0x4
	.byte	0
	.uleb128 0x24
	.byte	0x8
	.byte	0x1
	.byte	0x12
	.byte	0x9
	.4byte	0x614
	.uleb128 0x12
	.4byte	0x5db
	.uleb128 0x25
	.ascii	"v\000"
	.byte	0x1
	.byte	0x17
	.byte	0x9
	.4byte	0x614
	.byte	0
	.uleb128 0xf
	.4byte	0x5cb
	.4byte	0x624
	.uleb128 0x10
	.4byte	0x9e
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.4byte	$LASF72
	.byte	0x1
	.byte	0x18
	.byte	0x3
	.4byte	0x5fb
	.uleb128 0xb
	.4byte	0x624
	.uleb128 0x14
	.byte	0x14
	.byte	0x1
	.byte	0x20
	.4byte	0x665
	.uleb128 0xa
	.ascii	"pos\000"
	.byte	0x1
	.byte	0x21
	.byte	0xd
	.4byte	0x624
	.byte	0
	.uleb128 0xa
	.ascii	"vel\000"
	.byte	0x1
	.byte	0x22
	.byte	0xd
	.4byte	0x624
	.byte	0x8
	.uleb128 0x9
	.4byte	$LASF73
	.byte	0x1
	.byte	0x23
	.byte	0x9
	.4byte	0x5cb
	.byte	0x10
	.byte	0
	.uleb128 0x2
	.4byte	$LASF74
	.byte	0x1
	.byte	0x24
	.byte	0x3
	.4byte	0x635
	.uleb128 0x14
	.byte	0xc
	.byte	0x1
	.byte	0x26
	.4byte	0x694
	.uleb128 0xa
	.ascii	"pos\000"
	.byte	0x1
	.byte	0x27
	.byte	0xd
	.4byte	0x624
	.byte	0
	.uleb128 0x9
	.4byte	$LASF75
	.byte	0x1
	.byte	0x28
	.byte	0x9
	.4byte	0x5b0
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.4byte	$LASF76
	.byte	0x1
	.byte	0x29
	.byte	0x3
	.4byte	0x671
	.uleb128 0x15
	.4byte	0x9e
	.byte	0x1
	.byte	0x2b
	.byte	0xe
	.4byte	0x6b9
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
	.byte	0x2e
	.byte	0x3
	.4byte	0x6a0
	.uleb128 0x5
	.4byte	$LASF80
	.byte	0x1
	.byte	0x30
	.byte	0x13
	.4byte	0x6b9
	.uleb128 0x5
	.byte	0x3
	.4byte	g_game_state
	.uleb128 0x19
	.4byte	$LASF81
	.byte	0x8
	.byte	0xa5
	.uleb128 0x1e
	.4byte	$LASF83
	.byte	0x6
	.byte	0xd1
	.byte	0x18
	.4byte	0x521
	.uleb128 0x19
	.4byte	$LASF82
	.byte	0x6
	.byte	0xce
	.uleb128 0x1f
	.4byte	$LASF87
	.byte	0x8
	.byte	0x4d
	.4byte	0x707
	.uleb128 0x4
	.4byte	0x5ab
	.uleb128 0x4
	.4byte	0x5ab
	.byte	0
	.uleb128 0x1e
	.4byte	$LASF84
	.byte	0x4
	.byte	0xdc
	.byte	0xc
	.4byte	0x2c0
	.uleb128 0x20
	.4byte	$LASF85
	.byte	0x9
	.2byte	0x132
	.byte	0x6
	.uleb128 0x19
	.4byte	$LASF86
	.byte	0x6
	.byte	0xc8
	.uleb128 0x1f
	.4byte	$LASF88
	.byte	0x4
	.byte	0xc2
	.4byte	0x748
	.uleb128 0x4
	.4byte	0x1bc
	.uleb128 0x4
	.4byte	0x252
	.uleb128 0x4
	.4byte	0x100
	.uleb128 0x4
	.4byte	0x27d
	.uleb128 0x4
	.4byte	0x2b4
	.byte	0
	.uleb128 0x26
	.4byte	$LASF89
	.byte	0x7
	.2byte	0x169
	.byte	0x6
	.4byte	0x76a
	.uleb128 0x4
	.4byte	0x2c0
	.uleb128 0x4
	.4byte	0x97
	.uleb128 0x4
	.4byte	0x97
	.uleb128 0x4
	.4byte	0xc2
	.byte	0
	.uleb128 0x27
	.4byte	$LASF112
	.byte	0xc
	.byte	0xfa
	.byte	0x5
	.4byte	0x97
	.4byte	0x786
	.uleb128 0x4
	.4byte	0xac
	.uleb128 0x4
	.4byte	0xc7
	.uleb128 0x28
	.byte	0
	.uleb128 0x29
	.4byte	$LASF101
	.byte	0x1
	.byte	0x85
	.byte	0x5
	.4byte	0x97
	.4byte	$LFB104
	.4byte	$LFE104-$LFB104
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x812
	.uleb128 0x5
	.4byte	$LASF90
	.byte	0x1
	.byte	0x8b
	.byte	0x13
	.4byte	0x5a6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x5
	.4byte	$LASF91
	.byte	0x1
	.byte	0x8d
	.byte	0xc
	.4byte	0x812
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x5
	.4byte	$LASF92
	.byte	0x1
	.byte	0x98
	.byte	0xa
	.4byte	0x665
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x16
	.4byte	$LBB6
	.4byte	$LBE6-$LBB6
	.uleb128 0x5
	.4byte	$LASF93
	.byte	0x1
	.byte	0x9f
	.byte	0x14
	.4byte	0x2c0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -172
	.uleb128 0x5
	.4byte	$LASF94
	.byte	0x1
	.byte	0xab
	.byte	0x20
	.4byte	0x521
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x16
	.4byte	$LBB7
	.4byte	$LBE7-$LBB7
	.uleb128 0xe
	.ascii	"i\000"
	.byte	0xce
	.byte	0x1a
	.4byte	0x97
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	0x694
	.4byte	0x822
	.uleb128 0x10
	.4byte	0x9e
	.byte	0x1
	.byte	0
	.uleb128 0x2a
	.4byte	$LASF97
	.byte	0x1
	.byte	0x79
	.byte	0x17
	.4byte	$LFB103
	.4byte	$LFE103-$LFB103
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x855
	.uleb128 0xc
	.4byte	$LASF91
	.byte	0x79
	.byte	0x34
	.4byte	0x855
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.4byte	$LASF92
	.byte	0x79
	.byte	0x46
	.4byte	0x85a
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.byte	0
	.uleb128 0xd
	.4byte	0x694
	.uleb128 0xd
	.4byte	0x665
	.uleb128 0x2b
	.4byte	$LASF113
	.byte	0x1
	.byte	0x69
	.byte	0x17
	.4byte	$LFB102
	.4byte	$LFE102-$LFB102
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8ea
	.uleb128 0x5
	.4byte	$LASF24
	.byte	0x1
	.byte	0x6b
	.byte	0xf
	.4byte	0x5c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x5
	.4byte	$LASF25
	.byte	0x1
	.byte	0x6c
	.byte	0xf
	.4byte	0x5c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x5
	.4byte	$LASF95
	.byte	0x1
	.byte	0x6d
	.byte	0xf
	.4byte	0x5c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.ascii	"x\000"
	.byte	0x6e
	.byte	0xf
	.4byte	0x5c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.4byte	$LASF96
	.byte	0x1
	.byte	0x6f
	.byte	0xf
	.4byte	0x5c6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.4byte	$LBB3
	.4byte	$LBE3-$LBB3
	.uleb128 0xe
	.ascii	"i\000"
	.byte	0x73
	.byte	0xe
	.4byte	0x5bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x16
	.4byte	$LBB4
	.4byte	$LBE4-$LBB4
	.uleb128 0xe
	.ascii	"y\000"
	.byte	0x74
	.byte	0xd
	.4byte	0x5bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.4byte	$LASF98
	.byte	0x1
	.byte	0x5d
	.byte	0x17
	.4byte	$LFB101
	.4byte	$LFE101-$LFB101
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x94b
	.uleb128 0xc
	.4byte	$LASF93
	.byte	0x5d
	.byte	0x2e
	.4byte	0x2c0
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.4byte	$LASF99
	.byte	0x5d
	.byte	0x38
	.4byte	0x5b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xc
	.4byte	$LASF100
	.byte	0x5d
	.byte	0x44
	.4byte	0x5b0
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xe
	.ascii	"p1\000"
	.byte	0x5f
	.byte	0x11
	.4byte	0xcc
	.uleb128 0x5
	.byte	0x3
	.4byte	p1.1
	.uleb128 0xe
	.ascii	"p2\000"
	.byte	0x63
	.byte	0x11
	.4byte	0xcc
	.uleb128 0x5
	.byte	0x3
	.4byte	p2.0
	.byte	0
	.uleb128 0x2d
	.4byte	$LASF114
	.byte	0x1
	.byte	0x58
	.byte	0x10
	.4byte	$LFB100
	.4byte	$LFE100-$LFB100
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x996
	.uleb128 0x7
	.ascii	"x\000"
	.byte	0x58
	.byte	0x1e
	.4byte	0x5bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x7
	.ascii	"y\000"
	.byte	0x58
	.byte	0x25
	.4byte	0x5bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xc
	.4byte	$LASF24
	.byte	0x58
	.byte	0x2c
	.4byte	0x5bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xc
	.4byte	$LASF25
	.byte	0x58
	.byte	0x37
	.4byte	0x5bb
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.byte	0
	.uleb128 0x1a
	.4byte	$LASF102
	.byte	0x51
	.byte	0x10
	.4byte	0x1b5
	.4byte	$LFB99
	.4byte	$LFE99-$LFB99
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa18
	.uleb128 0x7
	.ascii	"x0\000"
	.byte	0x51
	.byte	0x19
	.4byte	0x5cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x7
	.ascii	"y0\000"
	.byte	0x51
	.byte	0x21
	.4byte	0x5cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x7
	.ascii	"w0\000"
	.byte	0x51
	.byte	0x29
	.4byte	0x5cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x7
	.ascii	"h0\000"
	.byte	0x51
	.byte	0x31
	.4byte	0x5cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x7
	.ascii	"x1\000"
	.byte	0x52
	.byte	0x19
	.4byte	0x5cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x7
	.ascii	"y1\000"
	.byte	0x52
	.byte	0x21
	.4byte	0x5cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x7
	.ascii	"w1\000"
	.byte	0x52
	.byte	0x29
	.4byte	0x5cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 52
	.uleb128 0x7
	.ascii	"h1\000"
	.byte	0x52
	.byte	0x31
	.4byte	0x5cb
	.uleb128 0x2
	.byte	0x91
	.sleb128 60
	.byte	0
	.uleb128 0x1a
	.4byte	$LASF103
	.byte	0x4a
	.byte	0x13
	.4byte	0x624
	.4byte	$LFB98
	.4byte	$LFE98-$LFB98
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa4a
	.uleb128 0x7
	.ascii	"a\000"
	.byte	0x4a
	.byte	0x2a
	.4byte	0x630
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x7
	.ascii	"b\000"
	.byte	0x4a
	.byte	0x3b
	.4byte	0x630
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.uleb128 0x1a
	.4byte	$LASF104
	.byte	0x45
	.byte	0x13
	.4byte	0x624
	.4byte	$LFB97
	.4byte	$LFE97-$LFB97
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa7e
	.uleb128 0x7
	.ascii	"v\000"
	.byte	0x45
	.byte	0x2c
	.4byte	0x630
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xc
	.4byte	$LASF105
	.byte	0x45
	.byte	0x39
	.4byte	0x5d6
	.uleb128 0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.uleb128 0x2e
	.4byte	$LASF108
	.byte	0xa
	.2byte	0x12d
	.byte	0xd
	.4byte	0xaa2
	.uleb128 0x2f
	.4byte	$LASF107
	.byte	0xa
	.2byte	0x12d
	.byte	0x28
	.4byte	0x59a
	.uleb128 0x20
	.4byte	$LASF106
	.byte	0xa
	.2byte	0x12e
	.byte	0x11
	.byte	0
	.uleb128 0x30
	.4byte	$LASF115
	.byte	0xb
	.byte	0x7f
	.byte	0xd
	.uleb128 0x17
	.ascii	"x0\000"
	.byte	0x2e
	.4byte	0xf4
	.uleb128 0x17
	.ascii	"y0\000"
	.byte	0x3a
	.4byte	0xf4
	.uleb128 0x17
	.ascii	"x1\000"
	.byte	0x46
	.4byte	0xf4
	.uleb128 0x17
	.ascii	"y1\000"
	.byte	0x52
	.4byte	0xf4
	.uleb128 0x31
	.uleb128 0x32
	.4byte	$LASF109
	.byte	0xb
	.byte	0x84
	.byte	0x15
	.uleb128 0x4
	.4byte	0xf4
	.uleb128 0x4
	.4byte	0xf4
	.uleb128 0x4
	.4byte	0xf4
	.uleb128 0x4
	.4byte	0xf4
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
	.uleb128 0x4
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x1b
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x7c
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
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
	.uleb128 0xb
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.4byte	0x54
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
	.byte	0
$Ldebug_ranges3:
	.section	.debug_line,"",@progbits
$Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
$LASF105:
	.ascii	"scale\000"
$LASF62:
	.ascii	"unused2\000"
$LASF85:
	.ascii	"rdpq_init\000"
$LASF111:
	.ascii	"src/main.c\000"
$LASF19:
	.ascii	"uint64_t\000"
$LASF3:
	.ascii	"__uint8_t\000"
$LASF72:
	.ascii	"Vector2\000"
$LASF39:
	.ascii	"bitdepth_t\000"
$LASF12:
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
$LASF61:
	.ascii	"origin_unchecked\000"
$LASF109:
	.ascii	"__rdpq_fill_rectangle_offline\000"
$LASF54:
	.ascii	"right\000"
$LASF10:
	.ascii	"long long int\000"
$LASF0:
	.ascii	"signed char\000"
$LASF79:
	.ascii	"Game_State\000"
$LASF114:
	.ascii	"draw_rect\000"
$LASF107:
	.ascii	"color\000"
$LASF7:
	.ascii	"long int\000"
$LASF115:
	.ascii	"__rdpq_fill_rectangle_fx\000"
$LASF113:
	.ascii	"draw_middle_line\000"
$LASF104:
	.ascii	"vec2_scale\000"
$LASF16:
	.ascii	"uint16_t\000"
$LASF112:
	.ascii	"sprintf\000"
$LASF42:
	.ascii	"GAMMA_CORRECT_DITHER\000"
$LASF27:
	.ascii	"buffer\000"
$LASF75:
	.ascii	"score\000"
$LASF4:
	.ascii	"__uint16_t\000"
$LASF52:
	.ascii	"down\000"
$LASF37:
	.ascii	"DEPTH_16_BPP\000"
$LASF8:
	.ascii	"__uint32_t\000"
$LASF30:
	.ascii	"resolution_t\000"
$LASF91:
	.ascii	"paddles\000"
$LASF95:
	.ascii	"padding\000"
$LASF82:
	.ascii	"controller_scan\000"
$LASF13:
	.ascii	"unsigned int\000"
$LASF110:
	.ascii	"GNU C99 14.2.0 -march=vr4300 -mtune=vr4300 -mips3 -g -O2"
	.ascii	" -O0 -std=gnu99 -falign-functions=32 -ffunction-sections"
	.ascii	" -fdata-sections -ffast-math -ftrapping-math -fno-associ"
	.ascii	"ative-math -fno-dwarf2-cfi-asm -fno-inline -fno-builtin\000"
$LASF9:
	.ascii	"long unsigned int\000"
$LASF102:
	.ascii	"AABB\000"
$LASF24:
	.ascii	"width\000"
$LASF50:
	.ascii	"data\000"
$LASF5:
	.ascii	"short unsigned int\000"
$LASF45:
	.ascii	"FILTERS_RESAMPLE\000"
$LASF98:
	.ascii	"draw_scores\000"
$LASF31:
	.ascii	"RESOLUTION_256x240\000"
$LASF55:
	.ascii	"C_up\000"
$LASF40:
	.ascii	"GAMMA_NONE\000"
$LASF89:
	.ascii	"graphics_draw_text\000"
$LASF67:
	.ascii	"analog_l\000"
$LASF68:
	.ascii	"analog_r\000"
$LASF2:
	.ascii	"short int\000"
$LASF6:
	.ascii	"__int32_t\000"
$LASF108:
	.ascii	"rdpq_set_mode_fill\000"
$LASF71:
	.ascii	"color_t\000"
$LASF32:
	.ascii	"RESOLUTION_320x240\000"
$LASF86:
	.ascii	"controller_init\000"
$LASF46:
	.ascii	"FILTERS_DEDITHER\000"
$LASF81:
	.ascii	"rdpq_detach_show\000"
$LASF96:
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
$LASF11:
	.ascii	"__uint64_t\000"
$LASF20:
	.ascii	"float\000"
$LASF97:
	.ascii	"transition_to_serving\000"
$LASF103:
	.ascii	"vec2_add\000"
$LASF29:
	.ascii	"_Bool\000"
$LASF17:
	.ascii	"int32_t\000"
$LASF1:
	.ascii	"unsigned char\000"
$LASF60:
	.ascii	"SI_condat\000"
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
$LASF18:
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
$LASF99:
	.ascii	"score1\000"
$LASF100:
	.ascii	"score2\000"
$LASF87:
	.ascii	"rdpq_attach_clear\000"
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
$LASF106:
	.ascii	"__rdpq_set_mode_fill\000"
$LASF47:
	.ascii	"FILTERS_RESAMPLE_ANTIALIAS\000"
$LASF15:
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
$LASF101:
	.ascii	"main\000"
$LASF53:
	.ascii	"left\000"
$LASF21:
	.ascii	"double\000"
	.ident	"GCC: (GNU) 14.2.0"
