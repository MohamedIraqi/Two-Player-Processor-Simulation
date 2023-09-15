
setcur 0h,11d           ;mov cursor
mov cx,10H             ;set initial conditions 
mov dh,11d
lea DI,P1Data
mov bl,[DI]
player1DataOut:

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
cout 0b3h   

pusha;print index 
sub dh,11d
mov al,dh
lea bx,mycounter
xlat 
colorout al,1h 
popa 
cout 0b3h 
inc dh
setcur 0d,dh
clc       
dec cx
cmp cx,0
jne player1DataOut  

;outline
setcur 75d,10d
cout 0dah
cout 0c4h
cout 0c2h
cout 0c4h
cout 0c4h 
;___________________________________________________
