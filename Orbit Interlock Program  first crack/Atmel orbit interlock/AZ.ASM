;CodeVisionAVR C Compiler V1.23.6a Evaluation
;(C) Copyright 1998-2002 HP InfoTech s.r.l.
;http://www.hpinfotech.ro
;e-mail:office@hpinfotech.ro , hpinfotech@xnet.ro

;Chip type           : AT90S8535
;Clock frequency     : 3.696000 MHz
;Memory model        : Small
;Optimize for        : Size
;(s)printf features  : int, width
;Internal SRAM size  : 512
;External SRAM size  : 0
;Data Stack size     : 128
;Promote char to int : No
;char is unsigned    : Yes
;8 bit enums         : Yes
;Automatic register allocation : On
;Use AVR Studio Terminal I/O   : No

	.DEVICE AT90S8535
	.LISTMAC
	.EQU UDRE=0x5
	.EQU RXC=0x7
	.EQU USR=0xB
	.EQU UDR=0xC
	.EQU EERE=0x0
	.EQU EEWE=0x1
	.EQU EEMWE=0x2
	.EQU SPSR=0xE
	.EQU SPDR=0xF
	.EQU EECR=0x1C
	.EQU EEDR=0x1D
	.EQU EEARL=0x1E
	.EQU EEARH=0x1F
	.EQU WDTCR=0x21
	.EQU MCUCR=0x35
	.EQU RAMPZ=0x3B
	.EQU SPL=0x3D
	.EQU SPH=0x3E
	.EQU SREG=0x3F
	.DEF R0X0=R0
	.DEF R0X1=R1
	.DEF R0X2=R2
	.DEF R0X3=R3
	.DEF R0X4=R4
	.DEF R0X5=R5
	.DEF R0X6=R6
	.DEF R0X7=R7
	.DEF R0X8=R8
	.DEF R0X9=R9
	.DEF R0XA=R10
	.DEF R0XB=R11
	.DEF R0XC=R12
	.DEF R0XD=R13
	.DEF R0XE=R14
	.DEF R0XF=R15
	.DEF R0X10=R16
	.DEF R0X11=R17
	.DEF R0X12=R18
	.DEF R0X13=R19
	.DEF R0X14=R20
	.DEF R0X15=R21
	.DEF R0X16=R22
	.DEF R0X17=R23
	.DEF R0X18=R24
	.DEF R0X19=R25
	.DEF R0X1A=R26
	.DEF R0X1B=R27
	.DEF R0X1C=R28
	.DEF R0X1D=R29
	.DEF R0X1E=R30
	.DEF R0X1F=R31
	.EQU __se_bit=0x40
	.EQU __sm_mask=0x30
	.EQU __sm_powerdown=0x20

	.MACRO __CPD1N
	CPI  R30,LOW(@0)
	LDI  R26,HIGH(@0)
	CPC  R31,R26
	LDI  R26,BYTE3(@0)
	CPC  R22,R26
	LDI  R26,BYTE4(@0)
	CPC  R23,R26
	.ENDM

	.MACRO __CPD2N
	CPI  R26,LOW(@0)
	LDI  R30,HIGH(@0)
	CPC  R27,R30
	LDI  R30,BYTE3(@0)
	CPC  R24,R30
	LDI  R30,BYTE4(@0)
	CPC  R25,R30
	.ENDM

	.MACRO __CPWRR
	CP   R@0,R@2
	CPC  R@1,R@3
	.ENDM

	.MACRO __CPWRN
	CPI  R@0,LOW(@2)
	LDI  R30,HIGH(@2)
	CPC  R@1,R30
	.ENDM

	.MACRO __ADDD1N
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	SBCI R22,BYTE3(-@0)
	SBCI R23,BYTE4(-@0)
	.ENDM

	.MACRO __ADDD2N
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	SBCI R24,BYTE3(-@0)
	SBCI R25,BYTE4(-@0)
	.ENDM

	.MACRO __SUBD1N
	SUBI R30,LOW(@0)
	SBCI R31,HIGH(@0)
	SBCI R22,BYTE3(@0)
	SBCI R23,BYTE4(@0)
	.ENDM

	.MACRO __SUBD2N
	SUBI R26,LOW(@0)
	SBCI R27,HIGH(@0)
	SBCI R24,BYTE3(@0)
	SBCI R25,BYTE4(@0)
	.ENDM

	.MACRO __ANDD1N
	ANDI R30,LOW(@0)
	ANDI R31,HIGH(@0)
	ANDI R22,BYTE3(@0)
	ANDI R23,BYTE4(@0)
	.ENDM

	.MACRO __ORD1N
	ORI  R30,LOW(@0)
	ORI  R31,HIGH(@0)
	ORI  R22,BYTE3(@0)
	ORI  R23,BYTE4(@0)
	.ENDM

	.MACRO __DELAY_USB
	LDI  R24,LOW(@0)
__DELAY_USB_LOOP:
	DEC  R24
	BRNE __DELAY_USB_LOOP
	.ENDM

	.MACRO __DELAY_USW
	LDI  R24,LOW(@0)
	LDI  R25,HIGH(@0)
__DELAY_USW_LOOP:
	SBIW R24,1
	BRNE __DELAY_USW_LOOP
	.ENDM

	.MACRO __CLRD1S
	CLR  R30
	STD  Y+@0,R30
	STD  Y+@0+1,R30
	STD  Y+@0+2,R30
	STD  Y+@0+3,R30
	.ENDM

	.MACRO __GETD1S
	LDD  R30,Y+@0
	LDD  R31,Y+@0+1
	LDD  R22,Y+@0+2
	LDD  R23,Y+@0+3
	.ENDM

	.MACRO __PUTD1S
	STD  Y+@0,R30
	STD  Y+@0+1,R31
	STD  Y+@0+2,R22
	STD  Y+@0+3,R23
	.ENDM

	.MACRO __POINTB1MN
	LDI  R30,LOW(@0+@1)
	.ENDM

	.MACRO __POINTW1MN
	LDI  R30,LOW(@0+@1)
	LDI  R31,HIGH(@0+@1)
	.ENDM

	.MACRO __POINTW1FN
	LDI  R30,LOW(2*@0+@1)
	LDI  R31,HIGH(2*@0+@1)
	.ENDM

	.MACRO __POINTB2MN
	LDI  R26,LOW(@0+@1)
	.ENDM

	.MACRO __POINTW2MN
	LDI  R26,LOW(@0+@1)
	LDI  R27,HIGH(@0+@1)
	.ENDM

	.MACRO __GETD1N
	LDI  R30,LOW(@0)
	LDI  R31,HIGH(@0)
	LDI  R22,BYTE3(@0)
	LDI  R23,BYTE4(@0)
	.ENDM

	.MACRO __GETD2N
	LDI  R26,LOW(@0)
	LDI  R27,HIGH(@0)
	LDI  R24,BYTE3(@0)
	LDI  R25,BYTE4(@0)
	.ENDM

	.MACRO __GETD2S
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	LDD  R24,Y+@0+2
	LDD  R25,Y+@0+3
	.ENDM

	.MACRO __GETB1MN
	LDS  R30,@0+@1
	.ENDM

	.MACRO __GETW1MN
	LDS  R30,@0+@1
	LDS  R31,@0+@1+1
	.ENDM

	.MACRO __GETD1MN
	LDS  R30,@0+@1
	LDS  R31,@0+@1+1
	LDS  R22,@0+@1+2
	LDS  R23,@0+@1+3
	.ENDM

	.MACRO __GETBRMN
	LDS  R@2,@0+@1
	.ENDM

	.MACRO __GETWRMN
	LDS  R@2,@0+@1
	LDS  R@3,@0+@1+1
	.ENDM

	.MACRO __GETB2MN
	LDS  R26,@0+@1
	.ENDM

	.MACRO __GETW2MN
	LDS  R26,@0+@1
	LDS  R27,@0+@1+1
	.ENDM

	.MACRO __GETD2MN
	LDS  R26,@0+@1
	LDS  R27,@0+@1+1
	LDS  R24,@0+@1+2
	LDS  R25,@0+@1+3
	.ENDM

	.MACRO __PUTB1MN
	STS  @0+@1,R30
	.ENDM

	.MACRO __PUTW1MN
	STS  @0+@1,R30
	STS  @0+@1+1,R31
	.ENDM

	.MACRO __PUTD1MN
	STS  @0+@1,R30
	STS  @0+@1+1,R31
	STS  @0+@1+2,R22
	STS  @0+@1+3,R23
	.ENDM

	.MACRO __PUTBMRN
	STS  @0+@1,R@2
	.ENDM

	.MACRO __PUTWMRN
	STS  @0+@1,R@2
	STS  @0+@1+1,R@3
	.ENDM

	.MACRO __GETW1R
	MOV  R30,R@0
	MOV  R31,R@1
	.ENDM

	.MACRO __GETW2R
	MOV  R26,R@0
	MOV  R27,R@1
	.ENDM

	.MACRO __GETWRN
	LDI  R@0,LOW(@2)
	LDI  R@1,HIGH(@2)
	.ENDM

	.MACRO __PUTW1R
	MOV  R@0,R30
	MOV  R@1,R31
	.ENDM

	.MACRO __PUTW2R
	MOV  R@0,R26
	MOV  R@1,R27
	.ENDM

	.MACRO __ADDWRN
	SUBI R@0,LOW(-@2)
	SBCI R@1,HIGH(-@2)
	.ENDM

	.MACRO __ADDWRR
	ADD  R@0,R@2
	ADC  R@1,R@3
	.ENDM

	.MACRO __SUBWRN
	SUBI R@0,LOW(@2)
	SBCI R@1,HIGH(@2)
	.ENDM

	.MACRO __SUBWRR
	SUB  R@0,R@2
	SBC  R@1,R@3
	.ENDM

	.MACRO __ANDWRN
	ANDI R@0,LOW(@2)
	ANDI R@1,HIGH(@2)
	.ENDM

	.MACRO __ANDWRR
	AND  R@0,R@2
	AND  R@1,R@3
	.ENDM

	.MACRO __ORWRN
	ORI  R@0,LOW(@2)
	ORI  R@1,HIGH(@2)
	.ENDM

	.MACRO __ORWRR
	OR   R@0,R@2
	OR   R@1,R@3
	.ENDM

	.MACRO __EORWRR
	EOR  R@0,R@2
	EOR  R@1,R@3
	.ENDM

	.MACRO __GETWRS
	LDD  R@0,Y+@2
	LDD  R@1,Y+@2+1
	.ENDM

	.MACRO __PUTWSR
	STD  Y+@2,R@0
	STD  Y+@2+1,R@1
	.ENDM

	.MACRO __MOVEWRR
	MOV  R@0,R@2
	MOV  R@1,R@3
	.ENDM

	.MACRO __INWR
	IN   R@0,@2
	IN   R@1,@2+1
	.ENDM

	.MACRO __OUTWR
	OUT  @2+1,R@1
	OUT  @2,R@0
	.ENDM

	.MACRO __CALL1MN
	LDS  R30,@0+@1
	LDS  R31,@0+@1+1
	ICALL
	.ENDM

	.MACRO __NBST
	BST  R@0,@1
	IN   R30,SREG
	LDI  R31,0x40
	EOR  R30,R31
	OUT  SREG,R30
	.ENDM


	.MACRO __PUTB1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SN
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNS
	LDD  R26,Y+@0
	LDD  R27,Y+@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMN
	LDS  R26,@0
	LDS  R27,@0+1
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	RCALL __PUTDP1
	.ENDM

	.MACRO __PUTB1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X,R30
	.ENDM

	.MACRO __PUTW1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1PMNS
	LDS  R26,@0
	LDS  R27,@0+1
	ADIW R26,@1
	RCALL __PUTDP1
	.ENDM

	.MACRO __GETB1SX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R30,Z
	.ENDM

	.MACRO __GETW1SX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R31,Z
	MOV  R30,R0
	.ENDM

	.MACRO __GETD1SX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R0,Z+
	LD   R1,Z+
	LD   R22,Z+
	LD   R23,Z
	MOV  R30,R0
	MOV  R31,R1
	.ENDM

	.MACRO __GETB2SX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R26,X
	.ENDM

	.MACRO __GETW2SX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	.ENDM

	.MACRO __GETD2SX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R1,X+
	LD   R24,X+
	LD   R25,X
	MOV  R26,R0
	MOV  R27,R1
	.ENDM

	.MACRO __GETBRSX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@1)
	SBCI R31,HIGH(-@1)
	LD   R@0,Z
	.ENDM

	.MACRO __GETWRSX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	LD   R@0,Z+
	LD   R@1,Z
	.ENDM

	.MACRO __LSLW8SX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	LD   R31,Z
	CLR  R30
	.ENDM

	.MACRO __PUTB1SX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.MACRO __CLRW1SX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	CLR  R0
	ST   Z+,R0
	ST   Z,R0
	.ENDM

	.MACRO __CLRD1SX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	CLR  R0
	ST   Z+,R0
	ST   Z+,R0
	ST   Z+,R0
	ST   Z,R0
	.ENDM

	.MACRO __PUTB2SX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R26
	.ENDM

	.MACRO __PUTW2SX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z+,R26
	ST   Z,R27
	.ENDM

	.MACRO __PUTBSRX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@0)
	SBCI R31,HIGH(-@0)
	ST   Z,R@1
	.ENDM

	.MACRO __PUTWSRX
	MOV  R30,R28
	MOV  R31,R29
	SUBI R30,LOW(-@2)
	SBCI R31,HIGH(-@2)
	ST   Z+,R@0
	ST   Z,R@1
	.ENDM

	.MACRO __PUTB1SNX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X,R30
	.ENDM

	.MACRO __PUTW1SNX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X,R31
	.ENDM

	.MACRO __PUTD1SNX
	MOV  R26,R28
	MOV  R27,R29
	SUBI R26,LOW(-@0)
	SBCI R27,HIGH(-@0)
	LD   R0,X+
	LD   R27,X
	MOV  R26,R0
	SUBI R26,LOW(-@1)
	SBCI R27,HIGH(-@1)
	ST   X+,R30
	ST   X+,R31
	ST   X+,R22
	ST   X,R23
	.ENDM

	.CSEG
	.ORG 0

	.INCLUDE "az.vec"
	.INCLUDE "az.inc"
__RESET:
	CLI
	CLR  R30
	OUT  EECR,R30
	OUT  MCUCR,R30

;DISABLE WATCHDOG
	LDI  R31,0x18
	OUT  WDTCR,R31
	LDI  R31,0x10
	OUT  WDTCR,R31

;CLEAR R2-R14
	LDI  R24,13
	LDI  R26,2
	CLR  R27
__CLEAR_REG:
	ST   X+,R30
	DEC  R24
	BRNE __CLEAR_REG

;CLEAR SRAM
	LDI  R24,LOW(0x200)
	LDI  R25,HIGH(0x200)
	LDI  R26,0x60
__CLEAR_SRAM:
	ST   X+,R30
	SBIW R24,1
	BRNE __CLEAR_SRAM

;GLOBAL VARIABLES INITIALIZATION
	LDI  R30,LOW(__GLOBAL_INI_TBL*2)
	LDI  R31,HIGH(__GLOBAL_INI_TBL*2)
__GLOBAL_INI_NEXT:
	LPM
	ADIW R30,1
	MOV  R1,R0
	LPM
	ADIW R30,1
	MOV  R22,R30
	MOV  R23,R31
	MOV  R31,R0
	MOV  R30,R1
	SBIW R30,0
	BREQ __GLOBAL_INI_END
	LPM
	ADIW R30,1
	MOV  R26,R0
	LPM
	ADIW R30,1
	MOV  R27,R0
	LPM
	ADIW R30,1
	MOV  R24,R0
	LPM
	ADIW R30,1
	MOV  R25,R0
__GLOBAL_INI_LOOP:
	LPM
	ADIW R30,1
	ST   X+,R0
	SBIW R24,1
	BRNE __GLOBAL_INI_LOOP
	MOV  R30,R22
	MOV  R31,R23
	RJMP __GLOBAL_INI_NEXT
__GLOBAL_INI_END:

;STACK POINTER INITIALIZATION
	LDI  R30,LOW(0x25F)
	OUT  SPL,R30
	LDI  R30,HIGH(0x25F)
	OUT  SPH,R30

;DATA STACK POINTER INITIALIZATION
	LDI  R28,LOW(0xDF)
	LDI  R29,HIGH(0xDF)

	RJMP _main

	.ESEG
	.ORG 0
	.DB  0 ; FIRST EEPROM LOCATION NOT USED, SEE ATMEL ERRATA SHEETS

	.DSEG
	.ORG 0xE0
;       1 /*********************************************
;       2 This program was produced by the
;       3 CodeWizardAVR V1.23.6a Evaluation
;       4 Automatic Program Generator
;       5 © Copyright 1998-2002 HP InfoTech s.r.l.
;       6 http://www.hpinfotech.ro
;       7 e-mail:office@hpinfotech.ro , hpinfotech@xnet.ro
;       8 
;       9 Project : 
;      10 Version : 
;      11 Date    : 8/15/2002
;      12 Author  : 
;      13 Company : 
;      14 Comments: 
;      15 
;      16 
;      17 Chip type           : AT90S8535
;      18 Clock frequency     : 3.696000 MHz
;      19 Memory model        : Small
;      20 Internal SRAM size  : 512
;      21 External SRAM size  : 0
;      22 Data Stack size     : 128
;      23 *********************************************/
;      24 
;      25 #include <90s8535.h>        
;      26 #include <delay.h>
;      27 
;      28 // Standard Input/Output functions
;      29 #include <stdio.h>
;      30 
;      31 // Declare your global variables here
;      32 
;      33 void main(void)
;      34 {

	.CSEG
_main:
;      35 // Declare your local variables here
;      36 
;      37 // Input/Output Ports initialization
;      38 // Port A initialization
;      39 // Func0=In Func1=In Func2=In Func3=In Func4=In Func5=In Func6=In Func7=In 
;      40 // State0=T State1=T State2=T State3=T State4=T State5=T State6=T State7=T 
;      41 PORTA=0x00;
	CLR  R30
	OUT  0x1B,R30
;      42 DDRA=0x00;
	OUT  0x1A,R30
;      43 
;      44 // Port B initialization
;      45 // Func0=In Func1=In Func2=In Func3=In Func4=In Func5=In Func6=In Func7=In 
;      46 // State0=T State1=T State2=T State3=T State4=T State5=T State6=T State7=T 
;      47 PORTB=0x00;
	OUT  0x18,R30
;      48 DDRB=0x00;
	OUT  0x17,R30
;      49 
;      50 // Port C initialization
;      51 // Func0=In Func1=In Func2=In Func3=In Func4=In Func5=In Func6=In Func7=In 
;      52 // State0=T State1=T State2=T State3=T State4=T State5=T State6=T State7=T 
;      53 PORTC=0x00;
	OUT  0x15,R30
;      54 DDRC=0x00;
	OUT  0x14,R30
;      55 
;      56 // Port D initialization
;      57 // Func0=In Func1=In Func2=In Func3=In Func4=In Func5=In Func6=In Func7=In 
;      58 // State0=T State1=T State2=T State3=T State4=T State5=T State6=T State7=T 
;      59 PORTD=0x00;
	OUT  0x12,R30
;      60 DDRD=0x00;
	OUT  0x11,R30
;      61 
;      62 // Timer/Counter 0 initialization
;      63 // Clock source: System Clock
;      64 // Clock value: Timer 0 Stopped
;      65 TCCR0=0x00;
	OUT  0x33,R30
;      66 TCNT0=0x00;
	OUT  0x32,R30
;      67 
;      68 // Timer/Counter 1 initialization
;      69 // Clock source: System Clock
;      70 // Clock value: Timer 1 Stopped
;      71 // Mode: Normal top=FFFFh
;      72 // OC1A output: Discon.
;      73 // OC1B output: Discon.
;      74 // Noise Canceler: Off
;      75 // Input Capture on Falling Edge
;      76 TCCR1A=0x00;
	OUT  0x2F,R30
;      77 TCCR1B=0x00;
	OUT  0x2E,R30
;      78 TCNT1H=0x00;
	OUT  0x2D,R30
;      79 TCNT1L=0x00;
	OUT  0x2C,R30
;      80 OCR1AH=0x00;
	OUT  0x2B,R30
;      81 OCR1AL=0x00;
	OUT  0x2A,R30
;      82 OCR1BH=0x00;
	OUT  0x29,R30
;      83 OCR1BL=0x00;
	OUT  0x28,R30
;      84 
;      85 // Timer/Counter 2 initialization
;      86 // Clock source: System Clock
;      87 // Clock value: Timer 2 Stopped
;      88 // Mode: Normal top=FFh
;      89 // OC2 output: Disconnected
;      90 ASSR=0x00;
	OUT  0x22,R30
;      91 TCCR2=0x00;
	OUT  0x25,R30
;      92 TCNT2=0x00;
	OUT  0x24,R30
;      93 OCR2=0x00;
	OUT  0x23,R30
;      94 
;      95 // External Interrupt(s) initialization
;      96 // INT0: Off
;      97 // INT1: Off
;      98 GIMSK=0x00;
	OUT  0x3B,R30
;      99 MCUCR=0x00;
	OUT  0x35,R30
;     100 
;     101 // Timer(s)/Counter(s) Interrupt(s) initialization
;     102 TIMSK=0x00;
	OUT  0x39,R30
;     103 
;     104 // UART initialization
;     105 // Communication Parameters: 8 Data, 1 Stop, No Parity
;     106 // UART Receiver: On
;     107 // UART Transmitter: On
;     108 // UART Baud rate: 9600
;     109 UCR=0x18;
	LDI  R30,LOW(24)
	OUT  0xA,R30
;     110 UBRR=0x17;
	LDI  R30,LOW(23)
	OUT  0x9,R30
;     111 
;     112 // Analog Comparator initialization
;     113 // Analog Comparator: Off
;     114 // Analog Comparator Input Capture by Timer/Counter 1: Off
;     115 // Analog Comparator Output: Off
;     116 ACSR=0x80;
	LDI  R30,LOW(128)
	OUT  0x8,R30
;     117 
;     118 while (1)
_0xB:
;     119       {
;     120              	printf("Please enter a value between 1 and 4096");
	__POINTW1FN _10,0
	ST   -Y,R31
	ST   -Y,R30
	LDI  R24,0
	RCALL _printf
	ADIW R28,2
;     121 	gets(command, 1);	         
	ST   -Y,R31
	ST   -Y,R30
	LDI  R30,LOW(1)
	LDI  R31,HIGH(1)
	RCALL SUBOPT_0x0
;     122 	{  
;     123 	   gets(command, 4);   
	ST   -Y,R31
	ST   -Y,R30
	LDI  R30,LOW(4)
	LDI  R31,HIGH(4)
	RCALL SUBOPT_0x0
;     124 	   rep=atoi(command);    
;     125 	}        
	CLR  R30
	CLR  R31
;     126             rep=(int)(invalue*4096/5.0);
	__GETD2N 0x45800000
	RCALL __MULF12
	RCALL __MOVED12
	__GETD1N 0x40A00000
	RCALL __DIVF21
;     127 	  	ten.dummy=rep;
	CLR  R30
	CLR  R31
;     128 		printf("the value is %d %d %d %d %d %d %d %d %d %d %d %d\n",ten.iolines.a,ten.iolines.b,ten.iolines.c,
	__POINTW1FN _10,40
	ST   -Y,R31
	ST   -Y,R30
	RCALL __PUTPARD1
	LDI  R24,4
	RCALL _printf
	ADIW R28,6
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
;     129 		  	ten.iolines.d,ten.iolines.e,ten.iolines.f,ten.iolines.g,ten.iolines.h,ten.iolines.i,ten.iolines.j,
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
;     130 			ten.iolines.k,ten.iolines.l);    
	RCALL SUBOPT_0x1
	RCALL SUBOPT_0x1
;     131 		       	DAC4SEL=0;
	CLR  R30
	CLR  R31
	RCALL SUBOPT_0x2
;     132 		       	DAC3SEL=0;
;     133 		     	DAC2SEL=0;     
	RCALL SUBOPT_0x2
;     134 		   	DAC1SEL=0;
;     135 		       	DACWRITE=0;
	CLR  R30
;     136 		       delay_ms(100);
	LDI  R30,LOW(100)
	LDI  R31,HIGH(100)
	ST   -Y,R31
	ST   -Y,R30
	RCALL _delay_ms
;     137 
;     138       };
	RJMP _0xB
;     139 }
_0xE:
	RJMP _0xE
_getchar:
     sbis usr,rxc
     rjmp _getchar
     in   r30,udr
	RET
_putchar:
     sbis usr,udre
     rjmp _putchar
     ld   r30,y
     out  udr,r30
	ADIW R28,1
	RET

	.DSEG
_pp_G2:
	.BYTE 0x2

	.CSEG
__put_G2:
	put:
	LDS  R30,_pp_G2
	LDS  R31,_pp_G2+1
	SBIW R30,0
	BREQ _0x45
	LDS  R26,_pp_G2
	LDS  R27,_pp_G2+1
	ADIW R26,1
	STS  _pp_G2,R26
	STS  _pp_G2+1,R27
	SBIW R26,1
	LD   R30,Y
	ST   X,R30
	RJMP _0x46
_0x45:
	LD   R30,Y
	ST   -Y,R30
	RCALL _putchar
_0x46:
	ADIW R28,1
	RET
__print_G2:
	SBIW R28,8
	RCALL __SAVELOCR6
	LDI  R16,0
_0x48:
	LDD  R30,Y+16
	LDD  R31,Y+16+1
	ADIW R30,1
	STD  Y+16,R30
	STD  Y+16+1,R31
	SBIW R30,1
	LPM
	MOV  R30,R0
	MOV  R19,R30
	CPI  R30,0
	BRNE PC+2
	RJMP _0x4A
	MOV  R30,R16
	CPI  R30,0
	BRNE _0x4E
	CPI  R19,37
	BRNE _0x4F
	LDI  R16,LOW(1)
	RJMP _0x50
_0x4F:
	RCALL SUBOPT_0x3
_0x50:
	RJMP _0x4D
_0x4E:
	CPI  R30,LOW(0x1)
	BRNE _0x51
	CPI  R19,37
	BRNE _0x52
	RCALL SUBOPT_0x3
	LDI  R16,LOW(0)
	RJMP _0x4D
_0x52:
	LDI  R16,LOW(2)
	LDI  R21,LOW(0)
	LDI  R17,LOW(0)
	CPI  R19,45
	BRNE _0x53
	LDI  R17,LOW(1)
	RJMP _0x4D
_0x53:
	CPI  R19,43
	BRNE _0x54
	LDI  R21,LOW(43)
	RJMP _0x4D
_0x54:
	CPI  R19,32
	BRNE _0x55
	LDI  R21,LOW(32)
	RJMP _0x4D
_0x55:
	RJMP _0x56
_0x51:
	CPI  R30,LOW(0x2)
	BRNE _0x57
_0x56:
	LDI  R20,LOW(0)
	LDI  R16,LOW(3)
	CPI  R19,48
	BRNE _0x58
	ORI  R17,LOW(128)
	RJMP _0x4D
_0x58:
	RJMP _0x59
_0x57:
	CPI  R30,LOW(0x3)
	BREQ PC+2
	RJMP _0x4D
_0x59:
	CPI  R19,48
	BRLO _0x5C
	CPI  R19,58
	BRLO _0x5D
_0x5C:
	RJMP _0x5B
_0x5D:
	MOV  R18,R20
	LSL  R20
	LSL  R20
	ADD  R20,R18
	LSL  R20
	MOV  R30,R19
	SUBI R30,LOW(48)
	ADD  R20,R30
	RJMP _0x4D
_0x5B:
	MOV  R30,R19
	CPI  R30,LOW(0x63)
	BRNE _0x61
	RCALL SUBOPT_0x4
	LD   R30,X
	RCALL SUBOPT_0x5
	RJMP _0x62
_0x61:
	CPI  R30,LOW(0x73)
	BRNE _0x64
	RCALL SUBOPT_0x4
	RCALL __GETD1P
	STD  Y+12,R30
	STD  Y+12+1,R31
	ST   -Y,R31
	ST   -Y,R30
	RCALL _strlen
	MOV  R16,R30
	RJMP _0x65
_0x64:
	CPI  R30,LOW(0x70)
	BRNE _0x67
	RCALL SUBOPT_0x4
	RCALL __GETD1P
	STD  Y+6,R30
	STD  Y+6+1,R31
	ST   -Y,R31
	ST   -Y,R30
	RCALL _strlenf
	MOV  R16,R30
	ORI  R17,LOW(8)
_0x65:
	ORI  R17,LOW(2)
	ANDI R17,LOW(127)
	LDI  R18,LOW(0)
	RJMP _0x68
_0x67:
	CPI  R30,LOW(0x64)
	BREQ _0x6B
	CPI  R30,LOW(0x69)
	BRNE _0x6C
_0x6B:
	ORI  R17,LOW(4)
	RJMP _0x6D
_0x6C:
	CPI  R30,LOW(0x75)
	BRNE _0x6E
_0x6D:
	LDI  R30,LOW(_tbl10_G2*2)
	LDI  R31,HIGH(_tbl10_G2*2)
	STD  Y+6,R30
	STD  Y+6+1,R31
	LDI  R16,LOW(5)
	RJMP _0x6F
_0x6E:
	CPI  R30,LOW(0x58)
	BRNE _0x71
	ORI  R17,LOW(8)
	RJMP _0x72
_0x71:
	CPI  R30,LOW(0x78)
	BREQ PC+2
	RJMP _0xA0
_0x72:
	LDI  R30,LOW(_tbl16_G2*2)
	LDI  R31,HIGH(_tbl16_G2*2)
	STD  Y+6,R30
	STD  Y+6+1,R31
	LDI  R16,LOW(4)
_0x6F:
	SBRS R17,2
	RJMP _0x74
	RCALL SUBOPT_0x4
	RCALL SUBOPT_0x6
	LDD  R26,Y+10
	LDD  R27,Y+10+1
	SBIW R26,0
	BRGE _0x75
	LDD  R30,Y+10
	LDD  R31,Y+10+1
	RCALL __ANEGW1
	STD  Y+10,R30
	STD  Y+10+1,R31
	LDI  R21,LOW(45)
_0x75:
	CPI  R21,0
	BREQ _0x76
	SUBI R16,-LOW(1)
	RJMP _0x77
_0x76:
	ANDI R17,LOW(251)
_0x77:
	RJMP _0x78
_0x74:
	RCALL SUBOPT_0x4
	RCALL SUBOPT_0x6
_0x78:
_0x68:
	SBRC R17,0
	RJMP _0x79
_0x7A:
	CP   R16,R20
	BRSH _0x7C
	SBRS R17,7
	RJMP _0x7D
	SBRS R17,2
	RJMP _0x7E
	ANDI R17,LOW(251)
	MOV  R19,R21
	SUBI R16,LOW(1)
	RJMP _0x7F
_0x7E:
	LDI  R19,LOW(48)
_0x7F:
	RJMP _0x80
_0x7D:
	LDI  R19,LOW(32)
_0x80:
	RCALL SUBOPT_0x3
	SUBI R20,LOW(1)
	RJMP _0x7A
_0x7C:
_0x79:
	MOV  R18,R16
	SBRS R17,1
	RJMP _0x81
_0x82:
	CPI  R18,0
	BREQ _0x84
	SBRS R17,3
	RJMP _0x85
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	ADIW R30,1
	STD  Y+6,R30
	STD  Y+6+1,R31
	SBIW R30,1
	LPM
	MOV  R30,R0
	RJMP _0xA2
_0x85:
	LDD  R26,Y+12
	LDD  R27,Y+12+1
	LD   R30,X+
	STD  Y+12,R26
	STD  Y+12+1,R27
_0xA2:
	ST   -Y,R30
	RCALL __put_G2
	CPI  R20,0
	BREQ _0x87
	SUBI R20,LOW(1)
_0x87:
	SUBI R18,LOW(1)
	RJMP _0x82
_0x84:
	RJMP _0x88
_0x81:
_0x8A:
	LDI  R19,LOW(48)
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	ADIW R30,2
	STD  Y+6,R30
	STD  Y+6+1,R31
	SBIW R30,2
	RCALL __GETW1PF
	STD  Y+8,R30
	STD  Y+8+1,R31
                                      ldd  r26,y+10  ;R26,R27=n
                                      ldd  r27,y+11
                                  calc_digit:
                                      cp   r26,r30
                                      cpc  r27,r31
                                      brlo calc_digit_done
	SUBI R19,-LOW(1)
	                                  sub  r26,r30
	                                  sbc  r27,r31
	                                  brne calc_digit
                                  calc_digit_done:
                                      std  Y+10,r26 ;n=R26,R27
                                      std  y+11,r27
	LDI  R30,LOW(57)
	CP   R30,R19
	BRSH _0x8C
	SBRS R17,3
	RJMP _0x8D
	SUBI R19,-LOW(7)
	RJMP _0x8E
_0x8D:
	SUBI R19,-LOW(39)
_0x8E:
_0x8C:
	SBRC R17,4
	RJMP _0x90
	LDI  R30,LOW(48)
	CP   R30,R19
	BRLO _0x92
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	CPI  R26,LOW(0x1)
	LDI  R30,HIGH(0x1)
	CPC  R27,R30
	BRNE _0x91
_0x92:
	ORI  R17,LOW(16)
	RJMP _0x94
_0x91:
	CP   R20,R18
	BRLO _0x96
	SBRS R17,0
	RJMP _0x97
_0x96:
	RJMP _0x95
_0x97:
	LDI  R19,LOW(32)
	SBRS R17,7
	RJMP _0x98
	LDI  R19,LOW(48)
	ORI  R17,LOW(16)
_0x94:
	SBRS R17,2
	RJMP _0x99
	ANDI R17,LOW(251)
	ST   -Y,R21
	RCALL __put_G2
	CPI  R20,0
	BREQ _0x9A
	SUBI R20,LOW(1)
_0x9A:
_0x99:
_0x98:
_0x90:
	RCALL SUBOPT_0x3
	CPI  R20,0
	BREQ _0x9B
	SUBI R20,LOW(1)
_0x9B:
_0x95:
	SUBI R18,LOW(1)
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDI  R30,LOW(1)
	LDI  R31,HIGH(1)
	CP   R30,R26
	CPC  R31,R27
	BRSH _0x8B
	RJMP _0x8A
_0x8B:
_0x88:
	SBRS R17,0
	RJMP _0x9C
_0x9D:
	CPI  R20,0
	BREQ _0x9F
	SUBI R20,LOW(1)
	LDI  R30,LOW(32)
	RCALL SUBOPT_0x5
	RJMP _0x9D
_0x9F:
_0x9C:
_0xA0:
_0x62:
	LDI  R16,LOW(0)
_0x4D:
	RJMP _0x48
_0x4A:
	RCALL __LOADLOCR6
	ADIW R28,18
	RET
_printf:
	MOV  R15,R24
	SBIW R28,2
	MOV  R26,R28
	MOV  R27,R29
	SBIW R26,2
	RCALL __ADDW2R15
	ST   Y,R26
	STD  Y+1,R27
	CLR  R30
	STS  _pp_G2,R30
	STS  _pp_G2+1,R30
	MOV  R26,R28
	MOV  R27,R29
	ADIW R26,2
	RCALL __ADDW2R15
	RCALL __GETW1P
	ST   -Y,R31
	ST   -Y,R30
	LDD  R30,Y+2
	LDD  R31,Y+2+1
	ST   -Y,R31
	ST   -Y,R30
	RCALL __print_G2
	ADIW R28,2
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES
SUBOPT_0x0:
	ST   -Y,R31
	ST   -Y,R30
	RJMP _gets

;OPTIMIZER ADDED SUBROUTINE, CALLED 12 TIMES
SUBOPT_0x1:
	CLR  R30
	CLR  R31
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES
SUBOPT_0x2:
	CLR  R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES
SUBOPT_0x3:
	ST   -Y,R19
	RJMP __put_G2

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES
SUBOPT_0x4:
	LDD  R26,Y+14
	LDD  R27,Y+14+1
	SBIW R26,4
	STD  Y+14,R26
	STD  Y+14+1,R27
	ADIW R26,4
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES
SUBOPT_0x5:
	ST   -Y,R30
	RJMP __put_G2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES
SUBOPT_0x6:
	RCALL __GETW1P
	STD  Y+10,R30
	STD  Y+10+1,R31
	RET

_gets:
	ldd  r27,y+3
	ldd  r26,y+2
	ldd  r25,y+1
	ld   r24,y
	adiw r24,0
	breq __gets2
__gets0:
	push r24
	push r25
	push r26
	push r27
	rcall _getchar
	pop  r27
	pop  r26
	pop  r25
	pop  r24
	cpi  r30,8
	brne __gets3
	ld   r30,y
	cp   r24,r30
	ldd  r30,y+1
	cpc  r25,r30
	brge __gets0
	adiw r24,1
	sbiw r26,1
	rjmp __gets0
__gets3:
	cpi  r30,10
	breq __gets1
	st   x+,r30
	sbiw r24,1
	brne __gets0
__gets1:
	clr  r30
	st   x,r30
	ldd  r30,y+2
	ldd  r31,y+3
__gets2:
	adiw r28,4
	ret

_strlen:
	ld   r26,y+
	ld   r27,y+
	clr  r30
	clr  r31
__strlen0:
	ld   r22,x+
	tst  r22
	breq __strlen1
	adiw r30,1
	rjmp __strlen0
__strlen1:
	ret

_strlenf:
	clr  r26
	clr  r27
	ld   r30,y+
	ld   r31,y+
__strlenf0:
	lpm 
	tst  r0
	breq __strlenf1
	adiw r26,1
	adiw r30,1
	rjmp __strlenf0
__strlenf1:
	mov  r30,r26
	mov  r31,r27
	ret

_delay_ms:
	ld   r30,y+
	ld   r31,y+
	adiw r30,0
	breq __delay_ms1
__delay_ms0:
	__DELAY_USW 0x39C
	wdr
	sbiw r30,1
	brne __delay_ms0
__delay_ms1:
	ret

__ADDW2R15:
	CLR  R0
	ADD  R26,R15
	ADC  R27,R0
	RET

__ANEGW1:
	COM  R30
	COM  R31
	ADIW R30,1
	RET

__MOVED12:
	MOV  R26,R30
	MOV  R27,R31
	MOV  R24,R22
	MOV  R25,R23
	RET

__GETW1P:
	LD   R30,X+
	LD   R31,X
	SBIW R26,1
	RET

__GETD1P:
	LD   R30,X+
	LD   R31,X+
	LD   R22,X+
	LD   R23,X
	SBIW R26,3
	RET

__GETW1PF:
	LPM
	ADIW R30,1
	MOV  R1,R0
	LPM 
	MOV  R31,R0
	MOV  R30,R1
	RET

__PUTPARD1:
	ST   -Y,R23
	ST   -Y,R22
	ST   -Y,R31
	ST   -Y,R30
	RET

__REPACK:
	LDI  R21,0x80
	EOR  R21,R23
	BRNE __REPACK0
	PUSH R21
	RJMP __ZERORES
__REPACK0:
	CPI  R21,0xFF
	BREQ __REPACK1
	LSL  R22
	LSL  R0
	ROR  R21
	ROR  R22
	MOV  R23,R21
	RET
__REPACK1:
	PUSH R21
	TST  R0
	BRMI __REPACK2
	RJMP __MAXRES
__REPACK2:
	RJMP __MINRES

__UNPACK:
	LDI  R21,0x80
	MOV  R1,R25
	AND  R1,R21
	LSL  R24
	ROL  R25
	EOR  R25,R21
	LSL  R21
	ROR  R24

__UNPACK1:
	LDI  R21,0x80
	MOV  R0,R23
	AND  R0,R21
	LSL  R22
	ROL  R23
	EOR  R23,R21
	LSL  R21
	ROR  R22
	RET

__MINRES:
	SER  R30
	SER  R31
	LDI  R22,0x7F
	SER  R23
	POP  R21
	RET

__ZERORES:
	CLR  R30
	CLR  R31
	CLR  R22
	CLR  R23
	POP  R21
	RET

__MAXRES:
	SER  R30
	SER  R31
	LDI  R22,0x7F
	LDI  R23,0x7F
	POP  R21
	RET

__MULF12:
	PUSH R21
	RCALL __UNPACK
	CPI  R23,0x80
	BREQ __ZERORES
	CPI  R25,0x80
	BREQ __ZERORES
	EOR  R0,R1
	SEC
	ADC  R23,R25
	BRVC __MULF124
	BRLT __ZERORES
__MULF125:
	TST  R0
	BRMI __MINRES
	RJMP __MAXRES
__MULF124:
	PUSH R19
	PUSH R20
	CLR  R1
	CLR  R19
	CLR  R20
	CLR  R21
	LDI  R25,24
__MULF120:
	LSL  R19
	ROL  R20
	ROL  R21
	ROL  R30
	ROL  R31
	ROL  R22
	BRCC __MULF121
	ADD  R19,R26
	ADC  R20,R27
	ADC  R21,R24
	ADC  R30,R1
	ADC  R31,R1
	ADC  R22,R1
__MULF121:
	DEC  R25
	BRNE __MULF120
	POP  R20
	POP  R19
	TST  R22
	BRMI __MULF122
	LSL  R21
	ROL  R30
	ROL  R31
	ROL  R22
	RJMP __MULF123
__MULF122:
	INC  R23
	BRVS __MULF125
__MULF123:
	RCALL __REPACK
	POP  R21
	RET

__DIVF21:
	PUSH R21
	RCALL __UNPACK
	CPI  R23,0x80
	BRNE __DIVF210
	TST  R1
__DIVF211:
	BRPL __MAXRES
	RJMP __MINRES
__DIVF210:
	CPI  R25,0x80
	BRNE __DIVF218
__DIVF217:
	RJMP __ZERORES
__DIVF218:
	EOR  R0,R1
	SEC
	SBC  R25,R23
	BRVC __DIVF216
	BRLT __DIVF217
	TST  R0
	RJMP __DIVF211
__DIVF216:
	MOV  R23,R25
	LSR  R22
	ROR  R31
	ROR  R30
	LSR  R24
	ROR  R27
	ROR  R26
	PUSH R20
	CLR  R1
	CLR  R20
	CLR  R21
	LDI  R25,24
__DIVF212:
	CP   R26,R30
	CPC  R27,R31
	CPC  R24,R22
	BRLO __DIVF213
	SUB  R26,R30
	SBC  R27,R31
	SBC  R24,R22
	SEC
	RJMP __DIVF214
__DIVF213:
	CLC
__DIVF214:
	ROL  R1
	ROL  R20
	ROL  R21
	ROL  R26
	ROL  R27
	ROL  R24
	DEC  R25
	BRNE __DIVF212
	MOV  R30,R1
	MOV  R31,R20
	MOV  R22,R21
	LSR  R26
	ADC  R30,R25
	ADC  R31,R25
	ADC  R22,R25
	POP  R20
	TST  R22
	BRMI __DIVF215
	LSL  R30
	ROL  R31
	ROL  R22
	DEC  R23
	BRVS __DIVF217
__DIVF215:
	RCALL __REPACK
	POP  R21
	RET

__SAVELOCR6:
	ST   -Y,R21
__SAVELOCR5:
	ST   -Y,R20
__SAVELOCR4:
	ST   -Y,R19
__SAVELOCR3:
	ST   -Y,R18
__SAVELOCR2:
	ST   -Y,R17
	ST   -Y,R16
	RET

__LOADLOCR6:
	LDD  R21,Y+5
__LOADLOCR5:
	LDD  R20,Y+4
__LOADLOCR4:
	LDD  R19,Y+3
__LOADLOCR3:
	LDD  R18,Y+2
__LOADLOCR2:
	LDD  R17,Y+1
	LD   R16,Y
	RET

