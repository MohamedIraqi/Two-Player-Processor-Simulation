;20/12/2021
;take a color changes background color ex: setBackground 04h
setBackground macro color
pusha
    mov ah,0bh
    mov bh,00h
    mov bl,color
    int 10h
popa
endm setBackground
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