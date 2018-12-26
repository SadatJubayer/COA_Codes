; Write a program to display the extended ASCII characters (ASCII codes 80h to FFh). Display 10 characters per line, separated by blanks. Stop after the extended characters have been displayed once.

.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC
  
  MOV BL, 80H     ; BL = 80H
  MOV CL, 0       ; CL = 0

  TOP:
    CMP CL, 10          ; if CL = 10 print a new line 
    JE NEW_LINE
    
    INC CL 
    MOV AH,2
    MOV DL, BL           ; CL++, BL ++ and print the BL 
    INT 21H 
    INC BL
    
    CMP BL, 0FFH 
    JE EXIT              ; if BL = 0FFh then exit 
    
    JMP TOP              ; else jump to top level 
    
 NEW_LINE:
    MOV AH,2
    MOV DL, 0AH
    INT 21H              ; Printing new line
    MOV DL, 0DH
    INT 21H
    
    MOV CL, 0 
    JMP TOP              ; CL = 0 and jump to top

  EXIT:
    MOV AH, 4CH
    INT 21H   
    
    MAIN ENDP
END MAIN 