; Extra opcodes that are available on the RCM2000


	defc	long_addr = 1025
	defc	addr_ldp = 1026
	defc	addr = 1027

	add	sp,4		; 27 04

; 16 bit logical operations
	and	hl,de		; dc
	altd	and	hl,de	; 76 dc
	and	hl',de		; 76 dc
	and	ix,de		; dd dc
	and	iy,de		; fd dc

	bool	hl		; cc
	bool	hl'		; 76 cc
	bool	ix		; dd cc
	bool	iy		; ed cc

	or	hl,de		; ec
	altd	or	hl,de	; 76 ec
	or	hl',de		; 76 ec
	or	ix,de		; dd ec
	or	iy,de		; fd ec

	rl	de		; f3
	rl	de'		; 76 f3
	altd rl	de		; 76 f3

	rr	de		; fb
	rr	de'		; 76 fb
	altd rr	de		; 76 fb

	rr	hl		; fc
	rr	hl'		; 76 fc
	altd rr	hl		; 76 fc
	rr	ix		; dd fc
	rr	iy		; fd fc

; Arithmetic
	mul			; f7

; RCM2000 ex instructions
	ex	de,hl'		; 76 eb
	ex	de',hl		; e3
	ex	de',hl'		; 76 e3
	ex	(sp),hl'	; 76 ed 54

; Interrupt management
	ipres			; ed 54
	ipset	0		; ed 46
	ipset	1		; ed 56
	ipset	2		; ed 4e
	ipset	3		; ed 5e
	push	ip		; ed 76
	pop	ip		; ed 7e

; 24 bit operations
	lcall	long_addr	; cf .. .. 00
	ljp	long_addr	; c7 .. .. 00
	lret			; ed 45

; ldp instructions
	ldp	(hl),hl		; ed 64
	ldp	(ix),hl		; dd 64
	ldp	(iy),hl		; fd 64

	ldp	(addr_ldp),hl	; ed 65 .. ..
	ldp	(addr_ldp),ix	; dd 65 .. ..
	ldp	(addr_ldp),iy	; fd 65 .. ..

	ldp	hl,(addr_ldp)	; ed 6d .. ..
	ldp	ix,(addr_ldp)	; dd 6d .. ..
	ldp	iy,(addr_ldp)	; fd 6d .. ..

	ldp	hl,(hl)		; ed 6c
	ldp	hl,(ix)		; dd 6c
	ldp	hl,(iy)		; fd 6c
	

; Stack relative addressing
	ld	hl,(sp+2)	; c4 02
	ld	hl',(sp+2)	; 76 c4 02
	ld	ix,(sp+2)	; dd c4 02
	ld	iy,(sp+2)	; fd c4 02

	ld	(sp+3),hl	; d4 03
	ld	(sp+3),ix	; dd d4 03
	ld	(sp+3),iy	; fd d4 03

; 16 bit loads
	ld	hl,ix		; dd 7c
	ld	hl',ix		; 76 dd 7c
	ld	hl,iy		; fd 7c
	ld	hl',iy		; 76 fd 7c

	ld	ix,hl		; dd 7d
	ld	iy,hl		; fd 7d

	ld	hl,(ix+4)	; e4 04
	ld	hl',(ix+4)	; 76 e4 04
	altd ld	hl,(ix+4)	; 76 e4 04

	ld	hl,(iy+4)	; fd e4 04
	ld	hl',(iy+4)	; 76 fd e4 04
	altd ld	hl,(iy+4)	; 76 fd e4 04

	ld	hl,(hl+5)	; dd e4 05
	ld	hl',(hl+5)	; 76 dd e4 05
	altd ld	hl,(hl+5)	; 76 dd e4 05

	ld	(ix+6),hl	; f4 06
	ld	(iy+6),hl	; fd f4 06
	ld	(hl+6),hl	; dd f4 06

	ld	bc',bc		; ed 49
	ld	de',bc		; ed 59
	ld	hl',bc		; ed 69

	ld	bc',de		; ed 41
	ld	de',de		; ed 51
	ld	hl',de		; ed 61

; XPC operations
	ld	xpc,a		; ed 67
	ld	a,xpc		; ed 77


; Some representative io instructions
	ioi ld 	hl,(addr)	; d3 2a .. ..
	altd ioi ld 	hl,(addr)	; 76 d3 2a .. ..
	ioe ld	(addr),hl	; db 22 .. ..

