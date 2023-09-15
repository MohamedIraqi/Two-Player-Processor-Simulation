;mohamed iraki,Mail: mailg.mohammed@gmail.com
;18/12/2021
;Reads a 2 digit-number and puts it in the mermory location des,ex des db ?
readnumber2digit macro des
pusha
cinchar
sub al,30h
mov bl,0ah
mul bl
mov bh,al
cinchar
sub al,30h
add al,bh
mov des,al
popa
endm readnumber2digit