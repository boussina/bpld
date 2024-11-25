;CodeVisionAVR C Compiler V1.23.6a Evaluation
;(C) Copyright 1998-2002 HP InfoTech s.r.l.
;http://www.hpinfotech.ro
;e-mail:office@hpinfotech.ro , hpinfotech@xnet.ro

;Chip type           : AT90S8535
;Clock frequency     : 8.000000 MHz
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

	.INCLUDE "orbit.vec"
	.INCLUDE "orbit.inc"
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
;       9 Project : Orbit Interlock
;      10 Version : 1.0
;      11 Date    : 8/15/2002
;      12 Author  : boussina
;      13 Company : ssrl
;      14 Comments: 
;      15 first try
;      16 
;      17 
;      18 Chip type           : AT90S8535
;      19 Clock frequency     : 3.696000 MHz
;      20 Memory model        : Small
;      21 Internal SRAM size  : 512
;      22 External SRAM size  : 0
;      23 Data Stack size     : 128
;      24 *********************************************/
;      25 
;      26 #include <90s8535.h>
;      27 
;      28 // Standard Input/Output functions
;      29 #include <stdio.h> 
;      30 #include <stdlib.h>
;      31 #include <delay.h>            
;      32 
;      33 //#define DAC3SEL PORTC.6    
;      34 //#define DAC4SEL PORTB.0 
;      35 //#define DAC2SEL PORTD.2
;      36 //#define DAC1SEL PORTD.4
;      37 //#define DACWRITE PORTD.6
;      38 
;      39 char command[8];  
_command:
	.BYTE 0x8
;      40 char command2[8];  
_command2:
	.BYTE 0x8
;      41 long rep=0;     
_rep:
	.BYTE 0x4
;      42   
;      43 #pragma regalloc-
;      44 
;      45 bit a;
;      46 bit b;
;      47 bit c;
;      48 bit d;
;      49 bit e;
;      50 bit f;
;      51 bit g;
;      52 bit h;
;      53 bit i;
;      54 bit j;     
;      55 bit k; 
;      56 bit l;   
;      57 
;      58 register long beta@2;   
	.ORG 0x2
_beta:
	.BYTE 0x4
	.ORG 0xF4
;      59  
;      60 
;      61 #pragma regalloc+
;      62    
;      63 
;      64 void main(void)
;      65 {

	.CSEG
_main:
;      66 // Declare your local variables here
;      67 
;      68 // Input/Output Ports initialization
;      69 // Port A initialization
;      70 // Func0=Out Func1=Out Func2=Out Func3=Out Func4=Out Func5=Out Func6=Out Func7=Out 
;      71 // State0=0 State1=0 State2=0 State3=0 State4=0 State5=0 State6=0 State7=0 
;      72 PORTA=0x00;
	CLR  R30
	OUT  0x1B,R30
;      73 DDRA=0xFF;
	LDI  R30,LOW(255)
	OUT  0x1A,R30
;      74 
;      75 // Port B initialization
;      76 // Func0=Out Func1=Out Func2=Out Func3=Out Func4=Out Func5=Out Func6=Out Func7=Out 
;      77 // State0=0 State1=0 State2=0 State3=0 State4=0 State5=0 State6=0 State7=0 
;      78 PORTB=0x00;
	CLR  R30
	OUT  0x18,R30
;      79 DDRB=0xFF;
	LDI  R30,LOW(255)
	OUT  0x17,R30
;      80 
;      81 // Port C initialization
;      82 // Func0=Out Func1=Out Func2=Out Func3=Out Func4=Out Func5=Out Func6=Out Func7=Out 
;      83 // State0=0 State1=0 State2=0 State3=0 State4=0 State5=0 State6=0 State7=0 
;      84 PORTC=0x00;
	CLR  R30
	OUT  0x15,R30
;      85 DDRC=0xFF;
	LDI  R30,LOW(255)
	OUT  0x14,R30
;      86 
;      87 // Port D initialization
;      88 // Func0=Out Func1=Out Func2=Out Func3=Out Func4=Out Func5=Out Func6=Out Func7=Out 
;      89 // State0=0 State1=0 State2=0 State3=0 State4=0 State5=0 State6=0 State7=0 
;      90 PORTD=0x00;
	CLR  R30
	OUT  0x12,R30
;      91 DDRD=0xFF;
	LDI  R30,LOW(255)
	OUT  0x11,R30
;      92 PORTC.6=1;    
	SBI  0x15,6
;      93 PORTB.0=1; 
	SBI  0x18,0
;      94 PORTD.2=1;
	SBI  0x12,2
;      95 PORTD.4=1;
	SBI  0x12,4
;      96 PORTD.6=1;
	SBI  0x12,6
;      97 
;      98 UCR=0x18;
	LDI  R30,LOW(24)
	OUT  0xA,R30
;      99 UBRR=0x33;
	LDI  R30,LOW(51)
	OUT  0x9,R30
;     100 
;     101 
;     102 while (1)
_0x16:
;     103 {                  
;     104        	if(USR.7==1)
	SBIS 0xB,7
	RJMP _0x19
;     105        	{
;     106 		gets(command2,2); 
	LDI  R30,LOW(_command2)
	LDI  R31,HIGH(_command2)
	ST   -Y,R31
	ST   -Y,R30
	LDI  R30,LOW(2)
	LDI  R31,HIGH(2)
	RCALL SUBOPT_0x0
;     107 		gets(command,5);  
	LDI  R30,LOW(5)
	LDI  R31,HIGH(5)
	RCALL SUBOPT_0x0
;     108 		rep=atol(command);          
	RCALL _atol
	STS  _rep,R30
	STS  _rep+1,R31
	STS  _rep+2,R22
	STS  _rep+3,R23
;     109             //rep=(int)(invalue*4096/5.0);
;     110 	        beta=rep;
	STS  _beta,R30
	STS  _beta+1,R31
	STS  _beta+2,R22
	STS  _beta+3,R23
;     111 		printf("the value is %d %d %d %d %d %d %d %d %d %d %d %d %d\n",rep,a,b,c,
;     112 		  	d,e,f,g,h,i,j,
;     113 			k,l);   
	__POINTW1FN _21,0
	ST   -Y,R31
	ST   -Y,R30
	LDS  R30,_rep
	LDS  R31,_rep+1
	LDS  R22,_rep+2
	LDS  R23,_rep+3
	RCALL __PUTPARD1
	CLR  R30
	SBRC R2,0
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R2,1
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R2,2
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R2,3
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R2,4
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R2,5
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R2,6
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R2,7
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R3,0
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R3,1
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R3,2
	LDI  R30,1
	RCALL SUBOPT_0x1
	CLR  R30
	SBRC R3,3
	LDI  R30,1
	RCALL SUBOPT_0x1
	LDI  R24,52
	RCALL _printf
	ADIW R28,54
;     114 			
;     115 		PORTB.1=a;
	BST  R2,0
	IN   R30,0x18
	BLD  R30,1
	OUT  0x18,R30
;     116 		PORTB.3=b;
	BST  R2,1
	IN   R30,0x18
	BLD  R30,3
	OUT  0x18,R30
;     117 		PORTB.5=c;
	BST  R2,2
	IN   R30,0x18
	BLD  R30,5
	OUT  0x18,R30
;     118 		PORTB.7=d;
	BST  R2,3
	IN   R30,0x18
	BLD  R30,7
	OUT  0x18,R30
;     119 		PORTC.1=e;
	BST  R2,4
	IN   R30,0x15
	BLD  R30,1
	OUT  0x15,R30
;     120 		PORTC.3=f;
	BST  R2,5
	IN   R30,0x15
	BLD  R30,3
	OUT  0x15,R30
;     121 		PORTC.5=g;
	BST  R2,6
	IN   R30,0x15
	BLD  R30,5
	OUT  0x15,R30
;     122 		PORTC.7=h;
	BST  R2,7
	IN   R30,0x15
	BLD  R30,7
	OUT  0x15,R30
;     123 		PORTB.2=i;
	BST  R3,0
	IN   R30,0x18
	BLD  R30,2
	OUT  0x18,R30
;     124 		PORTD.3=j;
	BST  R3,1
	IN   R30,0x12
	BLD  R30,3
	OUT  0x12,R30
;     125 		PORTD.5=k;
	BST  R3,2
	IN   R30,0x12
	BLD  R30,5
	OUT  0x12,R30
;     126 		PORTD.7=l;    
	BST  R3,3
	IN   R30,0x12
	BLD  R30,7
	OUT  0x12,R30
;     127 //		switch(command2[0])
;     128 //		{	         
;     129 //		case 'a': 
;     130 	   			PORTD.4=0; 
	CBI  0x12,4
;     131 	   			delay_us(1); 
	__DELAY_USB 3
;     132 	       			PORTD.6=0; 
	CBI  0x12,6
;     133 	       			delay_us(1); 
	__DELAY_USB 3
;     134 	       			PORTD.6=1;    
	SBI  0x12,6
;     135 	       			PORTD.4=1;
	SBI  0x12,4
;     136 //	       			break;   
;     137 //		case 'b': 
;     138 	   			PORTD.2=0; 
	CBI  0x12,2
;     139 	   			delay_us(1); 
	__DELAY_USB 3
;     140 	       			PORTD.6=0; 
	CBI  0x12,6
;     141 	       			delay_us(1); 
	__DELAY_USB 3
;     142 	       			PORTD.6=1;    
	SBI  0x12,6
;     143 	       			PORTD.2=1;
	SBI  0x12,2
;     144 //	       			break;
;     145 //		case 'c': 
;     146 	   			PORTC.6=0; 
	CBI  0x15,6
;     147 	   			delay_us(1); 
	__DELAY_USB 3
;     148 	       			PORTD.6=0; 
	CBI  0x12,6
;     149 	       			delay_us(1); 
	__DELAY_USB 3
;     150 	       			PORTD.6=1;    
	SBI  0x12,6
;     151 	       			PORTC.6=1;
	SBI  0x15,6
;     152 //	       			break;
;     153 //		case 'd': 
;     154 	   			PORTB.0=0; 
	CBI  0x18,0
;     155 	   			delay_us(1); 
	__DELAY_USB 3
;     156 	       			PORTD.6=0; 
	CBI  0x12,6
;     157 	       			delay_us(1); 
	__DELAY_USB 3
;     158 	       			PORTD.6=1;    
	SBI  0x12,6
;     159 	       			PORTB.0=1;
	SBI  0x18,0
;     160 //	       			break;
;     161 //	      }	
;     162 		        
;     163 	}
;     164 	delay_ms(1000);   
_0x19:
	LDI  R30,LOW(1000)
	LDI  R31,HIGH(1000)
	ST   -Y,R31
	ST   -Y,R30
	RCALL _delay_ms
;     165 };
	RJMP _0x16
;     166 }
_0x1A:
	RJMP _0x1A
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
	BREQ _0x51
	LDS  R26,_pp_G2
	LDS  R27,_pp_G2+1
	ADIW R26,1
	STS  _pp_G2,R26
	STS  _pp_G2+1,R27
	SBIW R26,1
	LD   R30,Y
	ST   X,R30
	RJMP _0x52
_0x51:
	LD   R30,Y
	ST   -Y,R30
	RCALL _putchar
_0x52:
	ADIW R28,1
	RET
__print_G2:
	SBIW R28,8
	RCALL __SAVELOCR6
	LDI  R16,0
_0x54:
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
	RJMP _0x56
	MOV  R30,R16
	CPI  R30,0
	BRNE _0x5A
	CPI  R19,37
	BRNE _0x5B
	LDI  R16,LOW(1)
	RJMP _0x5C
_0x5B:
	RCALL SUBOPT_0x2
_0x5C:
	RJMP _0x59
_0x5A:
	CPI  R30,LOW(0x1)
	BRNE _0x5D
	CPI  R19,37
	BRNE _0x5E
	RCALL SUBOPT_0x2
	LDI  R16,LOW(0)
	RJMP _0x59
_0x5E:
	LDI  R16,LOW(2)
	LDI  R21,LOW(0)
	LDI  R17,LOW(0)
	CPI  R19,45
	BRNE _0x5F
	LDI  R17,LOW(1)
	RJMP _0x59
_0x5F:
	CPI  R19,43
	BRNE _0x60
	LDI  R21,LOW(43)
	RJMP _0x59
_0x60:
	CPI  R19,32
	BRNE _0x61
	LDI  R21,LOW(32)
	RJMP _0x59
_0x61:
	RJMP _0x62
_0x5D:
	CPI  R30,LOW(0x2)
	BRNE _0x63
_0x62:
	LDI  R20,LOW(0)
	LDI  R16,LOW(3)
	CPI  R19,48
	BRNE _0x64
	ORI  R17,LOW(128)
	RJMP _0x59
_0x64:
	RJMP _0x65
_0x63:
	CPI  R30,LOW(0x3)
	BREQ PC+2
	RJMP _0x59
_0x65:
	CPI  R19,48
	BRLO _0x68
	CPI  R19,58
	BRLO _0x69
_0x68:
	RJMP _0x67
_0x69:
	MOV  R18,R20
	LSL  R20
	LSL  R20
	ADD  R20,R18
	LSL  R20
	MOV  R30,R19
	SUBI R30,LOW(48)
	ADD  R20,R30
	RJMP _0x59
_0x67:
	MOV  R30,R19
	CPI  R30,LOW(0x63)
	BRNE _0x6D
	RCALL SUBOPT_0x3
	LD   R30,X
	RCALL SUBOPT_0x4
	RJMP _0x6E
_0x6D:
	CPI  R30,LOW(0x73)
	BRNE _0x70
	RCALL SUBOPT_0x3
	RCALL __GETD1P
	STD  Y+12,R30
	STD  Y+12+1,R31
	ST   -Y,R31
	ST   -Y,R30
	RCALL _strlen
	MOV  R16,R30
	RJMP _0x71
_0x70:
	CPI  R30,LOW(0x70)
	BRNE _0x73
	RCALL SUBOPT_0x3
	RCALL __GETD1P
	STD  Y+6,R30
	STD  Y+6+1,R31
	ST   -Y,R31
	ST   -Y,R30
	RCALL _strlenf
	MOV  R16,R30
	ORI  R17,LOW(8)
_0x71:
	ORI  R17,LOW(2)
	ANDI R17,LOW(127)
	LDI  R18,LOW(0)
	RJMP _0x74
_0x73:
	CPI  R30,LOW(0x64)
	BREQ _0x77
	CPI  R30,LOW(0x69)
	BRNE _0x78
_0x77:
	ORI  R17,LOW(4)
	RJMP _0x79
_0x78:
	CPI  R30,LOW(0x75)
	BRNE _0x7A
_0x79:
	LDI  R30,LOW(_tbl10_G2*2)
	LDI  R31,HIGH(_tbl10_G2*2)
	STD  Y+6,R30
	STD  Y+6+1,R31
	LDI  R16,LOW(5)
	RJMP _0x7B
_0x7A:
	CPI  R30,LOW(0x58)
	BRNE _0x7D
	ORI  R17,LOW(8)
	RJMP _0x7E
_0x7D:
	CPI  R30,LOW(0x78)
	BREQ PC+2
	RJMP _0xAC
_0x7E:
	LDI  R30,LOW(_tbl16_G2*2)
	LDI  R31,HIGH(_tbl16_G2*2)
	STD  Y+6,R30
	STD  Y+6+1,R31
	LDI  R16,LOW(4)
_0x7B:
	SBRS R17,2
	RJMP _0x80
	RCALL SUBOPT_0x3
	RCALL SUBOPT_0x5
	LDD  R26,Y+10
	LDD  R27,Y+10+1
	SBIW R26,0
	BRGE _0x81
	LDD  R30,Y+10
	LDD  R31,Y+10+1
	RCALL __ANEGW1
	STD  Y+10,R30
	STD  Y+10+1,R31
	LDI  R21,LOW(45)
_0x81:
	CPI  R21,0
	BREQ _0x82
	SUBI R16,-LOW(1)
	RJMP _0x83
_0x82:
	ANDI R17,LOW(251)
_0x83:
	RJMP _0x84
_0x80:
	RCALL SUBOPT_0x3
	RCALL SUBOPT_0x5
_0x84:
_0x74:
	SBRC R17,0
	RJMP _0x85
_0x86:
	CP   R16,R20
	BRSH _0x88
	SBRS R17,7
	RJMP _0x89
	SBRS R17,2
	RJMP _0x8A
	ANDI R17,LOW(251)
	MOV  R19,R21
	SUBI R16,LOW(1)
	RJMP _0x8B
_0x8A:
	LDI  R19,LOW(48)
_0x8B:
	RJMP _0x8C
_0x89:
	LDI  R19,LOW(32)
_0x8C:
	RCALL SUBOPT_0x2
	SUBI R20,LOW(1)
	RJMP _0x86
_0x88:
_0x85:
	MOV  R18,R16
	SBRS R17,1
	RJMP _0x8D
_0x8E:
	CPI  R18,0
	BREQ _0x90
	SBRS R17,3
	RJMP _0x91
	LDD  R30,Y+6
	LDD  R31,Y+6+1
	ADIW R30,1
	STD  Y+6,R30
	STD  Y+6+1,R31
	SBIW R30,1
	LPM
	MOV  R30,R0
	RJMP _0xAE
_0x91:
	LDD  R26,Y+12
	LDD  R27,Y+12+1
	LD   R30,X+
	STD  Y+12,R26
	STD  Y+12+1,R27
_0xAE:
	ST   -Y,R30
	RCALL __put_G2
	CPI  R20,0
	BREQ _0x93
	SUBI R20,LOW(1)
_0x93:
	SUBI R18,LOW(1)
	RJMP _0x8E
_0x90:
	RJMP _0x94
_0x8D:
_0x96:
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
	BRSH _0x98
	SBRS R17,3
	RJMP _0x99
	SUBI R19,-LOW(7)
	RJMP _0x9A
_0x99:
	SUBI R19,-LOW(39)
_0x9A:
_0x98:
	SBRC R17,4
	RJMP _0x9C
	LDI  R30,LOW(48)
	CP   R30,R19
	BRLO _0x9E
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	CPI  R26,LOW(0x1)
	LDI  R30,HIGH(0x1)
	CPC  R27,R30
	BRNE _0x9D
_0x9E:
	ORI  R17,LOW(16)
	RJMP _0xA0
_0x9D:
	CP   R20,R18
	BRLO _0xA2
	SBRS R17,0
	RJMP _0xA3
_0xA2:
	RJMP _0xA1
_0xA3:
	LDI  R19,LOW(32)
	SBRS R17,7
	RJMP _0xA4
	LDI  R19,LOW(48)
	ORI  R17,LOW(16)
_0xA0:
	SBRS R17,2
	RJMP _0xA5
	ANDI R17,LOW(251)
	ST   -Y,R21
	RCALL __put_G2
	CPI  R20,0
	BREQ _0xA6
	SUBI R20,LOW(1)
_0xA6:
_0xA5:
_0xA4:
_0x9C:
	RCALL SUBOPT_0x2
	CPI  R20,0
	BREQ _0xA7
	SUBI R20,LOW(1)
_0xA7:
_0xA1:
	SUBI R18,LOW(1)
	LDD  R26,Y+8
	LDD  R27,Y+8+1
	LDI  R30,LOW(1)
	LDI  R31,HIGH(1)
	CP   R30,R26
	CPC  R31,R27
	BRSH _0x97
	RJMP _0x96
_0x97:
_0x94:
	SBRS R17,0
	RJMP _0xA8
_0xA9:
	CPI  R20,0
	BREQ _0xAB
	SUBI R20,LOW(1)
	LDI  R30,LOW(32)
	RCALL SUBOPT_0x4
	RJMP _0xA9
_0xAB:
_0xA8:
_0xAC:
_0x6E:
	LDI  R16,LOW(0)
_0x59:
	RJMP _0x54
_0x56:
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
	RCALL _gets
	LDI  R30,LOW(_command)
	LDI  R31,HIGH(_command)
	ST   -Y,R31
	ST   -Y,R30
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 12 TIMES
SUBOPT_0x1:
	CLR  R31
	CLR  R22
	CLR  R23
	RCALL __PUTPARD1
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 4 TIMES
SUBOPT_0x2:
	ST   -Y,R19
	RJMP __put_G2

;OPTIMIZER ADDED SUBROUTINE, CALLED 5 TIMES
SUBOPT_0x3:
	LDD  R26,Y+14
	LDD  R27,Y+14+1
	SBIW R26,4
	STD  Y+14,R26
	STD  Y+14+1,R27
	ADIW R26,4
	RET

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES
SUBOPT_0x4:
	ST   -Y,R30
	RJMP __put_G2

;OPTIMIZER ADDED SUBROUTINE, CALLED 2 TIMES
SUBOPT_0x5:
	RCALL __GETW1P
	STD  Y+10,R30
	STD  Y+10+1,R31
	RET

_atol:
	ldd  r27,y+1
	ld   r26,y
__atol0:
	ld   r30,x
	st   -y,r30
	rcall _isspace
	tst  r30
	breq __atol1
	adiw r26,1
	rjmp __atol0
__atol1:
	clt
	ld   r30,x
	cpi  r30,'-'
	brne __atol2
	set
	rjmp __atol3
__atol2:
	cpi  r30,'+'
	brne __atol4
__atol3:
	adiw r26,1
__atol4:
	clr  r0
	clr  r1
	clr  r24
	clr  r25
__atol5:
	ld   r30,x
	st   -y,r30
	rcall _isdigit
	tst  r30
	breq __atol6
	mov  r30,r0
	mov  r31,r1
	mov  r22,r24
	mov  r23,r25
	rcall __atol8
	rcall __atol8
	add  r0,r30
	adc  r1,r31
	adc  r24,r22
	adc  r25,r23
	rcall __atol8
	ld   r30,x+
	clr  r31
	subi r30,'0'
	add  r0,r30
	adc  r1,r31
	adc  r24,r31
	adc  r25,r31
	rjmp __atol5
__atol6:
	mov  r30,r0
	mov  r31,r1
	mov  r22,r24
	mov  r23,r25
	brtc __atol7
	com  r30
	com  r31
	com  r22
	com  r23
	clr  r24
	adiw r30,1
	adc  r22,r24
	adc  r23,r24
__atol7:
	adiw r28,2
	ret

__atol8:
	lsl  r0
	rol  r1
	rol  r24
	rol  r25
	ret

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

_isdigit:
	ldi  r30,1
	ld   r31,y+
	cpi  r31,'0'
	brlo __isdigit0
	cpi  r31,'9'+1
	brlo __isdigit1
__isdigit0:
	clr  r30
__isdigit1:
	ret

_isspace:
	ldi  r30,1
	ld   r31,y+
	cpi  r31,' '
	breq __isspace1
	cpi  r31,9
	breq __isspace1
	cpi  r31,13
	breq __isspace1
	clr  r30
__isspace1:
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
	__DELAY_USW 0x7D0
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

