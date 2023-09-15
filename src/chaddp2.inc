     ; check addressing mode player 2
     
     
   checkaddrdestp2 macro dest
      lea bx,dest
      mov al,[bx]
      cmp al,5bh
      jne convTheregisterp2
      lea bx,dummy1
      mov cl,','
      mov [bx],cl
      mov cl,']'
      mov [bx+1],cl
      lea si,dest
      mov cx,2
     checkERRORDESTp2:
      inc si 
      mov al,[si]
      cmp al,24h
      jne checkERRORDESTp2
      checksecbrackp2:
      dec si     
      mov al,[bx]
      mov ah,[si]
      cmp ah,al
      jne ERROR
      inc bx
      dec cx
      jnz checksecbrackp2
       
      lea si , reg23
      lea Di , dest
      mov cx,5
      REPE CMPSB
      JE destip2Bx  
      lea si , reg51
      lea Di , dest
      mov cx,5
      REPE CMPSB
      JE destip2Si
      lea si , reg61
      lea Di , dest
      mov cx , 5
      REPE CMPSB
      JE destip2Di
      jmp checkADDrnumberp2
    destip2BX:
      lea ax, P1DATA 
      lea bx, p1bx
      mov cx,[bx]
      add cx,ax
      mov word ptr dest,cx  
      jmp  checksour
    destip2Si:
      lea ax, P1DATA 
       lea bx, p1si
      mov cx,[bx]
      add cx,ax
      mov word ptr dest,cx   
      jmp  checksour
    destip2Di:
      lea ax, P1DATA 
      lea bx, p1di
      mov cx,[bx]
      add cx,ax
      mov word ptr dest,cx  
      jmp  checksour  
     checkADDrnumberp2: 
      lea bx,dest+1 
      mov al,[bx] 
      sub al,30h
      mov [bx],al
      cmp al,9h
      jg ERROR
     ADDrnumberp2:
      inc bx 
      mov al,[bx]
      cmp al,5Dh
      je  destnumberaddressp2                        
      mov al,[bx] 
      sub al,30h
      mov [bx],al 
      cmp al,9h     
      jle ADDrnumberp2
      mov al,[bx] 
      sub al,27h
      mov [bx],al
      cmp al,0Fh 
      jle ADDrnumberp2
      
      destnumberaddressp2:
      mov cl,0
      mov [bx],cl
      lea bx,dest+1 
      mov [bx],al
      cmp al,0
      jne contdestp2
      mov dl,[bx+1]
      mov [bx],dl 
      mov [bx+1],cl
       contdestp2:

      lea bx,dest+1
      mov dx,0
      mov dl,[bx]
      inc bx
      mov dh,[bx]
      mov ax,0
      lea ax,P1DATA     
      add dx,ax
      mov word ptr dest,dx
      jmp checksour
      
  endm  checkaddrdestp1  