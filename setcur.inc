;sets cursour at given x ,y locations
setcur macro x, y
pusha
mov bh,0
mov dl,x
mov dh,y
mov ah,2h
int 10h
popa
endm setcur