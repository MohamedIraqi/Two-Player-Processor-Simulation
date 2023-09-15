   ; add command
   
   Addcomm macro dest,source
    
   popf
    jle ADDNTR                          
    jmp ADDRTR                             
    ADDNTR: 
    clc                                      ; Add number to register
    mov ax,0                               
    mov ax,word ptr source
    mov bx,word ptr dest

    Add [bx],ax
    pushf   
    jmp endcode1

    ADDRTR: 
    clc
    mov ax,0
    mov bx,word ptr source                   ; Add register to register
    mov ax,[bx]
    mov si,word ptr dest
    cmp sixtenbitck,1
    je m16bitsourRadd
   clc
    add [si],al
    pushf
    jmp endcode1

   m16bitsourRadd:
  clc
    Add [si],ax
    pushf
    jmp endcode1
    
   endm Addcomm