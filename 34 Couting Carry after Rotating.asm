.model small
.stack 100h
.data
.code
main proc 
    mov cl,8
    xor al,al
    mov bl,11001011b
    
    top:
       ror bl,1
       jc next
       
       cmp cl,0
       je end
       loop top 
       
       next:
        cmp cl,0
        je end
        inc al
    
        loop top
        
        end: 
        mov ah,2
        add ax,48
        mov dx,ax
        int 21h 