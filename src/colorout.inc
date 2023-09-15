;mohamed iraki
;18/12/2021
;take a character and color and displays them ex: colorout M 4
colorout macro char, colr
pusha
mov al,char
mov ah,3
mov bh,0
int 10h
mov ah,9
mov cx,1
mov bh,0
mov bl,colr
int 10h
add dl,1
setcur dl dh
popa
endm colorout
;0h->black
;1h->blue
;2h->green
;3h->cyan
;4h->red
;5h->magenta
;6h->brown
;7h->light gray
;8h->dark gray
;9h->light blue
;0Ah->light green
;0Bh->light cyan
;0Ch->light red
;0Dh->light magenta
;0Eh->yellow
;0Fh->white