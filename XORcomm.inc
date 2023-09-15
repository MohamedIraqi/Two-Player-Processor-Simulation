;   XOR command

XORcomm macro dest,source 
 
   popf
    jle MovNTR                          
    jmp MovRTR                             
    XORNTR: 
    CLC
    mov ax,0                               ; XOR number to register
    mov ax,word ptr source
    mov bx,word ptr dest
    XOR [bx],ax
    pushf   
    jmp endcode1
  

    XORRTR: 
    mov ax,0 
    mov bx,word ptr source                   ; XOR register to register
    mov ax,[bx]
    mov si,word ptr dest
    cmp sixtenbitck,1
    je m16bitsourRxor
clc
    XOR [si],al
    pushf
    jmp endcode1
  m16bitsourRxor:
clc
    XOR [si],ax
    pushf
    jmp endcode1
    
 endm XORcomm
    
