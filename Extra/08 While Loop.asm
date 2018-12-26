; couting input of a line, enter means line end 

.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC
  
  MOV DX, 0
  MOV AH,1 

TOP:   
  INT 21H 
  CMP AL, 0DH
  JE PRINT_TOTAL
  INC DX 
  LOOP TOP 
   
PRINT_TOTAL:
   MOV AH, 2
   INT 21H 

  EXIT:
    MOV AH, 4CH
    INT 21H   
    
    MAIN ENDP
END MAIN 