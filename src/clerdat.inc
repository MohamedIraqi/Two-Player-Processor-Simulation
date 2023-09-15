          ;refresh data every turn


      cleardata macro 
	Local newdatainnew
	Local newcommand
	Local newsource
	Local newdest
	Local newplayer1comm
	Local newplayer2comm
        mov cl,'$'
      lea bx,datainnew
      newdatainnew:
            
      mov [bx],cl
      inc bx
      cmp [bx],cl
      jne  newdatainnew
    lea bx,command
      newcommand:      
      mov [bx],cl
      inc bx
      cmp [bx],cl
      jne  newcommand

      lea bx,source
      newsource:      
      mov [bx],cl
      inc bx
      cmp [bx],cl
      jne  newsource 
     
      lea bx,dest
      newdest:
      mov [bx],cl
      inc bx
      cmp [bx],cl
      jne  newdest
      
      lea bx,P1Command
       newplayer1comm:
      mov [bx],cl
      inc bx
      cmp [bx],cl
      jne  newplayer1comm

      lea bx,P2Command
      newplayer2comm:
      
      mov [bx],cl
      inc bx
      cmp [bx],cl
      jne  newplayer2comm


     endm cleardata