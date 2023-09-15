     ; check addressing mode player 2
     
     
   checkaddrsourp2 macro source
lea bx,source

      mov ax , [BX]  
      cmp al , 5bh
      jne skip2
      lea bx,dummy1
      mov ax , [BX]  
      cmp al , ','
      jne destnotaddr
      mov ax , [BX+1] 
      cmp al , ']'
      je ERROR
      mov dummy1 , ']'
      mov bl , dummy1
      lea si , source
      checkERRORSOURp2:
      inc si
      mov ax , [si]
      cmp al , 24h
      jne checkERRORSOURp2
      dec si
      mov ax , [si]
      cmp al , bl          
      JnE ERROR
      
      lea si , reg23
      lea Di , source
      mov cx,4
      REPE CMPSB
      JE sourcp2Bx  
      lea si , reg51
      lea Di , source
      mov cx,4
      REPE CMPSB
      JE sourcp2Si
      lea si , reg61
      lea Di , source
      mov cx,4
      REPE CMPSB
      JE sourcp2Di
      jmp checknumberp2

    sourcp2BX:
      lea ax, P1DATA 
      mov bx,offset p1bx
      mov cx,[bx]
      add cx,ax
      mov word ptr source,cx    
      jmp continue
    sourcp2Si:
      lea ax, P1DATA 
      mov bx,offset p1bx
      mov cx,[bx]
      add cx,ax
      mov word ptr source,cx  
      jmp continue
    sourcp2Di:
      lea ax, P1DATA 
      lea bx , p1bx
      mov cx,[bx]
      add cx,ax
      mov word ptr source,cx  
      jmp continue  
     checknumberp2: 
      lea bx,source+1
      mov al,[bx] 
      sub al,30h
      mov [bx],al
      cmp al , 9h
      jg ERROR
     restp2:
      inc bx  
      mov ax , [BX] 
      cmp al , 5Dh
      je  numberaddressp2                         
      mov al,[bx] 
      sub al,30h
      mov [bx],al
      cmp al , 9h     
      jle restp2
      mov al,[bx] 
      sub al,27h
      mov [bx],al
      cmp al , 0Fh 
      jle restp2
      
      numberaddressp2: 
      mov cl,0
      mov [bx],cl
      lea bx,sour+1
      mov ax , [BX] 
      cmp al , 0
      jne contsourp2
      mov dl,[bx+1]
      mov [bx],dl
      mov [bx+1],cl
      contsourp2:
      lea bx,source+1
      mov dx,0
      mov dl,[bx]
      inc bx
      mov dh,[bx]
      mov ax,0
      lea ax,P1DATA     
      add dx,ax
      mov word ptr source,dx
      jmp continue
      
  endm  checkaddrsourp2  