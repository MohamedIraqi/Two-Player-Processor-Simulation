;    AND command

Andcomm macro dest,source 
 
   popf
    jle AndNTR                          
    jmp AndRTR                             
    AndNTR: 
    mov ax,0                               ; AND number to register
    mov ax,word ptr source
    mov bx,word ptr dest
    cmp sixtenbitck,1
    jae m16bitsourAnd
    clc
    AND [bx],al 
    pushf   
    jmp endcode1
    m16bitsourAnd:
    clc
    AND [bx],ax
    pushf   
    jmp endcode1
  

    AndRTR: 

    mov ax,0
    mov cx,0   
    mov bx,word ptr source                   ; AND register to register
    mov ax,[bx]
    mov si,word ptr dest
    cmp sixtenbitck,1
    jae m16bitsourRAnd
     clc
     Add [si],al 
    pushf   
    jmp endcode1
    m16bitsourRAnd:
     clc
    Add [si],ax
    pushf
    jmp endcode1
    
 endm Movcomm
    
