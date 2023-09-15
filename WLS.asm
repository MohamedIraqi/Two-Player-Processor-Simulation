;mohamed iraki,Mail: mailg.mohammed@gmail.com
;3/2/2022
;prints the win screens
;EXTRN GameManager:far
include includes.inc  
;Public MainPage
.model small
.386
.data 
garbage      db '$$$$$$$$$$$$$$$$$$$$$'   
player1w0 db ' ',0ah,0dh
db '         \_/',0ah,0dh
db '        (* *)',0ah,0dh
db '       __)#(__',0ah,0dh
db '      ( )...( )(_)',0ah,0dh
db '      || |_| ||//',0ah,0dh
db '- ->==() | | ()/',0ah,0dh
db '       _(___)_',0ah,0dh
db '      [-]   [-]',0ah,0dh
db '        \|/                     \|/ ',0ah,0dh
db '        /|\                     /|\',0ah,0dh 
db '         __________________________',0ah,0dh 
db '          _',0ah,0dh                                   
db '         |_)| _.   _ ._  _ ._  _  \    /_ ._  ',0ah,0dh
db '         |  |(_|\/(/_|  (_)| |(/_  \/\/(_)| |',0ah,0dh 
db '                /                             ',0ah,0dh
db '                                    ',0ah,0dh
db '         __________________________',0ah,0dh 
db '                            ',0ah,0dh
db '        \|/             \|/',0ah,0dh 
db '        /|\             /|\',0ah,0dh 
db '$','$'
player2w     db '__________.__                              ________  ',0ah,0dh
db '\______   \  | _____  ___.__. ___________  \_____  \ ',0ah,0dh
db ' |     ___/  | \__  \<   |  |/ __ \_  __ \  /  ____/',0ah,0dh
db ' |    |   |  |__/ __ \\___  \  ___/|  | \/ /       \ ',0ah,0dh
db ' |____|   |____(____  / ____|\___  >__|    \_______ \',0ah,0dh
db '                    \/\/         \/                \/','$','$','$'                                                                                                                                                                                                                                                                                                                                                                                                                                              
                                                                                                                                                                                                                                                                                                                                                                                                                                                  
pp1Won db 1                                                                                                                                                                                                                                                                                                                                                                                                                                               
                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
pp2Won db 0                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
.code                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
winingscreen proc far                                                                                                                                                                                                                                                                                                                                                                                                                                                                        

mov ax , @data
mov ds , ax

videomode 12h
;Sets Sartingscreen
;textmode
setcur 0d , 0d           ;mov cursor


cmp [pp2Won] , 01h
je pla2won 


cmp [pp1Won] , 01h
jne drawwww

pla1won: 
   ; mov ah,0bh
;    mov bh,01h
;    mov bl,0ah
;    int 10h    
   ; setbackground 0ah
;lea bx , player1w0 
;coutstring bx
DrawStrColorOut player1w0 , 0ah
jmp ret22

pla2won:
 
cmp [pp1Won] , 01h
je drawwww

;lea bx , player2w
;coutstring bx
DrawStrColorOut player2w , 0bh
jmp ret22

drawwww:
cout 'D'
cout 0ah
cout 'R'
cout 'A'
cout 'W'
;_______________________ 
ret22:
waittime 02h ,0710h
ret     
winingscreen endp
end