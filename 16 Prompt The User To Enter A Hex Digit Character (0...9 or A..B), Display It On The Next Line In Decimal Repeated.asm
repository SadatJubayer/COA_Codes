.MODEL SMALL
.STACK 100H
.DATA
    FPROMPT DB 0AH,0DH,'ENTER A HEX DIGIT: $'
    INPUTVAL DB ?
    ONE DB 0AH,0DH,'1$'
    MSG DB 0AH,0DH,'SO YOU WANT TO DO IT AGAIN? $'
    IL DB 0AH,0DH,'ILLEGAL CHARACTER-ENTER 0..9 OR A..F: $'
 
.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     TOP:
         MOV AH,9
         LEA DX,FPROMPT
         INT 21H
       
         MOV AH,1
         INT 21H
         MOV INPUTVAL,AL
   
         CMP AL,30H
         JNGE CHARACTER
         CMP AL,39H
         JNLE CHARACTER
       
         MOV AH,2
         MOV DL,0AH
         INT 21H
         MOV DL,0DH
         INT 21H
         MOV DL,INPUTVAL
         INT 21H
       
         MOV AH,9
         LEA DX,MSG
         INT 21H
       
         MOV AH,1
         INT 21H
     
         CMP AL,'Y'
         JE TOP
     
         CMP AL,'y'
         JE TOP
     
         JMP END_
       
     LOOP TOP  
   
     CHARACTER:
        MOV BL,INPUTVAL
     
        CMP BL,'A'
        JNGE ILLIGAL
        CMP BL,'F'
        JNLE ILLIGAL
     
        SUB BL,11H
        MOV AH,9
        LEA DX,ONE
        INT 21H
     
        MOV AH,2
        MOV DL,BL
        INT 21H
   
        MOV AH,9
        LEA DX,MSG
        INT 21H
     
        MOV AH,1
        INT 21H
     
        CMP AL,'Y'
        JE TOP
     
        CMP AL,'y'
        JE TOP
     
        JMP END_
     
    ILLIGAL:
        MOV AH,9
        LEA DX,IL
        INT 21H
     
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
     
        JMP TOP
     
    END_:
 
    MOV AH,4CH
    INT 21H
     
    MAIN ENDP
END MAIN