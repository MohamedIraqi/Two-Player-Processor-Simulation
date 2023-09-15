;mohamed iraki
;22/12/2021
;choses page

Pagenum macro num

pusha
mov ah,05
mov al,num
int 10h
popa

endm Pagenum