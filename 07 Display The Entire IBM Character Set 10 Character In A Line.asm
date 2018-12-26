.MODEL SMALL
.STACK 100H
.DATA
   COUNTER DB 10
.CODE

MAIN PROC
 
    MOV AX,@DATA        ;
    MOV DS,AX           ;data set
 
    MOV AH,2            ;display character function
    MOV CX,256          ;256 character to display
    MOV BL,0            ;BL has ASCII code of null character( 0 = null)
 
    PRINTLOOP:
        CMP CX,0        ;if CX = 0 than jump to the END_
        JE END_
        CMP BL,COUNTER
        JE PRINTNEWLINE
        MOV AH,2
        MOV DL,BL
        INT 21H         ;instruction to display
        INC BL          ;increment BL ASCII code by 1
        DEC CX          ;decrement CX counter by 1
        JNZ PRINTLOOP   ;JNZ = Jump if not zero.if CX not zero than it's jump to the PRINTLOOP
     
    PRINTNEWLINE:
     
     
        MOV AH,2        ;
        MOV DL,0AH      ;
        INT 21H         ;  Printing NEWLINE
        MOV DL,0DH      ;
        INT 21H         ;
     
        ADD COUNTER,10  ;COUNTER incremented by 10
     
        JMP PRINTLOOP   ;without condition jump to the PRINTLOOP
 
    END_:
         
        MOV AH,4CH
        INT 21H
     
    MAIN ENDP
END MAIN
