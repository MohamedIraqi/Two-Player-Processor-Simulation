;mainpage
include Data.inc 
include Notify.inc 
include pagedat.inc
errormesssss   db  'error pls try again $'
Gameaccept     db  00,'$'
Gameinvitmes   db  'You have got a Game invitation press Y to accept and N to reject','$'
Gameinvitsent  db  'Game invitation Sent','$'
;________________________________________________
;drawgui
garbage db 'g'
myCounter db '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
myResOut  db  '0','0','0','0','$' 
pointsmes db  'points:','$','$','$','$','$','$','$','$','$','$' 
CmdMes    db  'Your command$$'
EnemyCmdMes db  'Enemy command$$'
chatline1   db  'this is your message $$'
chatline2   db  'this is the other players message$$'
Res       db  0

;_____________________________________________
;gamepageZero

plap1mes	db '__________.__                               ____ ',0ah,0dh
db '\______   \  | _____  ___.__. ___________  /_   |',0ah,0dh
db ' |     ___/  | \__  \<   |  |/ __ \_  __ \  |   |',0ah,0dh
db ' |    |   |  |__/ __ \\___  \  ___/|  | \/  |   |',0ah,0dh
db ' |____|   |____(____  / ____|\___  >__|     |___|',0ah,0dh
db '                    \/\/         \/','$','$'                                                                                              
                                                                                                                                            

plap2mes	db '__________.__                              ________  ',0ah,0dh
db '\______   \  | _____  ___.__. ___________  \_____  \ ',0ah,0dh
db ' |     ___/  | \__  \<   |  |/ __ \_  __ \  /  ____/',0ah,0dh
db ' |    |   |  |__/ __ \\___  \  ___/|  | \/ /       \ ',0ah,0dh
db ' |____|   |____(____  / ____|\___  >__|    \_______ \',0ah,0dh
db '                    \/\/         \/                \/','$','$'                                                                                                                                                                                                                                                                                       
                                                                      
                                                                                                                                                                                                    
                                                      
namemes         db  'name:', '$'      ;'please enter your name:$'
ipoints         db  'points:', '$'    ;'please Enter your suggested initial points:$$$'
forbcharmes     db  'forbChar:', '$'  ;'please Enter the forbidden Character$$'

;________________________________________________
;minigame

refresh db '________________________________________________________________________________$$$$$$$$$$$'
TargetColors db 01h, 0Ch, 0Eh, 0Bh, 02h
TargetScores db 1d, 2d, 4d, 8d, 16d
Seed dw ?
P1PaddleStartX db 17d
P1PaddleStartY db 12d
P1PaddleEndX db 19d
P1PaddleEndY db 12d
P2PaddleStartX db 60d
P2PaddleStartY db 12d
P2PaddleEndX db 62d
P2PaddleEndY db 12d
TargetX db 0d
TargetY db 0d
TargetDirection db 0d
TargetColor db 0d
P1BulletX db 80d
P1BulletY db 0d
P2BulletX db 80d
P2BulletY db 0d
LeftBoundary db 6d
LeftMiddleBoundary db 38d
RightMiddleBoundary db 42d
RightBoundary db 72d
TopBoundary db 8d
BottomBoundary db 14d
;__________________________________________________________________________
;level Page

mes                 db  'For level 1 press (1),For level 2 press (2) :$$$$$$'

errorLvlpg          db  'Error please enter Valid Level Num$'

confirmation        db  'Chosen level is $$$'

forbcharmeslvlpg    db  'Player 1 Forbidden char is: $'
forbcharmeslvlpg2   db  'Player 2 Forbidden char is: $'

level               db  00h

;____________________________________________________________________________
;checkWL

D_msg   db  'DRAW$$$$'

P1G_msg  db ' ',0ah,0dh
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
P2G_msg  db ' ',0ah,0dh
db '       ()=()',0ah,0dh
db '       (^;^)',0ah,0dh
db '       c   c',0ah,0dh
db '       ()_()',0ah,0dh
db '       (*.___.*)',0ah,0dh
db '       _ { + } _',0ah,0dh
db '     ()__|>o<|__()',0ah,0dh
db '        (  .  )',0ah,0dh
db '      (_)     (_)',0ah,0dh;ismail dbdob
db '   ___ _                         ____  ',0ah,0dh
db '  / _ \ | __ _ _   _  ___ _ __  |___ \ ',0ah,0dh
db ' / /_)/ |/ _` | | | |/ _ \ ___|   __) |',0ah,0dh
db '/ ___/| | (_| | |_| |  __/ |     / __/',0ah,0dh
db '\/    |_|\__,_|\__, |\___|_|    |_____|',0ah,0dh
db '               |___/ ',0ah,0dh
db  0ah,0dh,'$'

WL	 db  0
;__________________________________________________________________________
dolar db '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
khalid db 'Khaled$$'
;____________________________________________________________________________
;abed ;islam
;comms
command Db 5 DUP('$')
dest Db 6 DUP('$')
source Db 6 DUP('$') 
dummy1 db 2 dup('$') 
datainnew db 30 dup('$')
forbiddencharnew  db  4 dup('$') 
defineTurns db 00h    
eightbitck  db 00h
sixtenbitck db 00h 
addrornot   db 00
instructions DB 'i','n','c','d','e','c','m','u','l','d','i','v','n','o','p','c','l','c'
Registers    DW 'ax','al','ah'   
             DW 'cx','cl','ch'
             DW 'dx','dl','dh'
             DW 'bl','bh','bx'
             DW 'si'
             DW 'di'
             DW 'sp'
             DW 'bp'
;_______________________________________________________________________________
;;abed constants
comm1 Db 'mov ' 
comm2 Db 'add '
comm3 Db 'adc '
comm4 Db 'sub '
comm5 Db 'sbb '
comm6 Db 'xor '
comm7 Db 'and '
comm8 Db 'or '
comm9 Db 'shl '
comm10 Db 'shr ' 
comm11 Db 'inc '
comm12 Db 'dec '
comm13 Db 'mul '
comm14 db 'div '
comm15 Db 'nop '
comm16 Db 'clc '
reg1 Db 'ax,$$'
reg11 Db 'al,$$'
reg12 Db 'ah,$$' 
reg2 Db 'bx,$$'
reg21 Db 'bl,$$'
reg22 Db 'bh,$$'
reg23 Db '[bx],' 
reg3 Db 'cx,$$'
reg31 Db 'cl,$$'
reg32 Db 'ch,$$' 
reg4 Db 'dx,$$'
reg41 Db 'dl,$$'
reg42 Db 'dh,$$'
reg5 Db 'si,$$' 
reg51 Db '[si],'
reg6 Db 'di,$$'  
reg61 Db '[di],' 
reg7 Db 'sp,$$' 
reg8 Db 'bp,$$'
errorcode db 'ERROR! you lost a point and your turn' ,'$'
errorforb db 'ERROR! you entered a forbidden character' ,'$'
;___
sendbyteee db ? 