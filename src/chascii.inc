;mohamed iraki,Mail: mailg.mohammed@gmail.com
;18/12/2021
;takes number and changes it to ascii and puts it in des,des is a location in memory
chascii macro num, des
pusha
mov ax,num
mov bl,100
div bl
mov des,al
add des,30h
mov al,ah
mov ah,0

mov bl,10
div bl
mov des+1,al
add des+1,30h
mov al,ah

mov des+2,al
add des+2,30h

popa
endm chascii