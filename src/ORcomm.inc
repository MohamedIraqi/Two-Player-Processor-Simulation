;    OR command

ORcomm macro dest,source 
 
   popf
    jle ORNTR                          
    jmp ORRTR                             
    ORNTR: 
    clc
    mov ax,0                               ; OR number with register
    mov ax,word ptr source
    mov bx,word ptr dest
    OR [bx],ax
    pushf   
    jmp endcode1
  

    ORRTR: 

    mov ax,0
    mov cx,0   
    mov bx,word ptr source                   ; OR register with register
    mov ax,[bx]
    mov si,word ptr dest
    
    cmp sixtenbitck,1
    je m16bitsourRor
    clc
    OR [si],al
    pushf
    jmp endcode1
   m16bitsourRor:
    clc
    OR [si],ax
    pushf
    jmp endcode1
    
 endm ORcomm
    
