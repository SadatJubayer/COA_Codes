; print 80 stars in a row 

.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC
  
  MOV CX, 80 ; Number of stars
  
  ;OUTPUT FUNCTION 
  MOV AH,2
  MOV DL , "*" 
  
  ;CHECKING CX IS ZERO 0R NOT
  JCXZ EXIT
  
TOP: 
  INT 21H 
  LOOP TOP 
 

  EXIT:
    MOV AH, 4CH
    INT 21H   
    
    MAIN ENDP
END MAIN 