
setcur 75d,11d           ;mov cursor
mov cx,10H             ;set initial conditions 
mov dh,11d
lea DI,P2DATA
mov bl,[DI]
player2DataOut:

cout 0b3h 

pusha;print index 
sub dh,11d
mov al,dh
lea bx,mycounter
xlat 
colorout al,1h 
popa
 
cout 0b3h

pusha;print first digit
mov al,bl
lea bx,mycounter
xlat 
colorout al,5h;1h 
popa 
;colorout bl,1h

inc DI
mov bl,[DI]

pusha;print 2nd digit 
mov al,bl
lea bx,mycounter
xlat 
colorout al,5h;1h 
popa 
;colorout bl,1h

inc DI
mov bl,[DI]
   

inc dh
setcur 75d,dh
clc       
dec cx
cmp cx,0
jne player2DataOut