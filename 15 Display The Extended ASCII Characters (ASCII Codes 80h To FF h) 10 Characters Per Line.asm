.MODEL SMALL
.STACK 100H
.DATA

     FIRST DB 80H
     COUNTER DB 1
     NUMBER  DB 10
.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    TOP:
        MOV BL,NUMBER
        CMP COUNTER,BL
        JE NEWLINE
     
        MOV AH,2
        MOV DL,FIRST
        INT 21H
        MOV DL,20H
        INT 21H
     
        CMP FIRST,0FFH
        JE END_
     
        MOV BL,FIRST
        INC BL
        MOV FIRST,BL
     
        MOV BL,COUNTER
        INC BL
        MOV COUNTER,BL
     
    LOOP TOP
 
    NEWLINE:
     
        MOV AL,NUMBER
        ADD AL,10
        MOV NUMBER,AL
     
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
     
        JMP TOP
         
    END_:
 
    MOV AH,4CH
    INT 21H
     
    MAIN ENDP
END MAIN