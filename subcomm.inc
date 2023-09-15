   ; subtract command
   
   subcomm macro dest,source
    
   popf
    jle subNTR                          
    jmp subRTR                             
    subNTR: 
    clc                                     ; subtract number to register
    mov ax,0                               
    mov ax,word ptr source
    mov bx,word ptr dest
    sub [bx],ax
    pushf   
    jmp endcode1

    SubRTR: 

    mov ax,0
    mov bx,word ptr source                   ; subtract register to register
    mov ax,[bx]
    mov si,word ptr dest
    cmp sixtenbitck,1
    je m16bitsourRsub
clc
    sub [si],al
    pushf
    jmp endcode1

   m16bitsourRsub:
clc
    sub [si],ax
    pushf
    jmp endcode1
    
   endm subcomm