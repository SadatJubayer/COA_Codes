.MODEL SMALL
.STACK 100H
.DATA
    VAL DB ?
    FIRST DB 20H,'FIRST NUMBER.$'
    SECOND DB 20H,'SECOND NUMBER.$'
.CODE

MAIN PROC
 
    MOV AX,@DATA ; DATA SET
    MOV DS,AX    ;
 
    MOV AH,1     ;
    INT 21H      ;  INTPUT FIRST NUMBER AND SAVE IT TO VAL
    MOV VAL,AL   ;
 
    INT 21H      ;  INPUT SECOND NUMBER
    MOV CL,AL    ;
 
    CMP CL,VAL   ; COMPARE 2 NUMBER IF
    JLE PRINT    ;
 
    MOV AH,2
 
    MOV DL,0AH   ;
    INT 21H      ;
    MOV DL,0DH   ;   PRINTING NEW LINE
    INT 21H      ;
 
    MOV DL,CL    ;
    INT 21H      ;PRINTING SECOND VALUE
 
    MOV AH,9     ;
    LEA DX,SECOND; PRINTING SECOND MSG
    INT 21H      ;
     
    JMP END_     ;UNCONDITIONAL JUMP
 
    PRINT:
        MOV CL,VAL
        MOV AH,2
     
        MOV DL,0AH  ;
        INT 21H     ;   PRINTING NEW LINE
        MOV DL,0DH  ;
        INT 21H     ;
 
        MOV DL,CL   ;
        INT 21H     ; PRINTING FIRST VALUE
     
        MOV AH,9     ;
        LEA DX,FIRST ;   PRINTING FIRST MSG
        INT 21H      ;
     
    END_:  
    MOV AH,4CH
    INT 21H
 
    MAIN ENDP
END MAIN