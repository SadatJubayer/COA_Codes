; 8. write a program to dispaly a '?', read two capital letters and display them on the next line  in alphabetical order 

.MODEL SMALL
.STACK 100H  
.DATA

PROMPT DB '? $'
RESULT DB 0DH, 0AH,'Letters in Alphabetical order $'  

.CODE 
MAIN PROC
    
    ; initializing DATA
    MOV AX, @DATA
    MOV DS, AX    
    
    MOV AH, 9
    LEA DX, PROMPT      ;Showing prompt
    INT 21H
     
  
    MOV AH, 1 
    INT 21H 
    MOV BL, AL 
                                  ; TAKING TWO INPUT AND STORING THEN ON BL AND CL 
    MOV AH, 1
    INT 21H
    MOV CL, AL
    
    CMP BL, CL     ; COMPARING BL AND CL  
    JNGE PRINT_CL  ; JUMP IF NOT GREATER OR EQUAL
    CMP CL, BL     ; COMPARING CL AND BL 
    JGE PRINT_BL 
    
PRINT_BL: 
    MOV AH, 9           ; showing the result line
    LEA DX, RESULT
    INT 21H 
    
    MOV AH, 2
    MOV DL, CL          ; Here we got CL as greater than BL, so printing BL first and then CL 
    INT 21H 
    MOV DL, BL
    INT 21H  
    JMP EXIT 
        
PRINT_CL: 
    MOV AH, 9
    LEA DX, RESULT      ; showing the result line
    INT 21H 
    
    MOV AH, 2
    MOV DL, BL          ; Here we got CL as lower than BL, so printing CL first and then BL 
    INT 21H 
    MOV DL, CL
    INT 21H


    
EXIT:    
    MOV AH, 4CH
    INT 21H                 ; EXIT FUNCTION
    
    MAIN ENDP
END MAIN 