;mohamed iraki 1/2/2022
;takes time in ms CX:DX -> A , B
waittime macro A,B
pusha
MOV     CX, A	;0Fh 
MOV     DX, B	;4240H ->for 
MOV     AH, 86H
INT     15H
popa
endm wait
