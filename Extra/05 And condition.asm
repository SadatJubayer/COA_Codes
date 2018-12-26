; read a character, and if it's uppercase, Display it

.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC
  ; input function
  MOV AH, 1
  INT 21H 
  
  CMP AL, 'A' ; Compare with A
  JNGE EXIT   ; go to exit if not greater or equal 
  ; if not, then again compare with Z
  CMP AL, 'Z'
  JNLE EXIT ; again go to exit if not less or equal 
  ; if not, then print the character
  
  MOV AH, 2
  MOV DL, AL 
  INT 21H

  EXIT:
    MOV AH, 4CH
    INT 21H   
    
    MAIN ENDP
END MAIN 