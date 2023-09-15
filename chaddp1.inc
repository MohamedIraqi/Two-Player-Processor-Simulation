     ; check addressing mode player 1
     
     
   checkaddrdestp1 macro dest
lea bx,dest

      mov ax , [BX]
      cmp al , 5bh
      jne convTheregisterp1
      lea bx,dummy1 
      mov cx,','
      mov [bx],cx
       mov cx,']'
      mov [bx+1],cx
      lea si,dest
      mov cx,2
     checkERRORDESTp1:
      inc si 
      mov ax , [si]
      cmp al , 24h
      jne checkERRORDESTp1
      checksecbrackp1:
      dec si
      mov al,[bx]
      mov ax , [si]
      cmp al , al
      jne ERROR
      inc bx
      dec cx
      jnz checksecbrackp1
       

      lea si , reg23
      lea Di , dest
      mov cx , 5
      REPE CMPSB
      JE destip1Bx 
      lea si , reg51
      lea Di , dest
      mov cx , 5
      REPE CMPSB
      JE destip1Si
      lea si , reg61
      lea Di , dest
      mov cx , 5
      REPE CMPSB
      JE destip1Di
      jmp checkADDrnumberp1
    destip1BX:
      lea ax , P2DATA 
      lea bx , p2bx
      mov cx , [bx]
      add cx , ax
      mov word ptr dest,cx  
      jmp  checksour
    destip1Si:
      lea ax, P2DATA 
      lea bx , p2si
      mov cx,[bx]
      add cx,ax
      mov word ptr dest,cx   
      jmp  checksour
    destip1Di:
      lea ax , P2DATA 
      lea bx , p2di
      mov cx , [bx]
      add cx , ax
      mov word ptr dest,cx  
      jmp  checksour  
     checkADDrnumberp1: 
      lea bx , dest+1 
      mov ax,[bx] 
      sub al,30h
      mov [bx],al
      mov ax , [bx]
      cmp al , 9h
      jg ERROR
     ADDrnumberp1:
      inc bx  
      mov ax , [bx]
      cmp al , 5Dh
      je  destnumberaddressp1                        
      mov al,[bx] 
      sub al,30h
      mov [bx],al
      cmp al , 9h     
      jle ADDrnumberp1
      mov al,[bx] 
      sub al,27h
      mov [bx],al
      cmp al , 0Fh 
      jle ADDrnumberp1
      
      destnumberaddressp1:
      mov cx,0
      mov [bx] ,cx
      lea bx , dest+1
      mov ax , [bx]
      cmp al , 0
      jne contdestp1
      mov dl , [bx+1]
      mov [bx] , dl
      mov [bx+1] , cx
       contdestp1:

      lea bx , dest+1
      mov dx , 0
      mov dl , [bx]
      inc bx
      mov dh , [bx]
      mov ax , 0
      lea ax , P2DATA     
      add dx , ax
      mov word ptr dest,dx
      jmp checksour
      
  endm  checkaddrdestp1  