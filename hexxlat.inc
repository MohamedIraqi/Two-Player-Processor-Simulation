;mohamed iraki
;27/12/2021
;take a word of number for ex and split it to digits translates it then puts result in des
;numxlat src,des,table
Hexxlat macro src,des,table
pusha 
mov dx,0
lea si,src      ;source
mov ax,[si]
mov BX,1000H
div BX
lea bx,table    ;table
xlat
mov des,AL      ;des
mov AX,DX	;return the rest to the ax

mov dx,0
mov BX,100H
div BX 
push dx		;34an lea bt8yr el dx for some reason
lea bx,table    ;table 
xlat
mov des+1,AL    ;des
pop dx
mov al,dl	;return rest to ax


mov dx,0
mov BX,10H
div BX 
push dx 	;34an lea bt8yr el dx for some reason
lea bx,table    ;table 
xlat
mov des+2,AL    ;des
pop dx
mov al,dl


mov dx,ax
lea bx,table    ;table 
xlat
mov des+3,AL    ;des

          
popa 
endm Hexxlat