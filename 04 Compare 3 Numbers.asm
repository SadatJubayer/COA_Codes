.MODEL SMALL
.STACK 100H
.CODE 
MAIN PROC
    ; TAKING 3 NUMBERS AS INPUT 
    
    MOV AH,1
    INT 21H 
    MOV BL, AL
    INT 21H
    MOV BH, AL
    INT 21H
    MOV CL, AL
    
    ;COMPARE BL AND BH 
    
    CMP BL, BH 
    JGE L2  ; IF BL GREATER, THE WILL GO TO L2    
    
    ; // IF BL IS BIGGER
    L1: 
    CMP BH, CL   
    JGE L3   ; IF BH IS BIGGER, THEN  GO TO L3
    
    ; // IF CL IS BIGGGER PRINT CL 
    MOV AH, 2 
    MOV DL, CL 
    INT 21H  
    JMP EXIT 
    
    ; PRINT BH 
    L3:
    MOV AH,2 
    MOV DL, BH 
    INT 21H 
    JMP EXIT 
    
    
    
    ;// IF BL IS BIGGER
    L2:
    CMP BL, CL
    JGE L4 ; IF BL IS BIGGER, JUMP L4  
    
    ; IF CL IS BIGGER, PRINT CL 
    MOV AH,2 
    MOV DL, CL 
    INT 21H 
    JMP EXIT 
    
    L4:
    ; PRINT BL 
    MOV AH,2 
    MOV DL, BL 
    INT 21H 
    JMP EXIT
    
    EXIT: 
    MOV AH, 4CH 
    INT 21H
    
    MAIN ENDP 
END MAIN 
     
        
        
    
    
    
    
    
  
   EXIT:   
    MOV AH, 4CH 
    INT 21H
    
     
    
    
    
     
    MAIN ENDP 
END MAIN 


