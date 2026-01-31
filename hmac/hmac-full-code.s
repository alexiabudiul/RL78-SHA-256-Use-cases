	.text
	.file	"hmac-full-code.c"
	.globl	_sha256_init                    ; -- Begin function sha256_init
	.type	_sha256_init,@function
_sha256_init:                           ; @sha256_init
; %bb.0:
	mov !LOWW(_g_sha_state), #106
	mov !LOWW(_g_sha_state+1), #9
	mov !LOWW(_g_sha_state+2), #-26
	mov !LOWW(_g_sha_state+3), #103
	mov !LOWW(_g_sha_state+4), #-69
	mov !LOWW(_g_sha_state+5), #103
	mov !LOWW(_g_sha_state+6), #-82
	mov !LOWW(_g_sha_state+7), #-123
	mov !LOWW(_g_sha_state+8), #60
	mov !LOWW(_g_sha_state+9), #110
	mov !LOWW(_g_sha_state+10), #-13
	mov !LOWW(_g_sha_state+11), #114
	mov !LOWW(_g_sha_state+12), #-91
	mov !LOWW(_g_sha_state+13), #79
	mov !LOWW(_g_sha_state+14), #-11
	mov !LOWW(_g_sha_state+15), #58
	mov !LOWW(_g_sha_state+16), #81
	mov !LOWW(_g_sha_state+17), #14
	mov !LOWW(_g_sha_state+18), #82
	mov !LOWW(_g_sha_state+19), #127
	mov !LOWW(_g_sha_state+20), #-101
	mov !LOWW(_g_sha_state+21), #5
	mov !LOWW(_g_sha_state+22), #104
	mov !LOWW(_g_sha_state+23), #-116
	mov !LOWW(_g_sha_state+24), #31
	mov !LOWW(_g_sha_state+25), #-125
	mov !LOWW(_g_sha_state+26), #-39
	mov !LOWW(_g_sha_state+27), #-85
	mov !LOWW(_g_sha_state+28), #91
	mov !LOWW(_g_sha_state+29), #-32
	mov !LOWW(_g_sha_state+30), #-51
	mov !LOWW(_g_sha_state+31), #25
	clrw ax
	movw !LOWW(_g_sha_bitcount+6), ax
	movw !LOWW(_g_sha_bitcount+4), ax
	movw !LOWW(_g_sha_bitcount+2), ax
	movw !LOWW(_g_sha_bitcount), ax
	clrb !LOWW(_g_sha_buffer)
	clrb !LOWW(_g_sha_buffer+1)
	clrb !LOWW(_g_sha_buffer+2)
	clrb !LOWW(_g_sha_buffer+3)
	clrb !LOWW(_g_sha_buffer+4)
	clrb !LOWW(_g_sha_buffer+5)
	clrb !LOWW(_g_sha_buffer+6)
	clrb !LOWW(_g_sha_buffer+7)
	clrb !LOWW(_g_sha_buffer+8)
	clrb !LOWW(_g_sha_buffer+9)
	clrb !LOWW(_g_sha_buffer+10)
	clrb !LOWW(_g_sha_buffer+11)
	clrb !LOWW(_g_sha_buffer+12)
	clrb !LOWW(_g_sha_buffer+13)
	clrb !LOWW(_g_sha_buffer+14)
	clrb !LOWW(_g_sha_buffer+15)
	clrb !LOWW(_g_sha_buffer+16)
	clrb !LOWW(_g_sha_buffer+17)
	clrb !LOWW(_g_sha_buffer+18)
	clrb !LOWW(_g_sha_buffer+19)
	clrb !LOWW(_g_sha_buffer+20)
	clrb !LOWW(_g_sha_buffer+21)
	clrb !LOWW(_g_sha_buffer+22)
	clrb !LOWW(_g_sha_buffer+23)
	clrb !LOWW(_g_sha_buffer+24)
	clrb !LOWW(_g_sha_buffer+25)
	clrb !LOWW(_g_sha_buffer+26)
	clrb !LOWW(_g_sha_buffer+27)
	clrb !LOWW(_g_sha_buffer+28)
	clrb !LOWW(_g_sha_buffer+29)
	clrb !LOWW(_g_sha_buffer+30)
	clrb !LOWW(_g_sha_buffer+31)
	clrb !LOWW(_g_sha_buffer+32)
	clrb !LOWW(_g_sha_buffer+33)
	clrb !LOWW(_g_sha_buffer+34)
	clrb !LOWW(_g_sha_buffer+35)
	clrb !LOWW(_g_sha_buffer+36)
	clrb !LOWW(_g_sha_buffer+37)
	clrb !LOWW(_g_sha_buffer+38)
	clrb !LOWW(_g_sha_buffer+39)
	clrb !LOWW(_g_sha_buffer+40)
	clrb !LOWW(_g_sha_buffer+41)
	clrb !LOWW(_g_sha_buffer+42)
	clrb !LOWW(_g_sha_buffer+43)
	clrb !LOWW(_g_sha_buffer+44)
	clrb !LOWW(_g_sha_buffer+45)
	clrb !LOWW(_g_sha_buffer+46)
	clrb !LOWW(_g_sha_buffer+47)
	clrb !LOWW(_g_sha_buffer+48)
	clrb !LOWW(_g_sha_buffer+49)
	clrb !LOWW(_g_sha_buffer+50)
	clrb !LOWW(_g_sha_buffer+51)
	clrb !LOWW(_g_sha_buffer+52)
	clrb !LOWW(_g_sha_buffer+53)
	clrb !LOWW(_g_sha_buffer+54)
	clrb !LOWW(_g_sha_buffer+55)
	clrb !LOWW(_g_sha_buffer+56)
	clrb !LOWW(_g_sha_buffer+57)
	clrb !LOWW(_g_sha_buffer+58)
	clrb !LOWW(_g_sha_buffer+59)
	clrb !LOWW(_g_sha_buffer+60)
	clrb !LOWW(_g_sha_buffer+61)
	clrb !LOWW(_g_sha_buffer+62)
	clrb !LOWW(_g_sha_buffer+63)
	mov a, !LOWW(_g_sha_state)
	set1 !LOWW(_g_sha_state).4
	clr1 !LOWW(_g_sha_state).4
	mov !LOWW(_g_sha_state), a
	ret
.Lfunc_end0:
	.size	_sha256_init, .Lfunc_end0-_sha256_init
                                        ; -- End function
	.globl	_sha256_update                  ; -- Begin function sha256_update
	.type	_sha256_update,@function
_sha256_update:                         ; @sha256_update
; %bb.0:
	subw sp, #18
	movw [sp+2], ax
	movw de, !LOWW(_g_sha_bitcount)
	movw ax, bc
	shlw ax, 3
	movw [sp+10], ax
	xchw ax, bc
	movw [sp+4], ax
	xchw ax, bc
	movw hl, !LOWW(_g_sha_bitcount+2)
	movw ax, bc
	shrw ax, 13
	movw bc, ax
	movw ax, !LOWW(_g_sha_bitcount+4)
	movw [sp+6], ax
	movw ax, !LOWW(_g_sha_bitcount+6)
	movw [sp+8], ax
	xchw ax, de
	movw [sp+0], ax
	xchw ax, de
	movw ax, de
	xchw ax, de
	movw ax, [sp+10]
	xchw ax, de
	addw ax, de
	movw de, ax
	movw ax, hl
	xch a, x
	addc a, c
	xch a, x
	addc a, b
	xchw ax, bc
	movw ax, [sp+8]
	xchw ax, bc
	movw hl, ax
	movw ax, [sp+6]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	addc a, #0
	xch a, x
	addc a, #0
	sknc ;#.LBB2_2
; %bb.1:
	incw bc
.LBB2_2:
	movw !LOWW(_g_sha_bitcount+4), ax
	movw ax, bc
	movw !LOWW(_g_sha_bitcount+6), ax
	movw ax, de
	movw !LOWW(_g_sha_bitcount), ax
	movw ax, hl
	movw !LOWW(_g_sha_bitcount+2), ax
	movw ax, [sp+0]
	shrw ax, 3
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #63
	xch a, x
	clrb a
	movw de, ax
	cmpw ax, #0
	bz $.LBB2_3
; %bb.4:
	movw ax, [sp+4]
	movw hl, ax
	xchw ax, de
	movw [sp+16], ax
	xchw ax, de
	movw ax, #64
	subw ax, de
	cmpw ax, hl
	bnh $.LBB2_13
; %bb.5:
	movw ax, [sp+2]
	movw de, ax
	movw ax, hl
	cmpw ax, #0
	sknz ;#.LBB2_32
	br $!.LBB2_32
; %bb.6:
	movw ax, hl
	cmpw ax, #8
	skc ;#.LBB2_8
	br $!.LBB2_8
; %bb.7:
	movw de, #0
	br $!.LBB2_10
.LBB2_3:
	movw ax, [sp+2]
	movw de, ax
	movw ax, [sp+4]
	movw bc, ax
	movw hl, #0
	movw ax, hl
	addw ax, #63
	cmpw ax, bc
	sknc ;#.LBB2_23
	br $!.LBB2_23
	br $!.LBB2_22
.LBB2_13:
	movw [sp+0], ax
	movw ax, de
	xch a, x
	xor a, #63
	xch a, x
	cmpw ax, #7
	bnc $.LBB2_15
; %bb.14:
	movw de, #0
	br $.LBB2_17
.LBB2_15:
	movw bc, #LOWW(_g_sha_buffer+3)
	movw ax, de
	movw de, #0
	addw ax, bc
	movw [sp+10], ax
	movw ax, [sp+2]
	addw ax, #3
	movw [sp+12], ax
	movw ax, [sp+0]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #120
	xch a, x
	clrb a
	movw [sp+14], ax
.LBB2_16:                               ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+12]
	addw ax, de
	movw bc, ax
	addw ax, #-3
	push de
	pop hl
	xchw ax, hl
	movw [sp+6], ax
	xchw ax, hl
	movw de, ax
	mov a, [de]
	mov [sp+8], a
	movw ax, [sp+10]
	addw ax, hl
	movw de, ax
	addw ax, #-3
	movw hl, ax
	mov a, [sp+8]
	mov [hl], a
	movw ax, bc
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov [sp+8], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [sp+8]
	mov [hl], a
	push bc
	pop hl
	decw hl
	mov a, [hl]
	push de
	pop hl
	decw hl
	mov [hl], a
	push bc
	pop hl
	mov a, [hl]
	mov [de], a
	mov a, [hl+1]
	mov [de+1], a
	mov a, [hl+2]
	mov [de+2], a
	mov a, [hl+3]
	mov [de+3], a
	mov a, [hl+4]
	mov [de+4], a
	movw ax, [sp+6]
	addw ax, #8
	movw de, ax
	movw ax, [sp+14]
	cmpw ax, de
	bnz $.LBB2_16
.LBB2_17:
	movw ax, [sp+0]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	bz $.LBB2_20
; %bb.18:
	movw ax, [sp+2]
	addw ax, de
	movw hl, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+16]
	xchw ax, de
	addw ax, de
	movw de, #LOWW(_g_sha_buffer)
	addw ax, de
	movw de, ax
.LBB2_19:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB2_19
.LBB2_20:
	movw ax, #LOWW(_g_sha_buffer)
	call !_sha256_transform
	movw ax, [sp+2]
	movw de, ax
	movw ax, [sp+4]
	movw bc, ax
	movw ax, [sp+0]
	movw hl, ax
	movw ax, hl
	addw ax, #63
	cmpw ax, bc
	bnc $.LBB2_22
.LBB2_23:                               ; =>This Inner Loop Header: Depth=1
	xchw ax, hl
	movw [sp+0], ax
	xchw ax, hl
	movw ax, de
	addw ax, hl
	call !_sha256_transform
	movw ax, [sp+2]
	movw de, ax
	movw ax, [sp+0]
	movw bc, ax
	movw ax, bc
	addw ax, #64
	movw hl, ax
	movw ax, bc
	xchw ax, bc
	movw ax, [sp+4]
	xchw ax, bc
	xchw ax, hl
	movw [sp+0], ax
	xchw ax, hl
	addw ax, #127
	cmpw ax, bc
	bc $.LBB2_23
; %bb.24:
	movw ax, [sp+0]
	movw hl, ax
	movw ax, bc
	cmpw ax, hl
	bh $.LBB2_25
	br $!.LBB2_32
.LBB2_22:
	movw ax, hl
	movw [sp+0], ax
	movw ax, [sp+0]
	movw hl, ax
	movw ax, bc
	cmpw ax, hl
	skh ;#.LBB2_32
	br $!.LBB2_32
.LBB2_25:
	movw ax, bc
	xchw ax, bc
	movw ax, [sp+0]
	xchw ax, bc
	subw ax, bc
	movw hl, ax
	xchw ax, hl
	movw [sp+8], ax
	xchw ax, hl
	decw ax
	cmpw ax, #7
	movw ax, bc
	bnc $.LBB2_27
; %bb.26:
	movw de, #0
	br $.LBB2_29
.LBB2_27:
	addw ax, de
	movw bc, ax
	movw de, #0
	movw ax, hl
	xch a, x
	and a, #248
	xch a, x
	movw [sp+4], ax
	movw ax, bc
	addw ax, #3
	movw [sp+6], ax
.LBB2_28:                               ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+6]
	addw ax, de
	push de
	pop bc
	movw de, ax
	addw ax, #-3
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer)[bc], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer+1)[bc], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+2)[bc], a
	push de
	pop hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+3)[bc], a
	mov a, [hl+1]
	mov LOWW(_g_sha_buffer+4)[bc], a
	mov a, [hl+2]
	mov LOWW(_g_sha_buffer+5)[bc], a
	mov a, [hl+3]
	mov LOWW(_g_sha_buffer+6)[bc], a
	mov a, [hl+4]
	mov LOWW(_g_sha_buffer+7)[bc], a
	movw ax, bc
	addw ax, #8
	movw de, ax
	movw ax, [sp+4]
	cmpw ax, de
	bnz $.LBB2_28
.LBB2_29:
	movw ax, [sp+8]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	movw ax, [sp+2]
	movw ax, [sp+0]
	movw hl, ax
	sknz ;#.LBB2_32
	br $!.LBB2_32
; %bb.30:
	movw ax, hl
	movw [sp+0], ax
	push de
	pop hl
	movw de, #LOWW(_g_sha_buffer)
	movw ax, hl
	addw ax, de
	movw de, ax
	movw ax, [sp+0]
	addw ax, hl
	xchw ax, hl
	movw ax, [sp+2]
	xchw ax, hl
	addw ax, hl
	movw hl, ax
.LBB2_31:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB2_31
	br $!.LBB2_32
.LBB2_8:
	movw bc, #LOWW(_g_sha_buffer+3)
	movw ax, [sp+16]
	addw ax, bc
	clrw bc
	movw [sp+8], ax
	movw ax, de
	push bc
	pop de
	addw ax, #3
	movw [sp+10], ax
	movw ax, hl
	xch a, x
	and a, #248
	xch a, x
	movw [sp+12], ax
.LBB2_9:                                ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+10]
	addw ax, de
	movw bc, ax
	addw ax, #-3
	push de
	pop hl
	xchw ax, hl
	movw [sp+0], ax
	xchw ax, hl
	movw de, ax
	mov a, [de]
	mov [sp+6], a
	movw ax, [sp+8]
	addw ax, hl
	movw de, ax
	addw ax, #-3
	movw hl, ax
	mov a, [sp+6]
	mov [hl], a
	movw ax, bc
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov [sp+6], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [sp+6]
	mov [hl], a
	push bc
	pop hl
	decw hl
	mov a, [hl]
	push de
	pop hl
	decw hl
	mov [hl], a
	push bc
	pop hl
	mov a, [hl]
	mov [de], a
	mov a, [hl+1]
	mov [de+1], a
	mov a, [hl+2]
	mov [de+2], a
	mov a, [hl+3]
	mov [de+3], a
	mov a, [hl+4]
	mov [de+4], a
	movw ax, [sp+0]
	addw ax, #8
	movw de, ax
	movw ax, [sp+12]
	cmpw ax, de
	bnz $.LBB2_9
.LBB2_10:
	movw ax, [sp+4]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	movw ax, [sp+2]
	bz $.LBB2_32
; %bb.11:
	addw ax, de
	movw hl, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+16]
	xchw ax, de
	addw ax, de
	movw de, #LOWW(_g_sha_buffer)
	addw ax, de
	movw de, ax
.LBB2_12:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB2_12
.LBB2_32:
	addw sp, #18
	ret
.Lfunc_end1:
	.size	_sha256_update, .Lfunc_end1-_sha256_update
                                        ; -- End function
	.type	_sha256_transform,@function     ; -- Begin function sha256_transform
_sha256_transform:                      ; @sha256_transform
; %bb.0:
	subw sp, #254
	subw sp, #52
	movw de, #0
	clrb c
	movw [sp+10], ax
.LBB1_1:                                ; =>This Inner Loop Header: Depth=1
	xchw ax, de
	movw [sp+0], ax
	xchw ax, de
	movw ax, [sp+10]
	addw ax, de
	movw hl, ax
	mov a, [hl]
	mov b, a
	mov a, [hl+1]
	shrw ax, 8
	addw ax, bc
	movw [sp+8], ax
	movw ax, sp
	addw ax, #32
	addw ax, de
	movw de, ax
	movw ax, [sp+8]
	movw [de+2], ax
	mov a, [hl+2]
	mov b, a
	mov a, [hl+3]
	mov l, a
	clrb a
	mov h, a
	movw ax, bc
	addw ax, hl
	movw [de], ax
	movw ax, [sp+0]
	addw ax, #4
	movw de, ax
	cmpw ax, #64
	bnz $.LBB1_1
; %bb.2:
	push ax
	movw ax, bc
	movw bc, sp
	movw 298[bc], ax
	movw bc, ax
	pop ax
	clrw bc
	movw ax, [sp+34]
	movw [sp+0], ax
	movw ax, [sp+32]
	movw [sp+10], ax
.LBB1_3:                                ; =>This Inner Loop Header: Depth=1
	xchw ax, bc
	movw [sp+16], ax
	xchw ax, bc
	movw ax, sp
	addw ax, #32
	addw ax, bc
	movw bc, ax
	push bc
	pop hl
	movw ax, bc
	movw [sp+8], ax
	movw ax, [hl+58]
	movw [sp+18], ax
	shrw ax, 3
	movw de, ax
	movw ax, [hl+56]
	movw hl, ax
	shlw ax, 13
	addw ax, de
	movw [sp+14], ax
	movw ax, [sp+18]
	movw bc, ax
	movw ax, bc
	shrw ax, 1
	movw [sp+2], ax
	movw ax, [sp+2]
	movw de, ax
	movw ax, hl
	shlw ax, 15
	addw ax, de
	xchw ax, de
	movw ax, [sp+14]
	xchw ax, de
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, d
	xch a, x
	xor a, e
	xch a, x
	movw [sp+2], ax
	movw ax, bc
	shlw ax, 6
	movw de, ax
	movw ax, hl
	shrw ax, 10
	addw ax, de
	movw de, ax
	movw ax, [sp+2]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, d
	xch a, x
	xor a, e
	xch a, x
	movw [sp+2], ax
	movw ax, hl
	shrw ax, 3
	movw de, ax
	movw ax, bc
	shlw ax, 13
	addw ax, de
	movw de, ax
	movw ax, hl
	shrw ax, 1
	movw hl, ax
	movw ax, bc
	shlw ax, 15
	addw ax, hl
	xchw ax, hl
	movw ax, [sp+8]
	xchw ax, hl
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, d
	xch a, x
	xor a, e
	xch a, x
	movw de, ax
	movw ax, bc
	shrw ax, 10
	movw bc, ax
	movw ax, de
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw bc, ax
	movw ax, [sp+2]
	addw ax, [hl+36]
	movw de, ax
	movw ax, bc
	xch a, x
	push hl
	pop bc
	push hl
	push bc
	pop hl
	addc a, [hl+38]
	push hl
	pop bc
	pop hl
	xch a, x
	push hl
	push bc
	pop hl
	addc a, [hl+39]
	push hl
	pop bc
	pop hl
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+10]
	xchw ax, de
	addw ax, de
	movw [sp+2], ax
	movw ax, bc
	xchw ax, bc
	movw ax, [sp+0]
	xchw ax, bc
	sknc
	incw ax
	addw ax, bc
	movw [sp+18], ax
	movw ax, [hl+6]
	movw [sp+0], ax
	shrw ax, 2
	movw bc, ax
	movw ax, [hl+4]
	movw de, ax
	shlw ax, 14
	addw ax, bc
	movw [sp+14], ax
	movw ax, de
	shrw ax, 7
	movw [sp+10], ax
	movw ax, [sp+0]
	movw bc, ax
	movw ax, [sp+10]
	movw hl, ax
	movw ax, bc
	shlw ax, 9
	addw ax, hl
	xchw ax, hl
	movw ax, [sp+14]
	xchw ax, hl
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, h
	xch a, x
	xor a, l
	xch a, x
	movw hl, ax
	shlw bc, 13
	movw ax, de
	shrw ax, 3
	addw ax, bc
	movw bc, ax
	movw ax, hl
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw [sp+14], ax
	movw ax, [sp+0]
	movw hl, ax
	xchw ax, de
	movw [sp+10], ax
	xchw ax, de
	movw ax, de
	shrw ax, 2
	movw bc, ax
	movw ax, hl
	shlw ax, 14
	addw ax, bc
	movw bc, ax
	movw ax, hl
	shrw ax, 7
	movw hl, ax
	movw ax, de
	shlw ax, 9
	addw ax, hl
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw hl, ax
	movw ax, [sp+0]
	shrw ax, 3
	movw bc, ax
	movw ax, hl
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw bc, ax
	movw ax, [sp+2]
	xchw ax, de
	movw ax, [sp+14]
	xchw ax, de
	addw ax, de
	movw de, ax
	movw ax, [sp+18]
	sknc
	incw ax
	addw ax, bc
	xchw ax, hl
	movw ax, [sp+8]
	xchw ax, hl
	movw [hl+66], ax
	movw ax, de
	movw [hl+64], ax
	movw ax, [sp+16]
	addw ax, #4
	movw bc, ax
	cmpw ax, #192
	skz ;#.LBB1_3
	br $!.LBB1_3
; %bb.4:
	push ax
	movw bc, sp
	movw ax, 298[bc]
	movw bc, ax
	pop ax
	mov b, !LOWW(_g_sha_state)
	mov x, !LOWW(_g_sha_state+1)
	clrb a
	addw ax, bc
	movw [sp+12], ax
	mov b, !LOWW(_g_sha_state+2)
	mov a, !LOWW(_g_sha_state+3)
	mov e, a
	clrb a
	mov d, a
	movw ax, bc
	addw ax, de
	movw [sp+22], ax
	mov b, !LOWW(_g_sha_state+4)
	mov x, !LOWW(_g_sha_state+5)
	clrb a
	addw ax, bc
	movw [sp+10], ax
	mov b, !LOWW(_g_sha_state+6)
	mov a, !LOWW(_g_sha_state+7)
	mov e, a
	clrb a
	mov d, a
	movw ax, bc
	addw ax, de
	movw [sp+0], ax
	mov b, !LOWW(_g_sha_state+8)
	mov x, !LOWW(_g_sha_state+9)
	clrb a
	addw ax, bc
	movw [sp+18], ax
	mov b, !LOWW(_g_sha_state+10)
	mov a, !LOWW(_g_sha_state+11)
	mov e, a
	clrb a
	mov d, a
	movw ax, bc
	addw ax, de
	movw [sp+14], ax
	mov b, !LOWW(_g_sha_state+12)
	mov x, !LOWW(_g_sha_state+13)
	clrb a
	addw ax, bc
	push bc
	movw bc, sp
	movw 300[bc], ax
	pop bc
	mov b, !LOWW(_g_sha_state+14)
	mov a, !LOWW(_g_sha_state+15)
	mov e, a
	clrb a
	mov d, a
	movw ax, bc
	addw ax, de
	push bc
	movw bc, sp
	movw 302[bc], ax
	pop bc
	mov b, !LOWW(_g_sha_state+16)
	mov x, !LOWW(_g_sha_state+17)
	clrb a
	addw ax, bc
	movw [sp+4], ax
	mov b, !LOWW(_g_sha_state+18)
	mov a, !LOWW(_g_sha_state+19)
	mov e, a
	clrb a
	mov d, a
	movw ax, bc
	addw ax, de
	movw [sp+6], ax
	mov b, !LOWW(_g_sha_state+20)
	mov x, !LOWW(_g_sha_state+21)
	clrb a
	addw ax, bc
	push bc
	movw bc, sp
	movw 290[bc], ax
	pop bc
	xch a, h
	mov a, !LOWW(_g_sha_state+22)
	xch a, h
	mov x, !LOWW(_g_sha_state+23)
	movw [sp+30], ax
	mov a, !LOWW(_g_sha_state+24)
	mov x, !LOWW(_g_sha_state+25)
	movw [sp+26], ax
	mov b, !LOWW(_g_sha_state+26)
	xch a, x
	mov a, c
	xch a, x
	movw [sp+24], ax
	mov x, !LOWW(_g_sha_state+27)
	movw [sp+2], ax
	xch a, d
	mov a, !LOWW(_g_sha_state+28)
	xch a, d
	mov x, !LOWW(_g_sha_state+29)
	movw [sp+16], ax
	mov a, !LOWW(_g_sha_state+30)
	xch a, x
	mov a, c
	xch a, x
	movw [sp+8], ax
	xch a, e
	mov a, c
	xch a, e
	xchw ax, de
	movw [sp+28], ax
	movw ax, [sp+30]
	xchw ax, de
	xch a, l
	mov a, c
	xch a, l
	clrb a
	mov d, a
	movw ax, hl
	addw ax, de
	push bc
	movw bc, sp
	movw 292[bc], ax
	pop bc
	xchw ax, hl
	movw ax, [sp+26]
	xchw ax, hl
	clrb a
	xch a, x
	mov a, l
	xchw ax, hl
	movw ax, [sp+24]
	xchw ax, hl
	xch a, x
	addw ax, hl
	push bc
	movw bc, sp
	movw 304[bc], ax
	pop bc
	xchw ax, hl
	movw ax, [sp+2]
	xchw ax, hl
	clrb a
	mov h, a
	xch a, x
	mov a, c
	xch a, x
	push bc
	movw bc, sp
	movw 298[bc], ax
	pop bc
	movw ax, bc
	xchw ax, bc
	movw ax, [sp+16]
	xchw ax, bc
	addw ax, hl
	movw hl, ax
	clrb a
	xch a, x
	mov a, c
	xchw ax, bc
	movw ax, [sp+28]
	xchw ax, bc
	xch a, x
	addw ax, bc
	movw de, ax
	mov c, !LOWW(_g_sha_state+31)
	clrb a
	mov b, a
	movw ax, [sp+8]
	addw ax, bc
	movw [sp+20], ax
	clrw ax
	movw [sp+2], ax
.LBB1_5:                                ; =>This Inner Loop Header: Depth=1
	xchw ax, de
	push bc
	movw bc, sp
	movw 306[bc], ax
	pop bc
	xchw ax, de
	movw ax, [sp+18]
	push bc
	movw bc, sp
	movw 294[bc], ax
	pop bc
	movw ax, [sp+14]
	push bc
	movw bc, sp
	movw 296[bc], ax
	pop bc
	movw ax, [sp+4]
	movw bc, ax
	movw ax, [sp+6]
	movw de, ax
	push bc
	movw bc, sp
	movw ax, 290[bc]
	pop bc
	movw [sp+28], ax
	push bc
	movw bc, sp
	movw ax, 292[bc]
	pop bc
	movw [sp+30], ax
	push bc
	movw bc, sp
	movw ax, 304[bc]
	pop bc
	movw [sp+24], ax
	movw ax, hl
	movw [sp+26], ax
	movw ax, [sp+10]
	movw [sp+18], ax
	movw ax, [sp+0]
	movw [sp+14], ax
	movw ax, [sp+12]
	movw [sp+10], ax
	movw ax, [sp+22]
	movw [sp+0], ax
	movw ax, de
	push de
	pop hl
	xchw ax, hl
	movw [sp+16], ax
	xchw ax, hl
	xchw ax, bc
	movw [sp+8], ax
	xchw ax, bc
	shrw ax, 11
	movw de, ax
	movw ax, bc
	shlw ax, 5
	addw ax, de
	movw de, ax
	movw ax, hl
	shrw ax, 6
	movw hl, ax
	movw ax, bc
	shlw ax, 10
	addw ax, hl
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, d
	xch a, x
	xor a, e
	xch a, x
	movw [sp+4], ax
	movw ax, [sp+16]
	movw bc, ax
	movw ax, [sp+8]
	movw de, ax
	movw ax, bc
	shlw ax, 5
	movw hl, ax
	movw ax, de
	shrw ax, 11
	addw ax, hl
	movw [sp+6], ax
	movw ax, bc
	shlw ax, 10
	movw hl, ax
	movw ax, de
	shrw ax, 6
	addw ax, hl
	movw [sp+12], ax
	movw ax, bc
	shlw ax, 7
	movw hl, ax
	movw ax, de
	shrw ax, 9
	addw ax, hl
	movw hl, ax
	movw ax, [sp+4]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, h
	xch a, x
	xor a, l
	xch a, x
	movw [sp+4], ax
	movw ax, [sp+12]
	xchw ax, de
	movw ax, [sp+6]
	xchw ax, de
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, d
	xch a, x
	xor a, e
	xch a, x
	movw [sp+6], ax
	push bc
	pop de
	movw ax, [sp+8]
	movw hl, ax
	movw ax, de
	shrw ax, 9
	movw bc, ax
	movw ax, hl
	shlw ax, 7
	addw ax, bc
	movw bc, ax
	movw ax, [sp+6]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw [sp+6], ax
	movw ax, [sp+30]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	and a, d
	xch a, x
	and a, e
	xch a, x
	movw de, ax
	movw ax, [sp+28]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	and a, h
	xch a, x
	and a, l
	xch a, x
	movw bc, ax
	movw ax, [sp+4]
	addw ax, de
	movw de, ax
	movw ax, [sp+6]
	sknc
	incw ax
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+20]
	xchw ax, de
	addw ax, de
	movw [sp+4], ax
	movw ax, bc
	push ax
	movw bc, sp
	movw ax, 306[bc]
	movw bc, ax
	pop ax
	sknc
	incw ax
	addw ax, bc
	movw [sp+6], ax
	movw ax, [sp+0]
	movw de, ax
	movw ax, [sp+10]
	movw hl, ax
	movw ax, de
	shrw ax, 13
	movw bc, ax
	movw ax, hl
	shlw ax, 3
	addw ax, bc
	movw bc, ax
	movw ax, de
	shrw ax, 2
	movw [sp+12], ax
	movw ax, [sp+12]
	movw de, ax
	movw ax, hl
	shlw ax, 14
	addw ax, de
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw [sp+22], ax
	movw ax, [sp+0]
	shlw ax, 10
	movw bc, ax
	movw ax, hl
	shrw ax, 6
	addw ax, bc
	push bc
	movw bc, sp
	movw 290[bc], ax
	pop bc
	movw ax, [sp+18]
	movw de, ax
	movw ax, de
	push ax
	movw bc, sp
	movw ax, 294[bc]
	movw bc, ax
	pop ax
	and a, b
	xch a, x
	and a, c
	xch a, x
	movw [sp+20], ax
	movw ax, de
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	push bc
	movw bc, sp
	movw 292[bc], ax
	pop bc
	movw ax, [sp+14]
	movw de, ax
	movw ax, de
	push ax
	movw bc, sp
	movw ax, 296[bc]
	movw bc, ax
	pop ax
	and a, b
	xch a, x
	and a, c
	xch a, x
	movw hl, ax
	movw ax, de
	xor a, b
	xch a, x
	xor a, c
	xchw ax, bc
	movw ax, [sp+0]
	xchw ax, bc
	xch a, x
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	and a, b
	xch a, x
	and a, c
	xch a, x
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, h
	xch a, x
	xor a, l
	xch a, x
	movw [sp+12], ax
	push bc
	movw bc, sp
	movw ax, 292[bc]
	pop bc
	xchw ax, de
	movw ax, [sp+10]
	xchw ax, de
	xchw ax, bc
	movw ax, [sp+20]
	xchw ax, bc
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	and a, d
	xch a, x
	and a, e
	xch a, x
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw [sp+20], ax
	movw ax, [sp+22]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	push ax
	movw bc, sp
	movw ax, 290[bc]
	movw bc, ax
	pop ax
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw [sp+22], ax
	movw ax, [sp+0]
	movw hl, ax
	movw ax, hl
	shlw ax, 3
	movw bc, ax
	movw ax, de
	shrw ax, 13
	addw ax, bc
	movw bc, ax
	movw ax, hl
	shlw ax, 14
	movw hl, ax
	movw ax, de
	shrw ax, 2
	addw ax, hl
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xor a, b
	xch a, x
	xor a, c
	xch a, x
	movw bc, ax
	movw ax, [sp+0]
	shrw ax, 6
	movw hl, ax
	movw ax, de
	shlw ax, 10
	addw ax, hl
	movw hl, ax
	movw ax, bc
	xor a, h
	xch a, x
	xor a, l
	xch a, x
	movw hl, ax
	movw ax, [sp+22]
	xchw ax, bc
	movw ax, [sp+12]
	xchw ax, bc
	addw ax, bc
	movw [sp+12], ax
	movw ax, [sp+20]
	movw bc, ax
	movw ax, hl
	sknc
	incw ax
	addw ax, bc
	movw [sp+20], ax
	movw ax, [sp+26]
	movw de, ax
	movw ax, [sp+16]
	movw bc, ax
	movw ax, de
	and a, b
	xch a, x
	and a, c
	xch a, x
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+24]
	xchw ax, de
	subw ax, bc
	xchw ax, bc
	movw ax, [sp+8]
	xchw ax, bc
	movw hl, ax
	movw ax, de
	and a, b
	xch a, x
	and a, c
	xch a, x
	movw bc, ax
	movw ax, de
	subw ax, bc
	movw bc, ax
	movw ax, [sp+4]
	addw ax, hl
	movw [sp+4], ax
	movw ax, [sp+6]
	sknc
	incw ax
	addw ax, bc
	movw [sp+6], ax
	movw ax, [sp+2]
	movw de, ax
	movw bc, #LOWW(_K)
	xchw ax, de
	movw [sp+2], ax
	xchw ax, de
	movw ax, de
	addw ax, bc
	movw hl, ax
	movw bc, #LOWW(_K+2)
	movw ax, de
	addw ax, bc
	movw bc, ax
	movw ax, [sp+4]
	addw ax, [hl]
	movw [sp+4], ax
	movw ax, [sp+6]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	push hl
	push bc
	pop hl
	addc a, [hl]
	push hl
	pop bc
	pop hl
	xch a, x
	push hl
	push bc
	pop hl
	addc a, [hl+1]
	push hl
	pop bc
	pop hl
	movw bc, ax
	movw ax, sp
	addw ax, #32
	addw ax, de
	movw hl, ax
	movw ax, [sp+4]
	addw ax, [hl]
	movw de, ax
	movw ax, bc
	xch a, x
	addc a, [hl+2]
	xch a, x
	addc a, [hl+3]
	movw bc, ax
	movw ax, [sp+12]
	addw ax, de
	movw [sp+22], ax
	movw ax, [sp+20]
	sknc
	incw ax
	addw ax, bc
	movw [sp+12], ax
	movw ax, de
	xchw ax, de
	push bc
	movw bc, sp
	movw ax, 302[bc]
	pop bc
	xchw ax, de
	addw ax, de
	movw [sp+6], ax
	movw ax, bc
	push ax
	movw bc, sp
	movw ax, 300[bc]
	movw bc, ax
	pop ax
	sknc
	incw ax
	addw ax, bc
	movw [sp+4], ax
	movw ax, [sp+2]
	addw ax, #4
	movw [sp+2], ax
	cmpw ax, #256
	movw ax, [sp+26]
	movw [sp+20], ax
	movw ax, [sp+24]
	movw de, ax
	movw ax, [sp+30]
	movw hl, ax
	movw ax, [sp+28]
	push bc
	movw bc, sp
	movw 304[bc], ax
	pop bc
	movw ax, [sp+16]
	push bc
	movw bc, sp
	movw 292[bc], ax
	pop bc
	movw ax, [sp+8]
	push bc
	movw bc, sp
	movw 290[bc], ax
	pop bc
	push bc
	movw bc, sp
	movw ax, 296[bc]
	pop bc
	push bc
	movw bc, sp
	movw 302[bc], ax
	pop bc
	push bc
	movw bc, sp
	movw ax, 294[bc]
	pop bc
	push bc
	movw bc, sp
	movw 300[bc], ax
	pop bc
	skz ;#.LBB1_5
	br $!.LBB1_5
; %bb.6:
	xchw ax, hl
	push bc
	movw bc, sp
	movw ax, 298[bc]
	pop bc
	xchw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state)
	xch a, h
	mov x, !LOWW(_g_sha_state+1)
	clrb a
	addw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state+2)
	xch a, h
	mov c, !LOWW(_g_sha_state+3)
	movw de, ax
	clrb a
	mov b, a
	movw ax, hl
	addw ax, bc
	xchw ax, bc
	movw ax, [sp+22]
	xchw ax, bc
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+12]
	xchw ax, de
	sknc
	incw ax
	addw ax, de
	mov !LOWW(_g_sha_state), a
	mov a, x
	mov !LOWW(_g_sha_state+1), a
	mov a, b
	mov !LOWW(_g_sha_state+2), a
	mov a, c
	mov !LOWW(_g_sha_state+3), a
	mov a, !LOWW(_g_sha_state+4)
	mov h, a
	mov x, !LOWW(_g_sha_state+5)
	clrb a
	addw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state+6)
	xch a, h
	mov c, !LOWW(_g_sha_state+7)
	movw de, ax
	clrb a
	mov b, a
	movw ax, hl
	addw ax, bc
	xchw ax, bc
	movw ax, [sp+0]
	xchw ax, bc
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+10]
	xchw ax, de
	sknc
	incw ax
	addw ax, de
	mov !LOWW(_g_sha_state+4), a
	mov a, x
	mov !LOWW(_g_sha_state+5), a
	mov a, b
	mov !LOWW(_g_sha_state+6), a
	mov a, c
	mov !LOWW(_g_sha_state+7), a
	mov a, !LOWW(_g_sha_state+8)
	mov h, a
	mov x, !LOWW(_g_sha_state+9)
	clrb a
	addw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state+10)
	xch a, h
	mov c, !LOWW(_g_sha_state+11)
	movw de, ax
	clrb a
	mov b, a
	movw ax, hl
	addw ax, bc
	xchw ax, bc
	movw ax, [sp+14]
	xchw ax, bc
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+18]
	xchw ax, de
	sknc
	incw ax
	addw ax, de
	mov !LOWW(_g_sha_state+8), a
	mov a, x
	mov !LOWW(_g_sha_state+9), a
	mov a, b
	mov !LOWW(_g_sha_state+10), a
	mov a, c
	mov !LOWW(_g_sha_state+11), a
	mov a, !LOWW(_g_sha_state+12)
	mov h, a
	mov x, !LOWW(_g_sha_state+13)
	clrb a
	addw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state+14)
	xch a, h
	mov c, !LOWW(_g_sha_state+15)
	movw de, ax
	clrb a
	mov b, a
	movw ax, hl
	addw ax, bc
	push ax
	movw bc, sp
	movw ax, 296[bc]
	movw bc, ax
	pop ax
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	push bc
	movw bc, sp
	movw ax, 294[bc]
	pop bc
	xchw ax, de
	sknc
	incw ax
	addw ax, de
	mov !LOWW(_g_sha_state+12), a
	mov a, x
	mov !LOWW(_g_sha_state+13), a
	mov a, b
	mov !LOWW(_g_sha_state+14), a
	mov a, c
	mov !LOWW(_g_sha_state+15), a
	mov a, !LOWW(_g_sha_state+16)
	mov h, a
	mov x, !LOWW(_g_sha_state+17)
	clrb a
	addw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state+18)
	xch a, h
	mov c, !LOWW(_g_sha_state+19)
	movw de, ax
	clrb a
	mov b, a
	movw ax, hl
	addw ax, bc
	xchw ax, bc
	movw ax, [sp+6]
	xchw ax, bc
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+4]
	xchw ax, de
	sknc
	incw ax
	addw ax, de
	mov !LOWW(_g_sha_state+16), a
	mov a, x
	mov !LOWW(_g_sha_state+17), a
	mov a, b
	mov !LOWW(_g_sha_state+18), a
	mov a, c
	mov !LOWW(_g_sha_state+19), a
	mov a, !LOWW(_g_sha_state+20)
	mov h, a
	mov x, !LOWW(_g_sha_state+21)
	clrb a
	addw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state+22)
	xch a, h
	mov c, !LOWW(_g_sha_state+23)
	movw de, ax
	clrb a
	mov b, a
	movw ax, hl
	addw ax, bc
	xchw ax, bc
	movw ax, [sp+16]
	xchw ax, bc
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+8]
	xchw ax, de
	sknc
	incw ax
	addw ax, de
	mov !LOWW(_g_sha_state+20), a
	mov a, x
	mov !LOWW(_g_sha_state+21), a
	mov a, b
	mov !LOWW(_g_sha_state+22), a
	mov a, c
	mov !LOWW(_g_sha_state+23), a
	mov a, !LOWW(_g_sha_state+24)
	mov h, a
	mov x, !LOWW(_g_sha_state+25)
	clrb a
	addw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state+26)
	xch a, h
	mov c, !LOWW(_g_sha_state+27)
	movw de, ax
	clrb a
	mov b, a
	movw ax, hl
	addw ax, bc
	xchw ax, bc
	movw ax, [sp+30]
	xchw ax, bc
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+28]
	xchw ax, de
	sknc
	incw ax
	addw ax, de
	mov !LOWW(_g_sha_state+24), a
	mov a, x
	mov !LOWW(_g_sha_state+25), a
	mov a, b
	mov !LOWW(_g_sha_state+26), a
	mov a, c
	mov !LOWW(_g_sha_state+27), a
	mov a, !LOWW(_g_sha_state+28)
	mov h, a
	mov x, !LOWW(_g_sha_state+29)
	clrb a
	addw ax, hl
	xch a, h
	mov a, !LOWW(_g_sha_state+30)
	xch a, h
	mov c, !LOWW(_g_sha_state+31)
	movw de, ax
	clrb a
	mov b, a
	movw ax, hl
	addw ax, bc
	xchw ax, bc
	movw ax, [sp+26]
	xchw ax, bc
	addw ax, bc
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+24]
	xchw ax, de
	sknc
	incw ax
	addw ax, de
	mov !LOWW(_g_sha_state+28), a
	mov a, x
	mov !LOWW(_g_sha_state+29), a
	mov a, b
	mov !LOWW(_g_sha_state+30), a
	mov a, c
	mov !LOWW(_g_sha_state+31), a
	addw sp, #254
	addw sp, #52
	ret
.Lfunc_end2:
	.size	_sha256_transform, .Lfunc_end2-_sha256_transform
                                        ; -- End function
	.globl	_sha256_final                   ; -- Begin function sha256_final
	.type	_sha256_final,@function
_sha256_final:                          ; @sha256_final
; %bb.0:
	subw sp, #96
	movw [sp+94], ax
	movw ax, !LOWW(_g_sha_bitcount+6)
	movw [sp+92], ax
	movw ax, !LOWW(_g_sha_bitcount+4)
	movw [sp+88], ax
	movw ax, !LOWW(_g_sha_bitcount+2)
	movw [sp+86], ax
	movw ax, !LOWW(_g_sha_bitcount)
	movw [sp+84], ax
	clrw bc
	movw de, #63
	xchw ax, bc
	movw [sp+72], ax
	xchw ax, bc
	movw ax, sp
	incw ax
	call !_memset
	movw ax, [sp+84]
	shrw ax, 3
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #63
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #56
	bc $.LBB3_1
; %bb.2:
	movw ax, #120
	br $.LBB3_3
.LBB3_1:
	movw ax, #56
.LBB3_3:
	xchw ax, bc
	movw [sp+90], ax
	xchw ax, bc
	subw ax, bc
	movw de, ax
	xchw ax, de
	movw [sp+74], ax
	xchw ax, de
	shlw ax, 3
	movw bc, ax
	movw ax, de
	shrw ax, 13
	movw de, ax
	movw ax, bc
	xchw ax, bc
	movw ax, [sp+84]
	xchw ax, bc
	addw ax, bc
	movw [sp+76], ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+86]
	xchw ax, de
	xch a, x
	addc a, e
	xch a, x
	addc a, d
	movw bc, ax
	movw ax, [sp+88]
	xchw ax, de
	movw ax, [sp+92]
	xchw ax, de
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	addc a, #0
	xch a, x
	addc a, #0
	movw hl, ax
	movw ax, de
	bnc $.LBB3_5
; %bb.4:
	movw ax, de
	incw ax
.LBB3_5:
	movw !LOWW(_g_sha_bitcount+6), ax
	movw ax, hl
	movw !LOWW(_g_sha_bitcount+4), ax
	movw ax, bc
	movw !LOWW(_g_sha_bitcount+2), ax
	movw ax, [sp+76]
	movw !LOWW(_g_sha_bitcount), ax
	movw ax, [sp+84]
	movw bc, ax
	mov a, c
	mov [sp+71], a
	mov a, b
	mov [sp+70], a
	movw ax, [sp+86]
	movw bc, ax
	mov a, c
	mov [sp+69], a
	mov a, b
	mov [sp+68], a
	movw ax, [sp+88]
	movw bc, ax
	mov [sp+0], #-128
	mov a, c
	mov [sp+67], a
	mov a, b
	mov [sp+66], a
	mov a, e
	mov [sp+65], a
	mov a, d
	mov [sp+64], a
	movw ax, [sp+90]
	movw de, ax
	movw ax, de
	cmpw ax, #0
	sknz ;#.LBB3_23
	br $!.LBB3_23
; %bb.6:
	movw ax, de
	cmpw ax, #55
	bh $.LBB3_14
; %bb.7:
	movw ax, [sp+74]
	movw de, ax
	movw ax, de
	decw ax
	cmpw ax, #7
	skc ;#.LBB3_9
	br $!.LBB3_9
; %bb.8:
	movw hl, #0
	br $!.LBB3_11
.LBB3_14:
	mov a, [sp+0]
	push de
	pop bc
	mov LOWW(_g_sha_buffer)[bc], a
	movw bc, #LOWW(_g_sha_buffer)
	movw ax, de
	addw ax, bc
	movw hl, ax
	movw ax, de
	cmpw ax, #63
	bz $.LBB3_22
; %bb.15:
	mov a, [sp+1]
	mov [hl+1], a
	movw ax, de
	cmpw ax, #62
	bz $.LBB3_22
; %bb.16:
	mov a, [sp+2]
	mov [hl+2], a
	movw ax, de
	cmpw ax, #61
	bz $.LBB3_22
; %bb.17:
	mov a, [sp+3]
	mov [hl+3], a
	movw ax, de
	cmpw ax, #60
	bz $.LBB3_22
; %bb.18:
	mov a, [sp+4]
	mov [hl+4], a
	movw ax, de
	cmpw ax, #59
	bz $.LBB3_22
; %bb.19:
	mov a, [sp+5]
	mov [hl+5], a
	movw ax, de
	cmpw ax, #58
	bz $.LBB3_22
; %bb.20:
	mov a, [sp+6]
	mov [hl+6], a
	movw ax, de
	cmpw ax, #57
	bz $.LBB3_22
; %bb.21:
	mov a, [sp+7]
	mov [hl+7], a
.LBB3_22:
	movw ax, #LOWW(_g_sha_buffer)
	call !_sha256_transform
	movw ax, [sp+90]
	movw bc, ax
	movw ax, #64
	subw ax, bc
	movw [sp+72], ax
.LBB3_23:
	movw ax, [sp+72]
	movw hl, ax
	movw ax, [sp+74]
	movw bc, ax
	movw ax, hl
	addw ax, #63
	cmpw ax, bc
	bnc $.LBB3_24
.LBB3_25:                               ; =>This Inner Loop Header: Depth=1
	xchw ax, hl
	movw [sp+72], ax
	xchw ax, hl
	movw ax, sp
	addw ax, hl
	call !_sha256_transform
	movw ax, [sp+74]
	movw bc, ax
	movw ax, [sp+72]
	movw hl, ax
	movw ax, hl
	addw ax, #64
	movw de, ax
	movw ax, hl
	addw ax, #127
	cmpw ax, bc
	push de
	pop hl
	bc $.LBB3_25
; %bb.26:
	movw ax, bc
	cmpw ax, de
	bh $.LBB3_27
	br $!.LBB3_34
.LBB3_24:
	push hl
	pop de
	movw ax, bc
	cmpw ax, de
	skh ;#.LBB3_34
	br $!.LBB3_34
.LBB3_27:
	xchw ax, de
	movw [sp+76], ax
	xchw ax, de
	movw ax, bc
	subw ax, de
	movw hl, ax
	xchw ax, hl
	movw [sp+78], ax
	xchw ax, hl
	decw ax
	cmpw ax, #7
	bnc $.LBB3_29
; %bb.28:
	movw de, #0
	br $.LBB3_31
.LBB3_29:
	movw ax, sp
	addw ax, de
	movw bc, ax
	movw de, #0
	movw ax, hl
	xch a, x
	and a, #248
	xch a, x
	movw [sp+72], ax
	movw ax, bc
	addw ax, #3
	movw [sp+74], ax
.LBB3_30:                               ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+74]
	addw ax, de
	push de
	pop bc
	movw de, ax
	addw ax, #-3
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer)[bc], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer+1)[bc], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+2)[bc], a
	push de
	pop hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+3)[bc], a
	mov a, [hl+1]
	mov LOWW(_g_sha_buffer+4)[bc], a
	mov a, [hl+2]
	mov LOWW(_g_sha_buffer+5)[bc], a
	mov a, [hl+3]
	mov LOWW(_g_sha_buffer+6)[bc], a
	mov a, [hl+4]
	mov LOWW(_g_sha_buffer+7)[bc], a
	movw ax, bc
	addw ax, #8
	movw de, ax
	movw ax, [sp+72]
	cmpw ax, de
	bnz $.LBB3_30
.LBB3_31:
	movw ax, [sp+78]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw [sp+72], ax
	xchw ax, hl
	movw ax, [sp+76]
	xchw ax, hl
	cmpw ax, #0
	sknz ;#.LBB3_34
	br $!.LBB3_34
; %bb.32:
	movw bc, #LOWW(_g_sha_buffer)
	movw ax, de
	addw ax, bc
	push de
	pop bc
	movw de, ax
	movw ax, hl
	addw ax, bc
	movw bc, ax
	movw ax, sp
	addw ax, bc
	movw bc, ax
.LBB3_33:                               ; =>This Inner Loop Header: Depth=1
	push bc
	pop hl
	mov a, [hl]
	push de
	pop hl
	mov [hl], a
	incw bc
	incw de
	movw ax, [sp+72]
	decw ax
	cmpw ax, #0
	movw [sp+72], ax
	bnz $.LBB3_33
	br $!.LBB3_34
.LBB3_9:
	movw bc, #LOWW(_g_sha_buffer+3)
	movw hl, #0
	movw ax, [sp+90]
	addw ax, bc
	movw [sp+78], ax
	movw ax, sp
	addw ax, #3
	movw [sp+80], ax
	movw ax, de
	xch a, x
	and a, #248
	xch a, x
	movw [sp+82], ax
.LBB3_10:                               ; =>This Inner Loop Header: Depth=1
	movw ax, sp
	addw ax, hl
	push hl
	pop de
	movw hl, ax
	mov a, [hl]
	mov [sp+76], a
	movw ax, [sp+78]
	xchw ax, de
	movw [sp+72], ax
	xchw ax, de
	addw ax, de
	movw bc, ax
	addw ax, #-3
	movw hl, ax
	mov a, [sp+76]
	mov [hl], a
	movw ax, [sp+80]
	addw ax, de
	movw de, ax
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov [sp+76], a
	movw ax, bc
	decw ax
	decw ax
	movw hl, ax
	mov a, [sp+76]
	mov [hl], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	push bc
	pop hl
	decw hl
	mov [hl], a
	push de
	pop hl
	mov a, [hl]
	push bc
	pop hl
	mov [hl], a
	push de
	pop hl
	mov a, [hl+1]
	push bc
	pop hl
	mov [hl+1], a
	push de
	pop hl
	mov a, [hl+2]
	push bc
	pop hl
	mov [hl+2], a
	push de
	pop hl
	mov a, [hl+3]
	push bc
	pop hl
	mov [hl+3], a
	push de
	pop hl
	mov a, [hl+4]
	push bc
	pop hl
	mov [hl+4], a
	movw ax, [sp+72]
	addw ax, #8
	movw hl, ax
	movw ax, [sp+82]
	cmpw ax, hl
	bnz $.LBB3_10
.LBB3_11:
	movw ax, [sp+74]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	bz $.LBB3_34
; %bb.12:
	movw ax, sp
	addw ax, hl
	push hl
	pop de
	movw hl, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+90]
	xchw ax, de
	addw ax, de
	movw de, #LOWW(_g_sha_buffer)
	addw ax, de
	movw de, ax
.LBB3_13:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB3_13
.LBB3_34:
	movw bc, !LOWW(_g_sha_bitcount)
	movw ax, bc
	addw ax, #64
	movw [sp+72], ax
	clrw ax
	xch a, x
	addc a, !LOWW(_g_sha_bitcount+2)
	xch a, x
	addc a, !LOWW(_g_sha_bitcount+3)
	movw [sp+74], ax
	clrw ax
	xch a, x
	addc a, !LOWW(_g_sha_bitcount+4)
	xch a, x
	addc a, !LOWW(_g_sha_bitcount+5)
	movw de, ax
	clrw ax
	xch a, x
	addc a, !LOWW(_g_sha_bitcount+6)
	xch a, x
	addc a, !LOWW(_g_sha_bitcount+7)
	movw hl, ax
	movw ax, de
	movw !LOWW(_g_sha_bitcount+4), ax
	movw ax, hl
	movw !LOWW(_g_sha_bitcount+6), ax
	movw hl, #0
	movw ax, [sp+72]
	movw !LOWW(_g_sha_bitcount), ax
	movw ax, [sp+74]
	movw !LOWW(_g_sha_bitcount+2), ax
	movw ax, bc
	shrw ax, 3
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #63
	xch a, x
	clrb a
	movw de, ax
	cmpw ax, #0
	push hl
	pop bc
	sknz ;#.LBB3_46
	br $!.LBB3_46
; %bb.35:
	movw ax, de
	cmpw ax, #55
	bh $.LBB3_37
; %bb.36:
	movw ax, [sp+92]
	push de
	pop bc
	mov LOWW(_g_sha_buffer)[bc], a
	mov a, x
	mov LOWW(_g_sha_buffer+1)[bc], a
	movw ax, [sp+88]
	mov LOWW(_g_sha_buffer+2)[bc], a
	mov a, x
	mov LOWW(_g_sha_buffer+3)[bc], a
	movw ax, [sp+86]
	mov LOWW(_g_sha_buffer+4)[bc], a
	mov a, x
	mov LOWW(_g_sha_buffer+5)[bc], a
	movw ax, [sp+84]
	mov LOWW(_g_sha_buffer+6)[bc], a
	mov a, x
	mov LOWW(_g_sha_buffer+7)[bc], a
	br $!.LBB3_52
.LBB3_37:
	mov a, [sp+64]
	push de
	pop bc
	mov LOWW(_g_sha_buffer)[bc], a
	movw bc, #LOWW(_g_sha_buffer)
	movw ax, de
	addw ax, bc
	movw hl, ax
	movw ax, de
	cmpw ax, #63
	bz $.LBB3_45
; %bb.38:
	mov a, [sp+65]
	mov [hl+1], a
	movw ax, de
	cmpw ax, #62
	bz $.LBB3_45
; %bb.39:
	mov a, [sp+66]
	mov [hl+2], a
	movw ax, de
	cmpw ax, #61
	bz $.LBB3_45
; %bb.40:
	mov a, [sp+67]
	mov [hl+3], a
	movw ax, de
	cmpw ax, #60
	bz $.LBB3_45
; %bb.41:
	mov a, [sp+68]
	mov [hl+4], a
	movw ax, de
	cmpw ax, #59
	bz $.LBB3_45
; %bb.42:
	mov a, [sp+69]
	mov [hl+5], a
	movw ax, de
	cmpw ax, #58
	bz $.LBB3_45
; %bb.43:
	mov a, [sp+70]
	mov [hl+6], a
	movw ax, de
	cmpw ax, #57
	bz $.LBB3_45
; %bb.44:
	mov a, [sp+71]
	mov [hl+7], a
.LBB3_45:
	movw ax, de
	movw [sp+72], ax
	movw ax, #LOWW(_g_sha_buffer)
	call !_sha256_transform
	movw ax, [sp+72]
	movw de, ax
	movw hl, #0
	movw ax, #64
	subw ax, de
	movw bc, ax
	movw ax, de
	cmpw ax, #57
	sknc ;#.LBB3_52
	br $!.LBB3_52
.LBB3_46:
	movw ax, #8
	subw ax, bc
	movw [sp+78], ax
	xchw ax, bc
	movw [sp+76], ax
	xchw ax, bc
	decw bc
	movw ax, bc
	cmpw ax, #7
	bc $.LBB3_49
; %bb.47:
	movw ax, [sp+76]
	movw bc, ax
	movw ax, sp
	addw ax, #64
	addw ax, bc
	movw bc, ax
	movw ax, [sp+78]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #248
	xch a, x
	movw [sp+72], ax
	movw ax, bc
	addw ax, #3
	movw [sp+74], ax
.LBB3_48:                               ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+74]
	addw ax, hl
	movw de, ax
	addw ax, #-3
	push hl
	pop bc
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer)[bc], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer+1)[bc], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+2)[bc], a
	push de
	pop hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+3)[bc], a
	mov a, [hl+1]
	mov LOWW(_g_sha_buffer+4)[bc], a
	mov a, [hl+2]
	mov LOWW(_g_sha_buffer+5)[bc], a
	mov a, [hl+3]
	mov LOWW(_g_sha_buffer+6)[bc], a
	mov a, [hl+4]
	mov LOWW(_g_sha_buffer+7)[bc], a
	movw ax, bc
	addw ax, #8
	movw hl, ax
	movw ax, [sp+72]
	cmpw ax, hl
	bnz $.LBB3_48
.LBB3_49:
	movw ax, [sp+78]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	movw ax, [sp+76]
	bz $.LBB3_52
; %bb.50:
	movw de, #LOWW(_g_sha_buffer)
	movw ax, hl
	addw ax, de
	movw de, ax
	movw ax, [sp+76]
	addw ax, hl
	movw hl, ax
	movw ax, sp
	addw ax, #64
	addw ax, hl
	movw hl, ax
.LBB3_51:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB3_51
.LBB3_52:
	mov a, !LOWW(_g_sha_state)
	mov b, !LOWW(_g_sha_state+1)
	mov c, !LOWW(_g_sha_state+2)
	mov x, !LOWW(_g_sha_state+3)
	xchw ax, hl
	movw ax, [sp+94]
	xchw ax, hl
	mov [hl], a
	mov a, b
	mov [hl+1], a
	mov a, c
	mov [hl+2], a
	mov a, x
	mov [hl+3], a
	mov a, !LOWW(_g_sha_state+4)
	mov b, !LOWW(_g_sha_state+5)
	mov c, !LOWW(_g_sha_state+6)
	mov x, !LOWW(_g_sha_state+7)
	mov [hl+4], a
	mov a, b
	mov [hl+5], a
	mov a, c
	mov [hl+6], a
	mov a, x
	mov [hl+7], a
	mov a, !LOWW(_g_sha_state+8)
	mov b, !LOWW(_g_sha_state+9)
	mov c, !LOWW(_g_sha_state+10)
	mov x, !LOWW(_g_sha_state+11)
	mov [hl+8], a
	mov a, b
	mov [hl+9], a
	mov a, c
	mov [hl+10], a
	mov a, x
	mov [hl+11], a
	mov a, !LOWW(_g_sha_state+12)
	mov b, !LOWW(_g_sha_state+13)
	mov c, !LOWW(_g_sha_state+14)
	mov x, !LOWW(_g_sha_state+15)
	mov [hl+12], a
	mov a, b
	mov [hl+13], a
	mov a, c
	mov [hl+14], a
	mov a, x
	mov [hl+15], a
	mov a, !LOWW(_g_sha_state+16)
	mov b, !LOWW(_g_sha_state+17)
	mov c, !LOWW(_g_sha_state+18)
	mov x, !LOWW(_g_sha_state+19)
	mov [hl+16], a
	mov a, b
	mov [hl+17], a
	mov a, c
	mov [hl+18], a
	mov a, x
	mov [hl+19], a
	mov a, !LOWW(_g_sha_state+20)
	mov b, !LOWW(_g_sha_state+21)
	mov c, !LOWW(_g_sha_state+22)
	mov x, !LOWW(_g_sha_state+23)
	mov [hl+20], a
	mov a, b
	mov [hl+21], a
	mov a, c
	mov [hl+22], a
	mov a, x
	mov [hl+23], a
	mov a, !LOWW(_g_sha_state+24)
	mov b, !LOWW(_g_sha_state+25)
	mov c, !LOWW(_g_sha_state+26)
	mov x, !LOWW(_g_sha_state+27)
	mov [hl+24], a
	mov a, b
	mov [hl+25], a
	mov a, c
	mov [hl+26], a
	mov a, x
	mov [hl+27], a
	mov a, !LOWW(_g_sha_state+28)
	mov b, !LOWW(_g_sha_state+29)
	mov c, !LOWW(_g_sha_state+30)
	mov x, !LOWW(_g_sha_state+31)
	mov [hl+28], a
	mov a, b
	mov [hl+29], a
	mov a, c
	mov [hl+30], a
	mov a, x
	mov [hl+31], a
	clrb !LOWW(_g_sha_state)
	clrb !LOWW(_g_sha_state+1)
	clrb !LOWW(_g_sha_state+2)
	clrb !LOWW(_g_sha_state+3)
	clrb !LOWW(_g_sha_state+4)
	clrb !LOWW(_g_sha_state+5)
	clrb !LOWW(_g_sha_state+6)
	clrb !LOWW(_g_sha_state+7)
	clrb !LOWW(_g_sha_state+8)
	clrb !LOWW(_g_sha_state+9)
	clrb !LOWW(_g_sha_state+10)
	clrb !LOWW(_g_sha_state+11)
	clrb !LOWW(_g_sha_state+12)
	clrb !LOWW(_g_sha_state+13)
	clrb !LOWW(_g_sha_state+14)
	clrb !LOWW(_g_sha_state+15)
	clrb !LOWW(_g_sha_state+16)
	clrb !LOWW(_g_sha_state+17)
	clrb !LOWW(_g_sha_state+18)
	clrb !LOWW(_g_sha_state+19)
	clrb !LOWW(_g_sha_state+20)
	clrb !LOWW(_g_sha_state+21)
	clrb !LOWW(_g_sha_state+22)
	clrb !LOWW(_g_sha_state+23)
	clrb !LOWW(_g_sha_state+24)
	clrb !LOWW(_g_sha_state+25)
	clrb !LOWW(_g_sha_state+26)
	clrb !LOWW(_g_sha_state+27)
	clrb !LOWW(_g_sha_state+28)
	clrb !LOWW(_g_sha_state+29)
	clrb !LOWW(_g_sha_state+30)
	clrb !LOWW(_g_sha_state+31)
	clrw ax
	movw !LOWW(_g_sha_bitcount+6), ax
	movw !LOWW(_g_sha_bitcount+4), ax
	movw !LOWW(_g_sha_bitcount+2), ax
	movw !LOWW(_g_sha_bitcount), ax
	clrb !LOWW(_g_sha_buffer)
	clrb !LOWW(_g_sha_buffer+1)
	clrb !LOWW(_g_sha_buffer+2)
	clrb !LOWW(_g_sha_buffer+3)
	clrb !LOWW(_g_sha_buffer+4)
	clrb !LOWW(_g_sha_buffer+5)
	clrb !LOWW(_g_sha_buffer+6)
	clrb !LOWW(_g_sha_buffer+7)
	clrb !LOWW(_g_sha_buffer+8)
	clrb !LOWW(_g_sha_buffer+9)
	clrb !LOWW(_g_sha_buffer+10)
	clrb !LOWW(_g_sha_buffer+11)
	clrb !LOWW(_g_sha_buffer+12)
	clrb !LOWW(_g_sha_buffer+13)
	clrb !LOWW(_g_sha_buffer+14)
	clrb !LOWW(_g_sha_buffer+15)
	clrb !LOWW(_g_sha_buffer+16)
	clrb !LOWW(_g_sha_buffer+17)
	clrb !LOWW(_g_sha_buffer+18)
	clrb !LOWW(_g_sha_buffer+19)
	clrb !LOWW(_g_sha_buffer+20)
	clrb !LOWW(_g_sha_buffer+21)
	clrb !LOWW(_g_sha_buffer+22)
	clrb !LOWW(_g_sha_buffer+23)
	clrb !LOWW(_g_sha_buffer+24)
	clrb !LOWW(_g_sha_buffer+25)
	clrb !LOWW(_g_sha_buffer+26)
	clrb !LOWW(_g_sha_buffer+27)
	clrb !LOWW(_g_sha_buffer+28)
	clrb !LOWW(_g_sha_buffer+29)
	clrb !LOWW(_g_sha_buffer+30)
	clrb !LOWW(_g_sha_buffer+31)
	clrb !LOWW(_g_sha_buffer+32)
	clrb !LOWW(_g_sha_buffer+33)
	clrb !LOWW(_g_sha_buffer+34)
	clrb !LOWW(_g_sha_buffer+35)
	clrb !LOWW(_g_sha_buffer+36)
	clrb !LOWW(_g_sha_buffer+37)
	clrb !LOWW(_g_sha_buffer+38)
	clrb !LOWW(_g_sha_buffer+39)
	clrb !LOWW(_g_sha_buffer+40)
	clrb !LOWW(_g_sha_buffer+41)
	clrb !LOWW(_g_sha_buffer+42)
	clrb !LOWW(_g_sha_buffer+43)
	clrb !LOWW(_g_sha_buffer+44)
	clrb !LOWW(_g_sha_buffer+45)
	clrb !LOWW(_g_sha_buffer+46)
	clrb !LOWW(_g_sha_buffer+47)
	clrb !LOWW(_g_sha_buffer+48)
	clrb !LOWW(_g_sha_buffer+49)
	clrb !LOWW(_g_sha_buffer+50)
	clrb !LOWW(_g_sha_buffer+51)
	clrb !LOWW(_g_sha_buffer+52)
	clrb !LOWW(_g_sha_buffer+53)
	clrb !LOWW(_g_sha_buffer+54)
	clrb !LOWW(_g_sha_buffer+55)
	clrb !LOWW(_g_sha_buffer+56)
	clrb !LOWW(_g_sha_buffer+57)
	clrb !LOWW(_g_sha_buffer+58)
	clrb !LOWW(_g_sha_buffer+59)
	clrb !LOWW(_g_sha_buffer+60)
	clrb !LOWW(_g_sha_buffer+61)
	clrb !LOWW(_g_sha_buffer+62)
	clrb !LOWW(_g_sha_buffer+63)
	addw sp, #96
	ret
.Lfunc_end3:
	.size	_sha256_final, .Lfunc_end3-_sha256_final
                                        ; -- End function
	.globl	_sha256_compute                 ; -- Begin function sha256_compute
	.type	_sha256_compute,@function
_sha256_compute:                        ; @sha256_compute
; %bb.0:
	subw sp, #12
	xchw ax, de
	movw [sp+6], ax
	xchw ax, de
	push bc
	pop de
	movw [sp+2], ax
	mov !LOWW(_g_sha_state), #106
	mov !LOWW(_g_sha_state+1), #9
	mov !LOWW(_g_sha_state+2), #-26
	mov !LOWW(_g_sha_state+3), #103
	mov !LOWW(_g_sha_state+4), #-69
	mov !LOWW(_g_sha_state+5), #103
	mov !LOWW(_g_sha_state+6), #-82
	mov !LOWW(_g_sha_state+7), #-123
	mov !LOWW(_g_sha_state+8), #60
	mov !LOWW(_g_sha_state+9), #110
	mov !LOWW(_g_sha_state+10), #-13
	mov !LOWW(_g_sha_state+11), #114
	mov !LOWW(_g_sha_state+12), #-91
	mov !LOWW(_g_sha_state+13), #79
	mov !LOWW(_g_sha_state+14), #-11
	mov !LOWW(_g_sha_state+15), #58
	mov !LOWW(_g_sha_state+16), #81
	mov !LOWW(_g_sha_state+17), #14
	mov !LOWW(_g_sha_state+18), #82
	mov !LOWW(_g_sha_state+19), #127
	mov !LOWW(_g_sha_state+20), #-101
	mov !LOWW(_g_sha_state+21), #5
	mov !LOWW(_g_sha_state+22), #104
	mov !LOWW(_g_sha_state+23), #-116
	mov !LOWW(_g_sha_state+24), #31
	mov !LOWW(_g_sha_state+25), #-125
	mov !LOWW(_g_sha_state+26), #-39
	mov !LOWW(_g_sha_state+27), #-85
	mov !LOWW(_g_sha_state+28), #91
	mov !LOWW(_g_sha_state+29), #-32
	mov !LOWW(_g_sha_state+30), #-51
	mov !LOWW(_g_sha_state+31), #25
	clrb !LOWW(_g_sha_buffer)
	clrb !LOWW(_g_sha_buffer+1)
	clrb !LOWW(_g_sha_buffer+2)
	clrb !LOWW(_g_sha_buffer+3)
	clrb !LOWW(_g_sha_buffer+4)
	clrb !LOWW(_g_sha_buffer+5)
	clrb !LOWW(_g_sha_buffer+6)
	clrb !LOWW(_g_sha_buffer+7)
	clrb !LOWW(_g_sha_buffer+8)
	clrb !LOWW(_g_sha_buffer+9)
	clrb !LOWW(_g_sha_buffer+10)
	clrb !LOWW(_g_sha_buffer+11)
	clrb !LOWW(_g_sha_buffer+12)
	clrb !LOWW(_g_sha_buffer+13)
	clrb !LOWW(_g_sha_buffer+14)
	clrb !LOWW(_g_sha_buffer+15)
	clrb !LOWW(_g_sha_buffer+16)
	clrb !LOWW(_g_sha_buffer+17)
	clrb !LOWW(_g_sha_buffer+18)
	clrb !LOWW(_g_sha_buffer+19)
	clrb !LOWW(_g_sha_buffer+20)
	clrb !LOWW(_g_sha_buffer+21)
	clrb !LOWW(_g_sha_buffer+22)
	clrb !LOWW(_g_sha_buffer+23)
	clrb !LOWW(_g_sha_buffer+24)
	clrb !LOWW(_g_sha_buffer+25)
	clrb !LOWW(_g_sha_buffer+26)
	clrb !LOWW(_g_sha_buffer+27)
	clrb !LOWW(_g_sha_buffer+28)
	clrb !LOWW(_g_sha_buffer+29)
	clrb !LOWW(_g_sha_buffer+30)
	clrb !LOWW(_g_sha_buffer+31)
	clrb !LOWW(_g_sha_buffer+32)
	clrb !LOWW(_g_sha_buffer+33)
	clrb !LOWW(_g_sha_buffer+34)
	clrb !LOWW(_g_sha_buffer+35)
	clrb !LOWW(_g_sha_buffer+36)
	clrb !LOWW(_g_sha_buffer+37)
	clrb !LOWW(_g_sha_buffer+38)
	clrb !LOWW(_g_sha_buffer+39)
	clrb !LOWW(_g_sha_buffer+40)
	clrb !LOWW(_g_sha_buffer+41)
	clrb !LOWW(_g_sha_buffer+42)
	clrb !LOWW(_g_sha_buffer+43)
	clrb !LOWW(_g_sha_buffer+44)
	clrb !LOWW(_g_sha_buffer+45)
	clrb !LOWW(_g_sha_buffer+46)
	clrb !LOWW(_g_sha_buffer+47)
	clrb !LOWW(_g_sha_buffer+48)
	clrb !LOWW(_g_sha_buffer+49)
	clrb !LOWW(_g_sha_buffer+50)
	clrb !LOWW(_g_sha_buffer+51)
	clrb !LOWW(_g_sha_buffer+52)
	clrb !LOWW(_g_sha_buffer+53)
	clrb !LOWW(_g_sha_buffer+54)
	clrb !LOWW(_g_sha_buffer+55)
	clrb !LOWW(_g_sha_buffer+56)
	clrb !LOWW(_g_sha_buffer+57)
	clrb !LOWW(_g_sha_buffer+58)
	clrb !LOWW(_g_sha_buffer+59)
	clrb !LOWW(_g_sha_buffer+60)
	clrb !LOWW(_g_sha_buffer+61)
	clrb !LOWW(_g_sha_buffer+62)
	clrb !LOWW(_g_sha_buffer+63)
	clrw bc
	mov a, !LOWW(_g_sha_state)
	set1 !LOWW(_g_sha_state).4
	clr1 !LOWW(_g_sha_state).4
	mov !LOWW(_g_sha_state), a
	movw ax, de
	shrw ax, 13
	movw !LOWW(_g_sha_bitcount+2), ax
	movw ax, de
	shlw ax, 3
	movw !LOWW(_g_sha_bitcount), ax
	clrw ax
	movw !LOWW(_g_sha_bitcount+6), ax
	movw !LOWW(_g_sha_bitcount+4), ax
	push de
	pop hl
	movw ax, de
	cmpw ax, #64
	bc $.LBB4_3
; %bb.1:
	movw de, #0
	movw ax, hl
	movw [sp+4], ax
.LBB4_2:                                ; =>This Inner Loop Header: Depth=1
	xchw ax, de
	movw [sp+0], ax
	xchw ax, de
	movw ax, [sp+2]
	addw ax, de
	call !_sha256_transform
	movw ax, [sp+4]
	movw hl, ax
	movw ax, [sp+0]
	movw bc, ax
	movw ax, bc
	addw ax, #64
	movw de, ax
	movw ax, bc
	addw ax, #127
	push hl
	pop bc
	cmpw ax, bc
	push de
	pop bc
	bc $.LBB4_2
.LBB4_3:
	movw ax, hl
	cmpw ax, bc
	skh ;#.LBB4_11
	br $!.LBB4_11
; %bb.4:
	xchw ax, bc
	movw [sp+8], ax
	xchw ax, bc
	movw ax, hl
	subw ax, bc
	movw de, ax
	xchw ax, de
	movw [sp+10], ax
	xchw ax, de
	decw ax
	cmpw ax, #7
	bnc $.LBB4_6
; %bb.5:
	movw de, #0
	br $.LBB4_8
.LBB4_6:
	movw ax, bc
	xchw ax, bc
	movw ax, [sp+2]
	xchw ax, bc
	addw ax, bc
	movw bc, ax
	movw ax, de
	movw de, #0
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #248
	xch a, x
	movw [sp+0], ax
	movw ax, bc
	addw ax, #3
	movw [sp+4], ax
.LBB4_7:                                ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+4]
	addw ax, de
	push de
	pop bc
	movw de, ax
	addw ax, #-3
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer)[bc], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer+1)[bc], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+2)[bc], a
	push de
	pop hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+3)[bc], a
	mov a, [hl+1]
	mov LOWW(_g_sha_buffer+4)[bc], a
	mov a, [hl+2]
	mov LOWW(_g_sha_buffer+5)[bc], a
	mov a, [hl+3]
	mov LOWW(_g_sha_buffer+6)[bc], a
	mov a, [hl+4]
	mov LOWW(_g_sha_buffer+7)[bc], a
	movw ax, bc
	addw ax, #8
	movw de, ax
	movw ax, [sp+0]
	cmpw ax, de
	bnz $.LBB4_7
.LBB4_8:
	movw ax, [sp+10]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	movw ax, [sp+2]
	movw ax, [sp+8]
	movw hl, ax
	bz $.LBB4_11
; %bb.9:
	push de
	pop hl
	movw de, #LOWW(_g_sha_buffer)
	movw ax, hl
	addw ax, de
	movw de, ax
	movw ax, [sp+8]
	addw ax, hl
	xchw ax, hl
	movw ax, [sp+2]
	xchw ax, hl
	addw ax, hl
	movw hl, ax
.LBB4_10:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB4_10
.LBB4_11:
	movw ax, [sp+6]
	addw sp, #12
	br !_sha256_final
.Lfunc_end4:
	.size	_sha256_compute, .Lfunc_end4-_sha256_compute
                                        ; -- End function
	.globl	_hmac_sha256                    ; -- Begin function hmac_sha256
	.type	_hmac_sha256,@function
_hmac_sha256:                           ; @hmac_sha256
; %bb.0:
	subw sp, #52
	xchw ax, de
	movw [sp+38], ax
	xchw ax, de
	xchw ax, bc
	movw [sp+40], ax
	xchw ax, bc
	movw [sp+42], ax
	movw de, #64
	clrw bc
	movw ax, #LOWW(_k_ipad)
	call !_memset
	movw de, #64
	clrw bc
	movw ax, #LOWW(_k_opad)
	call !_memset
	movw ax, [sp+40]
	movw bc, ax
	movw ax, [sp+58]
	movw [sp+48], ax
	movw ax, [sp+56]
	movw [sp+36], ax
	movw ax, bc
	decw ax
	cmpw ax, #63
	sknh ;#.LBB5_7
	br $!.LBB5_7
; %bb.1:
	movw hl, #0
	cmpw ax, #7
	bc $.LBB5_4
; %bb.2:
	movw ax, [sp+42]
	addw ax, #3
	movw [sp+32], ax
	movw ax, bc
	xch a, x
	and a, #248
	xch a, x
	movw [sp+34], ax
.LBB5_3:                                ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+32]
	addw ax, hl
	movw de, ax
	addw ax, #-3
	push hl
	pop bc
	movw hl, ax
	mov a, [hl]
	mov LOWW(_k_ipad)[bc], a
	mov a, [hl]
	mov LOWW(_k_opad)[bc], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov LOWW(_k_ipad+1)[bc], a
	mov a, [hl]
	mov LOWW(_k_opad+1)[bc], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	mov LOWW(_k_ipad+2)[bc], a
	mov a, [hl]
	mov LOWW(_k_opad+2)[bc], a
	push de
	pop hl
	mov a, [hl]
	mov LOWW(_k_ipad+3)[bc], a
	mov a, [hl]
	mov LOWW(_k_opad+3)[bc], a
	mov a, [hl+1]
	mov LOWW(_k_ipad+4)[bc], a
	mov a, [hl+1]
	mov LOWW(_k_opad+4)[bc], a
	mov a, [hl+2]
	mov LOWW(_k_ipad+5)[bc], a
	mov a, [hl+2]
	mov LOWW(_k_opad+5)[bc], a
	mov a, [hl+3]
	mov LOWW(_k_ipad+6)[bc], a
	mov a, [hl+3]
	mov LOWW(_k_opad+6)[bc], a
	mov a, [hl+4]
	mov LOWW(_k_ipad+7)[bc], a
	mov a, [hl+4]
	mov LOWW(_k_opad+7)[bc], a
	movw ax, bc
	addw ax, #8
	movw hl, ax
	movw ax, [sp+34]
	cmpw ax, hl
	bnz $.LBB5_3
.LBB5_4:
	movw ax, [sp+40]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	cmpw ax, #0
	movw [sp+32], ax
	bz $.LBB5_7
; %bb.5:
	movw de, #LOWW(_k_ipad)
	movw ax, [sp+42]
	addw ax, hl
	movw bc, ax
	movw ax, hl
	addw ax, de
	movw de, ax
	movw ax, hl
	movw hl, #LOWW(_k_opad)
	addw ax, hl
	movw [sp+34], ax
.LBB5_6:                                ; =>This Inner Loop Header: Depth=1
	push bc
	pop hl
	incw bc
	mov a, [hl]
	mov [de], a
	incw de
	mov a, [hl]
	xchw ax, hl
	movw ax, [sp+34]
	xchw ax, hl
	mov [hl], a
	incw hl
	movw ax, hl
	movw [sp+34], ax
	movw ax, [sp+32]
	decw ax
	cmpw ax, #0
	movw [sp+32], ax
	bnz $.LBB5_6
.LBB5_7:
	clrw bc
	movw de, #LOWW(_k_opad)
.LBB5_8:                                ; =>This Inner Loop Header: Depth=1
	movw hl, #LOWW(_k_ipad)
	movw ax, bc
	addw ax, hl
	movw hl, ax
	mov a, #54
	xor a, [hl]
	mov LOWW(_k_ipad)[bc], a
	movw ax, bc
	addw ax, de
	movw hl, ax
	mov a, #92
	xor a, [hl]
	mov LOWW(_k_opad)[bc], a
	incw bc
	movw ax, bc
	cmpw ax, #64
	bnz $.LBB5_8
; %bb.9:
	mov !LOWW(_g_sha_state), #106
	mov !LOWW(_g_sha_state+1), #9
	mov !LOWW(_g_sha_state+2), #-26
	mov !LOWW(_g_sha_state+3), #103
	mov !LOWW(_g_sha_state+4), #-69
	mov !LOWW(_g_sha_state+5), #103
	mov !LOWW(_g_sha_state+6), #-82
	mov !LOWW(_g_sha_state+7), #-123
	mov !LOWW(_g_sha_state+8), #60
	mov !LOWW(_g_sha_state+9), #110
	mov !LOWW(_g_sha_state+10), #-13
	mov !LOWW(_g_sha_state+11), #114
	mov !LOWW(_g_sha_state+12), #-91
	mov !LOWW(_g_sha_state+13), #79
	mov !LOWW(_g_sha_state+14), #-11
	mov !LOWW(_g_sha_state+15), #58
	mov !LOWW(_g_sha_state+16), #81
	mov !LOWW(_g_sha_state+17), #14
	mov !LOWW(_g_sha_state+18), #82
	mov !LOWW(_g_sha_state+19), #127
	mov !LOWW(_g_sha_state+20), #-101
	mov !LOWW(_g_sha_state+21), #5
	mov !LOWW(_g_sha_state+22), #104
	mov !LOWW(_g_sha_state+23), #-116
	mov !LOWW(_g_sha_state+24), #31
	mov !LOWW(_g_sha_state+25), #-125
	mov !LOWW(_g_sha_state+26), #-39
	mov !LOWW(_g_sha_state+27), #-85
	mov !LOWW(_g_sha_state+28), #91
	mov !LOWW(_g_sha_state+29), #-32
	mov !LOWW(_g_sha_state+30), #-51
	mov !LOWW(_g_sha_state+31), #25
	clrb !LOWW(_g_sha_buffer)
	clrb !LOWW(_g_sha_buffer+1)
	clrb !LOWW(_g_sha_buffer+2)
	clrb !LOWW(_g_sha_buffer+3)
	clrb !LOWW(_g_sha_buffer+4)
	clrb !LOWW(_g_sha_buffer+5)
	clrb !LOWW(_g_sha_buffer+6)
	clrb !LOWW(_g_sha_buffer+7)
	clrb !LOWW(_g_sha_buffer+8)
	clrb !LOWW(_g_sha_buffer+9)
	clrb !LOWW(_g_sha_buffer+10)
	clrb !LOWW(_g_sha_buffer+11)
	clrb !LOWW(_g_sha_buffer+12)
	clrb !LOWW(_g_sha_buffer+13)
	clrb !LOWW(_g_sha_buffer+14)
	clrb !LOWW(_g_sha_buffer+15)
	clrb !LOWW(_g_sha_buffer+16)
	clrb !LOWW(_g_sha_buffer+17)
	clrb !LOWW(_g_sha_buffer+18)
	clrb !LOWW(_g_sha_buffer+19)
	clrb !LOWW(_g_sha_buffer+20)
	clrb !LOWW(_g_sha_buffer+21)
	clrb !LOWW(_g_sha_buffer+22)
	clrb !LOWW(_g_sha_buffer+23)
	clrb !LOWW(_g_sha_buffer+24)
	clrb !LOWW(_g_sha_buffer+25)
	clrb !LOWW(_g_sha_buffer+26)
	clrb !LOWW(_g_sha_buffer+27)
	clrb !LOWW(_g_sha_buffer+28)
	clrb !LOWW(_g_sha_buffer+29)
	clrb !LOWW(_g_sha_buffer+30)
	clrb !LOWW(_g_sha_buffer+31)
	clrb !LOWW(_g_sha_buffer+32)
	clrb !LOWW(_g_sha_buffer+33)
	clrb !LOWW(_g_sha_buffer+34)
	clrb !LOWW(_g_sha_buffer+35)
	clrb !LOWW(_g_sha_buffer+36)
	clrb !LOWW(_g_sha_buffer+37)
	clrb !LOWW(_g_sha_buffer+38)
	clrb !LOWW(_g_sha_buffer+39)
	clrb !LOWW(_g_sha_buffer+40)
	clrb !LOWW(_g_sha_buffer+41)
	clrb !LOWW(_g_sha_buffer+42)
	clrb !LOWW(_g_sha_buffer+43)
	clrb !LOWW(_g_sha_buffer+44)
	clrb !LOWW(_g_sha_buffer+45)
	clrb !LOWW(_g_sha_buffer+46)
	clrb !LOWW(_g_sha_buffer+47)
	clrb !LOWW(_g_sha_buffer+48)
	clrb !LOWW(_g_sha_buffer+49)
	clrb !LOWW(_g_sha_buffer+50)
	clrb !LOWW(_g_sha_buffer+51)
	clrb !LOWW(_g_sha_buffer+52)
	clrb !LOWW(_g_sha_buffer+53)
	clrb !LOWW(_g_sha_buffer+54)
	clrb !LOWW(_g_sha_buffer+55)
	clrb !LOWW(_g_sha_buffer+56)
	clrb !LOWW(_g_sha_buffer+57)
	clrb !LOWW(_g_sha_buffer+58)
	clrb !LOWW(_g_sha_buffer+59)
	clrb !LOWW(_g_sha_buffer+60)
	clrb !LOWW(_g_sha_buffer+61)
	clrb !LOWW(_g_sha_buffer+62)
	clrb !LOWW(_g_sha_buffer+63)
	mov a, !LOWW(_g_sha_state)
	set1 !LOWW(_g_sha_state).4
	clr1 !LOWW(_g_sha_state).4
	mov !LOWW(_g_sha_state), a
	movw ax, #512
	movw !LOWW(_g_sha_bitcount), ax
	clrw ax
	movw [sp+32], ax
	movw !LOWW(_g_sha_bitcount+6), ax
	movw !LOWW(_g_sha_bitcount+4), ax
	movw !LOWW(_g_sha_bitcount+2), ax
	movw ax, #LOWW(_k_ipad)
	call !_sha256_transform
	movw ax, [sp+36]
	movw bc, ax
	movw ax, bc
	shlw ax, 3
	movw [sp+40], ax
	movw de, !LOWW(_g_sha_bitcount+2)
	movw ax, bc
	shrw ax, 13
	movw bc, ax
	movw ax, !LOWW(_g_sha_bitcount)
	xchw ax, de
	movw [sp+44], ax
	xchw ax, de
	movw de, !LOWW(_g_sha_bitcount+4)
	xchw ax, de
	movw [sp+42], ax
	xchw ax, de
	movw hl, !LOWW(_g_sha_bitcount+6)
	movw [sp+34], ax
	xchw ax, de
	movw ax, [sp+40]
	xchw ax, de
	addw ax, de
	movw [sp+40], ax
	movw ax, [sp+44]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	addc a, c
	xch a, x
	addc a, b
	movw bc, ax
	movw ax, [sp+42]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	addc a, #0
	xch a, x
	addc a, #0
	sknc ;#.LBB5_11
; %bb.10:
	incw hl
.LBB5_11:
	movw !LOWW(_g_sha_bitcount+4), ax
	movw ax, hl
	movw !LOWW(_g_sha_bitcount+6), ax
	movw ax, [sp+40]
	movw !LOWW(_g_sha_bitcount), ax
	movw ax, bc
	movw !LOWW(_g_sha_bitcount+2), ax
	movw ax, [sp+34]
	xchw ax, hl
	movw ax, [sp+38]
	xchw ax, hl
	xchw ax, de
	movw ax, [sp+36]
	xchw ax, de
	shrw ax, 3
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #63
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	sknz ;#.LBB5_29
	br $!.LBB5_29
; %bb.12:
	xchw ax, bc
	movw [sp+50], ax
	xchw ax, bc
	movw ax, #64
	subw ax, bc
	cmpw ax, de
	bnh $.LBB5_21
; %bb.13:
	movw ax, de
	cmpw ax, #0
	sknz ;#.LBB5_40
	br $!.LBB5_40
; %bb.14:
	cmpw ax, #8
	movw de, ax
	skc ;#.LBB5_16
	br $!.LBB5_16
; %bb.15:
	movw de, #0
	br $!.LBB5_18
.LBB5_21:
	movw [sp+32], ax
	movw ax, bc
	xch a, x
	xor a, #63
	xch a, x
	cmpw ax, #7
	bnc $.LBB5_23
; %bb.22:
	movw de, #0
	br $.LBB5_25
.LBB5_23:
	movw de, #0
	movw ax, bc
	movw bc, #LOWW(_g_sha_buffer+3)
	addw ax, bc
	movw [sp+42], ax
	movw ax, hl
	addw ax, #3
	movw [sp+44], ax
	movw ax, [sp+32]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #120
	xch a, x
	clrb a
	movw [sp+46], ax
.LBB5_24:                               ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+44]
	addw ax, de
	movw bc, ax
	addw ax, #-3
	push de
	pop hl
	xchw ax, hl
	movw [sp+34], ax
	xchw ax, hl
	movw de, ax
	mov a, [de]
	mov [sp+40], a
	movw ax, [sp+42]
	addw ax, hl
	movw de, ax
	addw ax, #-3
	movw hl, ax
	mov a, [sp+40]
	mov [hl], a
	movw ax, bc
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov [sp+40], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [sp+40]
	mov [hl], a
	push bc
	pop hl
	decw hl
	mov a, [hl]
	push de
	pop hl
	decw hl
	mov [hl], a
	push bc
	pop hl
	mov a, [hl]
	mov [de], a
	mov a, [hl+1]
	mov [de+1], a
	mov a, [hl+2]
	mov [de+2], a
	mov a, [hl+3]
	mov [de+3], a
	mov a, [hl+4]
	mov [de+4], a
	movw ax, [sp+34]
	addw ax, #8
	movw de, ax
	movw ax, [sp+46]
	cmpw ax, de
	bnz $.LBB5_24
.LBB5_25:
	movw ax, [sp+32]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	bz $.LBB5_28
; %bb.26:
	movw ax, [sp+38]
	addw ax, de
	movw hl, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+50]
	xchw ax, de
	addw ax, de
	movw de, #LOWW(_g_sha_buffer)
	addw ax, de
	movw de, ax
.LBB5_27:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB5_27
.LBB5_28:
	movw ax, #LOWW(_g_sha_buffer)
	call !_sha256_transform
	movw ax, [sp+38]
	movw hl, ax
	movw ax, [sp+36]
	movw de, ax
.LBB5_29:
	movw ax, [sp+32]
	movw bc, ax
	movw ax, bc
	addw ax, #63
	cmpw ax, de
	bnc $.LBB5_30
.LBB5_31:                               ; =>This Inner Loop Header: Depth=1
	xchw ax, bc
	movw [sp+32], ax
	xchw ax, bc
	movw ax, hl
	addw ax, bc
	call !_sha256_transform
	movw ax, [sp+38]
	movw hl, ax
	movw ax, [sp+32]
	movw de, ax
	movw ax, de
	addw ax, #64
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+36]
	xchw ax, de
	xchw ax, bc
	movw [sp+32], ax
	xchw ax, bc
	addw ax, #127
	cmpw ax, de
	bc $.LBB5_31
	br $.LBB5_32
.LBB5_30:
	movw ax, bc
	movw [sp+32], ax
.LBB5_32:
	push hl
	pop bc
	movw ax, [sp+32]
	movw hl, ax
	movw ax, de
	cmpw ax, hl
	skh ;#.LBB5_40
	br $!.LBB5_40
; %bb.33:
	movw ax, de
	xchw ax, de
	movw ax, [sp+32]
	xchw ax, de
	subw ax, de
	movw hl, ax
	xchw ax, hl
	movw [sp+40], ax
	xchw ax, hl
	decw ax
	cmpw ax, #7
	movw ax, de
	bnc $.LBB5_35
; %bb.34:
	movw de, #0
	br $.LBB5_37
.LBB5_35:
	movw de, #0
	addw ax, bc
	movw bc, ax
	movw ax, hl
	xch a, x
	and a, #248
	xch a, x
	movw [sp+34], ax
	movw ax, bc
	addw ax, #3
	movw [sp+36], ax
.LBB5_36:                               ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+36]
	addw ax, de
	push de
	pop bc
	movw de, ax
	addw ax, #-3
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer)[bc], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer+1)[bc], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+2)[bc], a
	push de
	pop hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+3)[bc], a
	mov a, [hl+1]
	mov LOWW(_g_sha_buffer+4)[bc], a
	mov a, [hl+2]
	mov LOWW(_g_sha_buffer+5)[bc], a
	mov a, [hl+3]
	mov LOWW(_g_sha_buffer+6)[bc], a
	mov a, [hl+4]
	mov LOWW(_g_sha_buffer+7)[bc], a
	movw ax, bc
	addw ax, #8
	movw de, ax
	movw ax, [sp+34]
	cmpw ax, de
	bnz $.LBB5_36
.LBB5_37:
	movw ax, [sp+40]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	movw ax, [sp+38]
	movw ax, [sp+32]
	movw hl, ax
	sknz ;#.LBB5_40
	br $!.LBB5_40
; %bb.38:
	movw ax, hl
	movw [sp+32], ax
	push de
	pop hl
	movw de, #LOWW(_g_sha_buffer)
	movw ax, hl
	addw ax, de
	movw de, ax
	movw ax, [sp+32]
	addw ax, hl
	xchw ax, hl
	movw ax, [sp+38]
	xchw ax, hl
	addw ax, hl
	movw hl, ax
.LBB5_39:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB5_39
	br $!.LBB5_40
.LBB5_16:
	movw bc, #LOWW(_g_sha_buffer+3)
	movw ax, [sp+50]
	addw ax, bc
	movw [sp+40], ax
	push de
	pop bc
	movw de, #0
	movw ax, hl
	addw ax, #3
	movw [sp+42], ax
	movw ax, bc
	xch a, x
	and a, #248
	xch a, x
	movw [sp+44], ax
.LBB5_17:                               ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+42]
	addw ax, de
	movw bc, ax
	addw ax, #-3
	push de
	pop hl
	xchw ax, hl
	movw [sp+32], ax
	xchw ax, hl
	movw de, ax
	mov a, [de]
	mov [sp+34], a
	movw ax, [sp+40]
	addw ax, hl
	movw de, ax
	addw ax, #-3
	movw hl, ax
	mov a, [sp+34]
	mov [hl], a
	movw ax, bc
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov [sp+34], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [sp+34]
	mov [hl], a
	push bc
	pop hl
	decw hl
	mov a, [hl]
	push de
	pop hl
	decw hl
	mov [hl], a
	push bc
	pop hl
	mov a, [hl]
	mov [de], a
	mov a, [hl+1]
	mov [de+1], a
	mov a, [hl+2]
	mov [de+2], a
	mov a, [hl+3]
	mov [de+3], a
	mov a, [hl+4]
	mov [de+4], a
	movw ax, [sp+32]
	addw ax, #8
	movw de, ax
	movw ax, [sp+44]
	cmpw ax, de
	bnz $.LBB5_17
.LBB5_18:
	movw ax, [sp+36]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	movw ax, [sp+38]
	bz $.LBB5_40
; %bb.19:
	addw ax, de
	movw hl, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+50]
	xchw ax, de
	addw ax, de
	movw de, #LOWW(_g_sha_buffer)
	addw ax, de
	movw de, ax
.LBB5_20:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB5_20
.LBB5_40:
	movw ax, sp
	call !_sha256_final
	mov !LOWW(_g_sha_state), #106
	mov !LOWW(_g_sha_state+1), #9
	mov !LOWW(_g_sha_state+2), #-26
	mov !LOWW(_g_sha_state+3), #103
	mov !LOWW(_g_sha_state+4), #-69
	mov !LOWW(_g_sha_state+5), #103
	mov !LOWW(_g_sha_state+6), #-82
	mov !LOWW(_g_sha_state+7), #-123
	mov !LOWW(_g_sha_state+8), #60
	mov !LOWW(_g_sha_state+9), #110
	mov !LOWW(_g_sha_state+10), #-13
	mov !LOWW(_g_sha_state+11), #114
	mov !LOWW(_g_sha_state+12), #-91
	mov !LOWW(_g_sha_state+13), #79
	mov !LOWW(_g_sha_state+14), #-11
	mov !LOWW(_g_sha_state+15), #58
	mov !LOWW(_g_sha_state+16), #81
	mov !LOWW(_g_sha_state+17), #14
	mov !LOWW(_g_sha_state+18), #82
	mov !LOWW(_g_sha_state+19), #127
	mov !LOWW(_g_sha_state+20), #-101
	mov !LOWW(_g_sha_state+21), #5
	mov !LOWW(_g_sha_state+22), #104
	mov !LOWW(_g_sha_state+23), #-116
	mov !LOWW(_g_sha_state+24), #31
	mov !LOWW(_g_sha_state+25), #-125
	mov !LOWW(_g_sha_state+26), #-39
	mov !LOWW(_g_sha_state+27), #-85
	mov !LOWW(_g_sha_state+28), #91
	mov !LOWW(_g_sha_state+29), #-32
	mov !LOWW(_g_sha_state+30), #-51
	mov !LOWW(_g_sha_state+31), #25
	clrb !LOWW(_g_sha_buffer)
	clrb !LOWW(_g_sha_buffer+1)
	clrb !LOWW(_g_sha_buffer+2)
	clrb !LOWW(_g_sha_buffer+3)
	clrb !LOWW(_g_sha_buffer+4)
	clrb !LOWW(_g_sha_buffer+5)
	clrb !LOWW(_g_sha_buffer+6)
	clrb !LOWW(_g_sha_buffer+7)
	clrb !LOWW(_g_sha_buffer+8)
	clrb !LOWW(_g_sha_buffer+9)
	clrb !LOWW(_g_sha_buffer+10)
	clrb !LOWW(_g_sha_buffer+11)
	clrb !LOWW(_g_sha_buffer+12)
	clrb !LOWW(_g_sha_buffer+13)
	clrb !LOWW(_g_sha_buffer+14)
	clrb !LOWW(_g_sha_buffer+15)
	clrb !LOWW(_g_sha_buffer+16)
	clrb !LOWW(_g_sha_buffer+17)
	clrb !LOWW(_g_sha_buffer+18)
	clrb !LOWW(_g_sha_buffer+19)
	clrb !LOWW(_g_sha_buffer+20)
	clrb !LOWW(_g_sha_buffer+21)
	clrb !LOWW(_g_sha_buffer+22)
	clrb !LOWW(_g_sha_buffer+23)
	clrb !LOWW(_g_sha_buffer+24)
	clrb !LOWW(_g_sha_buffer+25)
	clrb !LOWW(_g_sha_buffer+26)
	clrb !LOWW(_g_sha_buffer+27)
	clrb !LOWW(_g_sha_buffer+28)
	clrb !LOWW(_g_sha_buffer+29)
	clrb !LOWW(_g_sha_buffer+30)
	clrb !LOWW(_g_sha_buffer+31)
	clrb !LOWW(_g_sha_buffer+32)
	clrb !LOWW(_g_sha_buffer+33)
	clrb !LOWW(_g_sha_buffer+34)
	clrb !LOWW(_g_sha_buffer+35)
	clrb !LOWW(_g_sha_buffer+36)
	clrb !LOWW(_g_sha_buffer+37)
	clrb !LOWW(_g_sha_buffer+38)
	clrb !LOWW(_g_sha_buffer+39)
	clrb !LOWW(_g_sha_buffer+40)
	clrb !LOWW(_g_sha_buffer+41)
	clrb !LOWW(_g_sha_buffer+42)
	clrb !LOWW(_g_sha_buffer+43)
	clrb !LOWW(_g_sha_buffer+44)
	clrb !LOWW(_g_sha_buffer+45)
	clrb !LOWW(_g_sha_buffer+46)
	clrb !LOWW(_g_sha_buffer+47)
	clrb !LOWW(_g_sha_buffer+48)
	clrb !LOWW(_g_sha_buffer+49)
	clrb !LOWW(_g_sha_buffer+50)
	clrb !LOWW(_g_sha_buffer+51)
	clrb !LOWW(_g_sha_buffer+52)
	clrb !LOWW(_g_sha_buffer+53)
	clrb !LOWW(_g_sha_buffer+54)
	clrb !LOWW(_g_sha_buffer+55)
	clrb !LOWW(_g_sha_buffer+56)
	clrb !LOWW(_g_sha_buffer+57)
	clrb !LOWW(_g_sha_buffer+58)
	clrb !LOWW(_g_sha_buffer+59)
	clrb !LOWW(_g_sha_buffer+60)
	clrb !LOWW(_g_sha_buffer+61)
	clrb !LOWW(_g_sha_buffer+62)
	clrb !LOWW(_g_sha_buffer+63)
	mov a, !LOWW(_g_sha_state)
	set1 !LOWW(_g_sha_state).4
	clr1 !LOWW(_g_sha_state).4
	mov !LOWW(_g_sha_state), a
	movw ax, #512
	movw !LOWW(_g_sha_bitcount), ax
	clrw ax
	movw !LOWW(_g_sha_bitcount+6), ax
	movw !LOWW(_g_sha_bitcount+4), ax
	movw !LOWW(_g_sha_bitcount+2), ax
	movw ax, #LOWW(_k_opad)
	call !_sha256_transform
	movw bc, !LOWW(_g_sha_bitcount+2)
	movw hl, !LOWW(_g_sha_bitcount+4)
	movw de, !LOWW(_g_sha_bitcount+6)
	movw ax, !LOWW(_g_sha_bitcount)
	movw [sp+32], ax
	addw ax, #256
	movw [sp+34], ax
	movw ax, bc
	xch a, x
	addc a, #0
	xch a, x
	addc a, #0
	movw bc, ax
	movw ax, hl
	xch a, x
	addc a, #0
	xch a, x
	addc a, #0
	sknc ;#.LBB5_42
; %bb.41:
	incw de
.LBB5_42:
	movw !LOWW(_g_sha_bitcount+4), ax
	movw hl, #0
	movw ax, de
	movw !LOWW(_g_sha_bitcount+6), ax
	movw ax, [sp+34]
	movw !LOWW(_g_sha_bitcount), ax
	movw ax, bc
	movw !LOWW(_g_sha_bitcount+2), ax
	movw ax, [sp+32]
	shrw ax, 3
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #63
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	push hl
	pop de
	sknz ;#.LBB5_53
	br $!.LBB5_53
; %bb.43:
	movw ax, bc
	cmpw ax, #31
	sknh ;#.LBB5_45
	br $!.LBB5_45
; %bb.44:
	mov a, [sp+0]
	mov LOWW(_g_sha_buffer)[bc], a
	mov a, [sp+1]
	mov LOWW(_g_sha_buffer+1)[bc], a
	mov a, [sp+2]
	mov LOWW(_g_sha_buffer+2)[bc], a
	mov a, [sp+3]
	mov LOWW(_g_sha_buffer+3)[bc], a
	mov a, [sp+4]
	mov LOWW(_g_sha_buffer+4)[bc], a
	mov a, [sp+5]
	mov LOWW(_g_sha_buffer+5)[bc], a
	mov a, [sp+6]
	mov LOWW(_g_sha_buffer+6)[bc], a
	mov a, [sp+7]
	mov LOWW(_g_sha_buffer+7)[bc], a
	mov a, [sp+8]
	mov LOWW(_g_sha_buffer+8)[bc], a
	mov a, [sp+9]
	mov LOWW(_g_sha_buffer+9)[bc], a
	mov a, [sp+10]
	mov LOWW(_g_sha_buffer+10)[bc], a
	mov a, [sp+11]
	mov LOWW(_g_sha_buffer+11)[bc], a
	mov a, [sp+12]
	mov LOWW(_g_sha_buffer+12)[bc], a
	mov a, [sp+13]
	mov LOWW(_g_sha_buffer+13)[bc], a
	mov a, [sp+14]
	mov LOWW(_g_sha_buffer+14)[bc], a
	mov a, [sp+15]
	mov LOWW(_g_sha_buffer+15)[bc], a
	mov a, [sp+16]
	mov LOWW(_g_sha_buffer+16)[bc], a
	mov a, [sp+17]
	mov LOWW(_g_sha_buffer+17)[bc], a
	mov a, [sp+18]
	mov LOWW(_g_sha_buffer+18)[bc], a
	mov a, [sp+19]
	mov LOWW(_g_sha_buffer+19)[bc], a
	mov a, [sp+20]
	mov LOWW(_g_sha_buffer+20)[bc], a
	mov a, [sp+21]
	mov LOWW(_g_sha_buffer+21)[bc], a
	mov a, [sp+22]
	mov LOWW(_g_sha_buffer+22)[bc], a
	mov a, [sp+23]
	mov LOWW(_g_sha_buffer+23)[bc], a
	mov a, [sp+24]
	mov LOWW(_g_sha_buffer+24)[bc], a
	mov a, [sp+25]
	mov LOWW(_g_sha_buffer+25)[bc], a
	mov a, [sp+26]
	mov LOWW(_g_sha_buffer+26)[bc], a
	mov a, [sp+27]
	mov LOWW(_g_sha_buffer+27)[bc], a
	mov a, [sp+28]
	mov LOWW(_g_sha_buffer+28)[bc], a
	mov a, [sp+29]
	mov LOWW(_g_sha_buffer+29)[bc], a
	mov a, [sp+30]
	mov LOWW(_g_sha_buffer+30)[bc], a
	mov a, [sp+31]
	mov LOWW(_g_sha_buffer+31)[bc], a
	br $!.LBB5_59
.LBB5_45:
	xchw ax, bc
	movw [sp+44], ax
	xchw ax, bc
	movw ax, #64
	subw ax, bc
	movw hl, ax
	xchw ax, hl
	movw [sp+42], ax
	xchw ax, hl
	movw ax, bc
	xch a, x
	xor a, #63
	xch a, x
	cmpw ax, #7
	bnc $.LBB5_47
; %bb.46:
	movw de, #0
	br $.LBB5_49
.LBB5_47:
	movw de, #LOWW(_g_sha_buffer+3)
	movw ax, bc
	addw ax, de
	movw [sp+36], ax
	movw de, #0
	movw ax, sp
	addw ax, #3
	movw [sp+38], ax
	movw ax, hl
	xch a, x
	and a, #120
	xch a, x
	clrb a
	movw [sp+40], ax
.LBB5_48:                               ; =>This Inner Loop Header: Depth=1
	movw ax, sp
	addw ax, de
	movw hl, ax
	mov a, [hl]
	mov [sp+34], a
	movw ax, [sp+36]
	xchw ax, de
	movw [sp+32], ax
	xchw ax, de
	addw ax, de
	movw bc, ax
	addw ax, #-3
	movw hl, ax
	mov a, [sp+34]
	mov [hl], a
	movw ax, [sp+38]
	addw ax, de
	movw de, ax
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov [sp+34], a
	movw ax, bc
	decw ax
	decw ax
	movw hl, ax
	mov a, [sp+34]
	mov [hl], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	push bc
	pop hl
	decw hl
	mov [hl], a
	push de
	pop hl
	mov a, [hl]
	push bc
	pop hl
	mov [hl], a
	push de
	pop hl
	mov a, [hl+1]
	push bc
	pop hl
	mov [hl+1], a
	push de
	pop hl
	mov a, [hl+2]
	push bc
	pop hl
	mov [hl+2], a
	push de
	pop hl
	mov a, [hl+3]
	push bc
	pop hl
	mov [hl+3], a
	push de
	pop hl
	mov a, [hl+4]
	push bc
	pop hl
	mov [hl+4], a
	movw ax, [sp+32]
	addw ax, #8
	movw de, ax
	movw ax, [sp+40]
	cmpw ax, de
	bnz $.LBB5_48
.LBB5_49:
	movw ax, [sp+42]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw hl, ax
	cmpw ax, #0
	bz $.LBB5_52
; %bb.50:
	movw ax, sp
	addw ax, de
	movw bc, ax
	movw ax, de
	xchw ax, de
	movw ax, [sp+44]
	xchw ax, de
	addw ax, de
	movw de, #LOWW(_g_sha_buffer)
	addw ax, de
	movw de, ax
.LBB5_51:                               ; =>This Inner Loop Header: Depth=1
	movw ax, hl
	movw [sp+32], ax
	push bc
	pop hl
	mov a, [hl]
	push de
	pop hl
	mov [hl], a
	movw ax, [sp+32]
	movw hl, ax
	incw bc
	incw de
	decw hl
	movw ax, hl
	cmpw ax, #0
	bnz $.LBB5_51
.LBB5_52:
	movw ax, #LOWW(_g_sha_buffer)
	call !_sha256_transform
	movw hl, #0
	movw ax, [sp+44]
	xchw ax, de
	movw ax, [sp+42]
	xchw ax, de
	cmpw ax, #33
	sknc ;#.LBB5_59
	br $!.LBB5_59
.LBB5_53:
	movw ax, #32
	subw ax, de
	movw [sp+36], ax
	xchw ax, de
	movw [sp+42], ax
	xchw ax, de
	movw ax, de
	addw ax, #-25
	cmpw ax, #7
	bc $.LBB5_56
; %bb.54:
	movw ax, [sp+42]
	movw bc, ax
	movw ax, sp
	addw ax, bc
	movw bc, ax
	movw ax, [sp+36]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #248
	xch a, x
	movw [sp+32], ax
	movw ax, bc
	addw ax, #3
	movw [sp+34], ax
.LBB5_55:                               ; =>This Inner Loop Header: Depth=1
	movw ax, [sp+34]
	addw ax, hl
	movw de, ax
	addw ax, #-3
	push hl
	pop bc
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer)[bc], a
	movw ax, de
	decw ax
	decw ax
	movw hl, ax
	mov a, [hl]
	mov LOWW(_g_sha_buffer+1)[bc], a
	push de
	pop hl
	decw hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+2)[bc], a
	push de
	pop hl
	mov a, [hl]
	mov LOWW(_g_sha_buffer+3)[bc], a
	mov a, [hl+1]
	mov LOWW(_g_sha_buffer+4)[bc], a
	mov a, [hl+2]
	mov LOWW(_g_sha_buffer+5)[bc], a
	mov a, [hl+3]
	mov LOWW(_g_sha_buffer+6)[bc], a
	mov a, [hl+4]
	mov LOWW(_g_sha_buffer+7)[bc], a
	movw ax, bc
	addw ax, #8
	movw hl, ax
	movw ax, [sp+32]
	cmpw ax, hl
	bnz $.LBB5_55
.LBB5_56:
	movw ax, [sp+36]
                                        ; kill: def $rp0 killed $rp0 def $r1 def $r0
	xch a, x
	and a, #7
	xch a, x
	clrb a
	movw bc, ax
	cmpw ax, #0
	movw ax, [sp+42]
	bz $.LBB5_59
; %bb.57:
	movw de, #LOWW(_g_sha_buffer)
	movw ax, hl
	addw ax, de
	movw de, ax
	movw ax, [sp+42]
	addw ax, hl
	movw hl, ax
	movw ax, sp
	addw ax, hl
	movw hl, ax
.LBB5_58:                               ; =>This Inner Loop Header: Depth=1
	decw bc
	mov a, [hl]
	incw hl
	mov [de], a
	incw de
	movw ax, bc
	cmpw ax, #0
	bnz $.LBB5_58
.LBB5_59:
	movw ax, [sp+48]
	call !_sha256_final
	addw sp, #52
	ret
.Lfunc_end5:
	.size	_hmac_sha256, .Lfunc_end5-_hmac_sha256
                                        ; -- End function
	.globl	_run_hmac_benchmark             ; -- Begin function run_hmac_benchmark
	.type	_run_hmac_benchmark,@function
_run_hmac_benchmark:                    ; @run_hmac_benchmark
; %bb.0:
	subw sp, #42
	clrw bc
	clrw ax
	movw [sp+40], ax
	br $.LBB6_1
.LBB6_3:                                ;   in Loop: Header=BB6_1 Depth=1
	movw ax, hl
	cmpw ax, #2
	movw ax, de
	sknz
	cmpw ax, #-23809
	movw ax, [sp+40]
	skc ;#.LBB6_4
	br $!.LBB6_4
.LBB6_1:                                ; =>This Inner Loop Header: Depth=1
	movw [sp+38], ax
	xchw ax, bc
	movw [sp+36], ax
	xchw ax, bc
	mov a, c
	add a, #63
	mov !LOWW(_sensor_buffer+63), a
	mov a, c
	add a, #62
	mov !LOWW(_sensor_buffer+62), a
	mov a, c
	add a, #61
	mov !LOWW(_sensor_buffer+61), a
	mov a, c
	add a, #60
	mov !LOWW(_sensor_buffer+60), a
	mov a, c
	add a, #59
	mov !LOWW(_sensor_buffer+59), a
	mov a, c
	add a, #58
	mov !LOWW(_sensor_buffer+58), a
	mov a, c
	add a, #57
	mov !LOWW(_sensor_buffer+57), a
	mov a, c
	add a, #56
	mov !LOWW(_sensor_buffer+56), a
	mov a, c
	add a, #55
	mov !LOWW(_sensor_buffer+55), a
	mov a, c
	add a, #54
	mov !LOWW(_sensor_buffer+54), a
	mov a, c
	add a, #53
	mov !LOWW(_sensor_buffer+53), a
	mov a, c
	add a, #52
	mov !LOWW(_sensor_buffer+52), a
	mov a, c
	add a, #51
	mov !LOWW(_sensor_buffer+51), a
	mov a, c
	add a, #50
	mov !LOWW(_sensor_buffer+50), a
	mov a, c
	add a, #49
	mov !LOWW(_sensor_buffer+49), a
	mov a, c
	add a, #48
	mov !LOWW(_sensor_buffer+48), a
	mov a, c
	add a, #47
	mov !LOWW(_sensor_buffer+47), a
	mov a, c
	add a, #46
	mov !LOWW(_sensor_buffer+46), a
	mov a, c
	add a, #45
	mov !LOWW(_sensor_buffer+45), a
	mov a, c
	add a, #44
	mov !LOWW(_sensor_buffer+44), a
	mov a, c
	add a, #43
	mov !LOWW(_sensor_buffer+43), a
	mov a, c
	add a, #42
	mov !LOWW(_sensor_buffer+42), a
	mov a, c
	add a, #41
	mov !LOWW(_sensor_buffer+41), a
	mov a, c
	add a, #40
	mov !LOWW(_sensor_buffer+40), a
	mov a, c
	add a, #39
	mov !LOWW(_sensor_buffer+39), a
	mov a, c
	add a, #38
	mov !LOWW(_sensor_buffer+38), a
	mov a, c
	add a, #37
	mov !LOWW(_sensor_buffer+37), a
	mov a, c
	add a, #36
	mov !LOWW(_sensor_buffer+36), a
	mov a, c
	add a, #35
	mov !LOWW(_sensor_buffer+35), a
	mov a, c
	add a, #34
	mov !LOWW(_sensor_buffer+34), a
	mov a, c
	add a, #33
	mov !LOWW(_sensor_buffer+33), a
	mov a, c
	add a, #32
	mov !LOWW(_sensor_buffer+32), a
	mov a, c
	add a, #31
	mov !LOWW(_sensor_buffer+31), a
	mov a, c
	add a, #30
	mov !LOWW(_sensor_buffer+30), a
	mov a, c
	add a, #29
	mov !LOWW(_sensor_buffer+29), a
	mov a, c
	add a, #28
	mov !LOWW(_sensor_buffer+28), a
	mov a, c
	add a, #27
	mov !LOWW(_sensor_buffer+27), a
	mov a, c
	add a, #26
	mov !LOWW(_sensor_buffer+26), a
	mov a, c
	add a, #25
	mov !LOWW(_sensor_buffer+25), a
	mov a, c
	add a, #24
	mov !LOWW(_sensor_buffer+24), a
	mov a, c
	add a, #23
	mov !LOWW(_sensor_buffer+23), a
	mov a, c
	add a, #22
	mov !LOWW(_sensor_buffer+22), a
	mov a, c
	add a, #21
	mov !LOWW(_sensor_buffer+21), a
	mov a, c
	add a, #20
	mov !LOWW(_sensor_buffer+20), a
	mov a, c
	add a, #19
	mov !LOWW(_sensor_buffer+19), a
	mov a, c
	add a, #18
	mov !LOWW(_sensor_buffer+18), a
	mov a, c
	add a, #17
	mov !LOWW(_sensor_buffer+17), a
	mov a, c
	add a, #16
	mov !LOWW(_sensor_buffer+16), a
	mov a, c
	add a, #15
	mov !LOWW(_sensor_buffer+15), a
	mov a, c
	add a, #14
	mov !LOWW(_sensor_buffer+14), a
	mov a, c
	add a, #13
	mov !LOWW(_sensor_buffer+13), a
	mov a, c
	add a, #12
	mov !LOWW(_sensor_buffer+12), a
	mov a, c
	add a, #11
	mov !LOWW(_sensor_buffer+11), a
	mov a, c
	add a, #10
	mov !LOWW(_sensor_buffer+10), a
	mov a, c
	add a, #9
	mov !LOWW(_sensor_buffer+9), a
	mov a, c
	add a, #8
	mov !LOWW(_sensor_buffer+8), a
	mov a, c
	add a, #7
	mov !LOWW(_sensor_buffer+7), a
	mov a, c
	add a, #6
	mov !LOWW(_sensor_buffer+6), a
	mov a, c
	add a, #5
	mov !LOWW(_sensor_buffer+5), a
	mov a, c
	add a, #4
	mov !LOWW(_sensor_buffer+4), a
	mov a, c
	add a, #3
	mov !LOWW(_sensor_buffer+3), a
	mov a, c
	add a, #2
	mov !LOWW(_sensor_buffer+2), a
	mov a, c
	mov !LOWW(_sensor_buffer), a
	inc a
	mov !LOWW(_sensor_buffer+1), a
	movw de, #LOWW(_sensor_buffer)
	movw bc, #32
	movw ax, sp
	addw ax, #4
	movw [sp+2], ax
	movw ax, #64
	movw [sp+0], ax
	movw ax, #LOWW(_secret_key)
	call !_hmac_sha256
	movw ax, [sp+38]
	movw hl, ax
	movw ax, [sp+36]
	movw de, ax
	movw ax, de
	addw ax, #1
	movw bc, ax
	skc ;#.LBB6_3
	br $!.LBB6_3
; %bb.2:                                ;   in Loop: Header=BB6_1 Depth=1
	movw ax, hl
	incw ax
	movw [sp+40], ax
	br $!.LBB6_3
.LBB6_4:
	addw sp, #42
	ret
.Lfunc_end6:
	.size	_run_hmac_benchmark, .Lfunc_end6-_run_hmac_benchmark
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	call !_run_hmac_benchmark
	clrw ax
	ret
.Lfunc_end7:
	.size	_main, .Lfunc_end7-_main
                                        ; -- End function
	.type	_g_sha_bitcount,@object         ; @g_sha_bitcount
	.section	.bss,"aw",@nobits
	.globl	_g_sha_bitcount
	.p2align	1, 0x0
_g_sha_bitcount:
	.long	0                               ; 0x0
	.long	0
	.size	_g_sha_bitcount, 8

	.type	_g_sha_buffer,@object           ; @g_sha_buffer
	.globl	_g_sha_buffer
_g_sha_buffer:
	.skip	64
	.size	_g_sha_buffer, 64

	.type	_g_sha_state,@object            ; @g_sha_state
	.globl	_g_sha_state
_g_sha_state:
	.skip	32
	.size	_g_sha_state, 32

	.type	_k_ipad,@object                 ; @k_ipad
	.globl	_k_ipad
_k_ipad:
	.skip	64
	.size	_k_ipad, 64

	.type	_k_opad,@object                 ; @k_opad
	.globl	_k_opad
_k_opad:
	.skip	64
	.size	_k_opad, 64

	.type	_sensor_buffer,@object          ; @sensor_buffer
	.globl	_sensor_buffer
_sensor_buffer:
	.skip	64
	.size	_sensor_buffer, 64

	.type	_secret_key,@object             ; @secret_key
	.section	.rodata,"a",@progbits
_secret_key:
	.skip	32,11
	.size	_secret_key, 32

	.type	_K,@object                      ; @K
	.p2align	1, 0x0
_K:
	.long	1116352408                      ; 0x428a2f98
	.long	1899447441                      ; 0x71374491
	.long	3049323471                      ; 0xb5c0fbcf
	.long	3921009573                      ; 0xe9b5dba5
	.long	961987163                       ; 0x3956c25b
	.long	1508970993                      ; 0x59f111f1
	.long	2453635748                      ; 0x923f82a4
	.long	2870763221                      ; 0xab1c5ed5
	.long	3624381080                      ; 0xd807aa98
	.long	310598401                       ; 0x12835b01
	.long	607225278                       ; 0x243185be
	.long	1426881987                      ; 0x550c7dc3
	.long	1925078388                      ; 0x72be5d74
	.long	2162078206                      ; 0x80deb1fe
	.long	2614888103                      ; 0x9bdc06a7
	.long	3248222580                      ; 0xc19bf174
	.long	3835390401                      ; 0xe49b69c1
	.long	4022224774                      ; 0xefbe4786
	.long	264347078                       ; 0xfc19dc6
	.long	604807628                       ; 0x240ca1cc
	.long	770255983                       ; 0x2de92c6f
	.long	1249150122                      ; 0x4a7484aa
	.long	1555081692                      ; 0x5cb0a9dc
	.long	1996064986                      ; 0x76f988da
	.long	2554220882                      ; 0x983e5152
	.long	2821834349                      ; 0xa831c66d
	.long	2952996808                      ; 0xb00327c8
	.long	3210313671                      ; 0xbf597fc7
	.long	3336571891                      ; 0xc6e00bf3
	.long	3584528711                      ; 0xd5a79147
	.long	113926993                       ; 0x6ca6351
	.long	338241895                       ; 0x14292967
	.long	666307205                       ; 0x27b70a85
	.long	773529912                       ; 0x2e1b2138
	.long	1294757372                      ; 0x4d2c6dfc
	.long	1396182291                      ; 0x53380d13
	.long	1695183700                      ; 0x650a7354
	.long	1986661051                      ; 0x766a0abb
	.long	2177026350                      ; 0x81c2c92e
	.long	2456956037                      ; 0x92722c85
	.long	2730485921                      ; 0xa2bfe8a1
	.long	2820302411                      ; 0xa81a664b
	.long	3259730800                      ; 0xc24b8b70
	.long	3345764771                      ; 0xc76c51a3
	.long	3516065817                      ; 0xd192e819
	.long	3600352804                      ; 0xd6990624
	.long	4094571909                      ; 0xf40e3585
	.long	275423344                       ; 0x106aa070
	.long	430227734                       ; 0x19a4c116
	.long	506948616                       ; 0x1e376c08
	.long	659060556                       ; 0x2748774c
	.long	883997877                       ; 0x34b0bcb5
	.long	958139571                       ; 0x391c0cb3
	.long	1322822218                      ; 0x4ed8aa4a
	.long	1537002063                      ; 0x5b9cca4f
	.long	1747873779                      ; 0x682e6ff3
	.long	1955562222                      ; 0x748f82ee
	.long	2024104815                      ; 0x78a5636f
	.long	2227730452                      ; 0x84c87814
	.long	2361852424                      ; 0x8cc70208
	.long	2428436474                      ; 0x90befffa
	.long	2756734187                      ; 0xa4506ceb
	.long	3204031479                      ; 0xbef9a3f7
	.long	3329325298                      ; 0xc67178f2
	.size	_K, 256

	.ident	"LLVM for Renesas RL78 (internal) clang version 17.0.1 (https://gitlab.global.renesas.com/compiler_dev/llvm-project.git d6c95d91149a5743cdab75e41a29823d577b99e1)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _g_sha_buffer
	.addrsig_sym _g_sha_state
	.addrsig_sym _k_ipad
	.addrsig_sym _k_opad
	.addrsig_sym _sensor_buffer
	.addrsig_sym _secret_key
