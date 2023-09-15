;    SHL command

SHLcomm macro dest,source 
 
   popf
    jle SHLNTR                          
    jmp SHLRTR                             
    SHLNTR: 
    clc
    mov cx,0                             ; SHL number WITH register
    mov cx,word ptr source
    mov bx,word ptr dest
    mov al,[bx]
    SHL al,cl 
    mov [bx],al
    pushf   
    jmp endcode1
  

    SHLRTR: 
    CLC
    mov cx,0   
    mov bx,word ptr source                   ; SHL register WITH register
    mov si,word ptr dest
    mov cx,[bx]
    mov al,[si]
    SHL al,cl 
    mov [si],al
    pushf   
    jmp endcode1
    
 endm SHLcomm
    
