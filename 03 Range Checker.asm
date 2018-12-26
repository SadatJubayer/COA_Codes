.MODEL SMALL
.STACK 100H 
.DATA 
MSG1 DB 'ENTER A NUMBER $'
MSG2 DB '       IN RANGE $'
MSG3 DB '       OUT OF RANGE $'

.CODE 
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX 
    
    ; MSG1 PRINT 
    MOV AH, 9
    LEA DX, MSG1
    INT 21H
    
    MOV AH,1 
    INT 21H
    MOV BL, AL 
    SUB BL, 48
     
    ; COMPARE WITH 4, IF GREATER THEN SEND TO MSG LEVEL 2 
    CMP BL, 4 
    JGE L2 
    
    L1: 
        MOV AH, 9
        LEA DX, MSG3 
        INT 21H
        JMP EXIT 
     
    L2: 
        CMP BL, 7
        JNG L3 ; JUMP IF LESS THAN OF EQUAL 
        JMP L1 
    L3: 
        MOV AH,9
        LEA DX, MSG2
        INT 21H
        
        
    EXIT: 
        MOV AH, 4CH 
        INT 21H
    
     
    MAIN ENDP
END MAIN 
