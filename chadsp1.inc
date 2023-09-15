     ; check addressing mode player 1
     
     
   checkaddrsourp1 macro source
     lea bx,source
      mov ax , [bx]
      cmp al , 5bh
      jne skip1
      lea bx,dummy1
      mov ax , [bx]
      cmp al , ','
      jne destnotaddr
      mov ax , [bx+1]
      cmp al , ']'
      je ERROR
      destnotaddr:
      mov dummy1,']'
      mov bl,dummy1
      lea si,source
      checkERRORSOURp1:
      inc si  
      mov ax , [si]
      cmp al,24h
      jne checkERRORSOURp1
      dec si
      mov ax , [si]
      cmp al , bl             
      JnE ERROR
      
      lea si , reg23
      lea Di , source
      mov cx,4
      REPE CMPSB
      JE sourcp1Bx  
      lea si , reg51
      lea Di , source
      mov cx , 4
      REPE CMPSB
      JE sourcp1Si
      lea si , reg61
      lea Di , source
      mov cx , 4
      REPE CMPSB
      JE sourcp1Di
      jmp checknumberp1
    sourcp1BX:
      lea ax , P2DATA 
      lea bx , p2bx
      mov cx , [bx]
      add cx , ax
      mov word ptr source,cx    
      jmp continue
    sourcp1Si:
      lea ax , P2DATA 
      lea bx , p2bx
      mov cx,[bx]
      add cx,ax
      mov word ptr source,cx  
      jmp continue
    sourcp1Di:
      lea ax , P2DATA 
      lea bx , p2bx
      mov cx , [bx]
      add cx , ax
      mov word ptr source,cx  
      jmp continue  
     checknumberp1: 
      lea bx,source+1 
      mov al,[bx] 
      sub al,30h
      mov [bx],al
      mov ax , [bx]
      cmp al , 9h
      jg ERROR
     restp1:
      inc bx 
      mov ax , [bx]
      cmp al , 5Dh
      je  numberaddressp1                         
      mov al,[bx] 
      sub al,30h
      mov [bx],al
      mov ax , [bx]
      cmp al , 9h     
      jle restp1
      mov al,[bx] 
      sub al,27h
      mov [bx],al
      mov ax , [bx]
      cmp al , 0Fh 
      jle restp1
      
      numberaddressp1: 
      mov cl,0
      mov [bx],cl
      lea bx,sour+1
      mov ax , [bx]
      cmp al , 0
      jne contsourp1
      mov dl,[bx+1]
      mov [bx],dl
      mov [bx+1],cl
      contsourp1:
      lea bx , source+1
      mov dx , 0
      mov dl , [bx]
      inc bx   
      mov dh , [bx]
      mov ax , 0
      lea ax , P2DATA     
      add dx , ax
      mov word ptr source,dx
      jmp continue
      
  endm  checkaddrsourp1  