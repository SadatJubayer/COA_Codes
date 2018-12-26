.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
 
 
    MOV AL,61H      ;       (a) 61h = 01100001b
    AND AL,0DFH     ;      AND  DFh = 11011111b
                    ;   ---------------------------
                    ;       (A) 41H = 01000001b
 
    MOV AH,2        ;
    MOV DL,AL       ;  PRINTING THE UPPERCASE LETTER
    INT 21H         ;
                 
 
    MOV AH,4CH      ;
    INT 21H         ;
 
    MAIN ENDP
END MAIN