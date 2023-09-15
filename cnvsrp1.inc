;convert source from ascii to the memory registers for p1

convsourp1 macro source
    
     lea si , reg1
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcAXp1 
     lea si , reg11
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcAlp1
     lea si , reg12
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcAhp1         
     lea si , reg2
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcBXp1
     lea si , reg21
     lea Di , source
     mov cx,2
     REPE CMPSB
     JE sourcBlp1
     lea si , reg22
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcBhp1
     lea si , reg3
     lea Di , source
     mov cx,2
     REPE CMPSB
     JE sourcCXp1
     lea si , reg31
     lea Di , source
     mov cx,2
     REPE CMPSB
     JE sourcClp1
     lea si , reg32
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcChp1
     lea si , reg4
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcDXp1
     lea si , reg41
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcDlp1
     lea si , reg42
     lea Di , source
     mov cx,2
     REPE CMPSB
     JE sourcDhp1
     lea si,  reg5
     lea Di,  source
     mov cx,2
     REPE CMPSB
     JE sourcSip1
     lea si , reg6
     lea Di , source
     mov cx,2
     REPE CMPSB
     JE sourcDip1
     lea si , reg7
     lea Di , source
     mov cx,2
     REPE CMPSB
     JE sourcspp1
     lea si , reg8
     lea Di , source
     mov cx,2
     REPE CMPSB
     JE sourcbpp1 
     mov cl,source
     cmp cl,24h  
     je continue           
     jmp ERROR
    sourcAXp1:
    lea ax, p2Ax 
    mov word ptr source,ax
    cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue
   
        
    sourcAlp1:  
    lea ax, p2Al  
    mov word ptr source,ax
    mov sixtenbitck,0
    cmp addrornot,0
    je continue 
    cmp eightbitck,0
    je ERROR
    jmp continue 
    sourcAhp1:
    lea ax, p2Ah 
    mov word ptr source,ax
    mov sixtenbitck,0
    cmp addrornot,0
    je continue 
    cmp eightbitck,0
    je ERROR
    jmp continue    
    sourcBXp1:
    lea ax, p2Bx
    mov word ptr source,ax
    cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue 
    sourcBlp1:
    lea ax, p2Bl
    mov word ptr source,ax
    mov sixtenbitck,0
    cmp addrornot,0
    je continue
    cmp eightbitck,0
    je ERROR
    jmp continue 
    sourcBhp1:
    lea ax, p2Bh
    mov word ptr source,ax
    mov sixtenbitck,0
    cmp addrornot,0
    je continue 
    cmp eightbitck,0
    je ERROR
    jmp continue    
    sourcCXp1:
    lea ax, p2Cx
    mov word ptr source,ax
    cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue
    sourcClp1:
    lea ax, p2Cl
    mov word ptr source,ax
    mov sixtenbitck,0
    cmp addrornot,0
    je continue 
    cmp eightbitck,0
    je ERROR
    jmp continue
    sourcChp1:
    lea ax, p2Ch
    mov word ptr source,ax
    mov sixtenbitck,0
    cmp addrornot,0
    je continue 
    cmp eightbitck,0
    je ERROR
    jmp continue       
    sourcDXp1:
    lea ax, p2Dx
    mov word ptr source,ax
    cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue
    sourcDlp1:
    lea ax, p2Dl
    mov word ptr source,ax
    mov sixtenbitck,0
    cmp addrornot,0
    je continue 
    cmp eightbitck,0
    je ERROR
    jmp continue
    sourcDhp1:

    lea ax, p2Dh
    mov word ptr source,ax
    mov sixtenbitck,0
    cmp addrornot,0
    je continue 
    cmp eightbitck,0
    je ERROR
    jmp continue
    sourcSip1:
    lea ax, p2Si
    mov word ptr source,ax
     cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue
    sourcDip1:
    lea ax, p2Di
    mov word ptr source,ax
    cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue    
    sourcSpp1:
    lea ax, p2Sp
    mov word ptr source,ax
    cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue
    sourcBpp1:
    lea ax, p2Bp 
    mov word ptr source,ax
    cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue 
endm convsourp1   