	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L4
	ldr	r3, .L4+4
	ldr	r2, [r3]
	ldr	r3, [ip, #4]
	sub	r3, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [ip, #28]
	ldr	r1, .L4+8
	str	lr, [sp, #-4]!
	smull	lr, r0, r1, r2
	asr	r1, r2, #31
	rsb	r1, r1, r0, asr #5
	add	r0, r1, r1, lsl #2
	add	r0, r0, r0, lsl #2
	sub	r2, r2, r0, lsl #2
	ldrb	ip, [ip, #1]	@ zero_extendqisi2
	ldr	r0, .L4+12
	sub	r1, r1, #1
	add	r2, r2, r1, lsl #5
	strh	r2, [r0, #4]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	hOff
	.word	1374389535
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore.part.0, %function
drawScore.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #105
	ldr	r3, .L13
	ldr	ip, .L13+4
	ldr	r1, .L13+8
	cmp	r0, #1
	push	{r4, lr}
	strh	r2, [r3, #72]	@ movhi
	strh	ip, [r3, #74]	@ movhi
	strh	r1, [r3, #76]	@ movhi
	beq	.L11
	cmp	r0, #2
	beq	.L12
	cmp	r0, #3
	bne	.L8
	mov	r1, #916
	ldr	lr, .L13+12
	ldr	ip, .L13+16
	ldr	r0, .L13+20
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r3, #88]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	ldr	r2, .L13+24
	strh	r1, [r3, #92]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	lr, [r3, #82]	@ movhi
	strh	ip, [r3, #84]	@ movhi
	strh	r0, [r3, #90]	@ movhi
	strh	r2, [r3, #98]	@ movhi
	b	.L8
.L12:
	mov	r1, #916
	mov	lr, #896
	ldr	ip, .L13+12
	ldr	r0, .L13+20
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r3, #88]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	ldr	r2, .L13+24
	strh	lr, [r3, #84]	@ movhi
	strh	r1, [r3, #92]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	ip, [r3, #82]	@ movhi
	strh	r0, [r3, #90]	@ movhi
	strh	r2, [r3, #98]	@ movhi
.L8:
	ldr	r3, .L13+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L13+32
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L13
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L11:
	mov	lr, #916
	ldrh	r1, [r3, #96]
	strh	r2, [r3, #80]	@ movhi
	strh	r2, [r3, #88]	@ movhi
	ldr	r2, .L13+20
	add	ip, ip, #16
	add	r0, r0, #904
	orr	r1, r1, #512
	strh	r1, [r3, #96]	@ movhi
	strh	lr, [r3, #92]	@ movhi
	strh	ip, [r3, #82]	@ movhi
	strh	r0, [r3, #84]	@ movhi
	strh	r2, [r3, #90]	@ movhi
	b	.L8
.L14:
	.align	2
.L13:
	.word	shadowOAM
	.word	16524
	.word	918
	.word	16540
	.word	898
	.word	16548
	.word	16556
	.word	waitForVBlank
	.word	DMANow
	.size	drawScore.part.0, .-drawScore.part.0
	.align	2
	.global	stateSel
	.syntax unified
	.arm
	.fpu softvfp
	.type	stateSel, %function
stateSel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L19
	mov	r4, r0
	mov	lr, pc
	bx	r3
	tst	r0, #1
	moveq	r2, #0
	movne	r2, #5
	ldr	r3, .L19+4
	add	r0, r3, r4, lsl #5
	str	r2, [r0, #16]
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	rand
	.word	enemies
	.size	stateSel, .-stateSel
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	r1, #32
	mov	lr, #32768
	mov	ip, #1
	mov	r0, #100
	ldr	r3, .L23
	str	lr, [r3]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #8]
	str	r0, [r3, #28]
	str	r2, [r3, #4]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #44]
	str	r2, [r3, #56]
	ldr	lr, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r5, #0
	mov	r4, #64
	mov	r7, #5
	mov	r6, #96
	mov	lr, r5
	mov	r2, #32
	mov	ip, #128
	mov	r0, #241
	ldr	r3, .L29
	ldr	r1, .L29+4
	str	r5, [r3, #4]
	str	r5, [r3, #44]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r7, [r3, #28]
	str	r6, [r3]
	ldr	r3, .L29+8
	str	r5, [r1, #44]
	str	r4, [r1, #16]
	str	r4, [r1, #20]
	str	r4, [r1, #4]
	str	r7, [r1, #28]
	str	r6, [r1]
	add	r1, r3, #160
.L26:
	str	r2, [r3]
	str	r0, [r3, #12]
	str	lr, [r3, #28]
	stmib	r3, {r2, ip}
	add	r3, r3, #32
	cmp	r3, r1
	bne	.L26
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	enemy1
	.word	enemy2
	.word	enemies
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	str	lr, [sp, #-4]!
	mov	lr, #32768
	mov	r0, #32
	mov	r1, #1
	mov	ip, #100
	ldr	r3, .L33
	str	r2, [r3]
	ldr	r3, .L33+4
	str	r2, [r3]
	ldr	r3, .L33+8
	str	r2, [r3]
	ldr	r3, .L33+12
	str	r2, [r3, #4]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #44]
	str	r2, [r3, #56]
	ldr	r2, .L33+16
	str	lr, [r3]
	ldr	lr, [sp], #4
	str	ip, [r3, #28]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r2]
	b	initEnemies
.L34:
	.align	2
.L33:
	.word	vOff
	.word	hOff
	.word	score
	.word	player
	.word	amJumping
	.size	initGame, .-initGame
	.align	2
	.global	spawnEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnEnemies, %function
spawnEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r1, .L47
.L39:
	ldr	r2, [r1, r3, lsl #5]
	cmp	r2, #0
	lsl	r2, r3, #5
	add	r3, r3, #1
	beq	.L46
	cmp	r3, #5
	bne	.L39
	bx	lr
.L46:
	mov	r0, #1
	push	{r4, lr}
	ldr	r4, .L47+4
	ldr	r3, .L47+8
	add	r4, r4, r2
	ldr	r2, [r4, #4]
	ldr	r3, [r3]
	rsb	r2, r2, #160
	add	r3, r3, #241
	str	r3, [r4, #12]
	str	r2, [r4, #8]
	str	r0, [r4, #28]
	ldr	r1, .L47+12
	mov	lr, pc
	bx	r1
	ands	r0, r0, #1
	movne	r3, #5
	streq	r0, [r4, #16]
	strne	r3, [r4, #16]
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	enemies+28
	.word	enemies
	.word	hOff
	.word	rand
	.size	spawnEnemies, .-spawnEnemies
	.global	__aeabi_i2d
	.global	__aeabi_dadd
	.global	__aeabi_d2iz
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r6, .L61
	ldr	r7, .L61+4
	ldr	r5, .L61+8
	ldr	r2, [r6, #4]
	ldr	r3, [r7, #16]
	ldr	r1, [r5]
	add	r3, r2, r3
	sub	r3, r3, r1
	cmp	r3, #24
	movmi	r3, #1
	strmi	r3, [r7, #44]
	ldr	r3, [r0, #28]
	addmi	r2, r2, #2
	strmi	r2, [r6, #4]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #20
	bne	.L60
	ldr	r2, .L61+12
	str	r3, [r2, #48]
.L49:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L60:
	ldr	r8, .L61+12
	ldr	r3, [r8]
	ldr	r0, [r8, #20]
	ldr	r1, [r8, #16]
	ldr	r2, [r8, #4]
	asr	r3, r3, #8
	str	r3, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp]
	ldr	r9, .L61+16
	ldm	r4, {r2, r3}
	ldr	r1, [r4, #8]
	ldr	r0, [r4, #12]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L52
	ldr	r3, [r4, #28]
	str	r0, [r8, #48]
.L53:
	cmp	r3, #0
	beq	.L49
	ldr	r3, [r4, #12]
	ldr	r1, [r4]
	ldr	r2, [r5]
	add	r3, r3, r1
	sub	r3, r3, r2
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4, #28]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L52:
	mov	r2, #1
	ldr	r3, [r4, #16]
	sub	r3, r3, #5
	bics	r3, r3, #4
	str	r2, [r8, #48]
	bne	.L54
	mov	r2, #9
	ldr	r1, [r8, #16]
	ldr	r3, [r4, #12]
	sub	r3, r3, r1
	sub	r3, r3, #1
	str	r2, [r4, #16]
	ldr	r0, [r5]
	ldr	r2, .L61+20
	str	r3, [r8, #4]
	mov	lr, pc
	bx	r2
	ldr	r6, .L61+24
	mov	r2, #0
	ldr	r3, .L61+28
	mov	lr, pc
	bx	r6
	ldr	r3, .L61+32
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #28]
	str	r0, [r5]
	b	.L53
.L54:
	mov	r3, #0
	mov	r1, #67108864
	str	r3, [r4, #28]
	str	r3, [r5]
	strh	r3, [r1, #16]	@ movhi
	ldr	r3, .L61+36
	str	r2, [r8, #44]
	str	r2, [r7, #44]
	str	r2, [r6, #44]
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #28]
	b	.L53
.L62:
	.align	2
.L61:
	.word	enemy2
	.word	enemy1
	.word	hOff
	.word	player
	.word	collision
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.word	1071644672
	.word	__aeabi_d2iz
	.word	goToLoseB
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L64
	ldr	r2, .L67+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L64:
	b	drawPlayer.part.0
.L68:
	.align	2
.L67:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L79
	ldr	r1, [r3, #44]
	ldr	r2, .L79+4
	cmp	r1, #0
	push	{r4, r5, r6, lr}
	ldrh	lr, [r2]
	beq	.L70
	ldr	r3, .L79+8
	ldrh	r2, [r3, #8]
	orr	r2, r2, #512
	strh	r2, [r3, #8]	@ movhi
.L71:
	ldr	r1, .L79+12
	ldr	r2, [r1, #44]
	cmp	r2, #0
	beq	.L72
	ldrh	r2, [r3, #16]
	orr	r2, r2, #512
	strh	r2, [r3, #16]	@ movhi
.L74:
	ldr	r3, .L79+8
	ldr	r2, .L79+16
	ldr	r5, .L79+20
	ldr	r4, .L79+24
	add	ip, r3, #40
.L73:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	bne	.L75
	ldrh	r1, [r3, #24]
	orr	r1, r1, #512
	strh	r1, [r3, #24]	@ movhi
.L76:
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #32
	bne	.L73
	pop	{r4, r5, r6, lr}
	bx	lr
.L75:
	ldr	r1, [r2, #12]
	ldr	r0, [r2, #16]
	sub	r1, r1, lr
	ldrb	r6, [r2, #8]	@ zero_extendqisi2
	and	r1, r1, r5
	orr	r1, r1, r4
	add	r0, r0, #672
	strh	r1, [r3, #26]	@ movhi
	strh	r0, [r3, #28]	@ movhi
	strh	r6, [r3, #24]	@ movhi
	b	.L76
.L72:
	ldr	r2, [r1, #4]
	sub	r2, r2, lr
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	ldrb	r0, [r1]	@ zero_extendqisi2
	ldr	r1, .L79+28
	strh	r2, [r3, #18]	@ movhi
	strh	r0, [r3, #16]	@ movhi
	strh	r1, [r3, #20]	@ movhi
	b	.L74
.L70:
	ldr	r2, [r3, #4]
	sub	r2, r2, lr
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r1, .L79+32
	ldr	r3, .L79+8
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	b	.L71
.L80:
	.align	2
.L79:
	.word	enemy1
	.word	hOff
	.word	shadowOAM
	.word	enemy2
	.word	enemies
	.word	511
	.word	-32768
	.word	534
	.word	526
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L85
	ldr	r3, [r3, #44]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L82
	ldr	r2, .L85+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L83:
	bl	drawEnemies
	ldr	r3, .L85+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L85+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L85+4
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L85+16
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L82:
	bl	drawPlayer.part.0
	b	.L83
.L86:
	.align	2
.L85:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.size	drawGame, .-drawGame
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	bne	.L88
	ldr	r3, .L91
	ldrh	ip, [r3, #72]
	ldrh	r0, [r3, #80]
	ldrh	r1, [r3, #88]
	ldrh	r2, [r3, #96]
	orr	ip, ip, #512
	orr	r0, r0, #512
	orr	r1, r1, #512
	orr	r2, r2, #512
	strh	ip, [r3, #72]	@ movhi
	strh	r0, [r3, #80]	@ movhi
	strh	r1, [r3, #88]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L88:
	b	drawScore.part.0
.L92:
	.align	2
.L91:
	.word	shadowOAM
	.size	drawScore, .-drawScore
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L136
	ldr	r1, [r4]
	cmp	r1, #0
	movlt	r3, #0
	ldr	r2, [r4, #52]
	movlt	r1, r3
	strlt	r3, [r4]
	cmp	r2, #120
	ldr	r3, [r4, #20]
	sub	sp, sp, #16
	bgt	.L134
.L95:
	ldr	r0, [r4, #48]
	cmp	r0, #0
	ldreq	r0, [r4, #4]
	addeq	r0, r0, #2
	streq	r0, [r4, #4]
	cmp	r2, #29
	bgt	.L98
	cmp	r2, #14
	movle	r2, #100
	movgt	r2, #105
	str	r2, [r4, #28]
.L100:
	ldr	r2, [r4, #8]
	rsb	r3, r3, #160
	add	r1, r2, r1
	cmp	r3, r1, asr #8
	strgt	r1, [r4]
	ble	.L135
.L103:
	ldr	r3, .L136+4
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L104
	ldr	r1, .L136+8
	ldrh	r1, [r1]
	tst	r1, #64
	bne	.L104
	ldr	r1, .L136+12
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L104
	ldr	r3, [r4, #56]
	sub	r2, r2, #1696
	cmp	r3, #0
	sub	r2, r2, #4
	bne	.L105
	mov	r0, #1
	mov	lr, #114
	ldr	ip, .L136+16
	ldr	r3, [ip]
	add	r3, r3, #50
	str	r2, [r4, #8]
	str	r3, [ip]
	str	r0, [r1]
	str	lr, [r4, #28]
	bl	drawScore.part.0
	ldr	r2, [r4, #8]
.L105:
	ldr	r3, [r4, #52]
	add	r2, r2, #70
	add	r3, r3, #1
	str	r2, [r4, #8]
	str	r3, [r4, #52]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L104:
	ands	r1, r3, #1
	beq	.L106
	ldr	r0, .L136+8
	ldrh	r0, [r0]
	tst	r0, #1
	bne	.L106
	ldr	ip, .L136+12
	ldr	r0, [ip]
	cmp	r0, #0
	bne	.L106
	mov	r3, #500
	ldr	r1, [r4, #56]
	sub	r2, r2, #1696
	sub	r2, r2, #4
	cmp	r1, #0
	str	r2, [r4, #8]
	str	r3, [r4, #28]
	bne	.L105
	mov	r1, #1
	ldr	r2, .L136+16
	ldr	r3, [r2]
	mov	r0, #2
	add	r3, r3, #100
	str	r3, [r2]
	str	r1, [ip]
	bl	drawScore.part.0
	ldr	r2, [r4, #8]
	b	.L105
.L106:
	tst	r3, #2
	beq	.L108
	ldr	r3, .L136+8
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L108
	ldr	r3, .L136+12
	ldr	r0, [r3]
	cmp	r0, #0
	bne	.L109
	ldr	r0, [r4, #56]
	ldr	r1, .L136+20
	cmp	r0, #0
	str	r1, [r4, #28]
	bne	.L105
	mov	lr, #1
	ldr	ip, .L136+16
	ldr	r1, [ip]
	sub	r2, r2, #1696
	sub	r2, r2, #4
	add	r1, r1, #200
	mov	r0, #3
	str	r2, [r4, #8]
	str	r1, [ip]
	str	lr, [r3]
	bl	drawScore.part.0
	ldr	r2, [r4, #8]
	b	.L105
.L108:
	ldr	r3, .L136+24
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L105
.L110:
	ldr	r3, .L136+24
	cmp	r1, #0
	ldrh	r3, [r3, #48]
	beq	.L105
	ldr	r1, .L136+8
	ldrh	r1, [r1]
	and	r3, r3, #2
	and	r1, r1, #1
	orrs	r3, r1, r3
	streq	r3, [r4, #56]
	b	.L105
.L98:
	add	r2, r1, r3
	cmp	r2, #160
	ble	.L101
	ldr	r2, [r4, #56]
	cmp	r2, #0
	ldrne	r2, .L136+28
	strne	r2, [r4, #28]
	bne	.L100
.L101:
	ldr	r2, .L136+12
	ldr	r2, [r2]
	cmp	r2, #0
	moveq	r2, #109
	streq	r2, [r4, #28]
	b	.L100
.L135:
	mov	r0, #0
	ldr	r3, .L136+12
	str	r0, [r4, #8]
	str	r0, [r3]
	bl	drawScore
	ldr	r2, [r4, #8]
	b	.L103
.L134:
	ldr	r5, .L136+32
	add	ip, r5, #16
	ldm	r5, {r0, r2}
	ldm	ip, {ip, lr}
	ldr	r6, .L136+36
	stmib	sp, {r0, ip, lr}
	str	r2, [sp]
	ldr	r0, [r4, #4]
	ldr	r2, [r4, #16]
	asr	r1, r1, #8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L132
	mov	r6, #0
	mov	r2, #1
	ldr	r3, .L136+40
	ldr	r0, .L136+44
	str	r6, [r3, #28]
	str	r6, [r3, #60]
	str	r6, [r3, #92]
	str	r6, [r3, #124]
	str	r6, [r3, #156]
	ldr	r1, .L136+48
	str	r2, [r4, #44]
	str	r2, [r5, #44]
	str	r2, [r0, #44]
	mov	lr, pc
	bx	r1
	mov	r3, #67108864
	ldr	r2, .L136+52
	str	r6, [r2]
	strh	r6, [r3, #16]	@ movhi
.L132:
	ldr	r2, [r4, #52]
	ldr	r1, [r4]
	ldr	r3, [r4, #20]
	b	.L95
.L109:
	ldr	r3, .L136+24
	ldrh	r3, [r3, #48]
	tst	r3, #1
	moveq	r3, #1
	streq	r3, [r4, #56]
	beq	.L105
	b	.L110
.L137:
	.align	2
.L136:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	amJumping
	.word	score
	.word	505
	.word	67109120
	.word	1013
	.word	enemy2
	.word	collision
	.word	enemies
	.word	enemy1
	.word	goToLoseA
	.word	hOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L147
	bl	updatePlayer
	ldr	r3, [r4, #16]
	add	r3, r3, r3, lsr #31
	ldr	r2, [r4, #4]
	asr	r3, r3, #1
	rsb	r3, r3, #120
	cmp	r2, r3
	ble	.L138
	ldr	r0, .L147+4
	ldr	ip, .L147+8
	ldr	r5, .L147+12
	ldr	r2, [r0, #4]
	ldr	r3, [ip, #4]
	ldr	r1, [r5]
	add	r2, r2, #1
	str	r2, [r0, #4]
	add	r3, r3, #1
	add	r1, r1, #2
	ldr	r0, .L147+16
	str	r3, [ip, #4]
	str	r1, [r5]
	bl	updateEnemies
	ldr	r0, .L147+20
	bl	updateEnemies
	ldr	r0, .L147+24
	bl	updateEnemies
	ldr	r0, .L147+28
	bl	updateEnemies
	ldr	r0, .L147+32
	bl	updateEnemies
	ldr	r3, [r5]
	ldr	r2, .L147+36
	cmp	r3, r2
	ble	.L141
	ldr	r2, .L147+40
	ldr	r3, [r4, #52]
	ldr	r1, .L147+44
	mla	r3, r1, r3, r2
	cmp	r2, r3, ror #1
	bcs	.L144
.L138:
	pop	{r4, r5, r6, lr}
	bx	lr
.L141:
	cmp	r3, #1000
	bgt	.L146
	cmp	r3, #0
	ble	.L138
	ldr	r2, .L147+48
	ldr	r3, [r4, #52]
	ldr	r1, .L147+52
	mla	r3, r1, r3, r2
	cmp	r2, r3, ror #1
	bcc	.L138
.L144:
	pop	{r4, r5, r6, lr}
	b	spawnEnemies
.L146:
	ldr	r2, .L147+56
	ldr	r3, [r4, #52]
	ldr	r1, .L147+60
	mla	r3, r1, r3, r2
	cmp	r2, r3, ror #1
	bcc	.L138
	b	.L144
.L148:
	.align	2
.L147:
	.word	player
	.word	enemy1
	.word	enemy2
	.word	hOff
	.word	enemies
	.word	enemies+32
	.word	enemies+64
	.word	enemies+96
	.word	enemies+128
	.word	3000
	.word	85899344
	.word	-1030792151
	.word	39045156
	.word	1483715975
	.word	47721858
	.word	-1527099483
	.size	updateGame, .-updateGame
	.comm	score,4,4
	.comm	amJumping,4,4
	.comm	enemies,160,4
	.comm	enemy2,60,4
	.comm	enemy1,60,4
	.comm	player,60,4
	.comm	shadowOAM,1024,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
