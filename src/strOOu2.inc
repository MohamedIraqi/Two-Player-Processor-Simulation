;mohamed Iraqi
;6-1-2022
;outs string with color using int 10 and macro colorout
;StrColorOut str, color
DrawStrColorOut macro str, color
local whilehere , Outtahere, spenter2, spenter
pusha
mov al,0
lea si , str
whilehere:
cmp bl, 0dh
JE spenter2
cmp bl, 0ah
JE spenter
colorout [si] , color 
inc si
mov bx,[si]
cmp bl, '$'
JnE whilehere
spenter:
setcur 0, al
inc al
spenter2:
inc si
mov bx,[si]
cmp bl, '$'
jnE whilehere

Outtahere:popa
endm DrawStrColorOut
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