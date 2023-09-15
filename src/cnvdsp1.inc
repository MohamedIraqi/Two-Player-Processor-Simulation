;convert destination from ascii to the memory registers for p1


convdestp1 macro dest
     mov addrornot,1
     mov si ,offset reg1
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desAXp1 
     mov si ,offset reg11
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desAlp1
     mov si ,offset reg12
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desAhp1        
     mov si ,offset reg2
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desBXp1
     mov si ,offset reg21
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desBlp1
     mov si ,offset reg22
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desBhp1
     mov si ,offset reg3
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desCXp1
     mov si ,offset reg31
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desClp1
     mov si ,offset reg32
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desChp1
     mov si ,offset reg4
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desDXp1
     mov si ,offset reg41
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desDlp1
     mov si ,offset reg42
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desDhp1
     mov si, offset reg5
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desSip1
     mov si ,offset reg6
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desDip1
     mov si ,offset reg7
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desspp1
     mov si ,offset reg8
     mov Di, offset dest
     mov cx,2
     REPE CMPSB
     JE desbpp1               
    jmp ERROR
    desAXp1:
    mov word ptr dest,offset p2Ax 
        mov eightbitck,0h 
    jmp checksour  
    desAlp1:
    mov word ptr dest,offset p2Al
      mov eightbitck,1h
    jmp checksour 
    desAhp1:
    mov word ptr dest,offset p2Ah
       mov eightbitck,1h
    jmp checksour   
     desBXp1:
    mov word ptr dest,offset p2Bx
         mov eightbitck,0h 
    jmp checksour 
    desBlp1:
    mov word ptr dest,offset p2Bl
    mov eightbitck,1h
    jmp checksour 
    desBhp1:
    mov word ptr dest,offset p2Bh
       mov eightbitck,1h
    jmp checksour  
     desCXp1:
    mov word ptr dest,offset p2Cx
         mov eightbitck,0h 
    jmp checksour 
    desClp1:
    mov word ptr dest,offset p2Cl
      mov eightbitck,1h
    jmp checksour
    desChp1:
    mov word ptr dest,offset p2Ch
     mov eightbitck,1h
    jmp checksour   
     desDXp1:
    mov word ptr dest,offset p2Dx
        mov eightbitck,0h 
    jmp checksour
    desDlp1:
    mov word ptr dest,offset p2Dl
     mov eightbitck,1h
    jmp checksour
    desDhp1:
    mov word ptr dest,offset p2Dh
     mov eightbitck,1h
    jmp checksour
     desSip1:
    mov word ptr dest,offset p2Si
          mov eightbitck,0h 
    jmp checksour
     desDip1:
    mov word ptr dest,offset p2Di
        mov eightbitck,0h 
    jmp checksour
     desSpp1:
    mov word ptr dest,offset p2Sp
          mov eightbitck,0h 
    jmp checksour
     desBpp1:
    mov word ptr dest,offset p2Bp
           mov eightbitck,0h 
    jmp checksour
endm convdestp1