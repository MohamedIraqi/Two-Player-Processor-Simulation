;convert destination from ascii to the memory registers for p2


convdestp2 macro dest
     mov addrornot,1
     mov si ,offset reg1
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desAXp2 
     mov si ,offset reg11
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desAlp2
     mov si ,offset reg12
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desAhp2        
     mov si ,offset reg2
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desBXp2
     mov si ,offset reg21
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desBlp2
     mov si ,offset reg22
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desBhp2
     mov si ,offset reg3
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desCXp2
     mov si ,offset reg31
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desClp2
     mov si ,offset reg32
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desChp2
     mov si ,offset reg4
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desDXp2
     mov si ,offset reg41
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desDlp2
     mov si ,offset reg42
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desDhp2
     mov si, offset reg5
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desSip2
     mov si ,offset reg6
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desDip2
     mov si ,offset reg7
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desspp2
     mov si ,offset reg8
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desbpp2               
    jmp ERROR
    desAXp2:
    mov word ptr dest,offset p1Ax  
     mov eightbitck,0 
    jmp checksour  
    desAlp2:
    mov word ptr dest,offset p1Al
     mov eightbitck,1h
    jmp checksour 
    desAhp2:
    mov word ptr dest,offset p1Ah
      mov eightbitck,1h
    jmp checksour   
     desBXp2:
    mov word ptr dest,offset p1Bx 
        mov eightbitck,0 
    jmp checksour 
    desBlp2:
    mov word ptr dest,offset p1Bl
      mov eightbitck,1h
    jmp checksour 
    desBhp2:
    mov word ptr dest,offset p1Bh
    mov eightbitck,1h
    jmp checksour  
     desCXp2:
    mov word ptr dest,offset p1Cx
     mov eightbitck,0
    jmp checksour 
    desClp2:
    mov word ptr dest,offset p1Cl
      mov eightbitck,1h
    jmp checksour
    desChp2:
    mov word ptr dest,offset p1Ch
     mov eightbitck,1h
    jmp checksour   
     desDXp2:
    mov word ptr dest,offset p1Dx
       mov eightbitck,0
    jmp checksour
    desDlp2:
    mov word ptr dest,offset p1Dl
     mov eightbitck,1h
    jmp checksour
    desDhp2:
    mov word ptr dest,offset p1Dh
     mov eightbitck,1h
    jmp checksour
     desSip2:
    mov word ptr dest,offset p1Si
      mov eightbitck,0
    jmp checksour
     desDip2:
    mov word ptr dest,offset p1Di
     mov eightbitck,0
    jmp checksour
     desSpp2:
    mov word ptr dest,offset p1Sp
      mov eightbitck,0
    jmp checksour
     desBpp2:
    mov word ptr dest,offset p1Bp
    mov eightbitck,0
    jmp checksour
endm convdestp2