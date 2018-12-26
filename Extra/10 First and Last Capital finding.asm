; take a line of char as input and find the first and last capital letters  

.MODEL SMALL
.STACK 100H  
.DATA

PROMPT DB 'Type a line of text', 0DH, 0AH, '$'
NO_CAP_MSG DB 0DH, 0AH,'There is not capital letter... $'
CAP_MSG DB 0DH, 0AH, 'The fist capital is = '
FIRST DB ']', ' and the Last Capital is = '
LAST DB '@ $'  

.CODE 
MAIN PROC
  
  ;Initialize DATA
  MOV AX, @DATA
  MOV DS, AX 
  
  ; Prompt for taking input
  MOV AH, 9
  LEA DX, PROMPT
  INT 21H 
  
  ; TAKING INPUT 
  MOV AH, 1
  INT 21H ; NOW input on AL
  
WHILE_:
  CMP AL, 0DH ; CHECK NEW LINE OR NOT
  JE EXIT_WHILE ; IF NEW LINE, THEN BREAK THE LOOP
  ;ELSE CHECK THE CHAR CAP OR NOT 
  
  CMP AL, 'A'
  JNGE END_IF 
  CMP AL, 'Z'      ; CHECKING CAPITAL OR NOT 
  JNLE END_IF  
  
  ; If CAP, then check with the varibles
  
  CMP AL, FIRST 
  JNL CHECK_LAST          ; COMPARING AL WITH FIRST, IF NOT LESS THAN FIRST Then MOVE TO LAST CHECKING, ELSE MOV FIRST = AL 
  MOV FIRST, AL                                                                                                           
  
 CHECK_LAST: 
  CMP AL, LAST            ; COMPARING AL WITH LAST, IF NOT GREATER THAN LAST Then MOVE TO END IF, ELSE MOV LAST = AL
  JNG END_IF 
  MOV LAST, AL
  
 END_IF:
  MOV AH,1              ; TAKING INPUT AGAIN AND JUMPING TO THE WHILE LOOP AGIAN 
  INT 21H
  JMP WHILE_
  
EXIT_WHILE:
  MOV AH, 9
  
  CMP FIRST, ']'           ; COMPARE FIRST WITH ] , IF NOT EQUAL THEN JUMP TO RESULT, ELSE PRINT NO_CAPS
  JNE RESULT
  LEA DX, NO_CAP_MSG
  JMP DISPLAY 
  
RESULT:
  LEA DX, CAP_MSG          ; MOVING ALL VARIABLES FOR PRINT 
  
DISPLAY:                    
  INT 21H                  ; PRINT FUNCTION 
  
 
    MOV AH, 4CH
    INT 21H                 ; EXIT FUNCTION
    
    MAIN ENDP
END MAIN 