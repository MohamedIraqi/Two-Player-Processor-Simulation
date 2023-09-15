;mohamed iraki ;edited:Ismail
;1/1/2022      :1/1/2022
;takes a des and puts string int it ex: cin player1name
cin macro des
pusha
mov AH , 0Ah
lea DX , des
int 21h 
popa
endm cin