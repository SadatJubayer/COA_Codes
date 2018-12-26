.MODEL SMALL
.STACK 100H
.DATA
MSG_1 DB 0AH,0DH,'ENTER A CHARACTER :$'  
MSG_2 DB 0AH,0DH,'THE CORRESPONDING ASCII  DIGIT :$' 
MSG_3 DB 0AH,0DH,'TYPE A CHARACTER  :$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG_1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H 
    
    XOR BX,BX
    MOV BL,AL
    
    LEA DX,MSG_2
    MOV AH,9
    INT 21H
    
    MOV BH,BH
    MOV CX,2
    MOV AH,2
    
    
    OUTPUT:
       
       SHL BL,1
       JNC ZERO
       INC BH
       MOV DL,41H 
       JMP DISPLAY
       
       ZERO:
        MOV DL,35H
        
        DISPLAY:
          INT 21H 
          LOOP OUTPUT
          
          
          LEA DX,MSG_3
          MOV AH,9
          INT 21H
          
          OR BH,35H
      
                 
          MOV AH,4CH
          INT 21H
          
          MAIN ENDP
END MAIN