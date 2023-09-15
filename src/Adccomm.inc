            ; add with carry command
   
   Adccomm macro dest,source
    
       
   popf
    jle ADCNTR                          
    jmp ADCRTR                             
    ADCNTR:                          ; Adc number to register
    mov ax,word ptr source
    mov bx,word ptr dest
    cmp defineTurns,0
    je addp2cfn
    Add ax,p1cf
   jmp contaddingn
   addp2cfn:
    Add ax,p2cf
    contaddingn:
    clc
    Add [bx],ax
    pushf   
    jmp endcode1

    ADCRTR:
    mov ax,0
    mov dx,0                                       ; AdC register to register
    mov bx,word ptr source 
    mov si,word ptr dest
    cmp defineTurns,0
    je addp2cfr 
    mov dx,p1cf
     jmp contaddingr
    addp2cfr:
    mov dx,p2cf
  contaddingr:

    cmp sixtenbitck,1
    je m16bitsourRadc
       clc
    ADD [bx],dl                   
    mov ax,[bx]  
    Add [si],al
    pushf
    jmp endcode1
   
   m16bitsourRadc:
       clc
    ADD [bx],dx                  
    mov ax,[bx]  
    Add [si],ax
    pushf
    jmp endcode1
    
    
   endm Adccomm