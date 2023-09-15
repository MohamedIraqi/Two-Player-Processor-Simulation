;mohamed iraki
;18/12/2021
;clears the screan
clearscreen macro
pusha
mov ah,06  	;06 scroll 
mov al,00	;00 entire screen
mov bh,07 	;07 normal attribuite
mov cx,00    	;00 starting postion(row , columns)
mov dx,184FH 	;2479d end position (row , columns)
int 10h
popa
endm clearscreen