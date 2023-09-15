;mohamed iraki
;30/12/2021
;take a x,y,n and color and displays virtical line on n line from x,y down
;DrawVline x, y, n, color
DrawVline macro x, y, n, color
Local Athererer
pusha
mov cx,n
mov bl,y
Athererer:
setcur x,bl
colorout 0b3h,color  ;draw vline
inc bx
dec cx
cmp cx,0
jne Athererer
popa
endm DrawVline
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