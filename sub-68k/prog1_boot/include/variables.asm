;   ======================================================================
;       Variables
;   ======================================================================

	include "variables\biosRoutines.asm"

unk_F700 equ $F700

; Prog2 (Player)
byte_1801C equ $1801C
byte_18022 equ $18022
sub_18000 equ $18000
sub_18004 equ $18004

; Word RAM (2M)
unk_90000 equ $90000
unk_99C00 equ $99C00
WR_object0 equ $99C02
WR_object1 equ $99C0C
unk_99C16 equ $99C16
unk_99C18 equ $99C18
WR_vectorTable equ $99E80

; Word RAM (1M)
unk_CE000 equ $CE000
unk_CE080 equ $CE080
unk_CE082 equ $CE082
unk_CE084 equ $CE084
word_CE002 equ $CE002
word_CE0FC equ $CE0FC

;   ======================================================================
;       Unless and until otherwise noted, all variables following
;       this statement are relative to RAM_BASE ($833C).
;   ======================================================================

word_0 equ 0
byte_2 equ 2
vblankFlag equ 3
word_4 equ 4
byte_6 equ 6

mainCommDataCache equ $E
subCommDataBuffer  equ $1E

word_2E equ $2E
word_32 equ $32
flags_3E equ $3E
flags_3F equ $3F
word_40 equ $40
discType equ $42
byte_43 equ $43

biosStatus  equ $44
biosStatus.currentStatus    equ $44 ; 00: current bios status
biosStatus.previousStatus   equ $46 ; 02: previous bios status
biosStatus.absFrameTime     equ $48 ; 04: absolute CD time
biosStatus.relFrameTime     equ $4C ; 08: relative CD time
biosStatus.trackNumber      equ $50 ; 0C: track number
biosStatus.flag             equ $51 ; 0D: flag byte
biosStatus.firstTrack       equ $52 ; 0E: first track
biosStatus.lastTrack        equ $53 ; 0F: last track
biosStatus.leadOutTime      equ $54 ; 10: lead-out start time
biosStatus.cddStatusCode    equ $58 ; 14: cdd status code

byte_59 equ $59
word_5A equ $5A
dword_5C equ $5C
dword_60 equ $60
byte_63 equ $63
unk_64 equ $64

chkdiskScratch equ $E4 ; (through $8E3)

word_A14 equ $A14
byte_A16 equ $A16
byte_A17 equ $A17
dword_A18 equ $A18
dword_A1C equ $A1C
word_A20 equ $A20
flags_A22 equ $A22
flags_A23 equ $A23
unk_A24 equ $A24
word_BB4 equ $BB4
word_BB6 equ $BB6
unk_BB8 equ $BB8
unk_BBC equ $BBC
word_BE4 equ $BE4
word_BE6 equ $BE6
byte_BE8 equ $BE8
byte_BE9 equ $BE9
word_BEA equ $BEA
word_BEC equ $BEC
word_BEE equ $BEE
word_BF0 equ $BF0
byte_BF2 equ $BF2
word_BF4 equ $BF4
word_BF6 equ $BF6
flags_BFC equ $BFC
dword_BFE equ $BFE
dword_C02 equ $C02
dword_C06 equ $C06

subcodeScratch equ $C0A ; (through $1359)

byte_135A equ $135A
byte_135B equ $135B

cdcHeaderBuffer equ $135C
cdcDataBuffer equ $1360 ; (through $1C7F)

;   Variables related to GFX scaling/rotation
word_1C90 equ $1C90
word_1C92 equ $1C92
byte_1C94 equ $1C94
byte_1C96 equ $1C96
oldGfxCompleteHandler equ $1C98
word_1C9C equ $1C9C
gfxCompleteFlag equ $1C9E
gfxPrevCompleteFlag equ $1C9F
word_1CA0 equ $1CA0
gfxAllOpsComplete equ $1CA2
word_1CA4 equ $1CA4
byte_1CA8 equ $1CA8
object0 equ $1CAA
object1 equ $1D4A
vectorTable0 equ $1DEA
vectorTable1 equ $1F6A

word_20EA equ $20EA

;   ======================================================================
;       Unless and until otherwise noted, all variables following
;       this statement are relative to WORD_RAM_1M ($C0000).
;   ======================================================================

WR1_word_402 equ $402
WR1_unk_404 equ $404
WR1_dword_408 equ $408
WR1_byte_410 equ $410
WR1_dword_426 equ $426
WR1_word_42A equ $42A
WR1_word_42C equ $42C
WR1_byte_440 equ $440

;   ======================================================================
