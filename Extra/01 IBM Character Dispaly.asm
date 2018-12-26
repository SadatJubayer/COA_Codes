; Program of All IBM Character Displaying 

.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC
    
    MOV AH,2       ; Display function
    MOV CX, 256    ; No of characters to display 
    MOV DL, 0      ; DL = 0
    
   PRINT_LOOP:
    INT 21H         ; Calling Display Function 
    INC DL          ; DL++
    DEC CX          ; CX-- 
    JNZ PRINT_LOOP  ; Jump if Not Zero (If CX is not 0, then Jump to PRINT_LOOP)
   
   MOV AH, 4CH      ; Exit function 
   INT 21H    
    
    MAIN ENDP
END MAIN 