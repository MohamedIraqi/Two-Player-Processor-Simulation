;    SHR command

SHRcomm macro dest,source 
 
   popf
    jle SHRNTR                          
    jmp SHRRTR                             
    SHRNTR: 
    clc
    mov cx,0                             ; SHR number WITH register
    mov cx,word ptr source
    mov bx,word ptr dest
    mov al,[bx]
    SHR al,cl 
    mov [bx],al
    pushf   
    jmp endcode1

  

    SHRRTR: 
    CLC
    mov cx,0   
    mov bx,word ptr source                   ; SHR register WITH register
    mov si,word ptr dest
   mov cx,[bx]
    mov al,[si]
    SHR al,cl 
    mov [si],al
    pushf
    jmp endcode1
    
 endm SHRcomm
    
