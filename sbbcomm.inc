   ; subtract with borrow command
   
   sbbcomm macro dest,source
    
    popf
    jle SbbNTR                          
    jmp SbbRTR                             
    SbbNTR: 
                               ; subtract with borrow number to register
    mov ax,0 
    mov dx,0                              
    mov ax,word ptr source
    mov bx,word ptr dest
   cmp defineTurns,0
    je subp2cfn
    mov dx,p1cf
    jmp contsubn
    subp2cfn:
    mov dx,p2cf
    contsubn:
    clc
    Add [bx],dx
    sub [bx],ax
    pushf   
    jmp endcode1

    SbbRTR:
    mov ax,0
    mov dx,0   
    mov bx,word ptr source                  ; subtract with borrow register to register
    mov si,word ptr dest
    cmp defineTurns,0
     je subp2cfr
    mov dx,p1cf
     jmp contsubr
    subp2cfr:
    mov dx,p2cf
    contsubr:
   
    cmp sixtenbitck,1
    je m16bitsourRsbb
     clc
    ADD [si],dl                  
    mov ax,[bx]  
    sub [si],al
    pushf
    jmp endcode1
  m16bitsourRsbb:
    clc
    ADD [si],dx                  
    mov ax,[bx]  
    sub [si],ax
    pushf
    jmp endcode1
    
   endm sbbcomm


