/*********************************************
This program was produced by the
CodeWizardAVR V1.23.6a Evaluation
Automatic Program Generator
© Copyright 1998-2002 HP InfoTech s.r.l.
http://www.hpinfotech.ro
e-mail:office@hpinfotech.ro , hpinfotech@xnet.ro

Project : Orbit Interlock
Version : 1.0
Date    : 8/15/2002
Author  : boussina
Company : ssrl
Comments: 
first try


Chip type           : AT90S8535
Clock frequency     : 3.696000 MHz
Memory model        : Small
Internal SRAM size  : 512
External SRAM size  : 0
Data Stack size     : 128
*********************************************/

#include <90s8535.h>

// Standard Input/Output functions
#include <stdio.h> 
#include <stdlib.h>
              

#define DAC3SEL PORTC.6    
#define DAC4SEL PORTD.0 
#define DAC2SEL PORTD.2 
#define DAC1SEL PORTD.4 
#define DACWRITE PORTD.6 

char command[5];     
int rep=0;
float invalue;
typedef struct bitsforuse{
	unsigned int a:1;
	unsigned int b:1;
	unsigned int c:1;
  	unsigned int d:1;
	unsigned int e:1;
	unsigned int f:1;
	unsigned int g:1;	
	unsigned int h:1;
	unsigned int i:1;
	unsigned int j:1;
	unsigned int k:1;
	unsigned int l:1;   
	
}io;
union bits{                 
		io iolines;
		unsigned int dummy;
	}ten;// declaring a structure for reading toggled bits
// Declare your global variables here

void main(void)
{
// Declare your local variables here

// Input/Output Ports initialization
// Port A initialization
// Func0=Out Func1=Out Func2=Out Func3=Out Func4=Out Func5=Out Func6=Out Func7=Out 
// State0=0 State1=0 State2=0 State3=0 State4=0 State5=0 State6=0 State7=0 
PORTA=0x00;
DDRA=0xFF;

// Port B initialization
// Func0=Out Func1=Out Func2=Out Func3=Out Func4=Out Func5=Out Func6=Out Func7=Out 
// State0=0 State1=0 State2=0 State3=0 State4=0 State5=0 State6=0 State7=0 
PORTB=0x00;
DDRB=0xFF;

// Port C initialization
// Func0=Out Func1=Out Func2=Out Func3=Out Func4=Out Func5=Out Func6=Out Func7=Out 
// State0=0 State1=0 State2=0 State3=0 State4=0 State5=0 State6=0 State7=0 
PORTC=0x00;
DDRC=0xFF;

// Port D initialization
// Func0=Out Func1=Out Func2=Out Func3=Out Func4=Out Func5=Out Func6=Out Func7=Out 
// State0=0 State1=0 State2=0 State3=0 State4=0 State5=0 State6=0 State7=0 
PORTD=0x00;
DDRD=0xFF;

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: Timer 0 Stopped
TCCR0=0x00;
TCNT0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: Timer 1 Stopped
// Mode: Normal top=FFFFh
// OC1A output: Discon.
// OC1B output: Discon.
// Noise Canceler: Off
// Input Capture on Falling Edge
TCCR1A=0x00;
TCCR1B=0x00;
TCNT1H=0x00;
TCNT1L=0x00;
OCR1AH=0x00;
OCR1AL=0x00;
OCR1BH=0x00;
OCR1BL=0x00;

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer 2 Stopped
// Mode: Normal top=FFh
// OC2 output: Disconnected
ASSR=0x00;
TCCR2=0x00;
TCNT2=0x00;
OCR2=0x00;

// External Interrupt(s) initialization
// INT0: Off
// INT1: Off
GIMSK=0x00;
MCUCR=0x00;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK=0x00;

// UART initialization
// Communication Parameters: 8 Data, 1 Stop, No Parity
// UART Receiver: On
// UART Transmitter: On
// UART Baud rate: 9600
UCR=0x18;
UBRR=0x17;

// Analog Comparator initialization
// Analog Comparator: Off
// Analog Comparator Input Capture by Timer/Counter 1: Off
// Analog Comparator Output: Off
ACSR=0x80;


while (1)
{             
       	printf("Please enter a value between 1 and 4096");
	gets(command, 1);	         
	{  
	   gets(command, 5);   
	   rep=atoi(command);    
	}        
            //rep=(int)(invalue*4096/5.0);
		ten.dummy=rep;
		printf("the value is %d %d %d %d %d %d %d %d %d %d %d %d\n",ten.iolines.a,ten.iolines.b,ten.iolines.c,
			ten.iolines.d,ten.iolines.e,ten.iolines.f,ten.iolines.g,ten.iolines.h,ten.iolines.i,ten.iolines.j,
			ten.iolines.k,ten.iolines.l);    
		       	DAC4SEL=0;
			DAC3SEL=0;
		 	DAC2SEL=0;     
		   	DAC1SEL=0;
		     	DACWRITE=0;
};
}


