; Printing ASCII characters serially form AL and BL

.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC

    MOV AH,2  ; OUTPUT FUNCTION 
    
    CMP AL, BL  ; AL <= BL
    JNBE ELSE_   ; Jump if not bellow or equal 
   
    ; IF BELLOW OR EQUAL 
    MOV DL, AL
    JMP DISPLAY 
   
 ELSE_: 
     MOV DL, BL 
     JMP DISPLAY
     
 DISPLAY: 
    INT 21H 
   
  EXIT:
    MOV AH, 4CH
    INT 21H   
    
    MAIN ENDP
END MAIN 