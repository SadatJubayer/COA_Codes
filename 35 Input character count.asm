.MODEL SMALL
.STACK 100H
.DATA
.CODE
 MAIN PROC
    MOV DX,0
    MOV AH,1
    INT 21H 
    
    WHILE_: 
    
    CMP AL,0DH
    JE END_WHILE
    INC DX
    INT 21H
    JMP WHILE_ 
    
    
    END_WHILE:
    
    ADD DX,48
    MOV BX,DX 
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
    MOV AH,2
    MOV DX,BX
    INT 21H 