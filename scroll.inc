;mohamed iraki
;18/12/2021
;colors the screan number of lines(pages), with color(color), from(start), to(end)
scroll macro pages, color, start, end
pusha
mov ah,06  	;06 scrolldown(07 for up) 
mov al,pages	;00 entire screen
mov bh,color 	;07 normal attribuite
mov cx,start   	;00 starting postion(row , columns)
mov dx,end 	;2479d end position (row , columns)
int 10h
popa
endm scroll
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