;takes a character and displays it ex: cout 'g'
cout macro char
pusha
mov ah,2
mov dl,char
int 21h
popa
endm cout