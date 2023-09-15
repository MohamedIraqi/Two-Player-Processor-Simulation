;mohamed Iraqi
;28-12-2021
;outs string with color using int 10 and macro colorout
;StrColorOut str, color
StrColorOut macro str, color
local whilehere , Outtahere
pusha
lea si , str
whilehere:
colorout [si] , color 
inc si
mov bx,[si]
cmp bl, 0dh
JE outtahere
cmp bl, '$'
JnE whilehere
Outtahere:popa
endm StrColroOut
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