.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
 
 
    MOV AL,1h   ;     01h = 00000001b
                ;  OR 81h = 10000001b
    OR AL,81h   ;  ---------------------    THIS CODE WILL SET
                ;     81h = 10000001b                MSB AND LSB TO '1'
 
    MOV AH,2    ;
    MOV DL,AL   ;  PRINTING THE RESULT
    INT 21H     ;
 
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN