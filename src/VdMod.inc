;mohamed iraki
;18/12/2021
;Sets Graphical mode
;mode 03h for text 16 colors : text mode 80x25
;mode 04h for graphics 4 colors : graphics mode 320x200
;mode 06h"high res" for graphics 1 color : graphics mode 640x200
VideoMode macro mode
pusha
mov ah,00
mov al,mode
int 10h
popa
endm VideoMode