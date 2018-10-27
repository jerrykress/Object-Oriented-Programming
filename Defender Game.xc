{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf100
{\fonttbl\f0\fnil\fcharset0 Menlo-Italic;\f1\fnil\fcharset0 Menlo-Regular;\f2\fnil\fcharset0 Menlo-Bold;
}
{\colortbl;\red255\green255\blue255;\red143\green143\blue143;\red255\green255\blue254;\red0\green0\blue0;
\red24\green24\blue24;\red81\green59\blue178;\red10\green22\blue51;\red175\green20\blue4;}
{\*\expandedcolortbl;;\cssrgb\c62745\c62745\c62745;\cssrgb\c100000\c100000\c99608;\cssrgb\c0\c0\c0;
\cssrgb\c12549\c12549\c12549;\cssrgb\c39608\c32941\c75294;\cssrgb\c3529\c11765\c25882;\cssrgb\c74902\c14902\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl400\partightenfactor0

\f0\i\fs26 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 /////////////////////////////////////////////////////////////////////////////////////////
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 // COMS20001
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 // CODE SKELETON FOR X-CORE200 EXPLORER KIT
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 // TITLE: "Console Ant Defender Game"
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 // Rudimentary game combining concurrent programming and I/O.
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 /////////////////////////////////////////////////////////////////////////////////////////
\f1\i0 \cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl400\partightenfactor0
\cf5 \cb3 \strokec5 #include\cf4 \strokec4  <\cf5 \strokec5 stdio\cf4 \strokec4 .\cf5 \strokec5 h\cf4 \strokec4 >\cb1 \
\cf5 \cb3 \strokec5 #include\cf4 \strokec4  <\cf5 \strokec5 print\cf4 \strokec4 .\cf5 \strokec5 h\cf4 \strokec4 >\cb1 \
\cf5 \cb3 \strokec5 #include\cf4 \strokec4  <\cf5 \strokec5 xs1\cf4 \strokec4 .\cf5 \strokec5 h\cf4 \strokec4 >\cb1 \
\cf5 \cb3 \strokec5 #include\cf4 \strokec4  <\cf5 \strokec5 platform\cf4 \strokec4 .\cf5 \strokec5 h\cf4 \strokec4 >\cb1 \
\
\cf5 \cb3 \strokec5 #define\cf4 \strokec4  \cf5 \strokec5 GAME_ENDED\cf4 \strokec4  \cf6 \strokec6 90\cf4 \cb1 \strokec4 \
\
\cf5 \cb3 \strokec5 on\cf4 \strokec4  \cf5 \strokec5 tile\cf4 \strokec4 [\cf6 \strokec6 0\cf4 \strokec4 ] : 
\f2\b \cf7 \strokec7 in
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 port\cf4 \strokec4  \cf5 \strokec5 buttons\cf4 \strokec4  = \cf5 \strokec5 XS1_PORT_4E\cf4 \strokec4 ; 
\f0\i \cf2 \strokec2 //port to access xCore-200 buttons
\f1\i0 \cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 on\cf4 \strokec4  \cf5 \strokec5 tile\cf4 \strokec4 [\cf6 \strokec6 0\cf4 \strokec4 ] : \cf5 \strokec5 out\cf4 \strokec4  \cf5 \strokec5 port\cf4 \strokec4  \cf5 \strokec5 leds\cf4 \strokec4  = \cf5 \strokec5 XS1_PORT_4F\cf4 \strokec4 ;   
\f0\i \cf2 \strokec2 //port to access xCore-200 LEDs
\f1\i0 \cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 /////////////////////////////////////////////////////////////////////////////////////////
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //  Helper Functions provided for you
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 /////////////////////////////////////////////////////////////////////////////////////////
\f1\i0 \cf4 \cb1 \strokec4 \
\

\f0\i \cf2 \cb3 \strokec2 //DISPLAYS an LED pattern
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0
\cf5 \cb3 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 showLEDs\cf4 \strokec4 (\cf5 \strokec5 out\cf4 \strokec4  \cf5 \strokec5 port\cf4 \strokec4  \cf5 \strokec5 p\cf4 \strokec4 , \cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 fromVisualiser\cf4 \strokec4 ) \{\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 pattern\cf4 \strokec4 ; 
\f0\i \cf2 \strokec2 //1st bit...separate green LED
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3                
\f0\i \cf2 \strokec2 //2nd bit...blue LED
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3                
\f0\i \cf2 \strokec2 //3rd bit...green LED
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3                
\f0\i \cf2 \strokec2 //4th bit...red LED
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 1\cf4 \strokec4 ;\cb1 \
\
\cb3   
\f2\b \cf7 \strokec7 while
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 running\cf4 \strokec4 ) \{\cb1 \
\cb3     \cf5 \strokec5 fromVisualiser\cf4 \strokec4  :> \cf5 \strokec5 pattern\cf4 \strokec4 ;   
\f0\i \cf2 \strokec2 //receive new pattern from visualiser
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 pattern\cf4 \strokec4  == \cf5 \strokec5 GAME_ENDED\cf4 \strokec4 ) \{      
\f0\i \cf2 \strokec2 //If pattern is equal to 90 (GAME_ENDED) stop the process
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3     \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3         \cf5 \strokec5 p\cf4 \strokec4  <: \cf5 \strokec5 pattern\cf4 \strokec4 ;                
\f0\i \cf2 \strokec2 //send pattern to LED port
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     \}\cb1 \
\cb3   \}\cb1 \
\cb3   
\f2\b \cf7 \strokec7 return
\f1\b0 \cf4 \strokec4  \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 //READ BUTTONS and send button pattern to userAnt
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0

\f2\b \cf7 \cb3 \strokec7 void
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 buttonListener\cf4 \strokec4 (
\f2\b \cf7 \strokec7 in
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 port\cf4 \strokec4  \cf5 \strokec5 b\cf4 \strokec4 , \cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 toUserAnt\cf4 \strokec4 ) \{\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 r\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 1\cf4 \strokec4 ;\cb1 \
\
\cb3   
\f2\b \cf7 \strokec7 while
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 running\cf4 \strokec4 ) \{\cb1 \
\cb3     \cf5 \strokec5 b\cf4 \strokec4  \cf5 \strokec5 when\cf4 \strokec4  \cf5 \strokec5 pinseq\cf4 \strokec4 (\cf6 \strokec6 15\cf4 \strokec4 )  :> \cf5 \strokec5 r\cf4 \strokec4 ;    
\f0\i \cf2 \strokec2 // check that no button is pressed
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     \cf5 \strokec5 b\cf4 \strokec4  \cf5 \strokec5 when\cf4 \strokec4  \cf5 \strokec5 pinsneq\cf4 \strokec4 (\cf6 \strokec6 15\cf4 \strokec4 ) :> \cf5 \strokec5 r\cf4 \strokec4 ;    
\f0\i \cf2 \strokec2 // check if some buttons are pressed
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  ((\cf5 \strokec5 r\cf4 \strokec4 ==\cf6 \strokec6 13\cf4 \strokec4 ) || (\cf5 \strokec5 r\cf4 \strokec4 ==\cf6 \strokec6 14\cf4 \strokec4 )) \{     
\f0\i \cf2 \strokec2 // if either button is pressed
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 toUserAnt\cf4 \strokec4  <: \cf5 \strokec5 r\cf4 \strokec4 ;             
\f0\i \cf2 \strokec2 // send button pattern to userAnt
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 r\cf4 \strokec4  == \cf5 \strokec5 GAME_ENDED\cf4 \strokec4 ) \{   
\f0\i \cf2 \strokec2 //Stop the process if GAME_ENDED is received form the user ant
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3     \}\cb1 \
\cb3   \}\cb1 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 //WAIT function
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0

\f2\b \cf7 \cb3 \strokec7 void
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 waitMoment\cf4 \strokec4 () \{\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 timer\cf4 \strokec4  \cf5 \strokec5 tmr\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 waitTime\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 tmr\cf4 \strokec4  :> \cf5 \strokec5 waitTime\cf4 \strokec4 ;                       
\f0\i \cf2 \strokec2 //read current timer value
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 waitTime\cf4 \strokec4  += \cf6 \strokec6 40000000\cf4 \strokec4 ;                  
\f0\i \cf2 \strokec2 //set waitTime to 0.4s after value
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 tmr\cf4 \strokec4  \cf5 \strokec5 when\cf4 \strokec4  \cf5 \strokec5 timerafter\cf4 \strokec4 (\cf5 \strokec5 waitTime\cf4 \strokec4 ) :> 
\f2\b \cf7 \strokec7 void
\f1\b0 \cf4 \strokec4 ; 
\f0\i \cf2 \strokec2 //wait until waitTime is reached
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 //PRINT WORLD TO CONSOLE
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0

\f2\b \cf7 \cb3 \strokec7 void
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 consolePrint\cf4 \strokec4 (\cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 userAntToDisplay\cf4 \strokec4 ,\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3                   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 ) \{\cb1 \
\cb3   \cf5 \strokec5 char\cf4 \strokec4  \cf5 \strokec5 world\cf4 \strokec4 [\cf6 \strokec6 25\cf4 \strokec4 ]; 
\f0\i \cf2 \strokec2 //world of size 23, plus 1 byte for line return
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3                   
\f0\i \cf2 \strokec2 //                  plus 1 byte for 0-termination
\f1\i0 \cf4 \cb1 \strokec4 \
\
\cb3   
\f0\i \cf2 \strokec2 //make the current world string
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   
\f2\b \cf7 \strokec7 for
\f1\b0 \cf4 \strokec4 (\cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 i\cf4 \strokec4 =\cf6 \strokec6 0\cf4 \strokec4 ;\cf5 \strokec5 i\cf4 \strokec4 <\cf6 \strokec6 23\cf4 \strokec4 ;\cf5 \strokec5 i\cf4 \strokec4 ++) \{\cb1 \
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  ((\cf5 \strokec5 i\cf4 \strokec4 >\cf6 \strokec6 7\cf4 \strokec4 ) && (\cf5 \strokec5 i\cf4 \strokec4 <\cf6 \strokec6 15\cf4 \strokec4 )) \cf5 \strokec5 world\cf4 \strokec4 [\cf5 \strokec5 i\cf4 \strokec4 ]=\cf8 \strokec8 '-'\cf4 \strokec4 ;\cb1 \
\cb3     
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 world\cf4 \strokec4 [\cf5 \strokec5 i\cf4 \strokec4 ]=\cf8 \strokec8 '.'\cf4 \strokec4 ;\cb1 \
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 userAntToDisplay\cf4 \strokec4 ==\cf5 \strokec5 i\cf4 \strokec4 ) \cf5 \strokec5 world\cf4 \strokec4 [\cf5 \strokec5 i\cf4 \strokec4 ]=\cf8 \strokec8 'X'\cf4 \strokec4 ;\cb1 \
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 ==\cf5 \strokec5 i\cf4 \strokec4 ) \cf5 \strokec5 world\cf4 \strokec4 [\cf5 \strokec5 i\cf4 \strokec4 ]=\cf8 \strokec8 'O'\cf4 \strokec4 ;\cb1 \
\cb3   \}\cb1 \
\cb3   \cf5 \strokec5 world\cf4 \strokec4 [\cf6 \strokec6 23\cf4 \strokec4 ]=\cf8 \strokec8 '\\n'\cf4 \strokec4 ;  
\f0\i \cf2 \strokec2 //add a line break
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 world\cf4 \strokec4 [\cf6 \strokec6 24\cf4 \strokec4 ]=\cf6 \strokec6 0\cf4 \strokec4 ;     
\f0\i \cf2 \strokec2 //add 0-termination
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 printstr\cf4 \strokec4 (\cf5 \strokec5 world\cf4 \strokec4 ); 
\f0\i \cf2 \strokec2 //send off to console
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 //PROCESS THAT COORDINATES DISPLAY
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0

\f2\b \cf7 \cb3 \strokec7 void
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 visualiser\cf4 \strokec4 (\cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 fromUserAnt\cf4 \strokec4 , \cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 fromAttackerAnt\cf4 \strokec4 , \cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 toLEDs\cf4 \strokec4 ) \{\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 userAntToDisplay\cf4 \strokec4  = \cf6 \strokec6 11\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4  = \cf6 \strokec6 2\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 pattern\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 round\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 distance\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 dangerzone\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 1\cf4 \strokec4 ;\cb1 \
\
\cb3   
\f2\b \cf7 \strokec7 while
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 running\cf4 \strokec4 ) \{\cb1 \
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 round\cf4 \strokec4 ==\cf6 \strokec6 0\cf4 \strokec4 ) \cf5 \strokec5 printstr\cf4 \strokec4 (\cf8 \strokec8 "ANT DEFENDER GAME (press button to start)\\n"\cf4 \strokec4 );\cb1 \
\cb3     \cf5 \strokec5 round\cf4 \strokec4 ++;\cb1 \
\cb3     \cf5 \strokec5 select\cf4 \strokec4  \{\cb1 \
\cb3       
\f2\b \cf7 \strokec7 case
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 fromUserAnt\cf4 \strokec4  :> \cf5 \strokec5 userAntToDisplay\cf4 \strokec4 :\cb1 \
\cb3           
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 userAntToDisplay\cf4 \strokec4  == \cf5 \strokec5 GAME_ENDED\cf4 \strokec4 ) \{   
\f0\i \cf2 \strokec2 //Stop process if receive GAME_ENDED from user ant
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3               \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3           \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3               \cf5 \strokec5 consolePrint\cf4 \strokec4 (\cf5 \strokec5 userAntToDisplay\cf4 \strokec4 ,\cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 );\cb1 \
\cb3           \}\cb1 \
\cb3         
\f2\b \cf7 \strokec7 break
\f1\b0 \cf4 \strokec4 ;\cb1 \
\cb3       
\f2\b \cf7 \strokec7 case
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 fromAttackerAnt\cf4 \strokec4  :> \cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 :\cb1 \
\cb3         \cf5 \strokec5 consolePrint\cf4 \strokec4 (\cf5 \strokec5 userAntToDisplay\cf4 \strokec4 ,\cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 );\cb1 \
\cb3         
\f2\b \cf7 \strokec7 break
\f1\b0 \cf4 \strokec4 ;\cb1 \
\cb3     \}\cb1 \
\cb3     \cf5 \strokec5 distance\cf4 \strokec4  = \cf5 \strokec5 userAntToDisplay\cf4 \strokec4 -\cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 ;\cb1 \
\cb3     \cf5 \strokec5 dangerzone\cf4 \strokec4  = ((\cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 ==\cf6 \strokec6 7\cf4 \strokec4 ) || (\cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 ==\cf6 \strokec6 15\cf4 \strokec4 ));\cb1 \
\cb3     \cf5 \strokec5 pattern\cf4 \strokec4  = \cf5 \strokec5 round\cf4 \strokec4 %\cf6 \strokec6 2\cf4 \strokec4  + \cf6 \strokec6 8\cf4 \strokec4  * \cf5 \strokec5 dangerzone\cf4 \strokec4  + \cf6 \strokec6 2\cf4 \strokec4  * ((\cf5 \strokec5 distance\cf4 \strokec4 ==\cf6 \strokec6 1\cf4 \strokec4 ) || (\cf5 \strokec5 distance\cf4 \strokec4 ==-\cf6 \strokec6 1\cf4 \strokec4 ));\cb1 \
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  ((\cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 >\cf6 \strokec6 7\cf4 \strokec4 )&&(\cf5 \strokec5 attackerAntToDisplay\cf4 \strokec4 <\cf6 \strokec6 15\cf4 \strokec4 )) \cf5 \strokec5 pattern\cf4 \strokec4  = \cf6 \strokec6 15\cf4 \strokec4 ;\cb1 \
\
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 running\cf4 \strokec4  == \cf6 \strokec6 0\cf4 \strokec4 ) \{\cb1 \
\cb3         \cf5 \strokec5 toLEDs\cf4 \strokec4  <: \cf5 \strokec5 GAME_ENDED\cf4 \strokec4 ;       
\f0\i \cf2 \strokec2 //Send GAME_ENDED to LEDs process
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3         \cf5 \strokec5 toLEDs\cf4 \strokec4  <: \cf5 \strokec5 pattern\cf4 \strokec4 ;\cb1 \
\cb3     \}\cb1 \
\cb3   \}\cb1 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 /////////////////////////////////////////////////////////////////////////////////////////
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //  MOST RELEVANT PART OF CODE TO EXPAND FOR YOU
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 /////////////////////////////////////////////////////////////////////////////////////////
\f1\i0 \cf4 \cb1 \strokec4 \
\

\f0\i \cf2 \cb3 \strokec2 //DEFENDER PROCESS... The defender is controlled by this process userAnt,
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //                    which has channels to a buttonListener, visualiser and controller
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0

\f2\b \cf7 \cb3 \strokec7 void
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 userAnt\cf4 \strokec4 (\cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 fromButtons\cf4 \strokec4 , \cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 toVisualiser\cf4 \strokec4 , \cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 toController\cf4 \strokec4 ) \{\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 userAntPosition\cf4 \strokec4  = \cf6 \strokec6 11\cf4 \strokec4 ;       
\f0\i \cf2 \strokec2 //the current defender position
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 buttonInput\cf4 \strokec4 ;                         
\f0\i \cf2 \strokec2 //the input pattern from the buttonListener
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;   
\f0\i \cf2 \strokec2 //the next attempted defender position after considering button
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 moveForbidden\cf4 \strokec4 ;                       
\f0\i \cf2 \strokec2 //the verdict of the controller if move is allowed
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 toVisualiser\cf4 \strokec4  <: \cf5 \strokec5 userAntPosition\cf4 \strokec4 ;         
\f0\i \cf2 \strokec2 //show initial position
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 1\cf4 \strokec4 ;                         
\f0\i \cf2 \strokec2 //indicate if the game is still running
\f1\i0 \cf4 \cb1 \strokec4 \
\
\cb3   
\f2\b \cf7 \strokec7 while
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 running\cf4 \strokec4 ) \{\cb1 \
\cb3     \cf5 \strokec5 fromButtons\cf4 \strokec4  :> \cf5 \strokec5 buttonInput\cf4 \strokec4 ; 
\f0\i \cf2 \strokec2 //expect values 13 and 14
\f1\i0 \cf4 \cb1 \strokec4 \
\
\cb3     \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4  = \cf5 \strokec5 userAntPosition\cf4 \strokec4 ;\cb1 \
\
\cb3     
\f0\i \cf2 \strokec2 // Move defender ant with buttons
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 buttonInput\cf4 \strokec4  == \cf6 \strokec6 14\cf4 \strokec4 ) \{\cb1 \
\cb3         
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 userAntPosition\cf4 \strokec4  == \cf6 \strokec6 0\cf4 \strokec4 ) \{\cb1 \
\cb3             \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4  = \cf6 \strokec6 22\cf4 \strokec4 ;\cb1 \
\cb3         \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3             \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4 --;\cb1 \
\cb3         \}\cb1 \
\cb3     \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 buttonInput\cf4 \strokec4  == \cf6 \strokec6 13\cf4 \strokec4 ) \{\cb1 \
\cb3         
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 userAntPosition\cf4 \strokec4  == \cf6 \strokec6 22\cf4 \strokec4 ) \{\cb1 \
\cb3             \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3         \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3             \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4 ++;\cb1 \
\cb3         \}\cb1 \
\cb3     \}\cb1 \
\
\cb3     
\f0\i \cf2 \strokec2 //Send to controller the attempted user ant position
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     \cf5 \strokec5 toController\cf4 \strokec4  <: \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4 ;\cb1 \
\
\cb3     
\f0\i \cf2 \strokec2 //Receive from controller details about the attempted move
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     \cf5 \strokec5 toController\cf4 \strokec4  :> \cf5 \strokec5 moveForbidden\cf4 \strokec4 ;\cb1 \
\
\cb3     
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 moveForbidden\cf4 \strokec4  == \cf6 \strokec6 0\cf4 \strokec4 ) \{                   
\f0\i \cf2 \strokec2 //Move is accepted
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 userAntPosition\cf4 \strokec4  = \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4 ;\cb1 \
\cb3         \cf5 \strokec5 toVisualiser\cf4 \strokec4  <: \cf5 \strokec5 userAntPosition\cf4 \strokec4 ;\cb1 \
\cb3     \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 moveForbidden\cf4 \strokec4  == \cf6 \strokec6 1\cf4 \strokec4 ) \{            
\f0\i \cf2 \strokec2 //Move is forbidden
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 toVisualiser\cf4 \strokec4  <: \cf5 \strokec5 userAntPosition\cf4 \strokec4 ;\cb1 \
\cb3     \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 moveForbidden\cf4 \strokec4  == \cf6 \strokec6 2\cf4 \strokec4 )\{             
\f0\i \cf2 \strokec2 //Game is over configuration
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3         \cf5 \strokec5 toVisualiser\cf4 \strokec4  <: \cf5 \strokec5 GAME_ENDED\cf4 \strokec4 ;\cb1 \
\cb3         \cf5 \strokec5 fromButtons\cf4 \strokec4  <: \cf5 \strokec5 GAME_ENDED\cf4 \strokec4 ;\cb1 \
\cb3     \}\cb1 \
\cb3   \}\cb1 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 //ATTACKER PROCESS... The attacker is controlled by this process attackerAnt,
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //                    which has channels to the visualiser and controller
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0

\f2\b \cf7 \cb3 \strokec7 void
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 attackerAnt\cf4 \strokec4 (\cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 toVisualiser\cf4 \strokec4 , \cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 toController\cf4 \strokec4 ) \{\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 moveCounter\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;                       
\f0\i \cf2 \strokec2 //moves of attacker so far
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 attackerAntPosition\cf4 \strokec4  = \cf6 \strokec6 2\cf4 \strokec4 ;      
\f0\i \cf2 \strokec2 //the current attacker position
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4 ;         
\f0\i \cf2 \strokec2 //the next attempted  position after considering move direction
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 currentDirection\cf4 \strokec4  = \cf6 \strokec6 1\cf4 \strokec4 ;                  
\f0\i \cf2 \strokec2 //the current direction the attacker is moving
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 moveForbidden\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;                     
\f0\i \cf2 \strokec2 //the verdict of the controller if move is allowed
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 1\cf4 \strokec4 ;                           
\f0\i \cf2 \strokec2 //indicating the attacker process is alive
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 toVisualiser\cf4 \strokec4  <: \cf5 \strokec5 attackerAntPosition\cf4 \strokec4 ;       
\f0\i \cf2 \strokec2 //show initial position
\f1\i0 \cf4 \cb1 \strokec4 \
\
\cb3   
\f2\b \cf7 \strokec7 while
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 running\cf4 \strokec4 ) \{\cb1 \
\
\cb3       
\f0\i \cf2 \strokec2 //Update the move counter
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3       \cf5 \strokec5 moveCounter\cf4 \strokec4 ++;\cb1 \
\
\cb3       
\f0\i \cf2 \strokec2 //Change direction if move number is divisible by 31 or 37
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3       
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  ((\cf5 \strokec5 moveCounter\cf4 \strokec4  % \cf6 \strokec6 31\cf4 \strokec4  == \cf6 \strokec6 0\cf4 \strokec4 ) || (\cf5 \strokec5 moveCounter\cf4 \strokec4  % \cf6 \strokec6 37\cf4 \strokec4  == \cf6 \strokec6 0\cf4 \strokec4 )) \{\cb1 \
\cb3           \cf5 \strokec5 currentDirection\cf4 \strokec4  = (-\cf6 \strokec6 1\cf4 \strokec4 ) * \cf5 \strokec5 currentDirection\cf4 \strokec4 ;\cb1 \
\cb3       \}\cb1 \
\
\cb3       
\f0\i \cf2 \strokec2 //Attacker ant move logic
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3       
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  ((\cf5 \strokec5 attackerAntPosition\cf4 \strokec4  == \cf6 \strokec6 0\cf4 \strokec4 ) && (\cf5 \strokec5 currentDirection\cf4 \strokec4  == -\cf6 \strokec6 1\cf4 \strokec4 )) \{\cb1 \
\cb3           \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4  = \cf6 \strokec6 22\cf4 \strokec4 ;\cb1 \
\cb3       \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  ((\cf5 \strokec5 attackerAntPosition\cf4 \strokec4  == \cf6 \strokec6 22\cf4 \strokec4 ) && (\cf5 \strokec5 currentDirection\cf4 \strokec4  == \cf6 \strokec6 1\cf4 \strokec4 )) \{\cb1 \
\cb3           \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3       \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3           \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4  = \cf5 \strokec5 attackerAntPosition\cf4 \strokec4  + \cf5 \strokec5 currentDirection\cf4 \strokec4 ;\cb1 \
\cb3       \}\cb1 \
\
\cb3       
\f0\i \cf2 \strokec2 //Send to controller the attacker ant attempted position
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3       \cf5 \strokec5 toController\cf4 \strokec4  <: \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4 ;\cb1 \
\
\cb3       
\f0\i \cf2 \strokec2 //Receive details about the move from controller
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3       \cf5 \strokec5 toController\cf4 \strokec4  :> \cf5 \strokec5 moveForbidden\cf4 \strokec4 ;\cb1 \
\
\cb3       
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 moveForbidden\cf4 \strokec4  == \cf6 \strokec6 0\cf4 \strokec4 ) \{                         
\f0\i \cf2 \strokec2 //Move accepted
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3           \cf5 \strokec5 attackerAntPosition\cf4 \strokec4  = \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4 ;\cb1 \
\cb3           \cf5 \strokec5 toVisualiser\cf4 \strokec4  <: \cf5 \strokec5 attackerAntPosition\cf4 \strokec4 ;\cb1 \
\cb3       \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 moveForbidden\cf4 \strokec4  == \cf6 \strokec6 1\cf4 \strokec4 ) \{                  
\f0\i \cf2 \strokec2 //Move forbidden
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3           \cf5 \strokec5 currentDirection\cf4 \strokec4  = (-\cf6 \strokec6 1\cf4 \strokec4 ) * \cf5 \strokec5 currentDirection\cf4 \strokec4 ;\cb1 \
\cb3           \cf5 \strokec5 toVisualiser\cf4 \strokec4  <: \cf5 \strokec5 attackerAntPosition\cf4 \strokec4 ;\cb1 \
\cb3       \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{                                          
\f0\i \cf2 \strokec2 //Game ended configuration
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3           \cf5 \strokec5 attackerAntPosition\cf4 \strokec4  = \cf5 \strokec5 attemptedAntPosition\cf4 \strokec4 ;\cb1 \
\cb3           \cf5 \strokec5 running\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3       \}\cb1 \
\
\cb3   \cf5 \strokec5 waitMoment\cf4 \strokec4 ();\cb1 \
\cb3   \}\cb1 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 //COLLISION DETECTOR... the controller process responds to \'ef\'bf\'bdpermission-to-move\'ef\'bf\'bd requests
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //                      from attackerAnt and userAnt. The process also checks if an attackerAnt
\f1\i0 \cf4 \cb1 \strokec4 \

\f0\i \cf2 \cb3 \strokec2 //                      has moved to winning positions.
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0

\f2\b \cf7 \cb3 \strokec7 void
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 controller\cf4 \strokec4 (\cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 fromAttacker\cf4 \strokec4 , \cf5 \strokec5 chanend\cf4 \strokec4  \cf5 \strokec5 fromUser\cf4 \strokec4 ) \{\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 lastReportedUserAntPosition\cf4 \strokec4  = \cf6 \strokec6 11\cf4 \strokec4 ;      
\f0\i \cf2 \strokec2 //position last reported by userAnt
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 lastReportedAttackerAntPosition\cf4 \strokec4  = \cf6 \strokec6 5\cf4 \strokec4 ;   
\f0\i \cf2 \strokec2 //position last reported by attackerAnt
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 unsigned\cf4 \strokec4  \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 attempt\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;                           
\f0\i \cf2 \strokec2 //incoming data from ants
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 gameEnded\cf4 \strokec4  = \cf6 \strokec6 0\cf4 \strokec4 ;                                  
\f0\i \cf2 \strokec2 //indicates if game is over
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 fromUser\cf4 \strokec4  :> \cf5 \strokec5 attempt\cf4 \strokec4 ;                                
\f0\i \cf2 \strokec2 //start game when user moves
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 fromUser\cf4 \strokec4  <: \cf6 \strokec6 1\cf4 \strokec4 ;                                      
\f0\i \cf2 \strokec2 //forbid first move
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3   
\f2\b \cf7 \strokec7 while
\f1\b0 \cf4 \strokec4  (!\cf5 \strokec5 gameEnded\cf4 \strokec4 ) \{\cb1 \
\cb3     \cf5 \strokec5 select\cf4 \strokec4  \{\cb1 \
\cb3       
\f2\b \cf7 \strokec7 case
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 fromAttacker\cf4 \strokec4  :> \cf5 \strokec5 attempt\cf4 \strokec4 :\cb1 \
\cb3           
\f0\i \cf2 \strokec2 //Move is forbidden if attacker wants to move over defender,
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3           
\f0\i \cf2 \strokec2 //also change direction
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3           
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 attempt\cf4 \strokec4  == \cf5 \strokec5 lastReportedUserAntPosition\cf4 \strokec4 ) \{\cb1 \
\cb3               \cf5 \strokec5 fromAttacker\cf4 \strokec4  <: \cf6 \strokec6 1\cf4 \strokec4 ;\cb1 \
\cb3           \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3               
\f0\i \cf2 \strokec2 //Game ends if attacker gets to treasure location
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3               
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 attempt\cf4 \strokec4  > \cf6 \strokec6 8\cf4 \strokec4  && \cf5 \strokec5 attempt\cf4 \strokec4  < \cf6 \strokec6 14\cf4 \strokec4 ) \{\cb1 \
\cb3                   \cf5 \strokec5 printf\cf4 \strokec4 (\cf8 \strokec8 "-----GAME IS OVER! ATTACKER ANT WINS!----- \\n"\cf4 \strokec4 );\cb1 \
\cb3                   \cf5 \strokec5 gameEnded\cf4 \strokec4  = \cf6 \strokec6 1\cf4 \strokec4 ;\cb1 \
\cb3                   \cf5 \strokec5 fromAttacker\cf4 \strokec4  <: \cf6 \strokec6 2\cf4 \strokec4 ;\cb1 \
\cb3                   \cf5 \strokec5 fromUser\cf4 \strokec4  <: \cf6 \strokec6 2\cf4 \strokec4 ;\cb1 \
\cb3               \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3                   
\f0\i \cf2 \strokec2 //Game continues
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3                   \cf5 \strokec5 fromAttacker\cf4 \strokec4  <: \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3               \}\cb1 \
\cb3               
\f0\i \cf2 \strokec2 //Update last reported attacker ant position
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3               \cf5 \strokec5 lastReportedAttackerAntPosition\cf4 \strokec4  = \cf5 \strokec5 attempt\cf4 \strokec4 ;\cb1 \
\cb3           \}\cb1 \
\
\
\cb3         
\f2\b \cf7 \strokec7 break
\f1\b0 \cf4 \strokec4 ;\cb1 \
\cb3       
\f2\b \cf7 \strokec7 case
\f1\b0 \cf4 \strokec4  \cf5 \strokec5 fromUser\cf4 \strokec4  :> \cf5 \strokec5 attempt\cf4 \strokec4 :\cb1 \
\cb3           
\f0\i \cf2 \strokec2 //Move is forbidden is defender tries to move over attacker ant
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3           
\f2\b \cf7 \strokec7 if
\f1\b0 \cf4 \strokec4  (\cf5 \strokec5 attempt\cf4 \strokec4  == \cf5 \strokec5 lastReportedAttackerAntPosition\cf4 \strokec4 ) \{\cb1 \
\cb3               \cf5 \strokec5 fromUser\cf4 \strokec4  <: \cf6 \strokec6 1\cf4 \strokec4 ;\cb1 \
\cb3           \} 
\f2\b \cf7 \strokec7 else
\f1\b0 \cf4 \strokec4  \{\cb1 \
\cb3               
\f0\i \cf2 \strokec2 //Update last reportde user ant position
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3               \cf5 \strokec5 lastReportedUserAntPosition\cf4 \strokec4  = \cf5 \strokec5 attempt\cf4 \strokec4 ;\cb1 \
\cb3               
\f0\i \cf2 \strokec2 //Continue game
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3               \cf5 \strokec5 fromUser\cf4 \strokec4  <: \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3           \}\cb1 \
\
\cb3         
\f2\b \cf7 \strokec7 break
\f1\b0 \cf4 \strokec4 ;\cb1 \
\cb3     \}\cb1 \
\cb3   \}\cb1 \
\cb3 \}\cb1 \
\
\pard\pardeftab720\sl400\partightenfactor0

\f0\i \cf2 \cb3 \strokec2 //MAIN PROCESS defining channels, orchestrating and starting the processes
\f1\i0 \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl400\partightenfactor0
\cf5 \cb3 \strokec5 int\cf4 \strokec4  \cf5 \strokec5 main\cf4 \strokec4 (
\f2\b \cf7 \strokec7 void
\f1\b0 \cf4 \strokec4 ) \{\cb1 \
\pard\pardeftab720\sl400\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 chan\cf4 \strokec4  \cf5 \strokec5 buttonsToUserAnt\cf4 \strokec4 ,         
\f0\i \cf2 \strokec2 //channel from buttonListener to userAnt
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3        \cf5 \strokec5 userAntToVisualiser\cf4 \strokec4 ,      
\f0\i \cf2 \strokec2 //channel from userAnt to Visualiser
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3        \cf5 \strokec5 attackerAntToVisualiser\cf4 \strokec4 ,  
\f0\i \cf2 \strokec2 //channel from attackerAnt to Visualiser
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3        \cf5 \strokec5 visualiserToLEDs\cf4 \strokec4 ,         
\f0\i \cf2 \strokec2 //channel from Visualiser to showLEDs
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3        \cf5 \strokec5 attackerAntToController\cf4 \strokec4 ,  
\f0\i \cf2 \strokec2 //channel from attackerAnt to Controller
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3        \cf5 \strokec5 userAntToController\cf4 \strokec4 ;      
\f0\i \cf2 \strokec2 //channel from userAnt to Controller
\f1\i0 \cf4 \cb1 \strokec4 \
\
\cb3   \cf5 \strokec5 par\cf4 \strokec4  \{\cb1 \
\cb3     
\f0\i \cf2 \strokec2 //PROCESSES FOR YOU TO EXPAND
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     \cf5 \strokec5 on\cf4 \strokec4  \cf5 \strokec5 tile\cf4 \strokec4 [\cf6 \strokec6 1\cf4 \strokec4 ]: \cf5 \strokec5 userAnt\cf4 \strokec4 (\cf5 \strokec5 buttonsToUserAnt\cf4 \strokec4 ,\cf5 \strokec5 userAntToVisualiser\cf4 \strokec4 ,\cf5 \strokec5 userAntToController\cf4 \strokec4 );\cb1 \
\cb3     \cf5 \strokec5 on\cf4 \strokec4  \cf5 \strokec5 tile\cf4 \strokec4 [\cf6 \strokec6 1\cf4 \strokec4 ]: \cf5 \strokec5 attackerAnt\cf4 \strokec4 (\cf5 \strokec5 attackerAntToVisualiser\cf4 \strokec4 ,\cf5 \strokec5 attackerAntToController\cf4 \strokec4 );\cb1 \
\cb3     \cf5 \strokec5 on\cf4 \strokec4  \cf5 \strokec5 tile\cf4 \strokec4 [\cf6 \strokec6 1\cf4 \strokec4 ]: \cf5 \strokec5 controller\cf4 \strokec4 (\cf5 \strokec5 attackerAntToController\cf4 \strokec4 , \cf5 \strokec5 userAntToController\cf4 \strokec4 );\cb1 \
\
\cb3     
\f0\i \cf2 \strokec2 //HELPER PROCESSES USING BASIC I/O ON X-CORE200 EXPLORER
\f1\i0 \cf4 \cb1 \strokec4 \
\cb3     \cf5 \strokec5 on\cf4 \strokec4  \cf5 \strokec5 tile\cf4 \strokec4 [\cf6 \strokec6 0\cf4 \strokec4 ]: \cf5 \strokec5 buttonListener\cf4 \strokec4 (\cf5 \strokec5 buttons\cf4 \strokec4 , \cf5 \strokec5 buttonsToUserAnt\cf4 \strokec4 );\cb1 \
\cb3     \cf5 \strokec5 on\cf4 \strokec4  \cf5 \strokec5 tile\cf4 \strokec4 [\cf6 \strokec6 0\cf4 \strokec4 ]: \cf5 \strokec5 visualiser\cf4 \strokec4 (\cf5 \strokec5 userAntToVisualiser\cf4 \strokec4 ,\cf5 \strokec5 attackerAntToVisualiser\cf4 \strokec4 ,\cf5 \strokec5 visualiserToLEDs\cf4 \strokec4 );\cb1 \
\cb3     \cf5 \strokec5 on\cf4 \strokec4  \cf5 \strokec5 tile\cf4 \strokec4 [\cf6 \strokec6 0\cf4 \strokec4 ]: \cf5 \strokec5 showLEDs\cf4 \strokec4 (\cf5 \strokec5 leds\cf4 \strokec4 ,\cf5 \strokec5 visualiserToLEDs\cf4 \strokec4 );\cb1 \
\cb3   \}\cb1 \
\cb3   
\f2\b \cf7 \strokec7 return
\f1\b0 \cf4 \strokec4  \cf6 \strokec6 0\cf4 \strokec4 ;\cb1 \
\cb3 \}\cb1 \
\
}