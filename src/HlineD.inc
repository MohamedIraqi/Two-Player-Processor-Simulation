;mohamed iraki
;30/12/2021
;take a x,y,n and color and displays horizontal line on n line from x,y down
;DrawHline x, y, n, color
DrawHline macro x, y, n, color
Local Athererer
pusha
mov bl,x
mov cl,n
Athererer:
setcur bl,y
colorout 0c4h,color  ;draw vline
inc bx
dec cx
cmp cx,0
jne Athererer
popa
endm DrawHline
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