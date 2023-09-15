;22/12/2021
;take a color changes background color ex: setBackground 04h
SettextBackground macro color
pusha
mov ah,06  	;06 scroll 
mov al,00	;00 entire screen
mov bh,color 	;higher for the foreground and lower for the back ground
mov cx,00    	;00 starting postion(row , columns)
mov dx,184FH 	;2479d end position (row , columns)
int 10h
popa
endm SettextBackground
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