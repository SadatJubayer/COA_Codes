.MODEL SMALL
.STACK 100H
.DATA
    COUNTER DB 0
    NEW DB 9
.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV CX,45
 
 
    TOP:
        CMP CX,0
        JE END_
     
        MOV AL,NEW
        CMP COUNTER,AL
        JE NEWLINE
        MOV AH,2
        MOV DL,'*'
        INT 21H
        MOV BL,COUNTER
        INC BL
        MOV COUNTER,BL
 
    LOOP TOP
 
    NEWLINE:
     
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
     
        MOV BL,NEW
        ADD BL,-1
        MOV NEW,BL
        MOV COUNTER,0
        JMP TOP
         
    END_:
 
    MAIN ENDP
END MAIN