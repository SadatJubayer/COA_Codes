.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
 
    MOV AL,86h   ;      86h = 10000110b
                 ;  AND 7Fh = 01111111b
    AND AL,7Fh   ;  ---------------------    THIS CODE WILL CLEAR
                 ;      06H = 00000110b                  THE SIGN BIT '1' TO '0'
 
    MOV AH,2     ;
    MOV DL,AL    ;  PRINTING THE RESULT
    INT 21H      ;
 
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN