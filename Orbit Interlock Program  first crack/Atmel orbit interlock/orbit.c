/*********************************************
This program was produced by the
CodeWizardAVR V1.23.6a Evaluation
Automatic Program Generator
� Copyright 1998-2002 HP InfoTech s.r.l.
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
#include <delay.h>            

//#define DAC3SEL PORTC.6    
//#define DAC4SEL PORTB.0 
//#define DAC2SEL PORTD.2
//#define DAC1SEL PORTD.4
//#define DACWRITE PORTD.6

char command[8];  
char command2[8];  
long rep=0;     
  
#pragma regalloc-

bit a;
bit b;
bit c;
bit d;
bit e;
bit f;
bit g;
bit h;
bit i;
bit j;     
bit k; 
bit l;   

register long beta@2;   
 

#pragma regalloc+
   

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
PORTC.6=1;    
PORTB.0=1; 
PORTD.2=1;
PORTD.4=1;
PORTD.6=1;

UCR=0x18;
UBRR=0x33;


while (1)
{                  
       	if(USR.7==1)
       	{
		gets(command2,2); 
		gets(command,5);  
		rep=atol(command);          
            //rep=(int)(invalue*4096/5.0);
	        beta=rep;
		printf("the value is %d %d %d %d %d %d %d %d %d %d %d %d %d\n",rep,a,b,c,
		  	d,e,f,g,h,i,j,
			k,l);   
			
		PORTB.1=a;
		PORTB.3=b;
		PORTB.5=c;
		PORTB.7=d;
		PORTC.1=e;
		PORTC.3=f;
		PORTC.5=g;
		PORTC.7=h;
		PORTB.2=i;
		PORTD.3=j;
		PORTD.5=k;
		PORTD.7=l;    
//		switch(command2[0])
//		{	         
//		case 'a': 
	   			PORTD.4=0; 
	   			delay_us(1); 
	       			PORTD.6=0; 
	       			delay_us(1); 
	       			PORTD.6=1;    
	       			delay_us(1); 
	       			PORTD.4=1;
//	       			break;   
//		case 'b': 
	   			PORTD.2=0; 
	   			delay_us(1); 
	       			PORTD.6=0; 
	       			delay_us(1); 
	       			PORTD.6=1;   
	       			delay_us(1);  
	       			PORTD.2=1;
//	       			break;
//		case 'c': 
	   			PORTC.6=0; 
	   			delay_us(1); 
	       			PORTD.6=0; 
	       			delay_us(1); 
	       			PORTD.6=1;   
	       			delay_us(1);  
	       			PORTC.6=1;
//	       			break;
//		case 'd': 
	   			PORTB.0=0; 
	   			delay_us(1); 
	       			PORTD.6=0; 
	       			delay_us(1); 
	       			PORTD.6=1;   
	       			delay_us(1);  
	       			PORTB.0=1;
//	       			break;
//	      }	
		        
	}
	delay_ms(1000);   
};
}
