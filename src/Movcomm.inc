;    move command

Movcomm macro dest,source 
 
   popf
    jle MovNTR                          
    jmp MovRTR                             
    MoVNTR: 
    mov ax,0                               ; move number to register
    mov ax,word ptr source
    mov bx,word ptr dest
    cmp ah,01h
    jae m16bitsourmov
    mov [bx],al 
    clc
    pushf   
    jmp endcode1
    m16bitsourmov:
    mov [bx],ax
    clc
    pushf   
    jmp endcode1
  

    MovRTR:  
    mov ax,0
    mov cx,0   
    mov bx,word ptr source                   ; move register to register
    mov ax,[bx]
    mov si,word ptr dest
   cmp sixtenbitck,1
    je m16bitsourRmov
    mov [si],al
    clc
    pushf
    jmp endcode1
   
    m16bitsourRmov:
    mov [si],ax
    clc
    pushf
    jmp endcode1
    
 endm Movcomm
    
