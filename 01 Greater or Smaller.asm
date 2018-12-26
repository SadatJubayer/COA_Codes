.MODEL SMALL 
.STACK 100H
.DATA
    MSG1 DB 'Enter Your Number: $'      
    MSG2 DB '    GREATER $'
    MSG3 DB '    SMALLER $'
.CODE
MAIN PROC                       
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AH, 9    
    LEA DX, MSG1
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BL, AL 
    SUB BL, 48
    
    CMP BL, 5
    JL SMALLER 
    
    
    GREATER: 
        MOV AH, 9
        LEA DX, MSG2
        INT 21H 
        JMP EXIT 
        
    SMALLER: 
        MOV AH, 9 
        LEA DX, MSG3 
        INT 21H 
  
     EXIT: 
        MOV AH, 4CH 
        INT 21H 
   

    MAIN ENDP 
END MAIN 