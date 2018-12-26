.MODEL SMALL
.STACK 100H
.DATA
  STR1 DB 'DH = '
  VAL1 DB ?
  STR2 DB 0AH,0DH,'CF = '
  VAL2 DB ?
  FINISH DB '$'


.CODE
MAIN PROC
 
    MOV AX,@DATA
    MOV DS,AX
 
    MOV AL,8AH
    MOV CL,3    ;
    SHL AL,CL   ; LEFTSHIFTING THE VALUE 3 TIMES
    MOV VAL1,AL ;
 
    JC ONE      ; JUMP IF CARRY ISEQUAL 1
 
    MOV BL,'0'  ;
    MOV VAL2,BL ;SET BL TO 0 IF CARRY 0
    JMP END_    ;
 
    ONE:
        MOV BL,'1'    ;
        MOV VAL2,BL   ;SET BL TO 1 IF CARRY 1
        JMP END_      ;
 
     
    END_:
 
    MOV AH,9      ;
    LEA DX,STR1   ;PRINTING THE FINAL RESULT
    INT 21H       ;
 
    MOV AH,4CH
    INT 21H
 
    MAIN ENDP
END MAIN