; Replace a number in AX by its Absolute value 

.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC
    CMP AX, 0  ; AX < 0
    JNL END_IF ; JUMP IF NOT LESS THAN
    NEG AX     ; YES, CHANGE SIGN  
  END_IF:
 
    AH, 4CH
    INT 21H   
    
    MAIN ENDP
END MAIN 