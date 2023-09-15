;takes a character,color and Number of times to repeat and displays it ex: cout 'g',5 -> gggg
Repcout macro char, N,color
pusha
mov ah,09 ;diplay option
mov bh,0 ;Page 0
mov al,char ;char ascii
mov cx,N ;repeat it N times
mov bl,color ;color
int 10h
popa
endm cout
;FOR MONOCHROME MONITORS ON 8086
;00 WHITE ON WHITE (NO DISP)
;07 WHITE ON BLACK (NORMAL)
;0F WHITE ON BLACK HIGHLIGHT
;87 WHITE ON BLACK BLINKING
;77 BLACK ON BLACK (NO DISP)
;70 BLACK ON WHITE
;F0 BLACK ON WHITE BLINKING