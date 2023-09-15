;mohamed iraki,Mail: mailg.mohammed@gmail.com
;18/12/2021
;takes offset of the string from memory and displays it
coutstring macro mes 
pusha
;add mes,2AFh
mov ah,9
mov dx,mes
int 21h
popa
ENDM coutstring