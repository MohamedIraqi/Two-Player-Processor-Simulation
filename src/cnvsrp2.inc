;convert source from ascii to the memory registers for p2

convsourp2 macro source
    
mov si ,offset reg1
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcAXp2
     mov si ,offset reg11
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcAlp2
     mov si ,offset reg12
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcAhp2         
     mov si ,offset reg2
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcBXp2
     mov si ,offset reg21
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcBlp2
     mov si ,offset reg22
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcBhp2
     mov si ,offset reg3
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcCXp2
     mov si ,offset reg31
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcClp2
     mov si ,offset reg32
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcChp2
     mov si ,offset reg4
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcDXp2
     mov si ,offset reg41
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcDlp2
     mov si ,offset reg42
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcDhp2
     mov si, offset reg5
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcSip2
     mov si ,offset reg6
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcDip2
     mov si ,offset reg7
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcspp2
     mov si ,offset reg8
     mov Di, offset source
     mov cx,2
     REPE CMPSB
     JE sourcbpp2               
     mov cl,source
     cmp cl,24h  
     je continue           
     jmp ERROR

    sourcAXp2:
    mov word ptr source,offset p1Ax
      cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue 
    sourcAlp2:

    mov word ptr source,offset p1Al
   mov sixtenbitck,0
  cmp addrornot,0
  je continue 
  cmp eightbitck,0
    je ERROR
    jmp continue 
    sourcAhp2:
    mov word ptr source,offset p1Ah
    mov sixtenbitck,0
  cmp addrornot,0
  je continue 
  cmp eightbitck,0
    je ERROR
    jmp continue    
    sourcBXp2:
    mov word ptr source,offset p1Bx
      cmp eightbitck,1
    je ERROR
   mov sixtenbitck,1
    jmp continue 
    sourcBlp2:
    mov word ptr source,offset p1Bl
   mov sixtenbitck,0
  cmp addrornot,0
  je continue 
  cmp eightbitck,0
    je ERROR
    jmp continue 
    sourcBhp2:

    mov word ptr source,offset p1Bh
   mov sixtenbitck,0
  cmp addrornot,0
  je continue 
  cmp eightbitck,0
    je ERROR
    jmp continue    
    sourcCXp2:
    mov word ptr source,offset p1Cx
     cmp eightbitck,1
    je ERROR
     mov sixtenbitck,1
    jmp continue
    sourcClp2:
 
    mov word ptr source,offset p1Cl
   mov sixtenbitck,0
  cmp addrornot,0
  je continue 
  cmp eightbitck,0
    je ERROR
    jmp continue
    sourcChp2:
 
    mov word ptr source,offset p1Ch
    mov sixtenbitck,0
  cmp addrornot,0
  je continue 
  cmp eightbitck,0
    je ERROR
    jmp continue       
    sourcDXp2:
    mov word ptr source,offset p1Dx
      cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue
    sourcDlp2:
 
    mov word ptr source,offset p1Dl
    mov sixtenbitck,0
  cmp addrornot,0
  je continue 
  cmp eightbitck,0
    je ERROR
    jmp continue
    sourcDhp2:
 
    mov word ptr source,offset p1Dh
    mov sixtenbitck,0
  cmp addrornot,0
  je continue 
  cmp eightbitck,0
    je ERROR
    jmp continue
    sourcSip2:
    mov word ptr source,offset p1Si
      cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue
    sourcDip2:
    mov word ptr source,offset p1Di
      cmp eightbitck,1
    je ERROR
   mov sixtenbitck,1
    jmp continue    
    sourcSpp2:
    mov word ptr source,offset p1Sp
     cmp eightbitck,1
    je ERROR
    mov sixtenbitck,1
    jmp continue
    sourcBpp2:
    mov word ptr source,offset p1Bp
     cmp eightbitck,1
    je ERROR
     mov sixtenbitck,1
    jmp continue 
endm convsourp2   