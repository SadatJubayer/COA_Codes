.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
 
 
    MOV AL,41H      ;       (A)  41h = 01000001b
    OR AL,20H       ;    OR(spa) 20h = 00100000b
                    ;   ---------------------------
                    ;       (a)  61H = 01100001b
 
    MOV AH,2        ;
    MOV DL,AL       ;  PRINTING THE LOWERCASE LETTER
    INT 21H         ;
                 
 
    MOV AH,4CH      ;
    INT 21H         ;
 
    MAIN ENDP
END MAIN