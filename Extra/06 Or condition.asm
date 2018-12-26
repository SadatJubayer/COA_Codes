; read a character, and if it's y or Y, then Display it 

.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC
  ; input function
  MOV AH, 1
  INT 21H 
  
  CMP AL, 'Y' ; Compare with Y
  JE DISPLAY   ; go to display if equal 
  
  ; again compare with y
  CMP AL, 'y'
  JE DISPLAY ; go to display if equal
   
  ; if both are false then jump to exit 
  JMP EXIT
  
DISPLAY: 
  MOV AH, 2
  MOV DL, AL 
  INT 21H

  EXIT:
    MOV AH, 4CH
    INT 21H   
    
    MAIN ENDP
END MAIN 