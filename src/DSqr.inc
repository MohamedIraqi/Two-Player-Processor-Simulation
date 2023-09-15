;mohamed iraki
;30/12/2021
;take a x,y,L,W and color and displays a rectangle with l for height and w for width, x,y of the bottom right corner
;DrawRec x, y, L, W, color
DrawRec macro x, y, L, W, color
pusha
setcur x,y			;06h,13h
colorout   0c0h,color;0eh 	;L

mov al,x
inc al
mov dl,w
sub dl,2d

DrawHline al, y, dl, color	;_______________;repcout 0c4h,W,color ;border

add al,dl

setcur al, y			;16h,13h
colorout 0D9h,color; _|

mov ah,y
sub ah,L

DrawVline x, ah, L, color	 ;x,(y-l)

mov al,x
add al,w
dec al

DrawVline al, ah, L, color

mov ah,y
sub ah,L

setcur x, ah
colorout   0DAh, color

mov al,x
inc al
mov dl,w
sub dl,1d

DrawHline al, ah, dl, color

mov al,x
add al,w
dec al

setcur al,ah
colorout 0BFh,color		; _|
popa
endm DrawRec
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