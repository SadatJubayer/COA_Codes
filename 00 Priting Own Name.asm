.MODEL SMALL
.STACK 100H
.DATA
   STR DB "Sadat Jubayer$"
.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, STR    
    INT 21H
    
    
    MAIN ENDP
END MAIN 
