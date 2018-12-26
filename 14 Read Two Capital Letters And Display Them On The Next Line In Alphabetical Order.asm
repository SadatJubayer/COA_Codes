.MODEL SMALL
.STACK 100H
.DATA
 

.CODE

MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV AH,1      ;  INPUT FINCTION
                  ;
    INT 21H       ;  INPUT FIRST CHARACTER
    MOV BL,AL     ;
                  ;
    INT 21H       ;  INPUT SECOND CHARACTER
    MOV CL,AL
 
    MOV AH,2      ;
    MOV DL,0AH    ;
    INT 21H       ;  PRINTING NEW LINE
    MOV DL,0DH    ;
    INT 21H       ;
                  ;
    CMP BL,CL     ;
    JLE FIRST     ;  COMPARE TWO CHARACTER IF FIRST INPUT IS
                  ;      SMALLER THAN SECOND INPUT THAN GOTO FIRST:
                  ;
    MOV AH,2      ;
    MOV DL,CL     ;  PRINT SECOND CHARACTER
    INT 21H       ;
                  ;
    JMP END_      ;  UNCONDITIONAL JUMP
                  ;
    FIRST:        ;
                  ;
        MOV AH,2  ;
        MOV DL,BL ; PRINT SECOND CHARACTER
        INT 21H   ;
                  ;
                  ;
    END_:
 
    MOV AH,4CH    ;
    INT 21H       ;
       
    MAIN ENDP
END MAIN