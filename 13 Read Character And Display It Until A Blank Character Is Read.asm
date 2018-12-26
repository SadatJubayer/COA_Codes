.MODEL SMALL
.STACK 100H
.DATA

.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    REPEAT:
 
        MOV AH,1         ;
        INT 21H          ;    INTPUT A CHARACTER
                         ;
        CMP AL,20H       ;
        JE END_          ;    COMPARE IF INPUT ISEQUALTO SPACE THAN PROGRAM WILL BE TERMINATE
                         ;
        MOV AH,2         ;
        MOV DL,AL        ;    DOSPALY THE NUMBER
        INT 21H
                         ;
        JMP REPEAT       ;    JUMP TO THE REPEAT
 
    END_:                ;    PROGRAM END HERE
 
    MOV AH,4CH
    INT 21H
   
    MAIN ENDP
END MAIN