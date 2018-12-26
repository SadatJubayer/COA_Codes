; Write a program that will prompt the user to enter a hex digit
; character ("0"·... "9" or "A" ... "F"), display it on the next line
; in decimal, and ask the user i.i he or she wants to do it again. If
; the user types "y" or "Y", the ·program repeats; If the user types
; anything else, the program terminates. If the user enters an illegal
; character, prompt the user to try again.

.MODEL SMALL
.STACK 100H 
.DATA   
    PROMPT DB  0AH,0DH, 'Enter a HEX Digit "0"..."9"  or "A".."F": $'
    TRY_AGAIN DB 'Try again. $'
    OUTPUT DB 0AH,0DH,'Output: $'
    AGAIN_PROMPT DB 0AH,0DH,'Do you want to do it again $',  0AH,0DH
.CODE 

MAIN PROC
  
  MOV AX, @DATA
  MOV DS, AX

TOP: 
  MOV AH, 9
  LEA DX, PROMPT  
  INT 21H
  
  MOV AH,1
  INT 21H
  
  CMP AL, 30H
  JL TRY_MSG
  
  CMP AL, 46H
  JG TRY_MSG  
  
  CMP AL, 39H
  JLE DIGIT       ; IF 0 TO 9, THEN JUMP TO DIGIT PRINT 
  
  ; ELSE PRINT AFTER SUBTRUCTING 11
  
  MOV AH, 9
  LEA DX, OUTPUT  
  INT 21H
  
  SUB AL, 11H
  MOV AH,2
  MOV DL, 31H
  INT 21H
  MOV DL, AL
  INT 21H
 
AGAIN: 
  MOV AH, 9
  LEA DX, PROMPT  
  INT 21H
   
  MOV AH,1
  INT 21H
  MOV BH,AL
  MOV AH,2
  MOV DL,0AH
  INT 21H
  MOV DL,0DH
  INT 21H

  CMP BH,'Y'
  JE TOP
  CMP BH,'y'
  JE TOP
  JMP EXIT
   
 
DIGIT: 
  MOV AH, 9
  LEA DX, OUTPUT  
  INT 21H 
  
  MOV AH, 2
  MOV DL, BL 
  INT 21H
  
  JMP AGAIN   
  
TRY_MSG:
   MOV AH,9
   LEA DX, TRY_AGAIN
   INT 21H
   JMP TOP    

  EXIT:
    MOV AH, 4CH
    INT 21H   
    
    MAIN ENDP
END MAIN 