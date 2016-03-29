
; Additional opcodes on the RCM4000

	defc	value32 = 23560 * 60000
	defc	value16 = 23560
	defc	value8 = 29
	defc	offs = 30
	defc	addr16 = 49150
	defc	addr24 = 80000


; Flow control
	call	(hl)		; ea
	call	(ix)		; dd ea
	call	(iy)		; fd ea
l_dwjnz:
	dwjnz	l_dwjnz		; ed 10 ..
	altd dwjnz	l_dwjnz	; 76 ed 10 ..

	cbm	value8		; ed 00 ..

	clr	hl		; bf
	clr	hl'		; 76 bf
	altd clr	hl	; 76 bf

	copy			; ed 80
	copyr			; ed 88


	cp	hl,de		; ed 48
	cp	hl',de		; 76 ed 48
	altd cp	hl,de		; 76 ed 48

	cp	hl,value8	; 48 ..
	cp	hl',value8	; 76 48 ..
	altd cp	hl,value8	; 76 48 ..


	ex	bc,hl		; b3
	ex	bc,hl'		; 76 b3
	ex	bc',hl		; ed 74
	ex	bc',hl'		; 76 ed 74

	exp			; ed d9
	fsyscall		; ed 55
	
	ibox	a		; ed 12
	ibox	a'		; 76 ed 12
	altd ibox	a	; 76 ed 12

	idet			; 5b


	mulu			; a7

	neg	hl		; 44
	neg	hl'		; 76 44
	altd neg		; 76 44

	sbox	a		; ed 02
	setsysp value16		; ed b1 .. ..
	setusrp	value16		; ed bf .. ..
	sysret			; ed 83

	flag	nz,hl		; ed c4
	flag	z,hl		; ed dc
	flag	nc,hl		; ed d4
	flag	c,hl		; ed dc
	flag	gt,hl		; ed a4
	flag	gtu,hl		; ed ac
	flag	lt,hl		; ed b4
	flag	v,hl		; ed bc

	push	su		; ed 66
	pop	su		; ed 6f

	ld	a,htr		; ed 50
	ld	htr,a		; ed 40
; jr, jre, jp


; Extra 16 bit operations
	ld	hl,bc		; 81
	ld	hl',bc		; 76 81 --- clashes with RCM2000 instr
	altd ld	hl,bc		; 76 81
	ld	bc,hl		; 91
	ld	bc',hl		; 76 91
	altd ld	bc,hl		; 76 91

	ld	hl,de		; a1
	ld	hl',de		; 76 a1
	altd ld	hl,de		; 76 a1

	ld	de,hl		; b1
	ld	de',hl		; 76 b1
	altd ld	de,hl		; 76 b1

	ld	hl,(sp+hl)	; ed fe
	ld	hl',(sp+hl)	; 76 ed fe
	altd ld	hl,(sp+hl)	; 76 ed fe

	push	value16		; ed a5 .. ..

	rl	bc		; 62
	rl	bc'		; 76 62
	altd rl	bc		; 76 62
	rl	hl		; 42
	rl	hl'		; 76 42
	altd rl	hl		; 76 42
	rlc	de		; 50
	rlc	de'		; 76 50
	altd rlc de		; 76 50
	rlc	bc		; 60
	rlc	bc'		; 76 60
	altd rlc bc		; 76 60
	rr	bc		; 63
	rr	bc'		; 76 63
	altd rr	bc		; 76 63
	rrc	bc		; 61
	rrc	bc'		; 76 61
	altd rrc bc		; 76 61
	rrc	de		; 51
	rrc	de'		; 76 51
	altd rrc de		; 76 51

	sub	hl,de		; 55
	sub	hl',de		; 76 55
	altd sub	hl,de	; 76 55
	sub	hl,jk		; 45
	sub	hl',jk		; 76 45
	altd sub	hl,jk	; 76 45

	test	hl		; 4c
	test	ix		; dd 4c
	test	iy		; fd 4c
	test	bc		; ed 4c

	xor	hl,de		; 54
	xor	hl',de		; 76 54
	altd xor	hl,de	; 76 54


; 16 bit operations on jk
	add	hl,jk		; 65
	add	hl',jk		; 76 65
	altd add	hl,jk	; 76 65

	ex	jk,hl		; b9
	ex	jk',hl		; ed 7c

	ld	jk,value16	; a9 .. ..
	ld	jk',value16	; 76 a9 .. ..
	altd ld	jk,value16	; 76 a9 .. ..

	ld	(addr16),jk	; 89 .. ..
	ld	jk,(addr16)	; 99 .. ..
	ld	jk',(addr16)	; 76 99 .. ..
	altd ld	jk,(addr16)	; 76 99 .. ..

; 32 bit operations on bcde/jkhk

	ld	bcde,(hl)	; dd 1a
	ld	bcde',(hl)	; 76 dd 1a
	altd ld	bcde,(hl)	; 76 dd 1a
	ld	(hl),bcde	; dd 1b
	ld	bcde,(addr16)	; 93 .. ..
	ld	(addr16),bcde	; 83 .. ..
	ld	bcde,value8	; a3 ..
	ld	bcde,(sp+hl)	; dd fe
	ld	bcde,(sp+offs)	; dd ee ..
	ld	bcde,(ix+offs)  ; dd ce ..
	ld	bcde,(iy+offs)  ; dd de ..
	ld	(sp+offs),bcde	; dd ef ..
	neg	bcde		; dd 4d
	pop	bcde		; dd f1
	push	bcde		; dd f5
	rlb	a,bcde		; dd 6f
	rrb	a,bcde		; dd 7f
	test	bcde		; dd 5c

	ld	jkhl,(hl)	; fd 1a
	ld	jkhl',(hl)	; 76 fd 1a
	altd ld	jkhl,(hl)	; 76 fd 1a
	ld	(hl),jkhl	; fd 1b
	ld	jkhl,(addr16)	; 94 .. ..
	ld	(addr16),jkhl	; 84 .. ..
	ld	jkhl,value8	; a4 ..
	ld	jkhl,(sp+hl)	; fd fe
	ld	jkhl,(sp+offs)	; fd ee ..
	ld	jkhl,(ix+offs)  ; fd ce ..
	ld	jkhl,(iy+offs)  ; fd de ..
	ld	(sp+offs),jkhl	; fd ef ..
	neg	jkhl		; fd 4d
	pop	jkhl		; fd f1
	push	jkhl		; fd f5
	rlb	a,jkhl		; fd 6f
	rrb	a,jkhl		; fd 7f
	test	jkhl		; fd 5c

	add	jkhl,bcde	; ed c6
	add	jkhl',bcde	; 76 ed c6
	altd add	jkhl,bcde	; 76 ed c6
	and	jkhl,bcde	; ed e6
	and	jkhl',bcde	; 76 ed e6
	altd and	jkhl,bcde	; 76 ed e6
	cp	jkhl,bcde	; ed 58
	cp	jkhl',bcde	; 76 ed 58
	altd cp	jkhl,bcde	; 76 ed 58
	ex	jkhl,bcde	; b4
	or	jkhl,bcde	; ed f6
	or	jkhl',bcde	; ed f6
	altd or	jkhl,bcde	; ed f6
	sub	jkhl,bcde	; ed d6
	xor	jkhl,bcde	; ed ee
	xor	jkhl',bcde	; 76 ed ee
	altd xor	jkhl,bcde	; 76 ed ee

; 32 bit index register operations
	ld	a,(pw+hl)	; 8b
	ld	a,(px+hl)	; 9b
	ld	a,(py+hl)	; ab
	ld	a,(pz+hl)	; bb
	ld	a',(pw+hl)	; 76 8b
	altd ld	a,(pw+hl)	; 76 8b

	ld	a,(pw+offs)	; 8d ..
	ld	a,(px+offs)	; 9d ..
	ld	a,(py+offs)	; ad ..
	ld	a,(pz+offs)	; bd ..
	ld	a',(pw+offs)	; 76 8d ..
	altd ld	a,(pw+offs)	; 76 8d ..

	ld	(pw+hl),a	; 8c
	ld	(px+hl),a	; 9c
	ld	(py+hl),a	; ac
	ld	(pz+hl),a	; bc

	ld	(pw+offs),a	; 8e ..
	ld	(px+offs),a	; 9e ..
	ld	(py+offs),a	; ae .. 
	ld	(pz+offs),a	; be ..

	ld	hl,(pw+bc)	; ed 06
	ld	hl,(px+bc)	; ed 16
	ld	hl,(py+bc)	; ed 26
	ld	hl,(pz+bc)	; ed 36
	ld	hl',(pw+bc)	; 76 ed 06
	altd ld	hl,(pw+bc)	; 76 ed 06

	ld	(pw+bc),hl	; ed 07
	ld	(px+bc),hl	; ed 17
	ld	(py+bc),hl	; ed 27
	ld	(pz+bc),hl	; ed 37

	ld	hl,(pw+offs)	; 85 ..	
	ld	hl,(px+offs)	; 95 ..	
	ld	hl,(py+offs)	; a5 ..	
	ld	hl,(pz+offs)	; b5 ..	
	ld	hl',(pw+offs)	; 76 85 ..	
	altd ld	hl,(pw+offs)	; 76 85 ..	

	ld	(pw+offs),hl	; 86 ..
	ld	(px+offs),hl	; 96 ..
	ld	(py+offs),hl	; a6 ..
	ld	(pz+offs),hl	; b6 ..
	
	ld	pw,(sp+offs)	; ed 04
	ld	px,(sp+offs)	; ed 14
	ld	py,(sp+offs)	; ed 24
	ld	pz,(sp+offs)	; ed 34

	ld	(sp+offs),pw	; ed 05
	ld	(sp+offs),px	; ed 15
	ld	(sp+offs),py	; ed 25
	ld	(sp+offs),pz	; ed 35

	ld	bcde,(pw+hl)	; dd 0c
	ld	bcde,(px+hl)	; dd 1c
	ld	bcde,(py+hl)	; dd 2c
	ld	bcde,(pz+hl)	; dd 3c
	ld	bcde',(pw+hl)	; 76 dd 0c
	altd ld	bcde,(pw+hl)	; 76 dd 0c
	ld	bcde,(pw+offs)	; dd 0e
	ld	bcde,(px+offs)	; dd 1e
	ld	bcde,(py+offs)	; dd 2e
	ld	bcde,(pz+offs)	; dd 3e
	ld	bcde',(pw+offs)	; 76 dd 0e
	altd ld	bcde,(pw+offs)	; 76 dd 0e
	ld	bcde,pw		; dd cd
	ld	bcde,px		; dd dd
	ld	bcde,py		; dd ed
	ld	bcde,pz		; dd fd
	ld	(pw+hl),bcde	; dd 0d
	ld	(px+hl),bcde	; dd 1d
	ld	(py+hl),bcde	; dd 2d
	ld	(pz+hl),bcde	; dd 3d
	ld	(pw+offs),bcde	; dd 0f ..
	ld	(px+offs),bcde	; dd 1f ..
	ld	(py+offs),bcde	; dd 2f ..
	ld	(pz+offs),bcde	; dd 3f ..


	ld	jkhl,(pw+hl)	; fd 0c
	ld	jkhl,(px+hl)	; fd 1c
	ld	jkhl,(py+hl)	; fd 2c
	ld	jkhl,(pz+hl)	; fd 3c
	ld	jkhl',(pw+hl)	; 76 fd 0c
	altd ld	jkhl,(pw+hl)	; 76 fd 0c
	ld	jkhl,(pw+offs)	; fd 0e
	ld	jkhl,(px+offs)	; fd 1e
	ld	jkhl,(py+offs)	; fd 2e
	ld	jkhl,(pz+offs)	; fd 3e
	ld	jkhl',(pw+offs)	; 76 fd 0e
	altd ld	jkhl,(pw+offs)	; 76 fd 0e
	ld	jkhl,pw		; fd cd
	ld	jkhl,px		; fd dd
	ld	jkhl,py		; fd ed
	ld	jkhl,pz		; fd fd
	ld	(pw+hl),jkhl	; fd 0d
	ld	(px+hl),jkhl	; fd 1d
	ld	(py+hl),jkhl	; fd 2d
	ld	(pz+hl),jkhl	; fd 3d
	ld	(pw+offs),jkhl	; fd 0f ..
	ld	(px+offs),jkhl	; fd 1f ..
	ld	(py+offs),jkhl	; fd 2f ..
	ld	(pz+offs),jkhl	; fd 3f ..


	push	pw		; ed c5
	push	px		; ed d5
	push	py		; ed e5
	push	pz		; ed f5
	pop 	pw		; ed c1
	pop 	px		; ed d1
	pop 	py		; ed e1
	pop 	pz		; ed f1

	ldl	pw,de		; dd 8f
	ldl	px,de		; dd 9f
	ldl	py,de		; dd af
	ldl	pz,de		; dd bf
	ldl	pw',de		; 76 dd 8f
	altd ldl	pw,de	; 76 dd 8f
	ldl	pw,hl		; fd 8f
	ldl	px,hl		; fd 9f
	ldl	py,hl		; fd af
	ldl	pz,hl		; fd bf
	ldl	pw',hl		; 76 fd 8f
	altd ldl	pw,hl	; 76 fd 8f
	ldl	pw,ix		; dd 8c
	ldl	px,ix		; dd 9c
	ldl	py,ix		; dd ac
	ldl	pz,ix		; dd bc
	ldl	pw',ix		; 76 dd 8c
	altd ldl	pw,ix	; 76 dd 8c
	ldl	pw,iy		; fd 8c
	ldl	px,iy		; fd 9c
	ldl	py,iy		; fd ac
	ldl	pz,iy		; fd bc
	ldl	pw',iy		; 76 fd 8c
	altd ldl	pw,iy	; 76 fd 8c
	ldl	pw,value16	; ed 0d .. ..
	ldl	px,value16	; ed 1d .. ..
	ldl	py,value16	; ed 2d .. ..
	ldl	pz,value16	; ed 3d .. ..
	ldl	pw',value16	; 76 ed 0d .. ..
	altd ldl	pw,value16	; 76 ed 0d .. ..
	ldl	pw,(sp+offs)	; ed 03 ..
	ldl	px,(sp+offs)	; ed 13 ..
	ldl	py,(sp+offs)	; ed 23 ..
	ldl	pz,(sp+offs)	; ed 33 ..
	ldl	pw',(sp+offs)	; 76 ed 03 ..
	altd ldl	pw,(sp+offs)	; 76 ed 03 ..

	ld	pw,bcde		; dd 8d
	ld	px,bcde		; dd 9d
	ld	py,bcde		; dd ad
	ld	pz,bcde		; dd bd
	ld	pw,jkhl		; fd 8d
	ld	px,jkhl		; fd 9d
	ld	py,jkhl		; fd ad
	ld	pz,jkhl		; fd bd

	ld	pw,value32	; ed 0c .. .. .. ..
	ld	px,value32	; ed 1c .. .. .. ..
	ld	py,value32	; ed 2c .. .. .. ..
	ld	pz,value32	; ed 3c .. .. .. ..

	ld	bc,(pw+offs)	; 6d 00 ..
	ld	bc,(px+offs)	; 6d 10 ..
	ld	bc,(py+offs)	; 6d 20 ..
	ld	bc,(pz+offs)	; 6d 30 ..
	ld	de,(pw+offs)	; 6d 40 ..
	ld	de,(px+offs)	; 6d 50 ..
	ld	de,(py+offs)	; 6d 60 ..
	ld	de,(pz+offs)	; 6d 70 ..
	ld	ix,(pw+offs)	; 6d 80 ..
	ld	ix,(px+offs)	; 6d 90 ..
	ld	ix,(py+offs)	; 6d a0 ..
	ld	ix,(pz+offs)	; 6d b0 ..
	ld	iy,(pw+offs)	; 6d c0 ..
	ld	iy,(px+offs)	; 6d d0 ..
	ld	iy,(py+offs)	; 6d e0 ..
	ld	iy,(pz+offs)	; 6d f0 ..

	ld	(pw+offs),bc	; 6d 01
	ld	(px+offs),bc	; 6d 11
	ld	(py+offs),bc	; 6d 21
	ld	(pz+offs),bc	; 6d 31
	ld	(pw+offs),de	; 6d 41
	ld	(px+offs),de	; 6d 51
	ld	(py+offs),de	; 6d 61
	ld	(pz+offs),de	; 6d 71
	ld	(pw+offs),ix	; 6d 81
	ld	(px+offs),ix	; 6d 91
	ld	(py+offs),ix	; 6d a1
	ld	(pz+offs),ix	; 6d b1
	ld	(pw+offs),iy	; 6d c1
	ld	(px+offs),iy	; 6d d1
	ld	(py+offs),iy	; 6d e1
	ld	(pz+offs),iy	; 6d f1

	ld	bc,(pw+hl)	; 6d 02
	ld	bc,(px+hl)	; 6d 12
	ld	bc,(py+hl)	; 6d 22
	ld	bc,(pz+hl)	; 6d 32
	ld	de,(pw+hl)	; 6d 42
	ld	de,(px+hl)	; 6d 52
	ld	de,(py+hl)	; 6d 62
	ld	de,(pz+hl)	; 6d 72
	ld	ix,(pw+hl)	; 6d 82
	ld	ix,(px+hl)	; 6d 92
	ld	ix,(py+hl)	; 6d a2
	ld	ix,(pz+hl)	; 6d b2
	ld	iy,(pw+hl)	; 6d c2
	ld	iy,(px+hl)	; 6d d2
	ld	iy,(py+hl)	; 6d e2
	ld	iy,(pz+hl)	; 6d f2

	ld	(pw+hl),bc	; 6d 03
	ld	(px+hl),bc	; 6d 13
	ld	(py+hl),bc	; 6d 23
	ld	(pz+hl),bc	; 6d 33
	ld	(pw+hl),de	; 6d 43
	ld	(px+hl),de	; 6d 53
	ld	(py+hl),de	; 6d 63
	ld	(pz+hl),de	; 6d 73
	ld	(pw+hl),ix	; 6d 83
	ld	(px+hl),ix	; 6d 93
	ld	(py+hl),ix	; 6d a3
	ld	(pz+hl),ix	; 6d b3
	ld	(pw+hl),iy	; 6d c3
	ld	(px+hl),iy	; 6d d3
	ld	(py+hl),iy	; 6d e3
	ld	(pz+hl),iy	; 6d f3

	ld	pw,pw+ix	; 6d 04
	ld	pw,px+ix	; 6d 14
	ld	pw,py+ix	; 6d 24
	ld	pw,pz+ix	; 6d 34
	ld	px,pw+ix	; 6d 44
	ld	px,px+ix	; 6d 54
	ld	px,py+ix	; 6d 64
	ld	px,pz+ix	; 6d 74
	ld	py,pw+ix	; 6d 84
	ld	py,px+ix	; 6d 94
	ld	py,py+ix	; 6d a4
	ld	py,pz+ix	; 6d b4
	ld	pz,pw+ix	; 6d c4
	ld	pz,px+ix	; 6d d4
	ld	pz,py+ix	; 6d e4
	ld	pz,pz+ix	; 6d f4

	ld	pw,pw+iy	; 6d 05
	ld	pw,px+iy	; 6d 15
	ld	pw,py+iy	; 6d 25
	ld	pw,pz+iy	; 6d 35
	ld	px,pw+iy	; 6d 45
	ld	px,px+iy	; 6d 55
	ld	px,py+iy	; 6d 65
	ld	px,pz+iy	; 6d 75
	ld	py,pw+iy	; 6d 85
	ld	py,px+iy	; 6d 95
	ld	py,py+iy	; 6d a5
	ld	py,pz+iy	; 6d b5
	ld	pz,pw+iy	; 6d c5
	ld	pz,px+iy	; 6d d5
	ld	pz,py+iy	; 6d e5
	ld	pz,pz+iy	; 6d f5

	ld	pw,pw+de	; 6d 06
	ld	pw,px+de	; 6d 16
	ld	pw,py+de	; 6d 26
	ld	pw,pz+de	; 6d 36
	ld	px,pw+de	; 6d 46
	ld	px,px+de	; 6d 56
	ld	px,py+de	; 6d 66
	ld	px,pz+de	; 6d 76
	ld	py,pw+de	; 6d 86
	ld	py,px+de	; 6d 96
	ld	py,py+de	; 6d a6
	ld	py,pz+de	; 6d b6
	ld	pz,pw+de	; 6d c6
	ld	pz,px+de	; 6d d6
	ld	pz,py+de	; 6d e5
	ld	pz,pz+de	; 6d f6

	ld	pw,pw		; 6d 07
	ld	pw,px		; 6d 17
	ld	pw,py		; 6d 27
	ld	pw,pz		; 6d 37
	ld	px,pw		; 6d 47
	ld	px,px		; 6d 57
	ld	px,py		; 6d 67
	ld	px,pz		; 6d 77
	ld	py,pw		; 6d 87
	ld	py,px		; 6d 97
	ld	py,py		; 6d a7
	ld	py,pz		; 6d b7
	ld	pz,pw		; 6d c7
	ld	pz,px		; 6d d7
	ld	pz,py		; 6d e7
	ld	pz,pz		; 6d f7

	ld	pw,(pw+offs)	; 6d 08 ..
	ld	pw,(px+offs)	; 6d 18 ..
	ld	pw,(py+offs)	; 6d 28 ..
	ld	pw,(pz+offs)	; 6d 38 ..
	ld	px,(pw+offs)	; 6d 48 ..
	ld	px,(px+offs)	; 6d 58 ..
	ld	px,(py+offs)	; 6d 68 ..
	ld	px,(pz+offs)	; 6d 78 ..
	ld	py,(pw+offs)	; 6d 88 ..
	ld	py,(px+offs)	; 6d 98 ..
	ld	py,(py+offs)	; 6d a8 ..
	ld	py,(pz+offs)	; 6d b8 ..
	ld	pz,(pw+offs)	; 6d c8 ..
	ld	pz,(px+offs)	; 6d d8 ..
	ld	pz,(py+offs)	; 6d e8 ..
	ld	pz,(pz+offs)	; 6d f8 ..

	ld	(pw+offs),pw	; 6d 09 ..
	ld	(pw+offs),px	; 6d 19 ..
	ld	(pw+offs),py	; 6d 29 ..
	ld	(pw+offs),pz	; 6d 39 ..
	ld	(px+offs),pw	; 6d 49 ..
	ld	(px+offs),px	; 6d 59 ..
	ld	(px+offs),py	; 6d 69 ..
	ld	(px+offs),pz	; 6d 79 ..
	ld	(py+offs),pw	; 6d 89 ..
	ld	(py+offs),px	; 6d 99 ..
	ld	(py+offs),py	; 6d a9 ..
	ld	(py+offs),pz	; 6d b9 ..
	ld	(pz+offs),pw	; 6d c9 ..
	ld	(pz+offs),px	; 6d d9 ..
	ld	(pz+offs),py	; 6d e9 ..
	ld	(pz+offs),pz	; 6d f9 ..

	ld	pw,(pw+hl)	; 6d 0a 
	ld	pw,(px+hl)	; 6d 1a 
	ld	pw,(py+hl)	; 6d 2a 
	ld	pw,(pz+hl)	; 6d 3a 
	ld	px,(pw+hl)	; 6d 4a 
	ld	px,(px+hl)	; 6d 5a 
	ld	px,(py+hl)	; 6d 6a 
	ld	px,(pz+hl)	; 6d 7a 
	ld	py,(pw+hl)	; 6d 8a 
	ld	py,(px+hl)	; 6d 9a 
	ld	py,(py+hl)	; 6d aa 
	ld	py,(pz+hl)	; 6d ba 
	ld	pz,(pw+hl)	; 6d ca 
	ld	pz,(px+hl)	; 6d da 
	ld	pz,(py+hl)	; 6d ea 
	ld	pz,(pz+hl)	; 6d fa 

	ld	(pw+hl),pw	; 6d 0b
	ld	(pw+hl),px	; 6d 1b
	ld	(pw+hl),py	; 6d 2b
	ld	(pw+hl),pz	; 6d 3b
	ld	(px+hl),pw	; 6d 4b
	ld	(px+hl),px	; 6d 5b
	ld	(px+hl),py	; 6d 6b
	ld	(px+hl),pz	; 6d 7b
	ld	(py+hl),pw	; 6d 8b
	ld	(py+hl),px	; 6d 9b
	ld	(py+hl),py	; 6d ab
	ld	(py+hl),pz	; 6d bb
	ld	(pz+hl),pw	; 6d cb
	ld	(pz+hl),px	; 6d db
	ld	(pz+hl),py	; 6d eb
	ld	(pz+hl),pz	; 6d fb

	ld	pw,pw+offs	; 6d 0c ..
	ld	pw,px+offs	; 6d 1c ..
	ld	pw,py+offs	; 6d 2c ..
	ld	pw,pz+offs	; 6d 3c ..
	ld	px,pw+offs	; 6d 4c ..
	ld	px,px+offs	; 6d 5c ..
	ld	px,py+offs	; 6d 6c ..
	ld	px,pz+offs	; 6d 7c ..
	ld	py,pw+offs	; 6d 8c ..
	ld	py,px+offs	; 6d 9c ..
	ld	py,py+offs	; 6d ac ..
	ld	py,pz+offs	; 6d bc ..
	ld	pz,pw+offs	; 6d cc ..
	ld	pz,px+offs	; 6d dc ..
	ld	pz,py+offs	; 6d ec ..
	ld	pz,pz+offs	; 6d fc ..

	ld	pw,pw+hl	; 6d 0e
	ld	pw,px+hl	; 6d 1e
	ld	pw,py+hl	; 6d 2e
	ld	pw,pz+hl	; 6d 3e
	ld	px,pw+hl	; 6d 4e
	ld	px,px+hl	; 6d 5e
	ld	px,py+hl	; 6d 6e
	ld	px,pz+hl	; 6d 7e
	ld	py,pw+hl	; 6d 8e
	ld	py,px+hl	; 6d 9e
	ld	py,py+hl	; 6d ae
	ld	py,pz+hl	; 6d be
	ld	pz,pw+hl	; 6d ce
	ld	pz,px+hl	; 6d de
	ld	pz,py+hl	; 6d ee
	ld	pz,pz+hl	; 6d fe


; 24 bit load instructions
	ldf	(addr24),a	; 8a .. .. ..
	ldf	(addr24),bc	; ed 0b .. .. ..
	ldf	(addr24),de	; ed 1b .. .. ..
	ldf	(addr24),ix	; ed 2b .. .. ..
	ldf	(addr24),iy	; ed 3b .. .. ..
	ldf	(addr24),hl	; 82 .. .. ..
	ldf	(addr24),bcde	; dd 0b .. .. ..
	ldf	(addr24),jkhl	; fd 0b .. .. ..

	ldf	a,(addr24)	; 9a .. .. ..
	ldf	a',(addr24)	; 76 9a .. .. ..
	altd ldf	a,(addr24)	; 76 9a .. .. ..
	ldf	bc,(addr24)	; ed 0a .. .. ..
	ldf	bc',(addr24)	; 76 ed 0a .. .. ..
	altd ldf	bc,(addr24)	; 76 ed 0a .. .. ..
	ldf	de,(addr24)	; ed 1a .. .. ..
	ldf	de',(addr24)	; 76 ed 1a .. .. ..
	altd ldf	de,(addr24)	; 76 ed 1a .. .. ..
	ldf	ix,(addr24)	; ed 2a .. .. ..
	ldf	iy,(addr24)	; ed 3a .. .. ..
	ldf	bcde,(addr24)	; dd 0a .. .. ..
	ldf	jkhl,(addr24)	; fd 0a .. .. ..
	ldf	jkhl',(addr24)	; 76 fd 0a .. .. ..
	altd ldf	jkhl,(addr24)	; 76 fd 0a .. .. ..
	ld	hl,(addr24)	; 92 .. .. ..
	ld	hl',(addr24)	; 76 92 .. .. ..
	altd ld	hl,(addr24)	; 76 92 .. .. ..
