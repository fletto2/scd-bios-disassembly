;   ======================================================================
;                     SEGA CD BIOS 2.00w US Disassembly
;                            Sub-CPU Boot Module
;   ======================================================================
;
;       Disassembly created by DarkMorford
;
;   ======================================================================

	include "constants.asm"
	include "variables.asm"
	include "macros.asm"

	org $6000

asc_6000:	dc.b 'MAINBOOTUSR'      ; DATA XREF: installJumpTable+15Ao
					; installJumpTable:loc_4FEo
		dc.b   0
		dc.w $10
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $20
		dc.w 0
		dc.w $20EC
		dc.w $A
		dc.w $8E
		dc.w $4A
		dc.w $120
		dc.w 0

; =============== S U B	R O U T	I N E =======================================


boot_user0:
		lea	RAM_BASE,a6
		clr.w	0(a6)
		clr.l	4(a6)
		bsr.w	sub_618C
		bsr.w	sub_61E8
		bclr	#GA_MODE,(GA_MEMORY_MODE).w
		bset	#GA_RET,(GA_MEMORY_MODE).w
		lea	(unk_F700).l,a0
		move.w	#$23F,d0
		moveq	#0,d1

loc_6056:				; CODE XREF: boot_user0+2Ej
		move.l	d1,(a0)+
		dbf	d0,loc_6056
		move.l	a6,-(sp)
		jsr	sub_18004
		movea.l	(sp)+,a6
		jmp	loc_625A(pc)
; End of function boot_user0


; =============== S U B	R O U T	I N E =======================================


boot_user2:
		lea	RAM_BASE,a6
		bsr.w	sub_6234
		tst.b	6(a6)
		beq.w	sub_6178
		move.w	0(a6),d0
		jsr	loc_609A(pc,d0.w)
		lea	RAM_BASE,a6
		addq.w	#1,4(a6)
		move.l	a6,-(sp)
		jsr	sub_18000
		movea.l	(sp)+,a6
		clr.b	3(a6)
		rts
; End of function boot_user2

; ---------------------------------------------------------------------------

loc_609A:
		bra.w	sub_6178
; ---------------------------------------------------------------------------
		bra.w	loc_7CA2
; ---------------------------------------------------------------------------
		bra.w	loc_7208
; ---------------------------------------------------------------------------
		nop
		rts
; ---------------------------------------------------------------------------
		bra.w	loc_8322

; =============== S U B	R O U T	I N E =======================================


boot_user1:				; CODE XREF: sub_610A+Cj
		bsr.w	sub_61E0
		beq.s	sub_610A
		move.b	#$80,(GA_COMM_SUBFLAGS).l
		bclr	#GA_PM0,(GA_MEMORY_MODE).w
		bclr	#GA_PM1,(GA_MEMORY_MODE).w
		bset	#GA_MODE,(GA_MEMORY_MODE).w
		bset	#GA_RET,(GA_MEMORY_MODE).w

loc_60D4:				; CODE XREF: boot_user1+2Cj
		btst	#GA_RET,(GA_MEMORY_MODE).w
		beq.s	loc_60D4
		bsr.s	clearWordRam1M
		bclr	#GA_RET,(GA_MEMORY_MODE).w

loc_60E4:				; CODE XREF: boot_user1+3Cj
		btst	#GA_RET,(GA_MEMORY_MODE).w
		bne.s	loc_60E4
		bsr.s	clearWordRam1M
		jsr	sub_18004
		moveq	#0,d0
		lea	(GA_COMM_SUBDATA).w,a0
		move.l	d0,(a0)+
		move.l	d0,(a0)+
		move.l	d0,(a0)+
		move.l	d0,(a0)+
		moveq	#$FFFFFFFF,d0
		ori	#1,ccr
		rts
; End of function boot_user1


; =============== S U B	R O U T	I N E =======================================


sub_610A:				; CODE XREF: boot_user1+4j
		lea	RAM_BASE,a6
		move.w	0(a6),d0
		jsr	loc_6118(pc,d0.w)
		bra.s	boot_user1
; End of function sub_610A

; ---------------------------------------------------------------------------

loc_6118:
		nop
		rts
; ---------------------------------------------------------------------------
		bra.w	sub_7B5E
; ---------------------------------------------------------------------------
		bra.w	sub_7302
; ---------------------------------------------------------------------------
		nop
		rts
; ---------------------------------------------------------------------------
		bra.w	sub_810A

; =============== S U B	R O U T	I N E =======================================


clearWordRam1M:				; CODE XREF: boot_user1+2Ep
					; boot_user1+3Ep
		lea	(WORD_RAM_1M).l,a0
		move.w	#$7FFF,d0
		moveq	#0,d1

loc_6138:				; CODE XREF: clearWordRam1M+Ej
		move.l	d1,(a0)+
		dbf	d0,loc_6138
		rts
; End of function clearWordRam1M


; =============== S U B	R O U T	I N E =======================================


boot_user3:
		rts
; End of function boot_user3


; =============== S U B	R O U T	I N E =======================================


sub_6142:				; CODE XREF: BOOT:000071FCj
		clr.b	6(a6)
		lea	0(a6),a0
		move.w	d0,(a0)+
		st	(a0)
		rts
; End of function sub_6142


; =============== S U B	R O U T	I N E =======================================


sub_6150:				; CODE XREF: sub_7302p	sub_7302+12p ...
		tst.b	2(a6)
		beq.s	locret_615E
		clr.b	2(a6)
		andi	#$FB,ccr ; '�'

locret_615E:				; CODE XREF: sub_6150+4j
		rts
; End of function sub_6150


; =============== S U B	R O U T	I N E =======================================


sub_6160:
		tst.b	2(a6)
		rts
; End of function sub_6160


; =============== S U B	R O U T	I N E =======================================


sub_6166:				; CODE XREF: sub_7302:loc_730Ap
					; sub_7B5E+Cp ...
		st	3(a6)

loc_616A:				; CODE XREF: sub_6166+8j
		tst.b	3(a6)
		bne.s	loc_616A
		rts
; End of function sub_6166


; =============== S U B	R O U T	I N E =======================================


sub_6172:
		st	3(a6)
		rts
; End of function sub_6172


; =============== S U B	R O U T	I N E =======================================


sub_6178:				; CODE XREF: boot_user2+Cj
					; BOOT:loc_609Aj
		lea	RAM_BASE,a6
		bsr.w	sub_619A
		bsr.w	sub_6296
		bsr.w	sub_6414
		bra.w	sub_71E6
; End of function sub_6178


; =============== S U B	R O U T	I N E =======================================


sub_618C:				; CODE XREF: boot_user0+Cp
		lea	$1E(a6),a0
		clr.l	(a0)+
		clr.l	(a0)+
		clr.l	(a0)+
		clr.l	(a0)+
		rts
; End of function sub_618C


; =============== S U B	R O U T	I N E =======================================


sub_619A:				; CODE XREF: sub_6178+4p
					; BOOT:0000720Cp ...
		lea	(GA_COMM_SUBFLAGS).w,a0
		bset	#0,(a0)
		lea	$E(a6),a2
		lea	(GA_COMM_MAINDATA).w,a1
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		move.l	(a1)+,(a2)+
		bsr.w	sub_62FA
		moveq	#3,d0

loc_61B8:				; CODE XREF: sub_619A+22j
		move.l	(a2),(a1)+
		clr.l	(a2)+
		dbf	d0,loc_61B8
		bchg	#1,(a0)
		bsr.w	sub_6384
		rts
; End of function sub_619A


; =============== S U B	R O U T	I N E =======================================


sub_61CA:				; CODE XREF: sub_726E+8Ep sub_7ADC+54p
		bset	#6,(GA_COMM_SUBFLAGS).w

loc_61D0:				; CODE XREF: sub_61CA+Cj
		btst	#2,(GA_COMM_MAINFLAGS).w
		bne.s	loc_61D0
		bclr	#6,(GA_COMM_SUBFLAGS).w
		rts
; End of function sub_61CA


; =============== S U B	R O U T	I N E =======================================


sub_61E0:				; CODE XREF: boot_user1p sub_7302+Cp ...
		btst	#7,(GA_COMM_MAINFLAGS).w
		rts
; End of function sub_61E0


; =============== S U B	R O U T	I N E =======================================


sub_61E8:				; CODE XREF: boot_user0+10p
		lea	$2E(a6),a0
		moveq	#$3D,d0	; '='

loc_61EE:				; CODE XREF: sub_61E8+8j
		clr.w	(a0)+
		dbf	d0,loc_61EE
		lea	dword_6218(pc),a1
		movea.l	a1,a3

loc_61FA:				; CODE XREF: sub_61E8+1Aj
		move.l	(a1)+,d0
		beq.s	loc_6204
		add.l	a3,d0
		move.l	d0,(a0)+
		bra.s	loc_61FA
; ---------------------------------------------------------------------------

loc_6204:				; CODE XREF: sub_61E8+14j
		bset	#0,$3E(a6)
		move.b	#$FF,$42(a6)
		moveq	#CBTINIT,d0
		jsr	_CDBOOT
		rts
; End of function sub_61E8

; ---------------------------------------------------------------------------
dword_6218:	dc.l $3B4		; DATA XREF: sub_61E8+Co
		dc.l $3B8
		dc.l $3BC
		dc.l $3C4
		dc.l $3CC
		dc.l $3DC
		dc.l 0

; =============== S U B	R O U T	I N E =======================================


sub_6234:				; CODE XREF: boot_user2+4p
		tst.b	$42(a6)
		bpl.s	locret_6258
		moveq	#CBTINT,d0
		jsr	_CDBOOT
		btst	#0,$3E(a6)
		beq.s	locret_6258
		moveq	#CBTCHKSTAT,d0
		jsr	_CDBOOT
		bcs.s	locret_6258
		tst.b	d0
		bmi.s	locret_6258
		move.b	d0,$42(a6)

locret_6258:				; CODE XREF: sub_6234+4j sub_6234+12j	...
		rts
; End of function sub_6234

; ---------------------------------------------------------------------------

loc_625A:				; CODE XREF: boot_user0+3Cj
		bsr.w	sub_62C6
		cmpi.b	#5,$58(a6)
		bne.s	sub_626E
		move.b	#$FF,$42(a6)
		rts

; =============== S U B	R O U T	I N E =======================================


sub_626E:				; CODE XREF: BOOT:00006264j
					; sub_6384+28p	...
		bset	#0,$3E(a6)
		bset	#1,$3E(a6)
		bclr	#2,$3E(a6)
		bsr.w	sub_66F4
		move.b	#$FF,$42(a6)
		move.w	#CBTCHKDISC,d0
		lea	$E4(a6),a0
		jmp	_CDBOOT
; End of function sub_626E


; =============== S U B	R O U T	I N E =======================================


sub_6296:				; CODE XREF: sub_6178+8p
					; BOOT:loc_722Ep ...
		lea	$E(a6),a1
		lea	$2E(a6),a2
		lea	$43(a6),a0
		btst	#7,(a0)
		bne.s	loc_62B2
		tst.w	(a1)
		beq.s	loc_62B2
		bset	#7,(a0)
		move.l	(a1),(a2)

loc_62B2:				; CODE XREF: sub_6296+10j sub_6296+14j
		moveq	#3,d0
		bra.s	loc_62BC
; ---------------------------------------------------------------------------

loc_62B6:				; CODE XREF: sub_6296+2Aj
		tst.w	(a1)
		beq.s	loc_62BC
		move.l	(a1),(a2)

loc_62BC:				; CODE XREF: sub_6296+1Ej sub_6296+22j
		addq.w	#2,a1
		addq.w	#2,a2
		dbf	d0,loc_62B6
		rts
; End of function sub_6296


; =============== S U B	R O U T	I N E =======================================


sub_62C6:				; CODE XREF: BOOT:loc_625Ap
					; sub_62FA+6p ...
		move.w	#CDBSTAT,d0
		jsr	_CDBIOS
		lea	$44(a6),a3
		move.l	a3,-(sp)
		move.w	(a3),d1
		move.w	(a0),(a3)+
		move.w	d1,(a3)+
		move.l	8(a0),(a3)+
		move.l	$C(a0),(a3)+
		move.b	7(a0),(a3)+
		move.b	$13(a0),(a3)+
		move.w	$10(a0),(a3)+
		move.l	$14(a0),(a3)+
		move.b	4(a0),(a3)+
		movea.l	(sp)+,a3
		rts
; End of function sub_62C6


; =============== S U B	R O U T	I N E =======================================


sub_62FA:				; CODE XREF: sub_619A+18p
		movem.l	a1-a2,-(sp)
		move.l	a0,-(sp)
		bsr.s	sub_62C6
		movea.l	(sp)+,a0
		bclr	#2,(a0)
		moveq	#0,d0
		move.w	4(a2),d0
		or.w	$C(a2),d0
		bne.s	loc_637E
		btst	#0,$3E(a6)
		beq.s	loc_6330
		move.b	$42(a6),d1
		bmi.s	loc_6330
		bclr	#0,$3E(a6)
		moveq	#4,d0
		bsr.w	sub_66EA
		bra.s	loc_637E
; ---------------------------------------------------------------------------

loc_6330:				; CODE XREF: sub_62FA+20j sub_62FA+26j
		bset	#2,(a0)
		bset	#3,(a0)
		move.w	(a3)+,d0
		move.w	d0,4(a2)
		move.w	(a3)+,d1
		andi.w	#$E000,d0
		bne.s	loc_6368
		tst.b	$53(a6)
		beq.s	loc_6368
		bmi.s	loc_6368
		bclr	#1,$3E(a6)
		beq.s	loc_6368
		adda.w	#$A,a3
		move.w	(a3)+,6(a2)
		move.l	(a3)+,$C(a2)
		bclr	#3,(a0)
		bra.s	loc_637E
; ---------------------------------------------------------------------------

loc_6368:				; CODE XREF: sub_62FA+4Aj sub_62FA+50j ...
		move.w	(a3)+,6(a2)
		addq.w	#2,a3
		move.w	(a3)+,$C(a2)
		addq.w	#2,a3
		move.b	(a3)+,$E(a2)
		move.b	$58(a6),$F(a2)

loc_637E:				; CODE XREF: sub_62FA+18j sub_62FA+34j ...
		movem.l	(sp)+,a1-a2
		rts
; End of function sub_62FA


; =============== S U B	R O U T	I N E =======================================


sub_6384:				; CODE XREF: sub_619A+2Ap
		cmpi.b	#$E,$58(a6)
		bne.s	loc_63B8
		cmpi.b	#5,$59(a6)
		beq.s	loc_63E6
		tst.w	$5A(a6)
		bne.s	loc_63A6
		move.w	#$168,$5A(a6)
		bsr.w	sub_6404
		bra.s	locret_63F2
; ---------------------------------------------------------------------------

loc_63A6:				; CODE XREF: sub_6384+14j sub_6384+66j
		subq.w	#1,$5A(a6)
		bne.s	locret_63F2
		bsr.w	sub_626E
		move.b	#$FF,$59(a6)
		bra.s	locret_63F2
; ---------------------------------------------------------------------------

loc_63B8:				; CODE XREF: sub_6384+6j
		clr.w	$5A(a6)
		cmpi.b	#5,$58(a6)
		bne.s	loc_63D2
		cmpi.b	#5,$59(a6)
		beq.s	locret_63F2
		bsr.w	sub_63F4
		bra.s	loc_63DE
; ---------------------------------------------------------------------------

loc_63D2:				; CODE XREF: sub_6384+3Ej
		cmpi.b	#5,$59(a6)
		bne.s	locret_63F2
		bsr.w	sub_626E

loc_63DE:				; CODE XREF: sub_6384+4Cj
		move.b	$58(a6),$59(a6)
		bra.s	locret_63F2
; ---------------------------------------------------------------------------

loc_63E6:				; CODE XREF: sub_6384+Ej
		tst.w	$5A(a6)
		bne.s	loc_63A6
		move.w	#$168,$5A(a6)

locret_63F2:				; CODE XREF: sub_6384+20j sub_6384+26j ...
		rts
; End of function sub_6384


; =============== S U B	R O U T	I N E =======================================


sub_63F4:				; CODE XREF: sub_6384+48p
		move.b	#$FF,$42(a6)
		moveq	#$FFFFFFFF,d1
		moveq	#4,d0
		bsr.w	sub_66EA
		rts
; End of function sub_63F4


; =============== S U B	R O U T	I N E =======================================


sub_6404:				; CODE XREF: sub_6384+1Cp
		bset	#2,$3E(a6)
		rts
; End of function sub_6404


; =============== S U B	R O U T	I N E =======================================


sub_640C:				; CODE XREF: sub_67CE+74p
		btst	#2,$3E(a6)
		rts
; End of function sub_640C


; =============== S U B	R O U T	I N E =======================================


sub_6414:				; CODE XREF: sub_6178+Cp
					; BOOT:00007232p ...
		bsr.w	sub_65F8
		bclr	#7,$43(a6)
		beq.w	locret_656C
		movea.w	#$5F22,a3
		lea	$2E(a6),a1
		lea	$64(a6),a0
		lea	$1E(a6),a2
		move.w	(a1),d0
		beq.w	locret_656C
		clr.w	(a1)+
		move.w	(a1),d1
		move.w	d0,d2
		andi.w	#$FF,d0
		move.w	d0,d3
		tst.b	d3
		bmi.w	loc_64A2
		cmpi.b	#$A,d3
		bne.s	loc_6462
		bclr	#2,$3E(a6)
		move.b	#$FF,$42(a6)
		moveq	#CBTOPENDISC,d0
		jmp	_CDBOOT
; ---------------------------------------------------------------------------

loc_6462:				; CODE XREF: sub_6414+3Aj
		subi.w	#$10,d3
		bpl.s	loc_646A
		jmp	(a3)
; ---------------------------------------------------------------------------

loc_646A:				; CODE XREF: sub_6414+52j
		cmpi.w	#9,d3
		bhi.w	loc_6550
		add.w	d3,d3
		add.w	d3,d3
		jmp	loc_647A(pc,d3.w)
; ---------------------------------------------------------------------------

loc_647A:
		bra.w	sub_626E
; ---------------------------------------------------------------------------
		bra.w	loc_666A
; ---------------------------------------------------------------------------
		bra.w	loc_6674
; ---------------------------------------------------------------------------
		bra.w	loc_6676
; ---------------------------------------------------------------------------
		bra.w	loc_653A
; ---------------------------------------------------------------------------
		bra.w	sub_6660
; ---------------------------------------------------------------------------
		bra.w	loc_653A
; ---------------------------------------------------------------------------
		bra.w	loc_6544
; ---------------------------------------------------------------------------
		bra.w	loc_654A
; ---------------------------------------------------------------------------
		bra.w	sub_665C
; ---------------------------------------------------------------------------

loc_64A2:				; CODE XREF: sub_6414+32j
		btst	#6,d0
		bne.s	loc_6518
		cmpi.w	#$96,d0	; '�'
		bhi.w	locret_656C
		andi.w	#$7F,d3	; ''
		add.w	d3,d3
		add.w	d3,d3
		jmp	loc_64BC(pc,d3.w)
; ---------------------------------------------------------------------------

loc_64BC:
		bra.w	loc_6572
; ---------------------------------------------------------------------------
		bra.w	loc_6534
; ---------------------------------------------------------------------------
		bra.w	loc_6588
; ---------------------------------------------------------------------------
		bra.w	loc_6580
; ---------------------------------------------------------------------------
		bra.w	loc_656A
; ---------------------------------------------------------------------------
		bra.w	loc_656A
; ---------------------------------------------------------------------------
		bra.w	loc_6592
; ---------------------------------------------------------------------------
		bra.w	loc_656A
; ---------------------------------------------------------------------------
		bra.w	loc_656A
; ---------------------------------------------------------------------------
		bra.w	loc_656A
; ---------------------------------------------------------------------------
		bra.w	loc_6572
; ---------------------------------------------------------------------------
		bra.w	loc_6572
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	loc_656A
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------
		bra.w	locret_6532
; ---------------------------------------------------------------------------

loc_6518:				; CODE XREF: sub_6414+92j
		cmpi.w	#$C1,d0	; '�'
		bhi.s	locret_6532
		andi.w	#$3F,d3	; '?'
		add.w	d3,d3
		add.w	d3,d3
		jmp	loc_652A(pc,d3.w)
; ---------------------------------------------------------------------------

loc_652A:
		bra.w	loc_65BA
; ---------------------------------------------------------------------------
		bra.w	loc_65C0
; ---------------------------------------------------------------------------

locret_6532:				; CODE XREF: sub_6414+D8j sub_6414+E0j ...
		rts
; ---------------------------------------------------------------------------

loc_6534:				; CODE XREF: sub_6414+ACj
		bsr.w	sub_62C6
		rts
; ---------------------------------------------------------------------------

loc_653A:				; CODE XREF: sub_6414+76j sub_6414+7Ej
		swap	d1
		move.w	d2,d1
		clr.b	d1
		bra.w	loc_66C0
; ---------------------------------------------------------------------------

loc_6544:				; CODE XREF: sub_6414+82j
		movea.l	$6C(a6),a0
		bra.s	loc_6564
; ---------------------------------------------------------------------------

loc_654A:				; CODE XREF: sub_6414+86j
		movea.l	$70(a6),a0
		bra.s	loc_6564
; ---------------------------------------------------------------------------

loc_6550:				; CODE XREF: sub_6414+5Aj
		cmpi.w	#$21,d0	; '!'
		beq.s	loc_655E
		bhi.s	locret_6532
		movea.l	$74(a6),a0
		bra.s	loc_6562
; ---------------------------------------------------------------------------

loc_655E:				; CODE XREF: sub_6414+140j
		movea.l	$78(a6),a0

loc_6562:				; CODE XREF: sub_6414+148j
					; BOOT:0000658Ep
		add.w	d1,d1

loc_6564:				; CODE XREF: sub_6414+134j
					; sub_6414+13Aj
		add.w	d1,d1
		add.w	d1,d1
		adda.w	d1,a0

loc_656A:				; CODE XREF: sub_6414+B8j sub_6414+BCj ...
		jmp	(a3)
; ---------------------------------------------------------------------------

locret_656C:				; CODE XREF: sub_6414+Aj sub_6414+20j	...
		rts
; End of function sub_6414

; ---------------------------------------------------------------------------
		movea.l	$80(a6),a0

loc_6572:				; CODE XREF: sub_6414:loc_64BCj
					; sub_6414+D0j	...
		move.w	d0,0(a2)
		jsr	(a3)
		scs	d1
		move.b	d1,2(a2)
		rts
; ---------------------------------------------------------------------------

loc_6580:				; CODE XREF: sub_6414+B4j
		move.w	d0,0(a2)
		jsr	(a3)
		rts
; ---------------------------------------------------------------------------

loc_6588:				; CODE XREF: sub_6414+B0j
		movea.l	$7C(a6),a0
		add.w	d1,d1
		bsr.s	loc_6562
		rts
; ---------------------------------------------------------------------------

loc_6592:				; CODE XREF: sub_6414+C0j
		move.w	d1,d3
		andi.l	#$FFF,d1
		andi.l	#$F000,d3
		lsl.l	#4,d3
		andi.l	#$FF00,d2
		swap	d2
		lsr.w	#4,d2
		or.l	d2,d1
		or.l	d3,d1
		jmp	(a3)
; ---------------------------------------------------------------------------
		bra.w	sub_626E
; ---------------------------------------------------------------------------
		moveq	#2,d0
		jmp	(a3)
; ---------------------------------------------------------------------------

loc_65BA:				; CODE XREF: sub_6414:loc_652Aj
		bsr.w	loc_666A
		bra.s	loc_65C4
; ---------------------------------------------------------------------------

loc_65C0:				; CODE XREF: sub_6414+11Aj
		bsr.w	loc_6674

loc_65C4:				; CODE XREF: BOOT:000065BEj
		move.w	#$8F,d0	; '�'
		moveq	#1,d1
		jmp	(a3)
; ---------------------------------------------------------------------------
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $10
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $F
		dc.w 2
		dc.w $8001
		dc.w $1000
		dc.w 2
		dc.w $2000
		dc.w 3
		dc.w $3000
		dc.w 4
		dc.w 0
		dc.w $84

; =============== S U B	R O U T	I N E =======================================


sub_65F8:				; CODE XREF: sub_6414p
		move.w	$44(a6),d0
		tst.b	$3F(a6)
		bpl.s	locret_665A
		btst	#6,$3F(a6)
		beq.s	loc_664A
		cmpi.w	#$100,d0
		beq.s	loc_6622
		cmpi.w	#$300,d0
		beq.s	loc_6642
		cmpi.w	#0,d0
		beq.s	loc_6642
		cmpi.w	#$500,d0
		bne.s	locret_665A

loc_6622:				; CODE XREF: sub_65F8+16j
		move.b	$63(a6),d1
		beq.s	loc_6642
		cmp.b	$50(a6),d1
		beq.s	loc_6642
		cmpi.w	#$500,d0
		bne.s	locret_665A
		subq.b	#1,d1
		beq.s	locret_665A
		cmp.b	$50(a6),d1
		bne.s	locret_665A
		bsr.w	sub_6E2C

loc_6642:				; CODE XREF: sub_65F8+1Cj sub_65F8+22j ...
		andi.b	#$3F,$3F(a6) ; '?'
		rts
; ---------------------------------------------------------------------------

loc_664A:				; CODE XREF: sub_65F8+10j
		move.w	$44(a6),d0
		cmp.w	$40(a6),d0
		beq.s	locret_665A
		bset	#6,$3F(a6)

locret_665A:				; CODE XREF: sub_65F8+8j sub_65F8+28j	...
		rts
; End of function sub_65F8


; =============== S U B	R O U T	I N E =======================================


sub_665C:				; CODE XREF: sub_6414+8Aj sub_6B46+6Ap ...
		moveq	#$19,d0
		bra.s	loc_6676
; End of function sub_665C


; =============== S U B	R O U T	I N E =======================================


sub_6660:				; CODE XREF: sub_6414+7Aj sub_6B46+5Ap ...
		moveq	#$15,d0
		move.b	#$80,$3F(a6)
		bra.s	loc_667C
; ---------------------------------------------------------------------------

loc_666A:				; CODE XREF: sub_6414+6Aj
					; BOOT:loc_65BAp ...
		moveq	#$11,d0
		move.b	#$80,$3F(a6)
		bra.s	loc_667C
; ---------------------------------------------------------------------------

loc_6674:				; CODE XREF: sub_6414+6Ej
					; BOOT:loc_65C0p ...
		moveq	#MSCPLAY1,d0

loc_6676:				; CODE XREF: sub_6414+72j sub_665C+2j
		move.b	#$81,$3F(a6)

loc_667C:				; CODE XREF: sub_6660+8j sub_6660+12j
		clr.l	$5C(a6)
		move.w	$44(a6),$40(a6)
		lea	$64(a6),a0
		move.b	d1,$63(a6)
		move.w	d1,(a0)
		jmp	_CDBIOS
; End of function sub_6660


; =============== S U B	R O U T	I N E =======================================


sub_6694:				; CODE XREF: sub_6850+60p sub_6A02+1Ep ...
		move.w	#CDBTOCREAD,d0
		jmp	_CDBIOS
; End of function sub_6694


; =============== S U B	R O U T	I N E =======================================


sub_669C:				; CODE XREF: sub_6B46+23Ep
		andi.b	#$3F,$3F(a6) ; '?'
		moveq	#MSCSCANFF,d0
		jmp	_CDBIOS
; End of function sub_669C


; =============== S U B	R O U T	I N E =======================================


sub_66A8:
		andi.b	#$3F,$3F(a6) ; '?'
		moveq	#MSCSCANFR,d0
		jmp	_CDBIOS
; End of function sub_66A8


; =============== S U B	R O U T	I N E =======================================


sub_66B4:				; CODE XREF: sub_66FE:loc_67C4p
					; sub_6B46:loc_6D6Cp
		move.w	#CDBCHK,d0
		jmp	_CDBIOS
; End of function sub_66B4


; =============== S U B	R O U T	I N E =======================================


sub_66BC:				; CODE XREF: sub_6A6C+4Cp
		move.l	d0,$5C(a6)

loc_66C0:				; CODE XREF: sub_6414+12Cj
		move.b	#$82,$3F(a6)
		moveq	#MSCPLAYT,d0
		lea	$64(a6),a0
		move.l	d1,$60(a6)
		clr.b	d1
		move.w	$44(a6),$40(a6)
		move.l	d1,(a0)
		jmp	_CDBIOS
; End of function sub_66BC


; =============== S U B	R O U T	I N E =======================================


pauseCdAudio:				; CODE XREF: BOOT:loc_714Ap
		moveq	#MSCPAUSEON,d0
		jmp	_CDBIOS
; End of function pauseCdAudio


; =============== S U B	R O U T	I N E =======================================


stopCdAudio:				; CODE XREF: sub_6B46+1E2j
		moveq	#MSCSTOP,d0
		jmp	_CDBIOS
; End of function stopCdAudio


; =============== S U B	R O U T	I N E =======================================


sub_66EA:				; CODE XREF: sub_62FA+30p sub_63F4+Ap
		move.w	d0,$1E(a6)
		move.w	d1,$20(a6)
		rts
; End of function sub_66EA


; =============== S U B	R O U T	I N E =======================================


sub_66F4:				; CODE XREF: sub_626E+12p sub_726E+86p
		clr.l	$A14(a6)
		clr.w	$A22(a6)
		rts
; End of function sub_66F4


; =============== S U B	R O U T	I N E =======================================


sub_66FE:				; CODE XREF: BOOT:0000723Cp
		bsr.w	sub_62C6
		lea	(WORD_RAM_1M).l,a5
		move.w	$42C(a5),d7
		lea	$A14(a6),a4
		lea	$44(a6),a3
		move.w	(a4),d6
		eor.w	d7,d6
		andi.w	#$F00,d6
		beq.s	loc_673C
		btst	#$A,d6
		beq.s	loc_6728
		bsr.w	sub_691E

loc_6728:				; CODE XREF: sub_66FE+24j
		btst	#9,d6
		beq.s	loc_6732
		bsr.w	sub_695E

loc_6732:				; CODE XREF: sub_66FE+2Ej
		btst	#$B,d6
		beq.s	loc_673C
		bsr.w	sub_69A2

loc_673C:				; CODE XREF: sub_66FE+1Ej sub_66FE+38j
		bsr.w	sub_67CE
		bsr.w	sub_6850
		move.w	(a4),d6
		eor.w	d7,d6
		andi.w	#$700,d6
		bne.s	loc_6788
		btst	#2,(a4)
		beq.w	loc_6788
		bsr.w	sub_6B46
		btst	#1,$A23(a6)
		bne.w	loc_6788
		cmpi.b	#$3F,$3F(a6) ; '?'
		bhi.w	loc_6788
		bsr.w	sub_6AC4
		btst	#2,$A23(a6)
		beq.s	loc_6780
		btst	#$B,d7
		beq.s	loc_6788

loc_6780:				; CODE XREF: sub_66FE+7Aj
		bsr.w	sub_6A02
		bsr.w	sub_6A6C

loc_6788:				; CODE XREF: sub_66FE+4Ej sub_66FE+54j ...
		move.l	$1C90(a6),$426(a5)
		move.w	(a4),$402(a5)
		lea	$44(a6),a0
		lea	$404(a5),a1
		move.l	(a0)+,(a1)+
		addq.l	#4,a0
		addq.l	#4,a1
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		bsr.w	sub_6E34
		move.w	$A22(a6),$42A(a5)
		move.b	$A17(a6),$410(a5)
		move.l	$48(a6),d6
		cmpi.l	#$FFFFFFFF,d6
		beq.s	loc_67C4
		move.l	d6,$408(a5)

loc_67C4:				; CODE XREF: sub_66FE+C0j
		bsr.w	sub_66B4
		scs	$440(a5)
		rts
; End of function sub_66FE


; =============== S U B	R O U T	I N E =======================================


sub_67CE:				; CODE XREF: sub_66FE:loc_673Cp
		btst	#8,d6
		beq.s	loc_6828
		btst	#8,d7
		beq.s	loc_67EE
		cmpi.w	#$4000,(a3)
		beq.s	loc_67E6
		tst.b	(a3)
		bmi.s	locret_6802
		bra.s	loc_6834
; ---------------------------------------------------------------------------

loc_67E6:				; CODE XREF: sub_67CE+10j
		clr.w	(a4)
		bset	#0,(a4)
		rts
; ---------------------------------------------------------------------------

loc_67EE:				; CODE XREF: sub_67CE+Aj
		btst	#0,$A23(a6)
		bne.s	loc_6804
		cmpi.w	#$4000,(a3)
		beq.s	locret_6802
		bset	#0,$A23(a6)

locret_6802:				; CODE XREF: sub_67CE+14j sub_67CE+2Cj
		rts
; ---------------------------------------------------------------------------

loc_6804:				; CODE XREF: sub_67CE+26j
		cmpi.w	#$4000,(a3)
		beq.s	loc_6816
		bclr	#0,(a4)
		bclr	#0,$A23(a6)
		rts
; ---------------------------------------------------------------------------

loc_6816:				; CODE XREF: sub_67CE+3Aj
		bset	#0,(a4)
		bclr	#0,$A23(a6)
		bset	#4,$401(a5)
		rts
; ---------------------------------------------------------------------------

loc_6828:				; CODE XREF: sub_67CE+4j
		btst	#8,d7
		beq.s	loc_683C
		cmpi.w	#$2000,(a3)
		bne.s	locret_684E

loc_6834:				; CODE XREF: sub_67CE+16j
		bset	#2,$401(a5)
		rts
; ---------------------------------------------------------------------------

loc_683C:				; CODE XREF: sub_67CE+5Ej
		cmpi.w	#$4000,(a3)
		beq.s	loc_6848
		bsr.w	sub_640C
		beq.s	locret_684E

loc_6848:				; CODE XREF: sub_67CE+72j
		bset	#4,$401(a5)

locret_684E:				; CODE XREF: sub_67CE+64j sub_67CE+78j
		rts
; End of function sub_67CE


; =============== S U B	R O U T	I N E =======================================


sub_6850:				; CODE XREF: sub_66FE+42p
		move.b	(a3),d0
		andi.b	#$70,d0	; 'p'
		beq.s	loc_6886
		cmpi.b	#$10,d0
		bne.s	loc_6878
		bset	#6,$A22(a6)
		bset	#2,$A22(a6)
		bne.s	locret_6884
		bset	#5,$401(a5)
		clr.l	0(a5)
		rts
; ---------------------------------------------------------------------------

loc_6878:				; CODE XREF: sub_6850+Cj
		bclr	#6,$A22(a6)
		bclr	#2,$A22(a6)

locret_6884:				; CODE XREF: sub_6850+1Aj sub_6850+3Aj
		rts
; ---------------------------------------------------------------------------

loc_6886:				; CODE XREF: sub_6850+6j
		tst.b	$42(a6)
		bmi.s	locret_6884
		bset	#6,$A22(a6)
		bne.s	loc_68D0
		bset	#3,$A22(a6)
		moveq	#0,d2
		move.b	$52(a6),d2
		move.b	$53(a6),d3
		move.l	a5,-(sp)
		move.w	d2,d1
		add.w	d1,d1
		add.w	d1,d1
		adda.w	d1,a5

loc_68AE:				; CODE XREF: sub_6850+78j
		move.w	d2,d1
		bsr.w	sub_6694
		move.w	d1,d4
		tst.b	d4
		beq.s	loc_68BE
		ori.b	#$80,d0

loc_68BE:				; CODE XREF: sub_6850+68j
		move.l	d0,(a5)+
		move.l	d0,d4
		cmp.b	d3,d2
		beq.s	loc_68CA
		addq.w	#1,d2
		bra.s	loc_68AE
; ---------------------------------------------------------------------------

loc_68CA:				; CODE XREF: sub_6850+74j
		clr.l	(a5)+
		movea.l	(sp)+,a5

locret_68CE:				; CODE XREF: sub_6850+86j
		rts
; ---------------------------------------------------------------------------

loc_68D0:				; CODE XREF: sub_6850+42j
		bset	#2,$A22(a6)
		bne.s	locret_68CE
		move.l	a5,-(sp)
		moveq	#0,d2
		move.b	$52(a6),d2
		move.w	d2,d1
		add.w	d1,d1
		add.w	d1,d1
		adda.w	d1,a5
		lea	$A24(a6),a1
		adda.w	d1,a1
		move.l	(a5)+,d0
		bsr.w	sub_716C

loc_68F4:				; CODE XREF: sub_6850+B4j
		move.l	d0,d1
		move.l	(a5)+,d0
		beq.s	loc_6906
		bsr.w	sub_716C
		move.l	d0,d2
		sub.l	d1,d2
		move.l	d2,(a1)+
		bra.s	loc_68F4
; ---------------------------------------------------------------------------

loc_6906:				; CODE XREF: sub_6850+A8j
		move.l	$54(a6),d0
		bsr.w	sub_716C
		sub.l	d1,d0
		move.l	d0,(a1)+
		clr.l	(a1)+
		movea.l	(sp)+,a5
		bset	#5,$401(a5)
		rts
; End of function sub_6850


; =============== S U B	R O U T	I N E =======================================


sub_691E:				; CODE XREF: sub_66FE+26p
		btst	#$A,d7
		bne.s	loc_6932
		tst.b	(a3)
		bne.s	locret_695C
		bclr	#2,(a4)
		clr.b	$A16(a6)
		rts
; ---------------------------------------------------------------------------

loc_6932:				; CODE XREF: sub_691E+4j
		cmpi.w	#$100,(a3)
		beq.s	loc_6944
		cmpi.w	#$500,(a3)
		bne.s	locret_695C
		btst	#9,d7
		beq.s	locret_695C

loc_6944:				; CODE XREF: sub_691E+18j
		bset	#2,(a4)
		bsr.w	sub_6DB6
		move.b	d1,$A16(a6)
		btst	#3,d7
		beq.s	locret_695C
		bset	#5,$A22(a6)

locret_695C:				; CODE XREF: sub_691E+8j sub_691E+1Ej	...
		rts
; End of function sub_691E


; =============== S U B	R O U T	I N E =======================================


sub_695E:				; CODE XREF: sub_66FE+30p
		btst	#9,d7
		bne.s	loc_6990
		btst	#$A,d7
		beq.s	loc_6984
		cmpi.w	#$100,(a3)
		beq.s	loc_698A
		btst	#0,$3F(a6)
		beq.s	locret_69A0
		move.b	$63(a6),d1
		cmp.b	$A17(a6),d1
		beq.s	locret_69A0
		bra.s	loc_698A
; ---------------------------------------------------------------------------

loc_6984:				; CODE XREF: sub_695E+Aj
		cmpi.w	#0,(a3)
		bne.s	locret_69A0

loc_698A:				; CODE XREF: sub_695E+10j sub_695E+24j
		bclr	#1,(a4)
		rts
; ---------------------------------------------------------------------------

loc_6990:				; CODE XREF: sub_695E+4j
		cmpi.w	#$500,(a3)
		bne.s	locret_69A0
		move.w	#8,2(a6)
		bset	#1,(a4)

locret_69A0:				; CODE XREF: sub_695E+18j sub_695E+22j ...
		rts
; End of function sub_695E


; =============== S U B	R O U T	I N E =======================================


sub_69A2:				; CODE XREF: sub_66FE+3Ap
		btst	#$B,d7
		bne.s	loc_69C2
		cmpi.w	#0,(a3)
		beq.s	loc_69BC
		cmpi.w	#$500,(a3)
		beq.s	loc_69BC
		cmpi.w	#$100,(a3)
		beq.s	loc_69BC
		rts
; ---------------------------------------------------------------------------

loc_69BC:				; CODE XREF: sub_69A2+Aj sub_69A2+10j	...
		bclr	#3,(a4)
		rts
; ---------------------------------------------------------------------------

loc_69C2:				; CODE XREF: sub_69A2+4j
		cmpi.b	#$C,$58(a6)
		beq.s	loc_69E6
		btst	#5,d7
		beq.s	loc_69E0
		cmpi.b	#$3F,$3F(a6) ; '?'
		bhi.s	locret_69EA
		bset	#1,$A23(a6)
		bra.s	loc_69E6
; ---------------------------------------------------------------------------

loc_69E0:				; CODE XREF: sub_69A2+2Cj
		cmpi.w	#$300,(a3)
		bne.s	locret_69EA

loc_69E6:				; CODE XREF: sub_69A2+26j sub_69A2+3Cj
		bset	#3,(a4)

locret_69EA:				; CODE XREF: sub_69A2+34j sub_69A2+42j
		rts
; End of function sub_69A2

; ---------------------------------------------------------------------------
		bclr	#3,(a4)
		bsr.w	sub_6DB6
		move.w	d7,d2
		andi.w	#$400D,d2
		bne.w	loc_6674
		bra.w	loc_666A

; =============== S U B	R O U T	I N E =======================================


sub_6A02:				; CODE XREF: sub_66FE:loc_6780p
		btst	#$F,d7
		beq.s	locret_6A6A
		btst	#$B,d7
		beq.s	loc_6A14
		btst	#$C,d7
		beq.s	locret_6A6A

loc_6A14:				; CODE XREF: sub_6A02+Aj
		cmpi.w	#$FFFF,$48(a6)
		beq.s	locret_6A6A
		bsr.w	sub_6DB6
		bsr.w	sub_6694
		lea	$BB8(a6),a1
		lea	$BBC(a6),a2
		swap	d0
		move.l	d0,-(sp)
		move.w	d0,(a2)+
		moveq	#0,d1
		move.b	$42F(a5),d1
		move.w	d1,(a1)
		bsr.w	sub_70B6
		move.l	(sp)+,d0
		move.w	(a1),d0
		swap	d0
		cmp.l	$48(a6),d0
		bcc.s	locret_6A6A
		swap	d1
		cmp.l	$A1C(a6),d1
		bhi.s	locret_6A6A
		bsr.w	sub_6DC8
		tst.w	d1
		beq.w	loc_6D1C
		bset	#5,$A22(a6)
		move.b	d1,$A16(a6)
		bra.w	loc_6CBE
; ---------------------------------------------------------------------------

locret_6A6A:				; CODE XREF: sub_6A02+4j sub_6A02+10j	...
		rts
; End of function sub_6A02


; =============== S U B	R O U T	I N E =======================================


sub_6A6C:				; CODE XREF: sub_66FE+86p
		btst	#9,d7
		bne.s	locret_6AC2
		btst	#1,d7
		beq.s	locret_6AC2
		cmpi.w	#$FFFF,$48(a6)
		beq.s	locret_6AC2
		move.w	$564(a5),d1
		move.l	$438(a5),d0
		cmp.b	d0,d1
		bne.s	locret_6AC2
		cmp.l	$48(a6),d0
		bhi.s	locret_6AC2
		addi.l	#$10000,d0
		cmp.l	$48(a6),d0
		bls.s	locret_6AC2
		moveq	#0,d0
		move.b	$437(a5),d0
		bsr.w	sub_6DB0
		bsr.w	sub_6DB6
		move.l	$434(a5),d0
		move.b	d1,d0
		move.l	d0,d1
		move.l	$43C(a5),d0
		bsr.w	sub_66BC
		bset	#4,$A23(a6)

locret_6AC2:				; CODE XREF: sub_6A6C+4j sub_6A6C+Aj ...
		rts
; End of function sub_6A6C


; =============== S U B	R O U T	I N E =======================================


sub_6AC4:				; CODE XREF: sub_66FE+70p
		btst	#2,$A23(a6)
		beq.s	loc_6AFC
		btst	#4,d7
		beq.s	loc_6AE4
		btst	#$B,d7
		bne.s	locret_6AFA
		btst	#9,d7
		beq.s	loc_6AE4
		subq.w	#1,$A20(a6)
		bne.s	locret_6B12

loc_6AE4:				; CODE XREF: sub_6AC4+Cj sub_6AC4+18j
		bset	#7,$401(a5)
		bclr	#5,$A22(a6)
		bclr	#2,$A23(a6)
		clr.w	$A20(a6)

locret_6AFA:				; CODE XREF: sub_6AC4+12j
		rts
; ---------------------------------------------------------------------------

loc_6AFC:				; CODE XREF: sub_6AC4+6j
		bclr	#5,$A22(a6)
		beq.s	locret_6B12
		btst	#4,d7
		beq.s	locret_6B12
		btst	#$B,d7
		bne.s	locret_6B12
		bsr.s	sub_6B14

locret_6B12:				; CODE XREF: sub_6AC4+1Ej sub_6AC4+3Ej ...
		rts
; End of function sub_6AC4


; =============== S U B	R O U T	I N E =======================================


sub_6B14:				; CODE XREF: sub_6AC4+4Cp sub_6B46+5Ej ...
		bclr	#5,$A22(a6)
		bset	#0,$400(a5)
		bset	#2,$A23(a6)
		move.b	$431(a5),d0
		move.w	d0,d1
		andi.w	#$F,d1
		andi.w	#$F0,d0	; '�'
		asr.w	#3,d0
		mulu.w	#5,d0
		add.w	d1,d0
		mulu.w	#$3C,d0	; '<'
		move.w	d0,$A20(a6)
		rts
; End of function sub_6B14


; =============== S U B	R O U T	I N E =======================================


sub_6B46:				; CODE XREF: sub_66FE+58p
		cmpi.b	#$3F,$3F(a6) ; '?'
		bhi.w	loc_6C24
		bclr	#4,$A23(a6)
		btst	#1,$A23(a6)
		bne.w	loc_6D6C
		btst	#3,(a4)
		bne.w	loc_6C2C
		btst	#1,(a4)
		bne.w	loc_6D2C
		move.b	(a3),d0
		bmi.w	locret_6C22
		cmpi.w	#$100,(a3)
		beq.s	loc_6BB8
		bsr.w	sub_6DC8
		tst.b	d1
		beq.w	loc_6D1C
		bset	#5,$A22(a6)
		move.b	d1,$A16(a6)
		move.w	d7,d0
		andi.w	#$400D,d0
		bne.s	loc_6BA8
		btst	#4,d7
		beq.w	loc_666A
		bsr.w	sub_6660
		bra.w	sub_6B14
; ---------------------------------------------------------------------------

loc_6BA8:				; CODE XREF: sub_6B46+50j
		btst	#4,d7
		beq.w	loc_6674
		bsr.w	sub_665C
		bra.w	sub_6B14
; ---------------------------------------------------------------------------

loc_6BB8:				; CODE XREF: sub_6B46+34j
		bsr.w	sub_6D90
		beq.s	locret_6C22
		bsr.w	sub_6DB6
		subq.b	#1,d1
		cmp.b	d0,d1
		bne.s	loc_6BD2
		bsr.w	sub_6DFA
		move.b	d1,$A16(a6)
		rts
; ---------------------------------------------------------------------------

loc_6BD2:				; CODE XREF: sub_6B46+80j
		bsr.w	sub_6DC8
		tst.b	d1
		beq.s	loc_6BFC
		cmp.b	d0,d1
		beq.s	loc_6BFC
		btst	#0,d7
		bne.s	loc_6BFC
		move.w	d7,d2
		andi.w	#$400D,d2
		beq.s	loc_6BF6
		btst	#1,$3F(a6)
		beq.s	loc_6BF6
		bra.s	loc_6BFC
; ---------------------------------------------------------------------------

loc_6BF6:				; CODE XREF: sub_6B46+A4j sub_6B46+ACj
		bsr.w	sub_6DFA
		bra.s	locret_6C22
; ---------------------------------------------------------------------------

loc_6BFC:				; CODE XREF: sub_6B46+92j sub_6B46+96j ...
		move.b	d1,$A16(a6)
		beq.w	loc_6D1C
		bset	#5,$A22(a6)
		move.w	d7,d0
		andi.w	#$400D,d0
		beq.s	locret_6C22
		btst	#4,d7
		beq.w	loc_6674
		bsr.w	sub_665C
		bra.w	sub_6B14
; ---------------------------------------------------------------------------

locret_6C22:				; CODE XREF: sub_6B46+2Cj sub_6B46+76j ...
		rts
; ---------------------------------------------------------------------------

loc_6C24:				; CODE XREF: sub_6B46+6j
		move.b	$63(a6),$A16(a6)
		rts
; ---------------------------------------------------------------------------

loc_6C2C:				; CODE XREF: sub_6B46+1Ej
		cmpi.w	#$300,(a3)
		bne.s	loc_6C9E
		cmpi.b	#$C,$58(a6)
		beq.s	loc_6C40
		bsr.w	sub_6D90
		beq.s	locret_6C9C

loc_6C40:				; CODE XREF: sub_6B46+F2j
		btst	#$C,d7
		bne.s	loc_6C82
		bsr.w	sub_6DB6
		move.w	d7,d2
		andi.w	#$400D,d2
		bne.w	loc_6CFC
		bsr.w	sub_6DFA
		cmp.b	d0,d1
		beq.s	loc_6C70
		bsr.w	sub_6DFA
		cmp.b	d0,d1
		beq.s	loc_6C70
		subq.w	#1,d0
		andi.w	#$FF,d0
		move.w	d0,$564(a5)
		move.w	d0,d1

loc_6C70:				; CODE XREF: sub_6B46+114j
					; sub_6B46+11Cj
		move.b	d1,$A16(a6)
		bne.s	locret_6C9C
		bsr.w	sub_6DB6
		move.b	d1,$A16(a6)
		bra.w	loc_6CFC
; ---------------------------------------------------------------------------

loc_6C82:				; CODE XREF: sub_6B46+FEj
		bsr.w	sub_6DC8
		move.b	d1,$A16(a6)
		beq.w	loc_6D1C
		btst	#0,d7
		bne.s	loc_6CBE
		btst	#0,$3F(a6)
		bne.s	loc_6CBE

locret_6C9C:				; CODE XREF: sub_6B46+F8j
					; sub_6B46+12Ej ...
		rts
; ---------------------------------------------------------------------------

loc_6C9E:				; CODE XREF: sub_6B46+EAj
		btst	#$B,d7
		beq.s	locret_6C9C
		btst	#$C,d7
		bne.s	loc_6CB4
		bsr.w	sub_6DB6
		move.b	d1,$A16(a6)
		bra.s	loc_6CFC
; ---------------------------------------------------------------------------

loc_6CB4:				; CODE XREF: sub_6B46+162j
		bsr.w	sub_6DC8
		move.b	d1,$A16(a6)
		beq.s	loc_6D1C

loc_6CBE:				; CODE XREF: sub_6A02+64j
					; sub_6B46+14Cj ...
		bset	#1,$A23(a6)
		move.w	d7,d0
		andi.w	#$400D,d0
		beq.s	loc_6CE4
		btst	#1,(a4)
		bne.w	sub_665C
		btst	#4,d7
		beq.w	loc_6674
		bsr.w	sub_665C
		bra.w	sub_6B14
; ---------------------------------------------------------------------------

loc_6CE4:				; CODE XREF: sub_6B46+184j
		btst	#1,(a4)
		bne.w	sub_6660
		btst	#4,d7
		beq.w	loc_666A
		bsr.w	sub_6660
		bra.w	sub_6B14
; ---------------------------------------------------------------------------

loc_6CFC:				; CODE XREF: sub_6B46+10Aj
					; sub_6B46+138j ...
		bset	#6,$401(a5)
		bset	#1,$A23(a6)
		move.w	d7,d0
		andi.w	#$400D,d0
		beq.s	loc_6D16
		bsr.w	sub_665C
		rts
; ---------------------------------------------------------------------------

loc_6D16:				; CODE XREF: sub_6B46+1C8j
		bsr.w	sub_6660
		rts
; ---------------------------------------------------------------------------

loc_6D1C:				; CODE XREF: sub_6A02+56j sub_6B46+3Cj ...
		bclr	#1,$A23(a6)
		bset	#0,$401(a5)
		bra.w	stopCdAudio
; ---------------------------------------------------------------------------

loc_6D2C:				; CODE XREF: sub_6B46+26j
		cmpi.b	#$C,$58(a6)
		beq.s	loc_6D4C
		move.b	$A17(a6),d0
		move.b	$A16(a6),d1
		cmp.b	d0,d1
		beq.s	locret_6D6A
		subq.b	#1,d1
		cmp.b	d0,d1
		beq.s	loc_6D62
		addq.b	#2,d1
		cmp.b	d0,d1
		bne.s	locret_6D6A

loc_6D4C:				; CODE XREF: sub_6B46+1ECj
		bsr.w	sub_6DC8
		move.b	d1,$A16(a6)
		beq.s	loc_6D1C
		move.w	d7,d0
		andi.w	#$400D,d0
		bne.w	loc_6CBE
		bra.s	locret_6D6A
; ---------------------------------------------------------------------------

loc_6D62:				; CODE XREF: sub_6B46+1FEj
		bsr.w	sub_6DFA
		move.b	d1,$A16(a6)

locret_6D6A:				; CODE XREF: sub_6B46+1F8j
					; sub_6B46+204j ...
		rts
; ---------------------------------------------------------------------------

loc_6D6C:				; CODE XREF: sub_6B46+16j
		bsr.w	sub_66B4
		bcs.s	locret_6D8E
		btst	#$C,d7
		bne.s	loc_6D80
		btst	#$B,d7
		beq.s	loc_6D88
		rts
; ---------------------------------------------------------------------------

loc_6D80:				; CODE XREF: sub_6B46+230j
		bclr	#3,(a4)
		bsr.w	sub_669C

loc_6D88:				; CODE XREF: sub_6B46+236j
		bclr	#1,$A23(a6)

locret_6D8E:				; CODE XREF: sub_6B46+22Aj
		rts
; End of function sub_6B46


; =============== S U B	R O U T	I N E =======================================


sub_6D90:				; CODE XREF: sub_6B46:loc_6BB8p
					; sub_6B46+F4p
		cmpi.b	#$3F,$3F(a6) ; '?'
		bhi.s	loc_6DAC
		moveq	#0,d0
		move.b	$50(a6),d0
		beq.s	loc_6DAC
		cmp.b	$53(a6),d0
		bhi.s	loc_6DAC
		cmp.b	$A16(a6),d0
		rts
; ---------------------------------------------------------------------------

loc_6DAC:				; CODE XREF: sub_6D90+6j sub_6D90+Ej ...
		cmp.b	d0,d0
		rts
; End of function sub_6D90


; =============== S U B	R O U T	I N E =======================================


sub_6DB0:				; CODE XREF: sub_6A6C+38p
		move.w	d0,$564(a5)
		rts
; End of function sub_6DB0


; =============== S U B	R O U T	I N E =======================================


sub_6DB6:				; CODE XREF: sub_691E+2Ap
					; BOOT:000069F0p ...
		move.w	$564(a5),d1
		addi.w	#$568,d1
		move.b	(a5,d1.w),d1
		andi.w	#$FF,d1
		rts
; End of function sub_6DB6


; =============== S U B	R O U T	I N E =======================================


sub_6DC8:				; CODE XREF: sub_6A02+50p sub_6B46+36p ...
		move.l	a1,-(sp)
		lea	$564(a5),a1
		btst	#0,d7
		bne.s	loc_6DD6
		addq.w	#1,(a1)

loc_6DD6:				; CODE XREF: sub_6DC8+Aj
		move.w	(a1),d1
		cmp.w	$566(a5),d1
		bcs.s	loc_6DF2
		btst	#$D,d7
		beq.s	loc_6DEA
		clr.w	(a1)
		moveq	#0,d1
		bra.s	loc_6DF2
; ---------------------------------------------------------------------------

loc_6DEA:				; CODE XREF: sub_6DC8+1Aj
		subq.w	#1,d1
		move.w	d1,(a1)
		moveq	#0,d1
		bra.s	loc_6DF6
; ---------------------------------------------------------------------------

loc_6DF2:				; CODE XREF: sub_6DC8+14j sub_6DC8+20j
		move.b	4(a1,d1.w),d1

loc_6DF6:				; CODE XREF: sub_6DC8+28j
		movea.l	(sp)+,a1
		rts
; End of function sub_6DC8


; =============== S U B	R O U T	I N E =======================================


sub_6DFA:				; CODE XREF: sub_6B46+82p
					; sub_6B46:loc_6BF6p ...
		move.l	a1,-(sp)
		lea	$564(a5),a1
		subq.w	#1,(a1)
		bpl.s	loc_6E10
		btst	#$D,d7
		beq.s	loc_6E18
		move.w	$566(a5),(a1)
		subq.w	#1,(a1)

loc_6E10:				; CODE XREF: sub_6DFA+8j
		move.w	(a1),d1
		move.b	4(a1,d1.w),d1
		bra.s	loc_6E1C
; ---------------------------------------------------------------------------

loc_6E18:				; CODE XREF: sub_6DFA+Ej
		moveq	#0,d1
		move.w	d1,(a1)

loc_6E1C:				; CODE XREF: sub_6DFA+1Cj
		movea.l	(sp)+,a1
		rts
; End of function sub_6DFA


; =============== S U B	R O U T	I N E =======================================


sub_6E20:
		move.w	$564(a5),d0
		addq.w	#1,d0
		cmp.w	$566(a5),d0
		rts
; End of function sub_6E20


; =============== S U B	R O U T	I N E =======================================


sub_6E2C:				; CODE XREF: sub_65F8+46p
		bset	#1,$A22(a6)
		rts
; End of function sub_6E2C


; =============== S U B	R O U T	I N E =======================================


sub_6E34:				; CODE XREF: sub_66FE+A6p
		bclr	#3,$A22(a6)
		beq.s	loc_6E3E
		rts
; ---------------------------------------------------------------------------

loc_6E3E:				; CODE XREF: sub_6E34+6j
		moveq	#0,d4
		moveq	#0,d6
		move.b	(a3),d0
		andi.b	#$70,d0	; 'p'
		bne.w	loc_6FD8
		btst	#$A,d7
		bne.s	loc_6EC6
		btst	#7,d7
		beq.s	loc_6E66
		bsr.w	sub_7070
		move.w	(a1),d6
		move.w	$4FE(a5),d4
		bra.w	loc_6FD8
; ---------------------------------------------------------------------------

loc_6E66:				; CODE XREF: sub_6E34+22j
		btst	#6,d7
		beq.s	loc_6E94
		bsr.w	sub_6DB6
		move.w	d1,d4
		moveq	#0,d5
		move.w	d7,d0
		andi.w	#$400D,d0
		beq.s	loc_6E8A
		bsr.w	sub_7080
		moveq	#0,d6
		move.w	(a1),d6
		swap	d6
		bra.w	loc_6FC4
; ---------------------------------------------------------------------------

loc_6E8A:				; CODE XREF: sub_6E34+46j
		bsr.w	sub_6694
		move.l	d0,d6
		bra.w	loc_6FC0
; ---------------------------------------------------------------------------

loc_6E94:				; CODE XREF: sub_6E34+36j
		move.b	$53(a6),d4
		move.w	$54(a6),d6
		move.w	d7,d0
		btst	#$E,d0
		bne.s	loc_6EAC
		bclr	#6,(a4)
		bra.w	loc_6FD8
; ---------------------------------------------------------------------------

loc_6EAC:				; CODE XREF: sub_6E34+6Ej
		bsr.w	sub_707A
		move.w	(a1),d6
		move.w	d6,$BB4(a6)
		clr.w	$BB6(a6)
		bset	#6,(a4)
		move.w	$566(a5),d4
		bra.w	loc_6FD8
; ---------------------------------------------------------------------------

loc_6EC6:				; CODE XREF: sub_6E34+1Cj
		move.w	(a4),d6
		eor.w	d7,d6
		btst	#$E,d6
		beq.s	loc_6EE4
		bchg	#6,(a4)
		bne.s	loc_6EE4
		bsr.w	sub_707A
		move.w	(a1),d6
		move.w	d6,$BB4(a6)
		clr.w	$BB6(a6)

loc_6EE4:				; CODE XREF: sub_6E34+9Aj sub_6E34+A0j
		cmpi.b	#$3F,$3F(a6) ; '?'
		bhi.s	loc_6F24
		cmpi.w	#$500,(a3)
		bne.s	loc_6F44
		btst	#1,$A22(a6)
		beq.s	loc_6F56
		move.b	$63(a6),d4
		moveq	#0,d5
		btst	#6,$A23(a6)
		beq.s	loc_6F66
		btst	#7,$A23(a6)
		beq.s	loc_6F66
		bra.w	loc_6F78
; ---------------------------------------------------------------------------

loc_6F14:				; CODE XREF: sub_6E34+120j
		move.b	$A17(a6),d4
		move.l	$A18(a6),d6
		move.l	$A1C(a6),d5
		bra.w	loc_6FC0
; ---------------------------------------------------------------------------

loc_6F24:				; CODE XREF: sub_6E34+B6j
		bclr	#1,$A22(a6)
		moveq	#0,d5
		move.l	d5,$40C(a5)
		move.b	$63(a6),d4
		bclr	#6,$A23(a6)
		bclr	#7,$A23(a6)
		bra.w	loc_6FDC
; ---------------------------------------------------------------------------

loc_6F44:				; CODE XREF: sub_6E34+BCj
		bclr	#1,$A22(a6)
		cmpi.w	#$100,(a3)
		beq.s	loc_6F56
		cmpi.w	#$300,(a3)
		bne.s	loc_6F14

loc_6F56:				; CODE XREF: sub_6E34+C4j
					; sub_6E34+11Aj
		move.b	$50(a6),d4
		beq.s	loc_6F62
		cmpi.b	#$FF,d4
		bne.s	loc_6F66

loc_6F62:				; CODE XREF: sub_6E34+126j
		move.b	$A17(a6),d4

loc_6F66:				; CODE XREF: sub_6E34+D2j sub_6E34+DAj ...
		move.l	$4C(a6),d5
		cmpi.l	#$FFFFFFFF,d5
		bne.s	loc_6F78
		move.l	$A1C(a6),d5
		bra.s	loc_6F7E
; ---------------------------------------------------------------------------

loc_6F78:				; CODE XREF: sub_6E34+DCj
					; sub_6E34+13Cj
		bset	#7,$A23(a6)

loc_6F7E:				; CODE XREF: sub_6E34+142j
		move.w	d7,d0
		andi.w	#$400D,d0
		beq.s	loc_6FA8
		cmpi.b	#2,$42E(a5)
		beq.s	loc_6FA8
		bsr.w	sub_7080
		lea	$BBC(a6),a2
		swap	d5
		move.w	d5,(a2)+
		swap	d5
		bsr.w	sub_70B6
		moveq	#0,d6
		move.w	(a1),d6
		swap	d6
		bra.s	loc_6FBA
; ---------------------------------------------------------------------------

loc_6FA8:				; CODE XREF: sub_6E34+150j
					; sub_6E34+158j
		move.l	$48(a6),d6
		cmpi.l	#$FFFFFFFF,d6
		bne.s	loc_6FBA
		move.l	$A18(a6),d6
		bra.s	loc_6FC0
; ---------------------------------------------------------------------------

loc_6FBA:				; CODE XREF: sub_6E34+172j
					; sub_6E34+17Ej
		bset	#6,$A23(a6)

loc_6FC0:				; CODE XREF: sub_6E34+5Cj sub_6E34+ECj ...
		move.l	d6,$A18(a6)

loc_6FC4:				; CODE XREF: sub_6E34+52j
		move.l	d5,$A1C(a6)
		move.l	d5,$40C(a5)
		moveq	#0,d0
		move.b	$42E(a5),d0
		asl.w	#2,d0
		jsr	loc_6FE2(pc,d0.w)

loc_6FD8:				; CODE XREF: sub_6E34+14j sub_6E34+2Ej ...
		move.w	d6,$424(a5)

loc_6FDC:				; CODE XREF: sub_6E34+10Cj
		move.b	d4,$A17(a6)
		rts
; End of function sub_6E34

; ---------------------------------------------------------------------------

loc_6FE2:
		bra.w	loc_6FF2
; ---------------------------------------------------------------------------
		bra.w	loc_6FF4
; ---------------------------------------------------------------------------
		bra.w	loc_6FF8
; ---------------------------------------------------------------------------
		bra.w	loc_7030
; ---------------------------------------------------------------------------

loc_6FF2:				; CODE XREF: BOOT:loc_6FE2j
		move.l	d5,d6

loc_6FF4:				; CODE XREF: BOOT:00006FE6j
		swap	d6
		rts
; ---------------------------------------------------------------------------

loc_6FF8:				; CODE XREF: BOOT:00006FEAj
		btst	#$A,d7
		bne.s	loc_7010
		move.w	d7,d0
		andi.w	#$400D,d0
		beq.s	loc_7010
		moveq	#0,d1
		move.b	d4,d1
		bsr.w	sub_6694
		move.l	d0,d6

loc_7010:				; CODE XREF: BOOT:00006FFCj
					; BOOT:00007004j
		moveq	#0,d1
		move.b	d4,d1
		cmp.b	$53(a6),d1
		beq.s	loc_702A
		addq.w	#1,d1
		bsr.w	sub_6694
		tst.b	d0
		beq.s	loc_7026
		bra.s	loc_7040
; ---------------------------------------------------------------------------

loc_7026:				; CODE XREF: BOOT:00007022j
		nop
		nop

loc_702A:				; CODE XREF: BOOT:00007018j
		move.l	$54(a6),d0
		bra.s	loc_7040
; ---------------------------------------------------------------------------

loc_7030:				; CODE XREF: BOOT:00006FEEj
		move.l	$54(a6),d0
		move.w	d7,d1
		btst	#$E,d1
		beq.s	loc_7040
		move.l	$BB4(a6),d0

loc_7040:				; CODE XREF: BOOT:00007024j
					; BOOT:0000702Ej ...
		move.l	d6,d1
		bsr.s	sub_7048
		move.w	d0,d6
		rts

; =============== S U B	R O U T	I N E =======================================


sub_7048:				; CODE XREF: BOOT:00007042p
		lea	$BB8(a6),a0
		lea	$BBC(a6),a1
		move.l	d0,(a0)+
		move.l	d1,(a1)+
		subq.w	#1,a0
		subq.w	#1,a1
		move	#4,ccr
		sbcd	-(a1),-(a0)
		sbcd	-(a1),-(a0)
		move	sr,-(sp)
		bcc.s	loc_7068
		subi.b	#$40,(a0) ; '@'

loc_7068:				; CODE XREF: sub_7048+1Aj
		move	(sp)+,sr
		sbcd	-(a1),-(a0)
		move.w	(a0),d0
		rts
; End of function sub_7048


; =============== S U B	R O U T	I N E =======================================


sub_7070:				; CODE XREF: sub_6E34+24p
		move.w	$4FE(a5),d0
		lea	$500(a5),a0
		bra.s	loc_7088
; End of function sub_7070


; =============== S U B	R O U T	I N E =======================================


sub_707A:				; CODE XREF: sub_6E34:loc_6EACp
					; sub_6E34+A2p
		move.w	$566(a5),d0
		bra.s	loc_7084
; End of function sub_707A


; =============== S U B	R O U T	I N E =======================================


sub_7080:				; CODE XREF: sub_6E34+48p
					; sub_6E34+15Ap
		move.w	$564(a5),d0

loc_7084:				; CODE XREF: sub_707A+4j
		lea	$568(a5),a0

loc_7088:				; CODE XREF: sub_7070+8j
		movem.l	d1-d2,-(sp)
		moveq	#0,d2
		subq.w	#1,d0
		bmi.s	loc_70A4
		lea	$A24(a6),a1

loc_7096:				; CODE XREF: sub_7080+20j
		moveq	#0,d1
		move.b	(a0)+,d1
		asl.w	#2,d1
		add.l	(a1,d1.w),d2
		dbf	d0,loc_7096

loc_70A4:				; CODE XREF: sub_7080+10j
		move.l	d2,d0
		bsr.w	sub_71AC
		lea	$BB8(a6),a1
		move.l	d0,(a1)
		movem.l	(sp)+,d1-d2
		rts
; End of function sub_7080


; =============== S U B	R O U T	I N E =======================================


sub_70B6:				; CODE XREF: sub_6A02+38p
					; sub_6E34+168p
		addq.w	#2,a1
		abcd	-(a2),-(a1)
		bcs.s	loc_70D8
		cmpi.b	#$60,(a1) ; '`'
		bcs.s	loc_70E0
		movem.l	d0-d1,-(sp)
		move.b	(a1),d0
		moveq	#$40,d1	; '@'
		abcd	d1,d0
		move	sr,-(sp)
		move.b	d0,(a1)
		move	(sp)+,sr
		movem.l	(sp)+,d0-d1
		bra.s	loc_70E0
; ---------------------------------------------------------------------------

loc_70D8:				; CODE XREF: sub_70B6+4j
		move	sr,-(sp)
		addi.b	#$40,(a1) ; '@'
		move	(sp)+,sr

loc_70E0:				; CODE XREF: sub_70B6+Aj sub_70B6+20j
		abcd	-(a2),-(a1)
		rts
; End of function sub_70B6

; ---------------------------------------------------------------------------
		addq.w	#3,a1
		abcd	-(a2),-(a1)
		bcs.s	loc_7106
		cmpi.b	#$75,(a1) ; 'u'
		bcs.s	loc_710E
		movem.l	d0-d1,-(sp)
		move.b	(a1),d0
		moveq	#$25,d1	; '%'
		abcd	d1,d0
		move	sr,-(sp)
		move.b	d0,(a1)
		move	(sp)+,sr
		movem.l	(sp)+,d0-d1
		bra.s	loc_710E
; ---------------------------------------------------------------------------

loc_7106:				; CODE XREF: BOOT:000070E8j
		move	sr,-(sp)
		addi.b	#$25,(a1) ; '%'
		move	(sp)+,sr

loc_710E:				; CODE XREF: BOOT:000070EEj
					; BOOT:00007104j
		abcd	-(a2),-(a1)
		bcs.s	loc_712A
		cmpi.b	#$60,(a1) ; '`'
		bcs.s	loc_7132
		movem.l	d0-d1,-(sp)
		move.b	(a1),d0
		moveq	#$40,d1	; '@'
		abcd	d1,d0
		move.b	d0,(a1)
		movem.l	(sp)+,d0-d1
		bra.s	loc_7132
; ---------------------------------------------------------------------------

loc_712A:				; CODE XREF: BOOT:00007110j
		move	sr,-(sp)
		addi.b	#$40,(a1) ; '@'
		move	(sp)+,sr

loc_7132:				; CODE XREF: BOOT:00007116j
					; BOOT:00007128j
		abcd	-(a2),-(a1)
		move.l	(a1),d2
		rts
; ---------------------------------------------------------------------------

loc_7138:				; CODE XREF: sub_7302+5Aj
		move.w	$44(a6),d0
		andi.w	#$F000,d0
		beq.s	loc_714A
		cmpi.b	#$3F,$3F(a6) ; '?'
		bls.s	locret_714E

loc_714A:				; CODE XREF: BOOT:00007140j
		bsr.w	pauseCdAudio

locret_714E:				; CODE XREF: BOOT:00007148j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_7150:				; CODE XREF: sub_716C+8p sub_716C+12p	...
		move.w	d1,-(sp)
		andi.w	#$FF,d0
		ror.w	#4,d0
		lsl.b	#1,d0
		move.b	d0,d1
		lsl.b	#2,d0
		add.b	d0,d1
		rol.w	#4,d0
		andi.w	#$F,d0
		add.b	d1,d0
		move.w	(sp)+,d1
		rts
; End of function sub_7150


; =============== S U B	R O U T	I N E =======================================


sub_716C:				; CODE XREF: sub_6850+A0p sub_6850+AAp ...

var_8		= -8
var_7		= -7
var_6		= -6

		move.l	d1,-(sp)
		move.l	d0,-(sp)
		move.b	8+var_6(sp),d0
		bsr.s	sub_7150
		moveq	#0,d1
		move.w	d0,d1
		move.b	8+var_7(sp),d0
		bsr.s	sub_7150
		mulu.w	#$4B,d0	; 'K'
		add.l	d0,d1
		move.b	8+var_8(sp),d0
		bsr.s	sub_7150
		mulu.w	#$1194,d0
		add.l	d1,d0
		move.l	(sp)+,d1
		move.l	(sp)+,d1
		rts
; End of function sub_716C


; =============== S U B	R O U T	I N E =======================================


sub_7198:				; CODE XREF: sub_71AC+Ep sub_71AC+1Ep	...
		andi.l	#$FF,d0
		divu.w	#$A,d0
		swap	d0
		ror.w	#4,d0
		lsl.l	#4,d0
		swap	d0
		rts
; End of function sub_7198


; =============== S U B	R O U T	I N E =======================================


sub_71AC:				; CODE XREF: sub_7080+26p

var_8		= -8
var_7		= -7
var_6		= -6

		move.l	d1,-(sp)
		moveq	#0,d1
		move.l	d1,-(sp)
		divu.w	#$4B,d0	; 'K'
		move.w	d0,d1
		swap	d0
		bsr.s	sub_7198
		move.b	d0,8+var_6(sp)
		move.l	d1,d0
		divu.w	#$3C,d0	; '<'
		move.w	d0,d1
		swap	d0
		bsr.s	sub_7198
		move.b	d0,8+var_7(sp)
		move.l	d1,d0
		divu.w	#$64,d0	; 'd'
		move.w	d0,d1
		swap	d0
		bsr.s	sub_7198
		move.b	d0,8+var_8(sp)
		move.l	(sp)+,d0
		move.l	(sp)+,d1
		rts
; End of function sub_71AC


; =============== S U B	R O U T	I N E =======================================


sub_71E6:				; CODE XREF: sub_6178+10j
					; BOOT:loc_7240p ...
		lea	$32(a6),a0
		move.w	(a0),d1
		beq.s	locret_71FA
		clr.w	(a0)+
		move.w	(a0),d0
		add.w	d1,d1
		add.w	d1,d1
		jmp	*+2(pc,d1.w)
; ---------------------------------------------------------------------------

locret_71FA:				; CODE XREF: sub_71E6+6j
					; BOOT:00007204j
		rts
; End of function sub_71E6

; ---------------------------------------------------------------------------
		bra.w	sub_6142
; ---------------------------------------------------------------------------
		bra.w	loc_79A2
; ---------------------------------------------------------------------------
		bra.w	locret_71FA
; ---------------------------------------------------------------------------

loc_7208:				; CODE XREF: BOOT:000060A2j
		lea	RAM_BASE,a6
		bsr.w	sub_619A
		btst	#GA_MODE,(GA_MEMORY_MODE).w
		beq.s	loc_722E
		btst	#GA_RET,(GA_MEMORY_MODE).w
		bne.s	loc_722E
		bset	#GA_RET,(GA_MEMORY_MODE).w

loc_7226:				; CODE XREF: BOOT:0000722Cj
		btst	#GA_RET,(GA_MEMORY_MODE).w
		beq.s	loc_7226

loc_722E:				; CODE XREF: BOOT:00007216j
					; BOOT:0000721Ej
		bsr.w	sub_6296
		bsr.w	sub_6414
		tst.b	3(a6)
		beq.s	loc_7240
		bsr.w	sub_66FE

loc_7240:				; CODE XREF: BOOT:0000723Aj
		bsr.w	sub_71E6

loc_7244:				; CODE XREF: BOOT:00007254j
		btst	#GA_MODE,(GA_MEMORY_MODE).w
		beq.s	locret_726C
		btst	#1,(GA_COMM_MAINFLAGS).l
		bne.s	loc_7244
		btst	#GA_RET,(GA_MEMORY_MODE).w
		beq.s	locret_726C
		bclr	#GA_RET,(GA_MEMORY_MODE).w

loc_7264:				; CODE XREF: BOOT:0000726Aj
		btst	#GA_RET,(GA_MEMORY_MODE).w
		bne.s	loc_7264

locret_726C:				; CODE XREF: BOOT:0000724Aj
					; BOOT:0000725Cj
		rts

; =============== S U B	R O U T	I N E =======================================


sub_726E:				; CODE XREF: sub_7302+4p
		bclr	#GA_PM0,(GA_MEMORY_MODE).w
		bclr	#GA_PM1,(GA_MEMORY_MODE).w
		bset	#GA_MODE,(GA_MEMORY_MODE).w
		btst	#GA_RET,(GA_MEMORY_MODE).w
		beq.s	loc_7296
		bclr	#GA_RET,(GA_MEMORY_MODE).w

loc_728E:				; CODE XREF: sub_726E+26j
		btst	#GA_RET,(GA_MEMORY_MODE).w
		bne.s	loc_728E

loc_7296:				; CODE XREF: sub_726E+18j
		move.w	#SCDINIT,d0
		lea	$C0A(a6),a0
		jsr	_CDBIOS
		move.w	#SCDSTART,d0
		moveq	#1,d1
		jsr	_CDBIOS
		lea	($CE080).l,a0
		clr.l	$7C(a0)
		move.l	#$AFFFC,(a0)
		move.b	#1,4(a0)
		moveq	#0,d1
		lea	$BE4(a6),a0
		moveq	#$12,d0

loc_72CA:				; CODE XREF: sub_726E+5Ej
		move.w	d1,(a0)+
		dbf	d0,loc_72CA
		lea	(WORD_RAM_1M).l,a0
		move.w	#$35FF,d0

loc_72DA:				; CODE XREF: sub_726E+6Ej
		move.l	d1,(a0)+
		dbf	d0,loc_72DA
		lea	(unk_CE000).l,a0
		move.w	#$F,d0

loc_72EA:				; CODE XREF: sub_726E+7Ej
		move.l	d1,(a0)+
		dbf	d0,loc_72EA
		bsr.w	sub_7AC0
		bsr.w	sub_66F4
		st	6(a6)
		bsr.w	sub_61CA
		rts
; End of function sub_726E


; =============== S U B	R O U T	I N E =======================================


sub_7302:				; CODE XREF: BOOT:00006120j
		bsr.w	sub_6150
		bsr.w	sub_726E

loc_730A:				; CODE XREF: sub_7302+20j sub_7302+48j
		bsr.w	sub_6166
		bsr.w	sub_61E0
		bne.s	loc_7350
		bsr.w	sub_6150
		bne.s	loc_7350
		bsr.w	sub_79AA

loc_731E:				; CODE XREF: sub_7302+4Cj
		bsr.w	sub_77D8
		beq.s	loc_730A
		bclr	#0,$BFC(a6)
		beq.s	loc_733C
		moveq	#0,d7
		moveq	#0,d5
		bsr.w	sub_744A
		moveq	#0,d7
		moveq	#8,d5
		bsr.w	sub_7480

loc_733C:				; CODE XREF: sub_7302+28j
		lea	(_CDBIOS).w,a3
		lea	$BC0(a6),a0
		move.w	#SCDREAD,d0
		jsr	(a3)
		bcs.s	loc_730A
		bsr.s	sub_7360
		bra.s	loc_731E
; ---------------------------------------------------------------------------

loc_7350:				; CODE XREF: sub_7302+10j sub_7302+16j
		move.w	#SCDSTOP,d0
		jsr	_CDBIOS
		bsr.w	sub_7ACA
		bra.w	loc_7138
; End of function sub_7302


; =============== S U B	R O U T	I N E =======================================


sub_7360:				; CODE XREF: sub_7302+4Ap
		move.b	(a0)+,d0
		bne.s	loc_736A
		addq.l	#1,$BFE(a6)
		rts
; ---------------------------------------------------------------------------

loc_736A:				; CODE XREF: sub_7360+2j
		addq.l	#1,$C06(a6)
		cmpi.b	#8,d0
		beq.w	locret_7382
		cmpi.b	#9,d0
		beq.s	loc_7384
		addq.l	#1,$C02(a6)
		rts
; ---------------------------------------------------------------------------

locret_7382:				; CODE XREF: sub_7360+12j
		rts
; ---------------------------------------------------------------------------

loc_7384:				; CODE XREF: sub_7360+1Aj
		moveq	#0,d0
		move.b	(a0)+,d0
		cmpi.b	#$26,d0	; '&'
		bhi.w	loc_7436
		addq.w	#2,a0
		add.w	d0,d0
		add.w	d0,d0
		jmp	loc_739A(pc,d0.w)
; ---------------------------------------------------------------------------

loc_739A:
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_743C
; ---------------------------------------------------------------------------
		bra.w	loc_748C
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_75E2
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_74A4
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7512
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_75A6
; ---------------------------------------------------------------------------
		bra.w	loc_75AA
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7436
; ---------------------------------------------------------------------------
		bra.w	loc_7632
; ---------------------------------------------------------------------------

loc_7436:				; CODE XREF: sub_7360+2Cj
					; sub_7360:loc_739Aj ...
		addq.l	#1,$C02(a6)
		rts
; ---------------------------------------------------------------------------

loc_743C:				; CODE XREF: sub_7360+3Ej
		move.b	(a0)+,d7
		move.b	(a0)+,d5
		beq.s	sub_744A
		cmpi.b	#8,d5
		beq.s	sub_7480
		rts
; End of function sub_7360


; =============== S U B	R O U T	I N E =======================================


sub_744A:				; CODE XREF: sub_7302+2Ep sub_7360+E0j
		bsr.w	sub_77C0
		lea	(WORD_RAM_1M).l,a1
		move.w	#$D7,d1	; '�'

loc_7458:				; CODE XREF: sub_744A+1Aj
		moveq	#$26,d2	; '&'

loc_745A:				; CODE XREF: sub_744A+12j
		move.l	d7,(a1)+
		dbf	d2,loc_745A
		adda.w	#$64,a1	; 'd'
		dbf	d1,loc_7458
		lea	$BE4(a6),a2
		moveq	#$C,d0

loc_746E:				; CODE XREF: sub_744A+26j
		clr.w	(a2)+
		dbf	d0,loc_746E
		lea	(unk_CE080).l,a0
		move.l	#$AFFFC,(a0)
; End of function sub_744A


; =============== S U B	R O U T	I N E =======================================


sub_7480:				; CODE XREF: sub_7302+36p sub_7360+E6j
		moveq	#4,d0
		move.w	d5,d1
		move.l	d7,d2
		bsr.w	sub_77F4
		rts
; End of function sub_7480

; ---------------------------------------------------------------------------

loc_748C:				; CODE XREF: sub_7360+42j
		move.b	(a0)+,d7
		move.l	d7,d2
		add.w	d7,d7
		lea	($CE000).l,a1
		move.w	2(a1,d7.w),(a1)
		moveq	#8,d0
		bsr.w	sub_77F4
		rts
; ---------------------------------------------------------------------------

loc_74A4:				; CODE XREF: sub_7360+8Aj
		move.b	(a0)+,d7
		bsr.w	sub_7816
		bsr.w	sub_77C0
		tst.b	$BE8(a6)
		beq.s	loc_74DA
		cmpi.b	#1,$BE8(a6)
		bne.s	loc_74C4
		bsr.w	sub_783C
		moveq	#0,d0
		bra.s	loc_74CA
; ---------------------------------------------------------------------------

loc_74C4:				; CODE XREF: BOOT:000074BAj
		bsr.w	sub_786A
		moveq	#$31,d0	; '1'

loc_74CA:				; CODE XREF: BOOT:000074C2j
		bsr.w	sub_76C0
		bsr.w	sub_7750
		bsr.w	sub_78C0
		bsr.w	sub_78D2

loc_74DA:				; CODE XREF: BOOT:000074B2j
		tst.b	$BE9(a6)
		beq.w	loc_7574
		cmpi.b	#1,$BE9(a6)
		bne.s	loc_74F4
		bsr.w	sub_78AE
		moveq	#0,d1
		bra.w	loc_74FA
; ---------------------------------------------------------------------------

loc_74F4:				; CODE XREF: BOOT:000074E8j
		bsr.w	sub_7898
		moveq	#$11,d1

loc_74FA:				; CODE XREF: BOOT:000074F0j
		bsr.w	sub_76EA
		bsr.w	sub_776E
		moveq	#0,d0
		bsr.w	loc_770E
		moveq	#$14,d0
		bsr.w	sub_77F4
		bra.w	loc_756C
; ---------------------------------------------------------------------------

loc_7512:				; CODE XREF: sub_7360+9Aj
		addq.w	#1,a0
		bsr.w	sub_7816
		tst.b	$BE8(a6)
		beq.s	loc_7550
		cmpi.b	#1,$BE8(a6)
		bne.s	loc_7538
		moveq	#$31,d0	; '1'
		bsr.w	sub_76C0
		bsr.w	sub_783C
		moveq	#0,d3
		bsr.w	sub_7794
		bra.s	loc_7548
; ---------------------------------------------------------------------------

loc_7538:				; CODE XREF: BOOT:00007524j
		moveq	#0,d0
		bsr.w	sub_76C0
		bsr.w	sub_786A
		moveq	#$31,d3	; '1'
		bsr.w	sub_7794

loc_7548:				; CODE XREF: BOOT:00007536j
		bsr.w	sub_78C0
		bsr.w	sub_78D2

loc_7550:				; CODE XREF: BOOT:0000751Cj
		tst.b	$BE9(a6)
		beq.s	loc_7574
		cmpi.b	#1,$BE9(a6)
		bne.s	loc_7566
		bsr.w	sub_78AE
		moveq	#0,d1
		bra.s	loc_756C
; ---------------------------------------------------------------------------

loc_7566:				; CODE XREF: BOOT:0000755Cj
		bsr.w	sub_7898
		moveq	#$11,d1

loc_756C:				; CODE XREF: BOOT:0000750Ej
					; BOOT:00007564j
		bsr.w	sub_76EA
		bsr.w	sub_7940

loc_7574:				; CODE XREF: BOOT:000074DEj
					; BOOT:00007554j
		move.w	$BE4(a6),d0
		move.w	$BE6(a6),d2
		move.w	$BEA(a6),d3
		move.w	$BF4(a6),d4
		mulu.w	#6,d3
		sub.w	d0,d3
		addi.w	#$A,d3
		mulu.w	#$C,d4
		add.w	d2,d4
		addi.w	#-4,d4
		move.w	d3,(unk_CE080).l
		move.w	d4,(unk_CE082).l
		rts
; ---------------------------------------------------------------------------

loc_75A6:				; CODE XREF: sub_7360+B2j
		moveq	#0,d7
		bra.s	loc_75AC
; ---------------------------------------------------------------------------

loc_75AA:				; CODE XREF: sub_7360+B6j
		moveq	#$10,d7

loc_75AC:				; CODE XREF: BOOT:000075A8j
		lea	(word_CE002).l,a1
		adda.w	d7,a1
		moveq	#7,d7

loc_75B6:				; CODE XREF: BOOT:000075D6j
		move.b	(a0),d1
		move.w	(a0)+,d2
		move.w	d2,d3
		lsr.b	#2,d1
		andi.w	#$F,d1
		lsl.b	#2,d2
		lsr.w	#2,d2
		andi.w	#$F0,d2	; '�'
		lsl.w	#8,d3
		andi.w	#$F00,d3
		or.w	d1,d2
		or.w	d2,d3
		move.w	d3,(a1)+
		dbf	d7,loc_75B6
		moveq	#$18,d0
		bsr.w	sub_77F4
		rts
; ---------------------------------------------------------------------------

loc_75E2:				; CODE XREF: sub_7360+52j
		move.b	(a0)+,d7
		move.b	d7,d5
		andi.b	#$30,d5	; '0'
		lsl.w	#2,d5
		move.b	(a0)+,d6
		or.b	d6,d5
		lsr.w	#4,d5
		andi.b	#$F,d5
		tst.b	d5
		beq.s	loc_7604
		cmp.b	(unk_CE084).l,d5
		beq.s	loc_7604
		rts
; ---------------------------------------------------------------------------

loc_7604:				; CODE XREF: BOOT:000075F8j
					; BOOT:00007600j
		bsr.w	sub_7682
		moveq	#$B,d4

loc_760A:				; CODE XREF: BOOT:00007622j
		move.b	(a0)+,d5
		lsl.b	#2,d5
		moveq	#5,d3

loc_7610:				; CODE XREF: BOOT:loc_761Aj
		add.b	d5,d5
		bcs.s	loc_7618
		move.b	d7,(a1)+
		bra.s	loc_761A
; ---------------------------------------------------------------------------

loc_7618:				; CODE XREF: BOOT:00007612j
		move.b	d6,(a1)+

loc_761A:				; CODE XREF: BOOT:00007616j
		dbf	d3,loc_7610
		lea	$1FA(a1),a1
		dbf	d4,loc_760A
		bsr.w	sub_770C
		moveq	#$C,d0
		bsr.w	sub_77F4
		rts
; ---------------------------------------------------------------------------

loc_7632:				; CODE XREF: sub_7360+D2j
		move.b	(a0)+,d7
		move.b	d7,d5
		andi.b	#$30,d5	; '0'
		lsl.w	#2,d5
		move.b	(a0)+,d6
		or.b	d6,d5
		lsr.w	#4,d5
		andi.b	#$F,d5
		tst.b	d5
		beq.s	loc_7654
		cmp.b	(unk_CE084).l,d5
		beq.s	loc_7654
		rts
; ---------------------------------------------------------------------------

loc_7654:				; CODE XREF: BOOT:00007648j
					; BOOT:00007650j
		bsr.w	sub_7682
		moveq	#$B,d4

loc_765A:				; CODE XREF: BOOT:00007672j
		move.b	(a0)+,d5
		lsl.b	#2,d5
		moveq	#5,d3

loc_7660:				; CODE XREF: BOOT:loc_766Aj
		add.b	d5,d5
		bcs.s	loc_7668
		eor.b	d7,(a1)+
		bra.s	loc_766A
; ---------------------------------------------------------------------------

loc_7668:				; CODE XREF: BOOT:00007662j
		eor.b	d6,(a1)+

loc_766A:				; CODE XREF: BOOT:00007666j
		dbf	d3,loc_7660
		lea	$1FA(a1),a1
		dbf	d4,loc_765A
		bsr.w	sub_770C
		moveq	#$C,d0
		bsr.w	sub_77F4
		rts

; =============== S U B	R O U T	I N E =======================================


sub_7682:				; CODE XREF: BOOT:loc_7604p
					; BOOT:loc_7654p
		move.b	(a0)+,d1
		move.b	(a0)+,d0
		bsr.w	sub_76EA
		bsr.w	sub_76C0
		movem.l	d0-d1,-(sp)
		lsl.w	#8,d1
		add.l	d1,d1
		add.l	d1,d0
		lea	(WORD_RAM_2M).l,a1
		adda.l	d0,a1
		movem.l	(sp)+,d0-d1
		rts
; End of function sub_7682


; =============== S U B	R O U T	I N E =======================================


sub_76A6:
		move.b	(a0)+,d1
		move.b	(a0)+,d0
		bsr.w	sub_76EA
		bsr.w	sub_76C6
		lsl.l	#8,d1
		add.w	d1,d0
		lea	(WORD_RAM_1M).l,a1
		adda.l	d0,a1
		rts
; End of function sub_76A6


; =============== S U B	R O U T	I N E =======================================


sub_76C0:				; CODE XREF: BOOT:loc_74CAp
					; BOOT:00007528p ...
		bsr.s	sub_76C6
		add.w	d0,d0
		rts
; End of function sub_76C0


; =============== S U B	R O U T	I N E =======================================


sub_76C6:				; CODE XREF: sub_76A6+8p sub_76C0p
		andi.l	#$3F,d0	; '?'
		sub.w	$BEC(a6),d0
		bmi.s	loc_76DE
		cmpi.b	#$33,d0	; '3'
		bls.s	loc_76E2
		subi.w	#$34,d0	; '4'
		bra.s	loc_76E2
; ---------------------------------------------------------------------------

loc_76DE:				; CODE XREF: sub_76C6+Aj
		addi.w	#$34,d0	; '4'

loc_76E2:				; CODE XREF: sub_76C6+10j sub_76C6+16j
		move.w	d0,d2
		add.w	d0,d0
		add.w	d2,d0
		rts
; End of function sub_76C6


; =============== S U B	R O U T	I N E =======================================


sub_76EA:				; CODE XREF: BOOT:loc_74FAp
					; BOOT:loc_756Cp ...
		andi.l	#$1F,d1
		add.w	$BF6(a6),d1
		bmi.s	loc_7702
		cmpi.b	#$11,d1
		bls.s	loc_7706
		subi.w	#$12,d1
		bra.s	loc_7706
; ---------------------------------------------------------------------------

loc_7702:				; CODE XREF: sub_76EA+Aj
		addi.w	#$12,d1

loc_7706:				; CODE XREF: sub_76EA+10j sub_76EA+16j
		mulu.w	#$C,d1
		rts
; End of function sub_76EA


; =============== S U B	R O U T	I N E =======================================


sub_770C:				; CODE XREF: BOOT:00007626p
					; BOOT:00007676p ...
		lsr.w	#1,d0

loc_770E:				; CODE XREF: BOOT:00007504p
		moveq	#0,d4
		andi.l	#3,d2
		beq.s	loc_7720
		cmpi.b	#3,d2
		beq.s	loc_7720
		moveq	#1,d4

loc_7720:				; CODE XREF: sub_770C+Aj sub_770C+10j
		andi.w	#$FFFC,d0
		move.w	d0,d2
		lsl.w	#8,d0
		add.w	d1,d1
		add.w	d1,d1
		mulu.w	#$D8,d2	; '�'
		add.w	d1,d2
		add.w	d0,d1
		addi.w	#$60,d2	; '`'
		move.l	d2,d3
		andi.w	#$C000,d2
		rol.l	#2,d2
		andi.w	#$3FFF,d3
		ori.w	#$4000,d3
		move.w	d3,d2
		swap	d2
		or.w	d4,d1
		rts
; End of function sub_770C


; =============== S U B	R O U T	I N E =======================================


sub_7750:				; CODE XREF: BOOT:000074CEp
		move.w	d2,-(sp)
		lea	(WORD_RAM_2M).l,a1
		adda.l	d0,a1
		move.w	#$D7,d2	; '�'

loc_775E:				; CODE XREF: sub_7750+16j
		move.l	d7,(a1)+
		move.w	d7,(a1)+
		lea	$1FA(a1),a1
		dbf	d2,loc_775E
		move.w	(sp)+,d2
		rts
; End of function sub_7750


; =============== S U B	R O U T	I N E =======================================


sub_776E:				; CODE XREF: BOOT:000074FEp
		movem.l	d1-d3,-(sp)
		lsl.w	#8,d1
		lea	(WORD_RAM_1M).l,a1
		adda.l	d1,a1
		moveq	#$B,d2

loc_777E:				; CODE XREF: sub_776E+1Cj
		moveq	#$26,d3	; '&'

loc_7780:				; CODE XREF: sub_776E+14j
		move.l	d7,(a1)+
		dbf	d3,loc_7780
		lea	$64(a1),a1
		dbf	d2,loc_777E
		movem.l	(sp)+,d1-d3
		rts
; End of function sub_776E


; =============== S U B	R O U T	I N E =======================================


sub_7794:				; CODE XREF: BOOT:00007532p
					; BOOT:00007544p
		move.w	d6,-(sp)
		lea	(WORD_RAM_2M).l,a1
		lea	(a1,d0.l),a2
		move.w	d3,d0
		bsr.w	sub_76C0
		adda.l	d0,a1
		move.w	#$D7,d6	; '�'

loc_77AC:				; CODE XREF: sub_7794+24j
		move.l	(a2)+,(a1)+
		move.w	(a2)+,(a1)+
		lea	$1FA(a1),a1
		lea	$1FA(a2),a2
		dbf	d6,loc_77AC
		move.w	(sp)+,d6
		rts
; End of function sub_7794


; =============== S U B	R O U T	I N E =======================================


sub_77C0:				; CODE XREF: sub_744Ap	BOOT:000074AAp
		move.w	d0,-(sp)
		move.b	d7,d0
		lsl.w	#4,d7
		or.b	d0,d7
		move.b	d7,d0
		lsl.w	#8,d7
		move.b	d0,d7
		move.w	d7,d0
		swap	d7
		move.w	d0,d7
		move.w	(sp)+,d0
		rts
; End of function sub_77C0


; =============== S U B	R O U T	I N E =======================================


sub_77D8:				; CODE XREF: sub_7302:loc_731Ep
		lea	(word_CE0FC).l,a4
		move.w	(a4),d0
		move.w	2(a4),d1
		moveq	#3,d2

loc_77E6:				; CODE XREF: sub_77D8+16j
		addq.w	#8,d0
		andi.w	#$7F8,d0
		cmp.w	d0,d1
		dbeq	d2,loc_77E6
		rts
; End of function sub_77D8


; =============== S U B	R O U T	I N E =======================================


sub_77F4:				; CODE XREF: sub_7480+6p
					; BOOT:0000749Ep ...
		move.w	d7,-(sp)
		lea	(word_CE0FC).l,a4
		move.w	(a4),d7
		move.w	d1,6(a4,d7.w)
		move.l	d2,8(a4,d7.w)
		move.w	d0,4(a4,d7.w)
		addq.w	#8,d7
		andi.w	#$7F8,d7
		move.w	d7,(a4)
		move.w	(sp)+,d7
		rts
; End of function sub_77F4


; =============== S U B	R O U T	I N E =======================================


sub_7816:				; CODE XREF: BOOT:000074A6p
					; BOOT:00007514p
		move.b	(a0),d1
		andi.w	#7,d1
		move.w	d1,$BE4(a6)
		move.b	(a0)+,d1
		lsr.b	#4,d1
		move.b	d1,$BE8(a6)
		move.b	(a0),d2
		andi.w	#$F,d2
		move.w	d2,$BE6(a6)
		move.b	(a0)+,d2
		lsr.b	#4,d2
		move.b	d2,$BE9(a6)
		rts
; End of function sub_7816


; =============== S U B	R O U T	I N E =======================================


sub_783C:				; CODE XREF: BOOT:000074BCp
					; BOOT:0000752Cp
		addq.w	#1,$BEA(a6)
		addq.w	#1,$BEC(a6)
		cmpi.w	#$34,$BEC(a6) ;	'4'
		bcs.s	loc_7850
		clr.w	$BEC(a6)

loc_7850:				; CODE XREF: sub_783C+Ej
		subi.w	#$C000,$BEE(a6)
		bcc.s	locret_7868
		st	$BF2(a6)
		subq.w	#1,$BF0(a6)
		bpl.s	locret_7868
		move.w	#$26,$BF0(a6) ;	'&'

locret_7868:				; CODE XREF: sub_783C+1Aj sub_783C+24j
		rts
; End of function sub_783C


; =============== S U B	R O U T	I N E =======================================


sub_786A:				; CODE XREF: BOOT:loc_74C4p
					; BOOT:0000753Ep
		subq.w	#1,$BEA(a6)
		subq.w	#1,$BEC(a6)
		bpl.s	loc_787A
		move.w	#$33,$BEC(a6) ;	'3'

loc_787A:				; CODE XREF: sub_786A+8j
		addi.w	#$C000,$BEE(a6)
		bcc.s	locret_7896
		st	$BF2(a6)
		addq.w	#1,$BF0(a6)
		cmpi.w	#$27,$BF0(a6) ;	'''
		bcs.s	locret_7896
		clr.w	$BF0(a6)

locret_7896:				; CODE XREF: sub_786A+16j sub_786A+26j
		rts
; End of function sub_786A


; =============== S U B	R O U T	I N E =======================================


sub_7898:				; CODE XREF: BOOT:loc_74F4p
					; BOOT:loc_7566p
		addq.w	#1,$BF4(a6)
		addq.w	#1,$BF6(a6)
		cmpi.w	#$12,$BF6(a6)
		bcs.s	locret_78AC
		clr.w	$BF6(a6)

locret_78AC:				; CODE XREF: sub_7898+Ej
		rts
; End of function sub_7898


; =============== S U B	R O U T	I N E =======================================


sub_78AE:				; CODE XREF: BOOT:000074EAp
					; BOOT:0000755Ep
		subq.w	#1,$BF4(a6)
		subq.w	#1,$BF6(a6)
		bpl.s	locret_78BE
		move.w	#$11,$BF6(a6)

locret_78BE:				; CODE XREF: sub_78AE+8j
		rts
; End of function sub_78AE


; =============== S U B	R O U T	I N E =======================================


sub_78C0:				; CODE XREF: BOOT:000074D2p
					; BOOT:loc_7548p
		move.w	d2,-(sp)
		moveq	#0,d1
		bsr.w	sub_770C
		moveq	#$10,d0
		bsr.w	sub_77F4
		move.w	(sp)+,d2
		rts
; End of function sub_78C0


; =============== S U B	R O U T	I N E =======================================


sub_78D2:				; CODE XREF: BOOT:000074D6p
					; BOOT:0000754Cp
		bclr	#0,$BF2(a6)
		beq.s	locret_793E
		move.w	$BF0(a6),d6
		moveq	#0,d0
		cmpi.b	#1,$BE8(a6)
		beq.s	loc_78F2
		subq.w	#1,d6
		bpl.s	loc_78F0
		addi.w	#$27,d6	; '''

loc_78F0:				; CODE XREF: sub_78D2+18j
		moveq	#$33,d0	; '3'

loc_78F2:				; CODE XREF: sub_78D2+14j
		sub.w	$BEA(a6),d0
		mulu.w	#6,d0
		asr.w	#2,d0
		andi.w	#$7E,d0	; '~'
		move.w	$BF4(a6),d2
		mulu.w	#$C0,d2	; '�'
		andi.l	#$F80,d2
		move.w	#$F80,d3
		sub.w	d2,d3
		add.w	d3,d3
		add.w	d0,d2
		swap	d2
		move.w	d3,d2
		move.w	$BF6(a6),d1
		mulu.w	#$C,d1
		lsr.w	#3,d1
		move.w	#$1A,d3
		sub.w	d1,d3
		move.b	d3,d2
		mulu.w	#$1B,d6
		add.w	d6,d1
		addi.w	#$6003,d1
		moveq	#$1C,d0
		bsr.w	sub_77F4

locret_793E:				; CODE XREF: sub_78D2+6j
		rts
; End of function sub_78D2


; =============== S U B	R O U T	I N E =======================================


sub_7940:				; CODE XREF: BOOT:00007570p
		move.w	$BF6(a6),d6
		moveq	#0,d2
		cmpi.b	#1,$BE9(a6)
		beq.s	loc_7956
		subq.w	#1,d6
		bpl.s	loc_7954
		moveq	#$11,d6

loc_7954:				; CODE XREF: sub_7940+10j
		moveq	#$11,d2

loc_7956:				; CODE XREF: sub_7940+Cj
		mulu.w	#$C,d6
		lsr.w	#3,d6
		moveq	#0,d0
		sub.w	$BEA(a6),d0
		mulu.w	#6,d0
		asr.w	#2,d0
		andi.w	#$7E,d0	; '~'
		moveq	#$7E,d3	; '~'
		sub.w	d0,d3
		lsl.w	#7,d3
		add.w	$BF4(a6),d2
		mulu.w	#$C0,d2	; '�'
		andi.l	#$F80,d2
		add.w	d0,d2
		swap	d2
		move.w	d3,d2
		move.w	$BF0(a6),d1
		moveq	#$26,d3	; '&'
		sub.w	d1,d3
		move.b	d3,d2
		mulu.w	#$1B,d1
		add.w	d6,d1
		addi.w	#$6003,d1
		moveq	#$20,d0	; ' '
		bsr.w	sub_77F4
		rts
; End of function sub_7940

; ---------------------------------------------------------------------------

loc_79A2:				; CODE XREF: BOOT:00007200j
		bset	#0,$BFC(a6)
		rts

; =============== S U B	R O U T	I N E =======================================


sub_79AA:				; CODE XREF: sub_7302+18p
		lea	(_CDBIOS).w,a2
		cmpi.w	#$100,$44(a6)
		beq.s	loc_79C6
		clr.l	$1C90(a6)
		tst.b	$135A(a6)
		beq.w	locret_7A64
		bra.w	loc_7AD2
; ---------------------------------------------------------------------------

loc_79C6:				; CODE XREF: sub_79AA+Aj
		tst.b	$135A(a6)
		bne.s	loc_79D8
		st	$135A(a6)

loc_79D0:				; CODE XREF: sub_79AA+56j
		moveq	#$E,d1
		move.w	#CDCSTARTP,d0
		jmp	(a2)
; ---------------------------------------------------------------------------

loc_79D8:				; CODE XREF: sub_79AA+20j
		move.b	$4B(a6),d0
		cmpi.b	#$FF,d0
		beq.s	loc_79E6
		move.b	d0,$135B(a6)

loc_79E6:				; CODE XREF: sub_79AA+36j
		btst	#2,$135B(a6)
		beq.s	loc_79F4
		clr.l	$1C90(a6)
		rts
; ---------------------------------------------------------------------------

loc_79F4:				; CODE XREF: sub_79AA+42j
		move.w	#CDCSTAT,d0
		jsr	(a2)
		bcc.s	loc_7A04
		btst	#0,d0
		bne.s	loc_79D0
		rts
; ---------------------------------------------------------------------------

loc_7A04:				; CODE XREF: sub_79AA+50j
		move.b	#3,(GA_CDC_TRANSFER).w
		move.w	#CDCREAD,d0
		jsr	(a2)
		bcs.s	locret_7A64
		move.w	d1,-(sp)
		lea	$135C(a6),a1
		lea	$1360(a6),a0
		move.w	#CDCTRN,d0
		jsr	(a2)
		lea	$1360(a6),a0
		move.w	(a0)+,d0
		move.w	(a0)+,d1
		move.w	#$7E,d4	; '~'

loc_7A2E:				; CODE XREF: sub_79AA:loc_7A3Ej
		move.w	(a0)+,d2
		cmp.b	d2,d0
		bge.s	loc_7A36
		move.w	d2,d0

loc_7A36:				; CODE XREF: sub_79AA+88j
		move.w	(a0)+,d2
		cmp.b	d2,d1
		bge.s	loc_7A3E
		move.w	d2,d1

loc_7A3E:				; CODE XREF: sub_79AA+90j
		dbf	d4,loc_7A2E
		move.w	(sp)+,d2
		andi.w	#$FF00,d2
		bne.s	loc_7A4C
		exg	d0,d1

loc_7A4C:				; CODE XREF: sub_79AA+9Ej
		bsr.w	sub_7A66
		move.w	d2,$1C90(a6)
		move.w	d1,d0
		bsr.w	sub_7A66
		move.w	d2,$1C92(a6)
		move.w	#CDCACK,d0
		jsr	(a2)

locret_7A64:				; CODE XREF: sub_79AA+14j sub_79AA+66j
		rts
; End of function sub_79AA


; =============== S U B	R O U T	I N E =======================================


sub_7A66:				; CODE XREF: sub_79AA:loc_7A4Cp
					; sub_79AA+ACp
		ror.w	#8,d0
		bmi.s	loc_7A7E
		lea	word_7A82(pc),a0
		move.w	#$1F,d2

loc_7A72:				; CODE XREF: sub_7A66+Ej
		cmp.w	(a0)+,d0
		dbhi	d2,loc_7A72
		addq.w	#1,d2
		lsr.w	#1,d2
		rts
; ---------------------------------------------------------------------------

loc_7A7E:				; CODE XREF: sub_7A66+2j
		moveq	#0,d2
		rts
; End of function sub_7A66

; ---------------------------------------------------------------------------
word_7A82:	dc.w $7214		; DATA XREF: sub_7A66+4o
		dc.w $65AC
		dc.w $5A9D
		dc.w $50C3
		dc.w $47FA
		dc.w $4026
		dc.w $392C
		dc.w $32F5
		dc.w $2D6A
		dc.w $287A
		dc.w $2413
		dc.w $2026
		dc.w $1CA7
		dc.w $198A
		dc.w $16C3
		dc.w $1449
		dc.w $1214
		dc.w $101D
		dc.w $E5C
		dc.w $CCC
		dc.w $B68
		dc.w $A2A
		dc.w $90F
		dc.w $813
		dc.w $732
		dc.w $66A
		dc.w $5B7
		dc.w $518
		dc.w $48A
		dc.w $40C
		dc.w $39B

; =============== S U B	R O U T	I N E =======================================


sub_7AC0:				; CODE XREF: sub_726E+82p
		clr.w	$135A(a6)
		clr.l	$1C90(a6)
		rts
; End of function sub_7AC0


; =============== S U B	R O U T	I N E =======================================


sub_7ACA:				; CODE XREF: sub_7302+56p
		tst.b	$135A(a6)
		bne.s	loc_7AD2
		rts
; ---------------------------------------------------------------------------

loc_7AD2:				; CODE XREF: sub_79AA+18j sub_7ACA+4j
		clr.b	$135A(a6)
		move.w	#$89,d0	; '�'
		jmp	(a2)
; End of function sub_7ACA


; =============== S U B	R O U T	I N E =======================================


sub_7ADC:				; CODE XREF: sub_7B5E+8p
		lea	RAM_BASE(pc),a6
		move.b	#0,($FF8003).l
		move.w	#4,($FF8058).l
		move.w	#$8000,($FF805A).l
		move.w	#0,($FF8060).l
		move.w	#$130,($FF8062).l
		move.l	(_LEVEL1+2).w,$1C98(a6)
		lea	loc_7CB8(pc),a1
		move.l	a1,(_LEVEL1+2).w
		bset	#1,(GA_INT_MASK).w
		move.w	#$9F,d7	; '�'
		lea	$1C9C(a6),a0

loc_7B24:				; CODE XREF: sub_7ADC+4Aj
		clr.l	(a0)+
		dbf	d7,loc_7B24
		move.w	#1,$1C9E(a6)
		bsr.w	sub_61CA
		move.b	#$81,(byte_18022).l
		st	6(a6)
		lea	$1CAA(a6),a5
		bsr.w	sub_80E4
		lea	$1D4A(a6),a5
		bsr.w	sub_80E4
		clr.b	(byte_1801C).l
		move.b	#$FF,$1C94(a6)
		rts
; End of function sub_7ADC


; =============== S U B	R O U T	I N E =======================================


sub_7B5E:				; CODE XREF: BOOT:0000611Cj
		clr.b	$1C96(a6)
		bsr.w	sub_6150
		bsr.w	sub_7ADC
		bsr.w	sub_6166

loc_7B6E:				; CODE XREF: sub_7B5E:loc_7C6Aj
		bsr.w	sub_61E0
		bne.w	loc_7C94
		bsr.w	sub_6150
		bne.w	loc_7C6E
		lea	$833C,a6
		lea	$1CAA(a6),a5
		clr.w	$1CA4(a6)
		lea	$1DEA(a6),a1
		bsr.w	sub_7CD0

loc_7B92:				; CODE XREF: sub_7B5E+44j
		bsr.w	sub_6150
		bne.w	loc_7C6E
		move.b	$1C9E(a6),d0
		cmp.b	$1C9F(a6),d0
		beq.s	loc_7B92
		move.b	$1C9E(a6),$1C9F(a6)

loc_7BAA:				; CODE XREF: sub_7B5E+5Cj
		bsr.w	sub_6150
		bne.w	loc_7C6E
		btst	#1,($FF8003).l
		beq.s	loc_7BAA
		clr.w	$1CA2(a6)
		lea	$1DEA(a6),a0
		bsr.w	sub_8032
		lea	$1D4A(a6),a5
		move.w	#1,$1CA4(a6)
		lea	$1F6A(a6),a1
		bsr.w	sub_7CD0
		move.w	$1CA0(a6),(unk_99C00).l
		move.b	(unk_99C18).l,$1CA8(a6)
		move.b	(byte_1801C).l,(unk_99C16).l
		clr.b	(byte_1801C).l
		move.w	$1CA0(a6),d0
		andi.w	#3,d0
		cmpi.w	#3,d0
		bne.s	loc_7C34
		moveq	#4,d7
		lea	(unk_99C02).l,a0
		lea	$1CAA(a6),a5
		lea	2(a5),a1

loc_7C18:				; CODE XREF: sub_7B5E+BCj
		move.w	(a0)+,(a1)+
		dbf	d7,loc_7C18
		moveq	#4,d7
		lea	(unk_99C0C).l,a0
		lea	$1D4A(a6),a5
		lea	2(a5),a1

loc_7C2E:				; CODE XREF: sub_7B5E+D2j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_7C2E

loc_7C34:				; CODE XREF: sub_7B5E+A8j sub_7B5E+E6j
		bsr.w	sub_6150
		bne.w	loc_7C6E
		move.b	$1C9E(a6),d0
		cmp.b	$1C9F(a6),d0
		beq.s	loc_7C34
		move.b	$1C9E(a6),$1C9F(a6)
		move.w	#1,$1CA2(a6)
		lea	$1F6A(a6),a0
		bsr.w	sub_8032
		addq.w	#1,$1CA0(a6)
		cmpi.w	#7,$1CA0(a6)
		bls.s	loc_7C6A
		clr.w	$1CA0(a6)

loc_7C6A:				; CODE XREF: sub_7B5E+106j
		bra.w	loc_7B6E
; ---------------------------------------------------------------------------

loc_7C6E:				; CODE XREF: sub_7B5E+1Cj sub_7B5E+38j ...
		move.b	#$E0,(byte_18022).l

loc_7C76:				; CODE XREF: sub_7B5E+142j
		bclr	#1,(GA_INT_MASK).w
		move.l	$1C98(a6),(_LEVEL1+2).w
		bclr	#3,($FF8003).l
		bclr	#4,($FF8003).l
		rts
; ---------------------------------------------------------------------------

loc_7C94:				; CODE XREF: sub_7B5E+14j
		move.b	#$E1,(byte_18022).l
		bsr.w	sub_6166
		bra.s	loc_7C76
; End of function sub_7B5E

; ---------------------------------------------------------------------------

loc_7CA2:				; CODE XREF: BOOT:0000609Ej
		lea	RAM_BASE,a6
		bsr.w	sub_619A
		bsr.w	sub_6296
		bsr.w	sub_6414
		bsr.w	sub_71E6
		rts
; ---------------------------------------------------------------------------

loc_7CB8:				; DATA XREF: sub_7ADC+32o
		bchg	#0,$1C9E(a6)
		tst.w	$1CA2(a6)
		beq.s	locret_7CCE

loc_7CC4:				; CODE XREF: BOOT:00007CCCj
		bset	#0,($FF8003).l
		beq.s	loc_7CC4

locret_7CCE:				; CODE XREF: BOOT:00007CC2j
		rte

; =============== S U B	R O U T	I N E =======================================


sub_7CD0:				; CODE XREF: sub_7B5E+30p sub_7B5E+78p
		move.w	$1CA0(a6),d0
		lsl.w	#2,d0
		movem.w	word_7D02(pc,d0.w),d2/d6
		move.w	#$FF68,d1
		move.w	$1CA0(a6),d0
		andi.w	#3,d0
		bne.s	loc_7CF2
		bsr.w	sub_7E94
		bsr.w	sub_7D22

loc_7CF2:				; CODE XREF: sub_7CD0+18j sub_7CD0+2Cj
		bsr.w	sub_7E24
		bsr.w	sub_7E3C
		addq.w	#1,d2
		dbf	d6,loc_7CF2
		rts
; End of function sub_7CD0

; ---------------------------------------------------------------------------
word_7D02:	dc.w $FFB0
		dc.w $27
		dc.w $FFD8
		dc.w $27
		dc.w 0
		dc.w $27
		dc.w $28
		dc.w $27
		dc.w $FFB0
		dc.w $27
		dc.w $FFD8
		dc.w $27
		dc.w 0
		dc.w $27
		dc.w $28
		dc.w $27

; =============== S U B	R O U T	I N E =======================================


sub_7D22:				; CODE XREF: sub_7CD0+1Ep
		move.w	0(a5),d0
		add.w	6(a5),d0
		muls.w	$22(a5),d0
		move.w	4(a5),d3
		muls.w	$20(a5),d3
		add.l	d3,d0
		asr.l	#8,d0
		move.w	d0,$30(a5)
		move.w	2(a5),d0
		muls.w	$20(a5),d0
		asr.l	#8,d0
		move.w	d0,$32(a5)
		move.w	2(a5),d0
		muls.w	$22(a5),d0
		asr.l	#8,d0
		move.w	d0,$34(a5)
		move.w	0(a5),d0
		muls.w	$22(a5),d0
		asr.l	#8,d0
		move.w	d0,$36(a5)
		move.w	$30(a5),d0
		muls.w	$26(a5),d0
		asr.l	#8,d0
		move.w	d0,$38(a5)
		move.w	$30(a5),d0
		muls.w	$24(a5),d0
		asr.l	#8,d0
		move.w	d0,$3C(a5)
		move.w	0(a5),d0
		add.w	6(a5),d0
		muls.w	$24(a5),d0
		move.w	$32(a5),d3
		muls.w	$26(a5),d3
		sub.l	d3,d0
		asr.l	#8,d0
		move.w	d0,$40(a5)
		move.w	0(a5),d0
		add.w	6(a5),d0
		muls.w	$26(a5),d0
		move.w	$32(a5),d3
		muls.w	$24(a5),d3
		add.l	d3,d0
		asr.l	#8,d0
		move.w	d0,$44(a5)
		move.w	$34(a5),d0
		muls.w	$26(a5),d0
		move.w	4(a5),d3
		muls.w	$24(a5),d3
		add.l	d3,d0
		asr.l	#8,d0
		muls.w	0(a5),d0
		move.l	d0,$48(a5)
		move.w	$34(a5),d0
		muls.w	$24(a5),d0
		move.w	4(a5),d3
		muls.w	$26(a5),d3
		sub.l	d3,d0
		asr.l	#8,d0
		muls.w	0(a5),d0
		move.l	d0,$4C(a5)
		move.w	$38(a5),d0
		muls.w	d1,d0
		move.l	d0,$50(a5)
		move.w	$3C(a5),d0
		muls.w	d1,d0
		move.l	d0,$54(a5)
		move.w	$38(a5),d0
		ext.l	d0
		asl.l	#8,d0
		move.l	d0,$5C(a5)
		move.w	$3C(a5),d0
		neg.w	d0
		ext.l	d0
		asl.l	#8,d0
		move.l	d0,$60(a5)
		rts
; End of function sub_7D22


; =============== S U B	R O U T	I N E =======================================


sub_7E24:				; CODE XREF: sub_7CD0:loc_7CF2p
		move.w	$20(a5),d0
		muls.w	d2,d0
		asr.l	#8,d0
		move.w	$36(a5),d3
		sub.w	d0,d3
		bne.s	loc_7E36
		moveq	#1,d3

loc_7E36:				; CODE XREF: sub_7E24+Ej
		move.w	d3,$58(a5)
		rts
; End of function sub_7E24


; =============== S U B	R O U T	I N E =======================================


sub_7E3C:				; CODE XREF: sub_7CD0+26p
		move.w	$40(a5),d0
		muls.w	d2,d0
		add.l	$50(a5),d0
		add.l	$48(a5),d0
		divs.w	$58(a5),d0
		asl.w	#3,d0
		addi.w	#$4C0,d0
		move.w	d0,(a1)+
		move.w	$44(a5),d0
		muls.w	d2,d0
		sub.l	$54(a5),d0
		sub.l	$4C(a5),d0
		divs.w	$58(a5),d0
		asl.w	#3,d0
		addi.w	#$280,d0
		tst.w	$1CA4(a6)
		beq.s	loc_7E78
		addi.w	#$7B00,d0

loc_7E78:				; CODE XREF: sub_7E3C+36j
		move.w	d0,(a1)+
		move.l	$5C(a5),d0
		divs.w	$58(a5),d0
		asl.w	#3,d0
		move.w	d0,(a1)+
		move.l	$60(a5),d0
		divs.w	$58(a5),d0
		asl.w	#3,d0
		move.w	d0,(a1)+
		rts
; End of function sub_7E3C


; =============== S U B	R O U T	I N E =======================================


sub_7E94:				; CODE XREF: sub_7CD0+1Ap
		andi.w	#$1FF,8(a5)
		move.w	8(a5),d7
		move.w	d7,d0
		andi.w	#$80,d0	; '�'
		cmpi.w	#$80,d0	; '�'
		bne.s	loc_7EAC
		addq.w	#1,d7

loc_7EAC:				; CODE XREF: sub_7E94+14j
		move.w	d7,d5
		bsr.s	sub_7EEA
		move.w	d7,$20(a5)
		move.w	d5,d7
		bsr.s	sub_7EE6
		move.w	d7,$22(a5)
		andi.w	#$1FF,$A(a5)
		move.w	$A(a5),d7
		move.w	d7,d0
		andi.w	#$80,d0	; '�'
		cmpi.w	#$80,d0	; '�'
		bne.s	loc_7ED4
		addq.w	#1,d7

loc_7ED4:				; CODE XREF: sub_7E94+3Cj
		move.w	d7,d5
		bsr.s	sub_7EEA
		move.w	d7,$24(a5)
		move.w	d5,d7
		bsr.s	sub_7EE6
		move.w	d7,$26(a5)
		rts
; End of function sub_7E94


; =============== S U B	R O U T	I N E =======================================


sub_7EE6:				; CODE XREF: sub_7E94+22p sub_7E94+4Ap
		addi.w	#$80,d7	; '�'
; End of function sub_7EE6


; =============== S U B	R O U T	I N E =======================================


sub_7EEA:				; CODE XREF: sub_7E94+1Ap sub_7E94+42p
		move.l	d6,-(sp)
		andi.w	#$1FF,d7
		move.w	d7,d6
		btst	#7,d7
		beq.s	loc_7EFA
		not.w	d6

loc_7EFA:				; CODE XREF: sub_7EEA+Cj
		andi.w	#$7F,d6	; ''
		lsl.w	#1,d6
		move.w	word_7F12(pc,d6.w),d6
		btst	#8,d7
		beq.s	loc_7F0C
		neg.w	d6

loc_7F0C:				; CODE XREF: sub_7EEA+1Ej
		move.w	d6,d7
		move.l	(sp)+,d6
		rts
; End of function sub_7EEA

; ---------------------------------------------------------------------------
word_7F12:	dc.w 0
		dc.w 3
		dc.w 6
		dc.w 9
		dc.w $C
		dc.w $F
		dc.w $12
		dc.w $16
		dc.w $19
		dc.w $1C
		dc.w $1F
		dc.w $22
		dc.w $25
		dc.w $28
		dc.w $2B
		dc.w $2F
		dc.w $32
		dc.w $35
		dc.w $38
		dc.w $3B
		dc.w $3E
		dc.w $41
		dc.w $44
		dc.w $47
		dc.w $4A
		dc.w $4D
		dc.w $50
		dc.w $53
		dc.w $56
		dc.w $59
		dc.w $5C
		dc.w $5F
		dc.w $62
		dc.w $65
		dc.w $68
		dc.w $6A
		dc.w $6D
		dc.w $70
		dc.w $73
		dc.w $76
		dc.w $79
		dc.w $7B
		dc.w $7E
		dc.w $81
		dc.w $84
		dc.w $86
		dc.w $89
		dc.w $8C
		dc.w $8E
		dc.w $91
		dc.w $93
		dc.w $96
		dc.w $99
		dc.w $9B
		dc.w $9E
		dc.w $A0
		dc.w $A2
		dc.w $A5
		dc.w $A7
		dc.w $AA
		dc.w $AC
		dc.w $AE
		dc.w $B1
		dc.w $B3
		dc.w $B5
		dc.w $B7
		dc.w $B9
		dc.w $BC
		dc.w $BE
		dc.w $C0
		dc.w $C2
		dc.w $C4
		dc.w $C6
		dc.w $C8
		dc.w $CA
		dc.w $CC
		dc.w $CE
		dc.w $D0
		dc.w $D1
		dc.w $D3
		dc.w $D5
		dc.w $D7
		dc.w $D8
		dc.w $DA
		dc.w $DC
		dc.w $DD
		dc.w $DF
		dc.w $E0
		dc.w $E2
		dc.w $E3
		dc.w $E5
		dc.w $E6
		dc.w $E7
		dc.w $E9
		dc.w $EA
		dc.w $EB
		dc.w $EC
		dc.w $EE
		dc.w $EF
		dc.w $F0
		dc.w $F1
		dc.w $F2
		dc.w $F3
		dc.w $F4
		dc.w $F5
		dc.w $F6
		dc.w $F7
		dc.w $F7
		dc.w $F8
		dc.w $F9
		dc.w $FA
		dc.w $FA
		dc.w $FB
		dc.w $FB
		dc.w $FC
		dc.w $FC
		dc.w $FD
		dc.w $FD
		dc.w $FE
word_8000:	dc.w $FE
		dc.w $FE
		dc.w $FF
		dc.w $FF
		dc.w $FF
		dc.w $FF
		dc.w $FF
		dc.w $FF
		dc.w $100
word_8012:	dc.w $28
		dc.w $28
		dc.w $28
		dc.w $28
		dc.w $28
		dc.w $28
		dc.w $28
		dc.w $28
word_8022:	dc.w $6800
		dc.w $6DF0
		dc.w $73E0
		dc.w $79D0
		dc.w $6800
		dc.w $6DF0
		dc.w $73E0
		dc.w $79D0

; =============== S U B	R O U T	I N E =======================================


sub_8032:				; CODE XREF: sub_7B5E+66p sub_7B5E+F8p
		move.w	$1CA0(a6),d0
		lsl.w	#1,d0
		move.w	word_8012(pc,d0.w),d1
		move.w	d1,($FF8064).l
		move.w	d1,d7
		lsr.w	#3,d1
		subq.w	#1,d1
		move.w	d1,($FF805C).l
		move.w	word_8022(pc,d0.w),d1
		move.w	d1,($FF805E).l
		subq.w	#1,d7
		lea	(unk_99E80).l,a1

loc_8060:				; CODE XREF: sub_8032+32j
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		dbf	d7,loc_8060
		bclr	#3,($FF8003).l
		bclr	#4,($FF8003).l
		tst.b	$1CA8(a6)
		beq.s	loc_80A6
		bclr	#3,($FF8003).l
		bset	#4,($FF8003).l
		cmpi.b	#1,$1CA8(a6)
		beq.s	loc_80A6
		bclr	#4,($FF8003).l
		bset	#3,($FF8003).l

loc_80A6:				; CODE XREF: sub_8032+4Aj sub_8032+62j
		tst.w	$1CA2(a6)
		beq.s	loc_80DA
		bclr	#3,($FF8003).l
		bset	#4,($FF8003).l
		lea	$1CAA(a6),a4
		move.w	6(a4),d0
		cmp.w	6(a5),d0
		bge.s	loc_80DA
		bclr	#4,($FF8003).l
		bset	#3,($FF8003).l

loc_80DA:				; CODE XREF: sub_8032+78j sub_8032+96j
		move.w	#$67A0,($FF8066).l
		rts
; End of function sub_8032


; =============== S U B	R O U T	I N E =======================================


sub_80E4:				; CODE XREF: sub_7ADC+68p sub_7ADC+70p
		move.w	#$80,0(a5) ; '�'
		move.w	#0,2(a5)
		move.w	#0,4(a5)
		move.w	#0,6(a5)
		move.w	#0,8(a5)
		move.w	#0,$A(a5)
		rts
; End of function sub_80E4


; =============== S U B	R O U T	I N E =======================================


sub_810A:				; CODE XREF: BOOT:00006128j
		bsr.w	sub_6150
		st	6(a6)

loc_8112:				; CODE XREF: sub_810A+10j
		bclr	#2,($FF8003).l
		bne.s	loc_8112

loc_811C:				; CODE XREF: sub_810A+1Aj
		btst	#1,($FF8003).l
		beq.s	loc_811C
		bsr.w	sub_82E8
		bra.s	loc_816E
; ---------------------------------------------------------------------------

loc_812C:				; CODE XREF: sub_810A+4Aj sub_810A+7Aj
		clr.l	$26(a6)

loc_8130:				; CODE XREF: sub_810A+40j
		bsr.w	sub_6166
		bsr.w	sub_6150
		beq.s	loc_8142
		nop
		nop
		nop
		rts
; ---------------------------------------------------------------------------

loc_8142:				; CODE XREF: sub_810A+2Ej
		btst	#1,($FF8003).l
		beq.s	loc_8130
		movem.w	$16(a6),d0-d1
		tst.w	d0
		beq.s	loc_812C
		move.w	d0,$26(a6)
		subq.w	#1,d0
		asl.w	#2,d0
		lea	(WORD_RAM_2M).l,a2
		lea	(unk_90000).l,a3
		jsr	loc_8186(pc,d0.w)

loc_816E:				; CODE XREF: sub_810A+20j sub_810A+6Cj
		bset	#0,($FF8003).l
		beq.s	loc_816E
		nop
		nop
		nop
		nop
		nop
		nop
		bra.s	loc_812C
; End of function sub_810A

; ---------------------------------------------------------------------------

loc_8186:
		bra.w	loc_81A6
; ---------------------------------------------------------------------------
		bra.w	sub_81D0
; ---------------------------------------------------------------------------
		bra.w	sub_81FE
; ---------------------------------------------------------------------------
		bra.w	sub_8222
; ---------------------------------------------------------------------------
		bra.w	sub_824A
; ---------------------------------------------------------------------------
		bra.w	sub_8268
; ---------------------------------------------------------------------------
		bra.w	sub_82B4
; ---------------------------------------------------------------------------
		bra.w	sub_82D0
; ---------------------------------------------------------------------------

loc_81A6:				; CODE XREF: BOOT:loc_8186j
		lea	$4010(a2),a0
		lea	$4000(a2),a1
		move.w	#BRMINIT,d0
		jsr	_BURAM
		bcs.s	loc_81BA
		moveq	#3,d1

loc_81BA:				; CODE XREF: BOOT:000081B6j
		add.w	d1,d1
		move.w	word_81C8(pc,d1.w),0(a2)
		clr.b	$C(a1)
		rts
; ---------------------------------------------------------------------------
word_81C8:	dc.w 0
		dc.w $8000
		dc.w $8001
		dc.w $8081

; =============== S U B	R O U T	I N E =======================================


sub_81D0:				; CODE XREF: BOOT:0000818Aj
					; sub_81FE+10p
		cmpi.w	#$8081,0(a2)
		bne.s	loc_81F0
		lea	$4000(a2),a1
		move.w	#BRMSTAT,d0
		jsr	_BURAM
		cmpi.w	#$FFFF,d0
		bne.s	loc_81F4
		cmpi.w	#$FFFF,d1
		bne.s	loc_81F4

loc_81F0:				; CODE XREF: sub_81D0+6j
		moveq	#0,d0
		moveq	#0,d1

loc_81F4:				; CODE XREF: sub_81D0+18j sub_81D0+1Ej
		move.w	d0,2(a2)
		move.w	d1,4(a2)
		rts
; End of function sub_81D0


; =============== S U B	R O U T	I N E =======================================


sub_81FE:				; CODE XREF: BOOT:0000818Ej
		move.w	#BRMFORMAT,d0
		jsr	_BURAM
		bcs.s	loc_8212
		move.w	#$8081,0(a2)
		bsr.s	sub_81D0
		rts
; ---------------------------------------------------------------------------

loc_8212:				; CODE XREF: sub_81FE+8j
		move.w	#$8000,0(a2)
		clr.w	2(a2)
		clr.w	4(a2)
		rts
; End of function sub_81FE


; =============== S U B	R O U T	I N E =======================================


sub_8222:				; CODE XREF: BOOT:00008192j
		move.w	$A(a2),d1
		swap	d1
		move.w	#$A,d1
		lea	$80(a2),a1
		lea	asc_823E(pc),a0	; "***********"
		move.w	#BRMDIR,d0
		jsr	_BURAM
		rts
; End of function sub_8222

; ---------------------------------------------------------------------------
asc_823E:	dc.b '***********',0    ; DATA XREF: sub_8222+Eo

; =============== S U B	R O U T	I N E =======================================


sub_824A:				; CODE XREF: BOOT:00008196j
		lea	$120(a2),a0
		lea	$130(a2),a1
		move.w	#BRMREAD,d0
		jsr	_BURAM
		bcs.s	locret_8266
		move.w	d0,$12C(a2)
		move.b	d1,$12B(a2)
		rts
; ---------------------------------------------------------------------------

locret_8266:				; CODE XREF: sub_824A+10j
		rts
; End of function sub_824A


; =============== S U B	R O U T	I N E =======================================


sub_8268:				; CODE XREF: BOOT:0000819Aj
		move.w	#0,$12E(a2)
		moveq	#2,d7

loc_8270:				; CODE XREF: sub_8268+2Aj
		lea	$120(a3),a0
		lea	$130(a3),a1
		move.w	#BRMWRITE,d0
		jsr	_BURAM
		bcs.s	locret_82B2
		lea	$120(a3),a0
		lea	$130(a3),a1
		move.w	#BRMVERIFY,d0
		jsr	_BURAM
		dbcc	d7,loc_8270
		bcs.s	loc_829A
		rts
; ---------------------------------------------------------------------------

loc_829A:				; CODE XREF: sub_8268+2Ej
		lea	$120(a3),a0
		clr.b	$12B(a3)
		move.w	#BRMDEL,d0
		jsr	_BURAM
		move.w	#$FFFF,$12E(a2)
		rts
; ---------------------------------------------------------------------------

locret_82B2:				; CODE XREF: sub_8268+18j
		rts
; End of function sub_8268


; =============== S U B	R O U T	I N E =======================================


sub_82B4:				; CODE XREF: BOOT:0000819Ej
		lea	$120(a3),a0
		move.w	#BRMSERCH,d0
		jsr	_BURAM
		bcs.s	loc_82C8
		clr.w	$12E(a2)
		rts
; ---------------------------------------------------------------------------

loc_82C8:				; CODE XREF: sub_82B4+Cj
		move.w	#$FFFF,$12E(a2)
		rts
; End of function sub_82B4


; =============== S U B	R O U T	I N E =======================================


sub_82D0:				; CODE XREF: BOOT:000081A2j
		lea	$120(a2),a0
		clr.b	$12B(a2)
		move.w	#BRMDEL,d0
		jsr	_BURAM
		move.w	#$FFFF,$12E(a2)
		rts
; End of function sub_82D0


; =============== S U B	R O U T	I N E =======================================


sub_82E8:				; CODE XREF: sub_810A+1Cp
		lea	(WORD_RAM_2M).l,a0
		lea	(unk_90000).l,a1
		lea	$4010(a0),a2
		lea	$4010(a1),a3
		moveq	#0,d0
		moveq	#0,d1
		moveq	#0,d2
		moveq	#0,d3
		moveq	#$1F,d4
		moveq	#$10,d5

loc_8308:				; CODE XREF: sub_82E8+34j
		movem.l	d0-d3,(a0)
		movem.l	d0-d3,(a1)
		movem.l	d0-d3,(a2)
		movem.l	d0-d3,(a3)
		adda.l	d5,a0
		adda.l	d5,a1
		dbf	d4,loc_8308
		rts
; End of function sub_82E8

; ---------------------------------------------------------------------------

loc_8322:				; CODE XREF: BOOT:000060AAj
		lea	RAM_BASE,a6
		bsr.w	sub_619A
		bsr.w	sub_6296
		bsr.w	sub_6414
		bsr.w	sub_71E6
		addq.w	#1,$20EA(a6)
		rts

		END