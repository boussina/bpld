/*********************************************
This program was produced by the
CodeWizardAVR V1.23.5 Evaluation
Automatic Program Generator
� Copyright 1998-2002 HP InfoTech s.r.l.
http://www.hpinfotech.ro
e-mail:office@hpinfotech.ro , hpinfotech@xnet.ro

Project : 
Version : 
Date    : 7/25/2002
Author  : 
Company : 
Comments: 


Chip type           : AT90S8535
Clock frequency     : 4.000000 MHz
Memory model        : Small
Internal SRAM size  : 512
External SRAM size  : 0
Data Stack size     : 128
*********************************************/

#include <90s8535.h>    
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
bit a;
bit b;
bit c;
bit d;
bit e;
bit f;
bit g;
bit h;
bit i;
bit l;

	}ten;// declaring a structure for reading toggled bits
void main(void)
{

PORTA=0x00;
DDRA=0xff;
PORTB=0x00;
DDRB=0xff; 
PORTC=0x00;
DDRC=0xff;
PORTD=0x00;
DDRD=0xff;
GIMSK=0x00;
MCUCR=0x00;
TIMSK=0x00;
UCR=0x18;   
UBRR=0x17;

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
