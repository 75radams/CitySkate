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
	.file	"main.c"
	.text
	.align	2
	.global	goToSplash
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r0, #20480
	ldr	r2, .L4
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L4+4
	strh	r2, [r1, #8]	@ movhi
	strh	r0, [r1, #10]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #12160
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L4+24
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+44
	ldr	r1, .L4+48
	ldr	r5, .L4+52
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+56
	ldr	r1, .L4+60
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r6, .L4+64
	ldr	r3, .L4+68
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r6
	mov	r1, r5
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #448
	mov	r2, #456
	ldr	ip, .L4+72
	ldr	r3, .L4+76
	ldr	r1, .L4+80
	strh	ip, [r5, #2]	@ movhi
	strh	r0, [r5, #4]	@ movhi
	strh	r1, [r5, #10]	@ movhi
	strh	r2, [r5, #12]	@ movhi
	strh	r3, [r5]	@ movhi
	strh	r3, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r1, r5
	mov	r2, #117440512
	mov	r0, #3
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+88
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+92
	ldr	r3, .L4+96
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L4+100
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	23556
	.word	DMANow
	.word	background1Pal
	.word	background2Tiles
	.word	100696064
	.word	background2Map
	.word	24672
	.word	100679680
	.word	background1Tiles
	.word	100720640
	.word	background1Map
	.word	83886592
	.word	spritesheetPal
	.word	shadowOAM
	.word	100728832
	.word	spritesheetTiles
	.word	waitForVBlank
	.word	hideSprites
	.word	-16328
	.word	16448
	.word	-16264
	.word	stopSound
	.word	splashSound_length
	.word	splashSound_data
	.word	playSoundA
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #67108864
	mov	lr, #4864
	mov	r0, #20480
	mov	r1, #456
	mov	r2, #448
	ldr	ip, .L8
	strh	lr, [r3]	@ movhi
	ldr	r4, .L8+4
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	ldr	ip, .L8+8
	ldr	r3, .L8+12
	ldr	r0, .L8+16
	strh	ip, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	strh	r0, [r4, #10]	@ movhi
	strh	r1, [r4, #12]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	ldr	r2, .L8+20
	mov	lr, pc
	bx	r2
	mov	r0, #3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L8+24
	mov	lr, pc
	bx	r4
	mov	r1, #0
	ldr	r2, .L8+28
	ldr	r3, .L8+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+36
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r3, .L8+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	23556
	.word	shadowOAM
	.word	-16328
	.word	16448
	.word	-16264
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	setupSounds
	.word	setupInterrupts
	.word	initGame
	.size	initialize, .-initialize
	.align	2
	.global	goToInstr
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstr, %function
goToInstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r3, #8256
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	alleyPal
	.word	alleyTiles
	.word	100720640
	.word	alleyMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToInstr, .-goToInstr
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L16
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	mov	r3, #23552
	mov	r1, #4352
	ldr	r4, .L16+4
	strh	r3, [r2, #8]	@ movhi
	mov	r0, #3
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+12
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L16+20
	ldr	r1, .L16+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L16+28
	ldr	r1, .L16+32
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L16+36
	ldr	r1, .L16+40
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+44
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L16+48
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L16+52
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	DMANow
	.word	cityStreetPal
	.word	22816
	.word	cityStreetTiles
	.word	100720640
	.word	cityStreetMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_d2uiz
	.align	2
	.global	splashState
	.syntax unified
	.arm
	.fpu softvfp
	.type	splashState, %function
splashState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #60
	mov	lr, #448
	mov	r1, #128
	mov	r2, #456
	ldr	r5, .L34
	ldr	r3, [r5]
	add	r3, r3, #1
	ldr	r4, .L34+4
	str	r3, [r5]
	ldr	r0, .L34+8
	ldr	r3, .L34+12
	strh	r0, [r4, #2]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	ldr	r0, .L34+16
	ldr	r3, .L34+20
	strh	lr, [r4, #4]	@ movhi
	strh	r2, [r4, #12]	@ movhi
	strh	ip, [r4, #16]	@ movhi
	strh	r0, [r4, #18]	@ movhi
	strh	r1, [r4, #20]	@ movhi
	strh	r3, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	ldr	r2, .L34+24
	mov	lr, pc
	bx	r2
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L34+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L19
	ldr	r2, .L34+36
	ldrh	r0, [r2]
	ands	r4, r0, #4
	beq	.L32
.L19:
	tst	r3, #8
	beq	.L21
	ldr	r2, .L34+36
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L33
.L21:
	tst	r3, #512
	bne	.L22
.L31:
	ldr	r0, [r5]
	ldr	r3, .L34+40
	lsl	r4, r0, #16
	ldr	r5, .L34+44
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L34+48
	mov	lr, pc
	bx	r5
	ldr	r3, .L34+52
	mov	lr, pc
	bx	r3
	lsl	r0, r0, #16
	lsr	r4, r4, #16
	lsr	r0, r0, #16
.L20:
	mov	r3, #67108864
	strh	r4, [r3, #16]	@ movhi
	strh	r0, [r3, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	ldr	r3, .L34+36
	ldrh	r3, [r3]
	tst	r3, #512
	bne	.L31
	mov	r0, #1
	ldr	r3, .L34+56
	mov	lr, pc
	bx	r3
	b	.L31
.L32:
	ldr	r3, .L34+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+64
	ldr	r0, .L34+68
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r3, .L34+72
	mov	lr, pc
	bx	r3
	bl	goToInstr
	mov	r3, #67108864
	str	r4, [r5]
	mov	r0, r4
	strh	r4, [r3, #16]	@ movhi
	b	.L20
.L33:
	ldr	r3, .L34+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+76
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L34+80
	ldr	r3, .L34+72
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L34+84
	mov	lr, pc
	bx	r3
	b	.L31
.L35:
	.align	2
.L34:
	.word	hOff
	.word	shadowOAM
	.word	-16344
	.word	-16280
	.word	-32603
	.word	16448
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	1071644672
	.word	__aeabi_d2uiz
	.word	muteSound
	.word	stopSound
	.word	pauseSound_length
	.word	pauseSound_data
	.word	playSoundA
	.word	gameSound_length
	.word	gameSound_data
	.word	initGame
	.size	splashState, .-splashState
	.align	2
	.global	instrState
	.syntax unified
	.arm
	.fpu softvfp
	.type	instrState, %function
instrState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L53
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
	ldr	r2, .L53+8
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L50
.L37:
	tst	r3, #8
	beq	.L38
	ldr	r2, .L53+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L51
.L38:
	tst	r3, #512
	beq	.L36
	ldr	r3, .L53+8
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L52
.L36:
	pop	{r4, lr}
	bx	lr
.L50:
	pop	{r4, lr}
	b	goToSplash
.L51:
	ldr	r3, .L53+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L53+20
	ldr	r3, .L53+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L53+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L52:
	mov	r0, #1
	ldr	r3, .L53+32
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	gameSound_length
	.word	gameSound_data
	.word	playSoundA
	.word	initGame
	.word	muteSound
	.size	instrState, .-instrState
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L57
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L57+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L57+8
	ldr	r1, .L57+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L57+16
	ldr	r1, .L57+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L57+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L57+32
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L57+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L58:
	.align	2
.L57:
	.word	DMANow
	.word	pauseScreenPal
	.word	5968
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
	ldr	r2, .L71+16
	ldrh	r2, [r2]
	ands	r4, r2, #8
	beq	.L69
.L60:
	tst	r3, #512
	beq	.L59
	ldr	r3, .L71+16
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L70
.L59:
	pop	{r4, lr}
	bx	lr
.L69:
	ldr	r3, .L71+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+24
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L71+28
	ldr	r3, .L71+32
	mov	lr, pc
	bx	r3
	bl	goToPause
	mov	r2, #67108864
	ldr	r3, .L71+36
	ldr	r1, .L71+40
	ldr	r0, [r3]
	str	r4, [r3]
	str	r0, [r1]
	strh	r4, [r2, #16]	@ movhi
	pop	{r4, lr}
	bx	lr
.L70:
	mov	r0, #1
	ldr	r3, .L71+44
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	pauseGameSound
	.word	instrSound_length
	.word	instrSound_data
	.word	playSoundB
	.word	hOff
	.word	tempHOff
	.word	muteSound
	.size	gameState, .-gameState
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L90
	mov	lr, pc
	bx	r5
	ldr	r4, .L90+4
	ldr	r3, .L90+8
	ldr	r2, .L90+12
	strh	r3, [r4]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	strh	r3, [r4, #2]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L90+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L90+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L74
	ldr	r2, .L90+24
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L87
.L74:
	tst	r3, #8
	beq	.L75
	ldr	r2, .L90+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L88
.L75:
	tst	r3, #512
	beq	.L73
	ldr	r3, .L90+24
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L89
.L73:
	pop	{r4, r5, r6, lr}
	bx	lr
.L87:
	pop	{r4, r5, r6, lr}
	b	goToSplash
.L88:
	ldr	r3, .L90+28
	mov	lr, pc
	bx	r3
	bl	goToGame
	mov	r1, #67108864
	ldr	r3, .L90+32
	ldr	r2, [r3]
	ldr	r0, .L90+36
	lsl	r3, r2, #16
	lsr	r3, r3, #16
	str	r2, [r0]
	pop	{r4, r5, r6, lr}
	strh	r3, [r1, #16]	@ movhi
	bx	lr
.L89:
	mov	r0, #2
	ldr	r3, .L90+40
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	waitForVBlank
	.word	shadowOAM
	.word	-32698
	.word	293
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	unpauseGameSound
	.word	tempHOff
	.word	hOff
	.word	muteSound
	.size	pauseState, .-pauseState
	.align	2
	.global	goToLoseA
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLoseA, %function
goToLoseA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L94
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L94+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L94+8
	ldr	r1, .L94+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L94+16
	ldr	r1, .L94+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L94+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+28
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L94+32
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L94+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L94+44
	ldr	r3, .L94+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+52
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L94+56
	ldr	r3, .L94+60
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L94+64
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L95:
	.align	2
.L94:
	.word	DMANow
	.word	losePal
	.word	7264
	.word	loseTiles
	.word	100720640
	.word	loseMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	stopSound
	.word	loseSound_length
	.word	loseSound_data
	.word	playSoundA
	.word	explosion_length
	.word	explosion_data
	.word	playSoundB
	.word	state
	.size	goToLoseA, .-goToLoseA
	.align	2
	.global	loseAState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseAState, %function
loseAState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L108
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L108+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L97
	ldr	r2, .L108+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L106
.L97:
	tst	r3, #512
	beq	.L96
	ldr	r3, .L108+8
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L107
.L96:
	pop	{r4, lr}
	bx	lr
.L106:
	pop	{r4, lr}
	b	goToSplash
.L107:
	mov	r0, #1
	ldr	r3, .L108+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L109:
	.align	2
.L108:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	muteSound
	.size	loseAState, .-loseAState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L122
	mov	lr, pc
	bx	r3
	ldr	r6, .L122+4
	ldr	r8, .L122+8
	ldr	r5, .L122+12
	ldr	fp, .L122+16
	ldr	r10, .L122+20
	ldr	r9, .L122+24
	ldr	r7, .L122+28
	ldr	r4, .L122+32
.L111:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L112:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L112
.L114:
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L115
	.word	.L113
	.word	.L113
.L113:
	mov	lr, pc
	bx	r7
	b	.L111
.L115:
	ldr	r3, .L122+36
	mov	lr, pc
	bx	r3
	b	.L111
.L116:
	mov	lr, pc
	bx	r9
	b	.L111
.L117:
	mov	lr, pc
	bx	r10
	b	.L111
.L118:
	mov	lr, pc
	bx	fp
	b	.L111
.L123:
	.align	2
.L122:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	splashState
	.word	instrState
	.word	gameState
	.word	loseAState
	.word	67109120
	.word	pauseState
	.size	main, .-main
	.text
	.align	2
	.global	goToLoseB
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLoseB, %function
goToLoseB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L126
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L126+4
	mov	lr, pc
	bx	r4
	mov	r3, #6080
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L126+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L126+12
	ldr	r1, .L126+16
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L126+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+24
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L126+28
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L126+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+36
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L126+40
	ldr	r3, .L126+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L126+52
	ldr	r3, .L126+56
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L126+60
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L127:
	.align	2
.L126:
	.word	DMANow
	.word	loseBPal
	.word	loseBTiles
	.word	100720640
	.word	loseBMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	stopSound
	.word	loseSound_length
	.word	loseSound_data
	.word	playSoundA
	.word	explosion_length
	.word	explosion_data
	.word	playSoundB
	.word	state
	.size	goToLoseB, .-goToLoseB
	.align	2
	.global	loseBState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseBState, %function
loseBState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	loseAState
	.size	loseBState, .-loseBState
	.comm	tempHOff,4,4
	.comm	hOff,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
