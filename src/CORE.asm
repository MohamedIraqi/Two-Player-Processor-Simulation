;mohamed iraki,Mail: mailg.mohammed@gmail.com
;2/1/2022
;prints everything
include includes.inc
.model small
.386
.stack 300
.data  
org 2AFh
include BigData.inc

.code    
main proc far
    mov ax,@data        
    mov ds,ax
    mov es,ax
    
    mov ax, 0000h ;Get Randomizer Seed as sytem time
    int 1Ah
    mov Seed, dx

    mainnn:    
    call MainPage
    jmp mainnn   
endp Main    

;________________________________________________________________         
;Ismail+Iraki

GameManager proc far

     
call GamePageZero
call levelpage
   
    ;calc the points
    mov ax , p1point
    cmp ax , p2point
    ja p2pointOver
    p1pointOver:     
    mov ax , p1point 
    mov p2point , ax  
    jmp pOutOver
    p2pointOver:
    mov ax , p2point
    mov p1point , ax
    pOutOver:

mainloopOFFLINE:
call drawGUI

 mov ah,1
 int 16h  
 mov cx,30
 cmp ah , 3Eh
 je chkwlout

;lea  si , dolar
;lea  di , p1command
;mov  cx , 20d
;rep  movsb
;
;lea  si , dolar
;lea  di , p2command
;mov  cx , 20d
;rep  movsb

cleardata
cmp defineTurns,0
je player1inputOFF
jmp player2inputOFF
 
 
player1inputOFF:
setcur  07h, 12h ;player1  
mov AH,0AH
lea dx, P1Command
int 21h
call P1PowerUps  
fixdatain  p1forbiddenchar,forbiddencharnew     
fixdatain  P1Command,datainnew
jmp continuexx
  
player2inputOFF:
setcur  8Ah, 12h ;player2
mov AH,0AH
lea dx, P2Command
int 21h
call P2PowerUps  
fixdatain  p2forbiddenchar,forbiddencharnew    
fixdatain  P2Command,datainnew    

continuexx:
call drawGUI


mov ax, 25173d  ;Generate Random number between 1 and 10000 using LCG
mul Seed
add ax, 13849d
mov dx, 0000h
mov Seed, ax
mov bx,20d
div bx
inc dx    
cmp dx,10d       ;Spawn Target based on percentage

jg SkipMinigame

call minigame

SkipMinigame:

call updatedata 

jmp chkwl
chkwlout:
mov P1AX,105Eh
mov P2AX,105Eh
;cinchar
;loop chkwl
;cinchar
chkwl:
call checkWL
cmp [WL] , 1
je ggiZi

jmp mainloopOFFLINE

ggiZi:

ret                   
GameManager endp

;_________________________________________________
;Ismail+Iraki

MainPage proc far 
    
;Sets Sartingscreen
    VideoMode 12h           ;textmode
;    Pagenum 0h              ;page num 0
;    clearscreen             ;clearscreen
;    settextbackground 0Ah ;set background color
    setcur 1d,12d           ;mov cursor
;    lea bx,comF1
;    coutstring bx 
    StrColorOut comF1 , 0Ah
    
    setcur 1d,14d           ;mov cursor
;    lea bx,comF2
;    coutstring bx
    StrColorOut comF2 , 0Ah   
      
    setcur 1d,16d          ;mov cursor
;    lea bx,comESC
;    coutstring bx  
    StrColorOut comF3 , 0Ah
    
    setcur 1d,18d          ;mov cursor
;    lea bx,comESC
;    coutstring bx  
    StrColorOut comEsc , 0Ah
    
    setcur 0d,27d           ;mov cursor
;    lea bx,N0
;    coutstring bx
    StrColorOut N0 , 0Ah
    


    jmp getinput
    
gminvtsent: 
    setcur 0d,28d           ;mov cursor
    StrColorOut Gameinvitsent , 0Ah  
    jmp getinput
        
recievedGameinv:
    setcur 0d,28d           ;mov cursor
    StrColorOut Gameinvitmes , 0Ah 
    




    ;get input
getinput: 
    recbyte Gameaccept

    cmp [Gameaccept],11h
    je gmngron
    mov ah,1
    int 16h; ZF=1 no key waiting, ZF=0- ah=key scan code al=ascii char
    JZ getinput
    mov ah,0;gets the pressed key
    int 16h 
    

    cmp al,'y'
    je Yaccxx 
    
    cmp al,'Y'
    je Yaccxx
    
    cmp al,27d
    je mEsc
    
    cmp ah,59d
    je mF1    
    
    
    cmp ah,60d
    je mF2

    cmp ah,61d
    je mF3
    
    cmp [Gameaccept],10h
    je recievedGameinv 
    
    
    
    
    jmp getinput 
    
    setcur 0d,26d           ;mov cursor
    lea bx,errormesssss
    coutstring bx
    jmp getinput

    
    mf1:
    cout 'h'
    jmp getinput
    
    mF2:
    call GameManager
    jmp reto
    jmp getinput  
    
    mF3:
    mov [defineturns],0
    sendbyte 10h
    jmp gminvtsent
    
    Yaccxx: 
    mov [defineturns],1
    sendbyte 11h 
    add [Gameaccept],1h
    jmp getinput
    
    
    gmngron:
    call GameManagerOnline
    jmp reto
    
    Mesc:include ret2dos.inc
    
 
    
reto: ret
MainPage endp    

;_________________________________________________________________
;iraki
;2/2/2022 
                                                                  
GameManagerOnline proc far

include initio.inc
     
call GamePageZeroOnline
call levelpage
   
    ;calc the points
    mov ax , p1point
    cmp ax , p2point
    ja p2pointOveron
   ;p1pointOver:     
    mov ax , p1point 
    mov p2point , ax  
    jmp pOutOveron
    p2pointOveron:
    mov ax , p2point
    mov p1point , ax
    pOutOveron:

mainloopONLINE:
call drawGUI

 mov ah,1
 int 16h  
 mov cx,30
 cmp ah , 3Eh
 je chkwlouton

;lea  si , dolar
;lea  di , p1command
;mov  cx , 20d
;rep  movsb
;
;lea  si , dolar
;lea  di , p2command
;mov  cx , 20d
;rep  movsb

cmp defineturns ,1
je updata

cleardata
cmp defineTurns,0
je player1inputON
jmp player2inputON 
 
player1inputON:
setcur  07h, 12h ;player1  
mov AH,0AH
lea dx, P1Command
int 21h  
jmp continuezz
  
player2inputON:
setcur  8Ah, 12h ;player2
mov AH,0AH
lea dx, P2Command
int 21h     

continuezz:
call process
call drawGUI

updata:
;call updateData 

call drawGUI


mov ax, 25173d  ;Generate Random number between 1 and 10000 using LCG
mul Seed
add ax, 13849d
mov dx, 0000h
mov Seed, ax
mov bx,20d
div bx
inc dx    
cmp dx,10d       ;Spawn Target based on percentage

jg SkipMinigameonline

;call minigameonline
SkipMinigameonline:
;call updatedata 

jmp chkwlon
chkwlouton:
mov P1AX,105Eh
mov P2AX,105Eh
;cinchar
;loop chkwl
;cinchar
chkwlon:
call checkWL
cmp [WL] , 1
je ggiZion

jmp mainloopONLINE

ggiZion:

ret                   
GameManagerOnline endp

;_________________________________________________________________
levelpage proc far
 
cmp defineturns , 1
je ereto        

    VideoMode 12h           ;textmode
;    Pagenum 0h              ;page num 0
;    clearscreen             ;clearscreen
;    settextbackground 05h   ;set background color
    setcur 2d , 3d         ;mov cursor
;    lea bx , mes
;    coutstring bx   
    StrColorOut mes     , 1h
takein:
    cinchar                 ;take input 
    mov [level] , al
ereto:   
    cmp [level] , 31h       ;if level1 show forb chars
    je showforbchar
    
    cmp [level] , 32h       ;if level2 dont show frob chars
    je confirm
    
    setcur 2d,6d           ;mov cursor
;    lea bx , errormesssss   ;if num isnt 1 nor 2 show error
;    coutstring bx
    StrColorOut errormesssss , 1h
    jmp takein
    
showforbchar:
    setcur 2d,6d           ;mov cursor
;    lea bx , forbcharmeslvlpg
;    coutstring bx
    StrColorOut forbcharmeslvlpg , 0Ah
;    lea bx ,  p1forbiddenchar+2
;    coutstring bx
    StrColorOut p1forbiddenchar+2  , 0Ah 
    
    setcur 2d,7d          ;mov cursor
;    lea bx , forbcharmeslvlpg2
;    coutstring bx  
    StrColorOut forbcharmeslvlpg2 , 4h
    
;    lea bx ,  p2forbiddenchar+2
;    coutstring bx
    StrColorOut p2forbiddenchar+2 , 0Ch
    
confirm:    
    setcur 2d,9d           ;mov cursor
;    lea bx , confirmation
;    coutstring bx 
    StrColorOut confirmation , 1h       
    cout [level]
    
    waittime 27h , 10h    

    
    
    
ret                   
levelpage endp

;_________________________________________________________________
GamePageZero proc far          

VideoMode 12h           ;textmode 
;clearscreen             ;clearscreen
;settextbackground 0Ah   ;black back ground ligh green foreground
;_________________________________________________________________
;take input from player one
Setcur 0 , 0d   
DrawStrColorOut plap1mes     , 0ah

Setcur 0 , 7d   
StrColorOut namemes     , 2h
mov AH , 0Ah
lea DX , Player1Name
int 21h 

Setcur 0 , 9d 
StrColorOut ipoints     , 2h
mov AH , 0Ah
lea DX , p1pointmes
int 21h                

StringToWord p1pointmes, p1point
                        
Setcur 0 , 11d
StrColorOut forbcharmes , 2h              
mov AH , 0Ah
lea DX , p2forbiddenchar
int 21h 
;_________________________________________________________________
;take input from player two 
scroll 00, 00, 00, 2979d             ;clearscreen
;settextbackground 0ch   ;black back ground ligh green foreground
Setcur 0 , 0d
DrawStrColorOut plap2mes , 0ch   


Setcur 0 , 7d
StrColorOut namemes     , 4h 
mov AH , 0Ah
lea DX , Player2Name
int 21h 

Setcur 0 , 9d 
StrColorOut ipoints     , 4h
mov AH , 0Ah
lea DX , p2pointmes
int 21h                

StringToWord p2pointmes, p2point

Setcur 0 , 11d
StrColorOut forbcharmes , 4h              
mov AH , 0Ah
lea DX , p1forbiddenchar
int 21h 

ret                   
GamePageZero endp

;_______________________________________________________________________
;Mohamed Iraki

GamePageZeroOnline proc far        

VideoMode 12h            ;textmode 
;clearscreen             ;clearscreen
;settextbackground 0Ah   ;black back ground ligh green foreground
cmp defineturns,1
je pplyr2GamePageZero

pplyr1GamePageZero:
;_________________________________________________________________
;take input from player one
Setcur 0 , 0d   
DrawStrColorOut plap1mes     , 0ah

Setcur 0 , 7d   
StrColorOut namemes     , 2h
mov AH , 0Ah
lea DX , Player1Name
int 21h 

Setcur 0 , 9d 
StrColorOut ipoints     , 2h
mov AH , 0Ah
lea DX , p1pointmes
int 21h                

StringToWord p1pointmes, p1point
                        
Setcur 0 , 11d
StrColorOut forbcharmes , 2h              
mov AH , 0Ah
lea DX , p1forbiddenchar
int 21h 

sendda [Player1Name]
recVa  [Player2Name]

ret
   
pplyr2GamePageZero:
;_________________________________________________________________
;take input from player two 
scroll 00, 00, 00, 2979d             ;clearscreen
;settextbackground 0ch   ;black back ground ligh green foreground
Setcur 0 , 0d
DrawStrColorOut plap2mes , 0ch   


Setcur 0 , 7d
StrColorOut namemes     , 4h 
mov AH , 0Ah
lea DX , Player2Name
int 21h 

Setcur 0 , 9d 
StrColorOut ipoints     , 4h
mov AH , 0Ah
lea DX , p2pointmes
int 21h                

StringToWord p2pointmes, p2point

Setcur 0 , 11d
StrColorOut forbcharmes , 4h              
mov AH , 0Ah
lea DX , p2forbiddenchar
int 21h 

recVa  [Player1Name]
sendda [Player2Name]

ret                   
GamePageZeroOnline endp

;_______________________________________________________________________

checkWL proc far

;mov bx , p1AX
;cmp bx , p2AX
;je draw             
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;lea di , khalid
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;lea si , player1Name 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;repe cmpsb 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;je p1gg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;lea di , khalid
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;lea si , player2Name 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;repe cmpsb 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;je p2gg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp [p2AX] , 105EH
je p1gg


cmp [p1AX] , 105EH
je p2gg
jmp non

;draw:
;cmp [p1AX],105EH
;je draw2
;jmp non

draw2:

    VideoMode 12h           ;textmode
    ;Pagenum 0h              ;page num 0
    ;clearscreen             ;clearscreen
    ;settextbackground 0Fh   ;set background color
    setcur 40d , 12d        ;mov cursor
    lea bx , D_msg
    coutstring bx
    waittime 27h , 10h      
    mov [WL] , 1  
    waittime 27h , 10h     
    jmp non
                              
p1gg:   
      
    cmp [p1AX],105EH
    je draw2 
    
    VideoMode 12h           ;textmode
    ;Pagenum 0h              ;page num 0
    ;clearscreen             ;clearscreen
    ;settextbackground 0Ah   ;set background color
    setcur 40d , 12d        ;mov cursor
;    lea bx , P1G_msg
    ;coutstring bx
    DrawStrColorOut P1G_msg, 0Ah
    waittime 27h , 10h     
    mov [WL] , 1      
    waittime 27h , 10h     
    jmp non
    
p2gg:   

    VideoMode 12h           ;textmode
    ;Pagenum 0h              ;page num 0
    ;clearscreen             ;clearscreen
    ;settextbackground 0Ch   ;set background color
    setcur 40d , 12d         ;mov cursor
;    lea bx , P2G_msg
;    coutstring bx 
    DrawStrColorOut P2G_msg, 04h
    waittime 27h , 10h     
    mov [WL] , 1
    waittime 27h , 10h     
    jmp non
    
non:

ret        
           
endp checkWL

;_______________________________________________________________________       
DrawGui proc far 

;Sets Sartingscreen
VideoMode 12h           ;graphics mode
;Pagenum 0h              ;page num 0
;setBackground 00h       ;set Background color black
;
;outline
setcur 0h,10d
cout 0c4h
cout 0c4h
cout 0c2h
cout 0c4h 
cout 0bfh
;___________________________________________________
;outs player 1 data
include p1DOut.inc
;___________________________________________________
;outs player 2 data
include p2DOut.inc
;_____________________________________________________________________
;outline  
setcur 0d,27d
cout 0c4h 
cout 0c4h
cout 0c1h ;t m2lob
cout 0c4h
cout 0c1h ;t m2lob
repcout 0c4h,70,07h
setcur 75d,27d
cout 0c1h ;t m2lob
cout 0c4h
cout 0c1h ;t m2lob 
cout 0c4h
cout 0c4h
;_____________________________________________________________________     
;print player 1 registers content
setcur 06h,15h
colorout   0DAh,0eh
repcout 0c4h,15d,0eh ;border

RegOut 'A','X', 06h,16h ,P1Ax,myResout,mycounter 
RegOut 'B','X', 06h,17h ,P1Bx,myResOut,mycounter
RegOut 'C','X', 06h,18h ,P1Cx,myResOut,mycounter 
RegOut 'D','X', 06h,19h ,P1Dx,myResOut,mycounter 

RegOut 'S','I', 0Eh,16h ,P1SI,myResOut,mycounter 
RegOut 'D','I', 0Eh,17h ,P1DI,myResOut,mycounter 
RegOut 'S','P', 0Eh,18h ,P1SP,myResOut,mycounter 
RegOut 'B','P', 0Eh,19h ,P1BP,myResOut,mycounter

setcur 16h,15h
colorout   0BFh,0eh 
mov cx,4d
mov bl,16h
Athere:
setcur 16h,bl
colorout 0b3h,0eh  ;draw vline
inc bx
dec cx
cmp cx,0
jne Athere
setcur 16h,1Ah
colorout 0D9h,0eh

setcur 06h,1Ah
colorout   0c0h,0eh
repcout 0c4h,15d,0eh ;border
;_____________________________________________________________________     
;print player 2 registers content
setcur 89h,15h
colorout   0DAh,0eh
repcout 0c4h,15d,0eh ;border

RegOut 'A','X', 89h,16h ,P2Ax,myResout,mycounter 
RegOut 'B','X', 89h,17h ,P2Bx,myResOut,mycounter
RegOut 'C','X', 89h,18h ,P2Cx,myResOut,mycounter 
RegOut 'D','X', 89h,19h ,P2Dx,myResOut,mycounter 

RegOut 'S','I', 91h,16h ,P2SI,myResOut,mycounter 
RegOut 'D','I', 91h,17h ,P2DI,myResOut,mycounter 
RegOut 'S','P', 91h,18h ,P2SP,myResOut,mycounter 
RegOut 'B','P', 91h,19h ,P2BP,myResOut,mycounter

setcur 99h,15h
colorout   0BFh,0eh 
mov cx,4d
mov bl,16h
Athererer:
setcur 99h,bl
colorout 0b3h,0eh  ;draw vline
inc bx
dec cx
cmp cx,0
jne Athererer
setcur 99h,1Ah
colorout 0D9h,0eh

setcur 89h,1Ah
colorout   0c0h,0eh
repcout 0c4h,15d,0eh ;border  
;___________________________________________________________
;kan momken ytgm3 fe macro bs real hustla 3l fady
;___________________________________________________________
;names Out
;greem for the player 1,Red for player 2 
setcur 07h ,14h  
lea bx , player1Name+2
StrColorOut [bx],2h     


setcur 8ah ,14h 
lea bx , player2Name+2
StrColorOut [bx],4h 

;____________________________________________________________
;commands out

DrawRec 06h, 13h, 2d, 17d, 0eh
setcur  07h, 12h ;player1 
StrColorOut    CmdMes   , 0eh  

DrawRec 89h, 13h, 2d, 17d, 4h
setcur  8Ah, 12h ;player2
StrColorOut    CmdMes   , 04h 

;el commands ht5og mn el input
;____________________________________________________________
;split screen line
DrawVline 40, 0, 27, 0fh    
;____________________________________________________________
 
;power ups score  player 1
    ;blue   ;01h        
DrawRec 23d, 24d, 2d, 3d, 1h 
setcur 24d, 23d 
hexxlat [P1blue-1],Res,myCounter
colorout [Res+1], 1h  

    ;light red    ;0Ch         
DrawRec 27d, 24d, 2d, 3d, 0Ch 
setcur 28d, 23d 
hexxlat [P1red-1],Res,myCounter
colorout [Res+1], 0Ch    

    ;yellow ;0Eh
DrawRec 31d, 24d, 2d, 3d, 0Eh 
setcur 32d, 23d 
hexxlat [P1yellow-1],Res,myCounter
colorout [Res+1], 0Eh       
    
    ;Light cyan   ;0Bh 
DrawRec 35d, 24d, 2d, 3d, 0Bh 
setcur 36d, 23d 
hexxlat [P1cyan-1],Res,myCounter
colorout [Res+1], 0Bh            
    
    ;green  ;02h
DrawRec 35d, 21d, 2d, 3d, 2h 
setcur 36d, 20d 
hexxlat [P1green-1],Res,myCounter
colorout [Res+1], 2h   
;____________________________________________________________
;power ups score player 2
    ;blue   ;01h        
DrawRec 41d, 24d, 2d, 3d, 1h 
setcur 42d, 23d 
hexxlat [P2blue-1],Res,myCounter
colorout [Res+1], 1h  

    ;light red    ;0Ch         
DrawRec 45d, 24d, 2d, 3d, 0Ch 
setcur 46d, 23d 
hexxlat [P2red-1],Res,myCounter
colorout [Res+1], 0Ch    

    ;yellow ;0Eh
DrawRec 49d, 24d, 2d, 3d, 0Eh 
setcur 50d, 23d 
hexxlat [P2yellow-1],Res,myCounter
colorout [Res+1], 0Eh       
    
    ;Light cyan   ;0Bh 
DrawRec 53d, 24d, 2d, 3d, 0Bh 
setcur 54d, 23d 
hexxlat [P2cyan-1],Res,myCounter
colorout [Res+1], 0Bh            
    
    ;green  ;02h
DrawRec 41d, 21d, 2d, 3d, 2h 
setcur 42d, 20d 
hexxlat [P2green-1],Res,myCounter
colorout [Res+1], 2h 

;_______________________________________________________________
;chat 
;names Out
;greem for the player 1,Red for player 2 
setcur 1d , 28d 
lea bx , player1Name+2
StrColorOut [bx],2h ;player1Name     
cout ':'
lea bx , chatline1 
coutstring bx 

setcur 1d , 29d   
lea bx , player2Name+2
StrColorOut [bx] , 4h      ;player2name
cout ':' 
lea bx , chatline2 
coutstring bx
;_______________________________________________________________
;points
setcur 23d, 25d ;player1 
StrColorOut    pointsmes   , 0eh   
;numxlat p1point,Res,myCounter
;cout Res
Decxlat p1point, p1pointmes+2, myCounter
StrColorOut    p1pointmes+2   , 0eh 
 
setcur 41d, 25d ;player2 
StrColorOut    pointsmes   , 4h   
;numxlat p2point,Res,myCounter
;cout Res
Decxlat p2point, p2pointmes+2, myCounter  
StrColorOut    p2pointmes+2   , 4h 

;_______________________________________________________________



ret
    
DrawGui endp

;______________________________________________________________
;Ismail
  
Minigame proc far

jmp SpawnTarget
       
ControlPaddle:
         
mov al, 00h       ;wait for 100 milliseconds (186Ah:0000h)
mov ah, 86h
mov cx, 0000H
mov dx, 786AH
int 15h 
;waittime 00,786Ah

setcur 0h, 0h
StrColorOut refresh, 0h

mov cl, LeftBoundary
mov ch, 0d
mov dl, LeftMiddleBoundary
mov dh, BottomBoundary                          
scroll 00h, 00h, cx, dx

mov cl, RightMiddleBoundary
mov ch, 0d
mov dl, RightBoundary
mov dh, BottomBoundary                          
scroll 00h, 00h, cx, dx


mov cx,0000h
mov dx,0000h

cmp TargetDirection, 0d
je EndMinigame
    
call DetectP1Collision    ;collision calls
call DetectP2Collision  

call DrawP1Paddle  ;movment calls
call DrawP2Paddle
call DrawTarget
call DrawP1Bullet
call DrawP2Bullet



mov al, 00h     ;Get User Input based on scancodes
mov ah, 01h
int 16h
cmp ah, 10h
je ShootP1Bullet
cmp ah, 1Eh
je MoveP1PaddleLeft
cmp ah, 20h
je MoveP1PaddleRight
cmp ah, 1Fh
je MoveP1PaddleDown
cmp ah, 11h    
je MoveP1PaddleUp
cmp ah, 19h
je ShootP2Bullet
cmp ah, 25h
je MoveP2PaddleLeft
cmp ah, 27h
je MoveP2PaddleRight
cmp ah, 26h
je MoveP2PaddleDown
cmp ah, 18h    
je MoveP2PaddleUp
mov ah, 0Ch
int 21h
jmp ControlPaddle

SpawnTarget:       ;If no target already exists, Spawn a target, randomize spawn direction and color based on generated number 
cmp TargetDirection, 0d 
jne ControlPaddle

mov ax, dx
mov bl, 2d
div bl
add al,ah
mov ah,0h
dec ax
lea bx, TargetColors
add bx, ax
mov al,[bx]
mov TargetColor,al

and dx, 0001h
cmp dx,1d
je SpawnLeft
SpawnRight:
mov TargetDirection, 2d
mov TargetX, 79d
jmp ControlPaddle
SpawnLeft:
mov TargetDirection, 1d
mov TargetX, 0d
jmp ControlPaddle
                  
ShootP1Bullet:      ;If no bullet already exists, Spawn a bullet at paddle's midpoint (If paddle is not at top of screen)
mov ah, 0Ch
int 21h
cmp P1BulletX,80d
jne ControlPaddle
mov ah, P1PaddleStartY
cmp ah, 0d
jbe  ControlPaddle
sub ah, 1d
mov P1BulletY, ah
mov ah, 00h
mov al, P1PaddleEndX 
sub al, P1PaddleStartX
mov bh, 02h
div bh
mov ah, 00h
add al, P1PaddleStartX
mov P1BulletX, al 
jmp ControlPaddle

MoveP1PaddleLeft:  ;Move paddle left within bounds
mov ah, 0Ch
int 21h
mov al, P1PaddleStartX
cmp al, LeftBoundary
je ControlPaddle
dec P1PaddleStartX
dec P1PaddleEndX 
jmp ControlPaddle

MoveP1PaddleRight: ;Move paddle right within bounds
mov ah, 0Ch
int 21h
mov al, P1PaddleEndX
cmp al, LeftMiddleBoundary
je ControlPaddle
inc P1PaddleStartX
inc P1PaddleEndX 
jmp ControlPaddle

MoveP1PaddleDown:  ;Move paddle down within bounds
mov ah, 0Ch
int 21h
mov ah, P1PaddleEndY 
cmp ah, BottomBoundary
je ControlPaddle
inc P1PaddleStartY
inc P1PaddleEndY 
jmp ControlPaddle

MoveP1PaddleUp:    ;Move paddle up within bounds
mov ah, 0Ch
int 21h
mov ah, P1PaddleStartY
cmp ah, TopBoundary
je ControlPaddle
dec P1PaddleStartY
dec P1PaddleEndY 
jmp ControlPaddle

ShootP2Bullet:      ;If no bullet already exists, Spawn a bullet at paddle's midpoint (If paddle is not at top of screen)
mov ah, 0Ch
int 21h
cmp P2BulletX,80d
jne ControlPaddle
mov ah, P2PaddleStartY
cmp ah, 0d
jbe  ControlPaddle
sub ah, 1d
mov P2BulletY, ah
mov ah, 00h
mov al, P2PaddleEndX 
sub al, P2PaddleStartX
mov bh, 02h
div bh
mov ah, 00h
add al, P2PaddleStartX
mov P2BulletX, al 
jmp ControlPaddle

MoveP2PaddleLeft:  ;Move paddle left within bounds
mov ah, 0Ch
int 21h
mov al, P2PaddleStartX
cmp al, RightMiddleBoundary
je ControlPaddle
dec P2PaddleStartX
dec P2PaddleEndX 
jmp ControlPaddle

MoveP2PaddleRight: ;Move paddle right within bounds
mov ah, 0Ch
int 21h
mov al, P2PaddleEndX
cmp al, RightBoundary
je ControlPaddle
inc P2PaddleStartX
inc P2PaddleEndX 
jmp ControlPaddle

MoveP2PaddleDown:  ;Move paddle down within bounds
mov ah, 0Ch
int 21h
mov ah, P2PaddleEndY 
cmp ah, BottomBoundary
je ControlPaddle
inc P2PaddleStartY
inc P2PaddleEndY 
jmp ControlPaddle

MoveP2PaddleUp:    ;Move paddle up within bounds
mov ah, 0Ch
int 21h
mov ah, P2PaddleStartY
cmp ah, TopBoundary
je ControlPaddle
dec P2PaddleStartY
dec P2PaddleEndY 
jmp ControlPaddle

EndMinigame:
ret      
Minigame endp

DrawP1Paddle proc    ;Draw P1Paddle
    mov cx, 1d
    mov bh, 00h
    mov bl, 0Eh      ;p1 paddle color
    mov dh, P1PaddleStartY
    P1PaddleNextRow:
    mov dl, P1PaddleStartX
    P1PaddleFillRow:
    mov al, 00h
    mov ah, 02h
    int 10h
    mov al, 02d    ;p1 paddle shape
    mov ah, 09h
    int 10h
    inc dl
    cmp dl, P1PaddleEndX
    jbe P1PaddleFillRow
    inc dh
    cmp dh, P1PaddleEndY
    jbe P1PaddleNextRow
    ret
DrawP1Paddle endp

DrawP2Paddle proc    ;Draw P2Paddle
    mov cx, 1d
    mov bh, 00h
    mov bl, 05h      ;p2 paddle color
    mov dh, P2PaddleStartY
    P2PaddleNextRow:
    mov dl, P2PaddleStartX
    P2PaddleFillRow:
    mov al, 00h     
    mov ah, 02h
    int 10h
    mov al, 01d      ;p2 paddle shape
    mov ah, 09h
    int 10h
    inc dl
    cmp dl, P2PaddleEndX
    jbe P2PaddleFillRow
    inc dh
    cmp dh, P2PaddleEndY
    jbe P2PaddleNextRow
    ret
DrawP2Paddle endp

DrawTarget proc   ;Draw Target if it exists. The first time it hits a side of the screen, Bounce back. The Second time it hits a side of the screen, Destroy it.

    cmp TargetDirection, 0d     
    je DoneTarget   
    mov cx, 1d
    mov dh, TargetY
    mov dl, TargetX
    mov bh, 00h
    mov bl, TargetColor
    mov al, 219d
    mov ah, 02h
    int 10h
    mov ah, 09h
    int 10h
    
    mov ah, 0d
    mov al, TargetDirection
    mov bl, 4d
    div bl              
    
    cmp ah, 1d 
    je HeadingLeft
    cmp ah, 2d 
    je HeadingRight
    cmp ah, 3d
    je HeadingRight
    cmp ah, 4d
    je HeadingLeft
    
    HeadingLeft:
    inc TargetX    
    cmp TargetX, 79d
    je TargetHitWall
    jmp DoneTarget
    
    HeadingRight:
    dec TargetX 
    cmp TargetX, 0d
    je TargetHitWall
    jmp DoneTarget
       
    TargetHitWall:
    add TargetDirection, 2d
    cmp TargetDirection, 4d ;bounces = (n-2)/2
    ja DestroyTarget
    jmp DoneTarget
     
    DestroyTarget:
    mov TargetDirection, 0d
    mov TargetX, 0d   
    DoneTarget:
    ret
DrawTarget endp

DrawP1Bullet proc  ;Draw P1Bullet if it exists. if it reaches top of screen, destroy it
    cmp P1BulletX,80d     
    je DoneP1Bullet
    mov cx, 1d
    mov dh, P1BulletY
    mov dl, P1BulletX
    mov bh, 00h
    mov bl, 04h
    mov al, 21h  ;p1 bullet shape
    mov ah, 02h
    int 10h
    mov ah, 09h
    int 10h
    
    dec P1BulletY
    cmp P1BulletY,0d
    je DestroyP1Bullet
    jmp DoneP1Bullet    
    DestroyP1Bullet:
    mov P1BulletX,80d
    DoneP1Bullet:
    ret
DrawP1Bullet endp

DetectP1Collision proc  ;If P1bullet exists, compare X,Y to detect collision and destroy target and bullet
    cmp P1BulletX, 80d
    je P1NoCollision
    mov dl, P1BulletX
    mov dh, P1BulletY
    dec dh
    cmp dl, TargetX
    jne P1NoCollision
    cmp dh, TargetY
    jne P1NoCollision

    mov bx, offset TargetColors
    mov al, 0h
    mov ah, TargetColor
    P1NextColor:
    cmp ah, [bx]
    je P1AddPoints   
    inc bx
    inc al
    jmp P1NextColor
    
    P1AddPoints:
    mov ah,0h
    mov bx, offset P1Score
    add bx,ax
    inc Byte PTR [bx]
    mov bx, offset TargetScores
    xlat
    add P1Point,ax
    cout 07h
    
    mov TargetDirection, 0d
    mov TargetX, 0d 
    mov P1BulletX,80d
    mov P1BulletY,0d
    mov P2BulletX,80d
    mov P2BulletY,0d    
    P1NoCollision: 
    ret    
DetectP1Collision endp

DrawP2Bullet proc  ;Draw P2Bullet if it exists. if it reaches top of screen, destroy it
    cmp P2BulletX,80d     
    je DoneP2Bullet
    mov cx, 1d
    mov dh, P2BulletY
    mov dl, P2BulletX
    mov bh, 00h
    mov bl, 04h
    mov al, 21h  ;p1 bullet shape
    mov ah, 02h
    int 10h
    mov ah, 09h
    int 10h
    
    dec P2BulletY
    cmp P2BulletY,0d
    je DestroyP2Bullet
    jmp DoneP2Bullet    
    DestroyP2Bullet:
    mov P2BulletX,80d
    DoneP2Bullet:
    ret
DrawP2Bullet endp 

DetectP2Collision proc  ;If P2bullet exists, compare X,Y to detect collision and destroy target and bullet
    cmp P2BulletX, 80d
    je P2NoCollision
    mov dl, P2BulletX
    mov dh, P2BulletY
    dec dh
    cmp dl, TargetX
    jne P2NoCollision
    cmp dh, TargetY
    jne P2NoCollision
    
    mov bx, offset TargetColors
    mov al, 0h
    mov ah, TargetColor
    P2NextColor:
    cmp ah, [bx]
    je P2AddPoints   
    inc bx
    inc al
    jmp P2NextColor
    
    P2AddPoints:
    mov ah,0h
    mov bx, offset P2Score
    add bx,ax
    inc Byte PTR [bx]
    mov bx, offset TargetScores
    xlat
    add P2Point,ax
    cout 07h
    
    mov TargetDirection, 0d
    mov TargetX, 0d 
    mov P2BulletX,80d
    mov P2BulletY,0d
    mov P1BulletX,80d
    mov P1BulletY,0d    
    P2NoCollision: 
    ret    
DetectP2Collision endp   
 
;__________________________________________________________
;comms                                                     
;islam ;abed   

process proc far
  
cmp defineTurns,0
je player1fixd
jmp player2fixd
  
player1fixd: 
fixdatain  p1forbiddenchar,forbiddencharnew     
fixdatain  P1Command,datainnew
jmp continuefixd
  
player2fixd: 
fixdatain  p2forbiddenchar,forbiddencharnew    
fixdatain  P2Command,datainnew 
  
  continuefixd:
  lea Di, datainnew+2 
  lea si, forbiddencharnew+2
 chfbd: 
   cmpsb
   jz errorf
   dec si 
   mov cl,[di]
   cmp cl,24h
   jnz chfbd
   
   
  lea bx, datainnew+2
  lea si, command

   com:                          ;seperate the command part from the input
    mov al,[bx] 
    mov [si],al
    inc bx
    inc si
    cmp al,20h
    Jne com
    lea si,dest       
                                  ;seperate the destination part from the input
   des:
     mov al,[bx] 
     mov [si],al
     inc bx
     inc si 
     cmp al,20h
     je  jump6comm
     cmp al,24h
     je continue  
     cmp al,2ch 
     jne des 

     lea si,source  
   sour:                          ;seperate the source part from the input
     mov al,[bx]                                                                               
     mov [si],al
     inc bx
     inc si
     mov cl,[bx]  
     cmp cl,24h      
     jne sour
 
             
     jump6comm: 
     cmp defineTurns,0                     ; choose which player
     je p1ckdest
     jmp p2ckdest
     
      p1ckdest: 
      
      lea bx,dummy1 
      mov cl,'$'
      mov [bx],cl
      mov [bx+1],cl 
      mov cl,0
      mov eightbitck ,cl
      mov sixtenbitck,cl 
      
     checkaddrdestp1 dest           ;check the the destination addresing mode
     
     convTheregisterp1:                               
                                  ;convert the characters into the memory destination
     convdestp1 dest  
     
      p2ckdest:   
      lea bx,dummy1
      mov cl,'$'
      mov [bx],cl
      mov [bx+1],cl
      
       mov cl,0
      mov eightbitck ,cl
      mov sixtenbitck,cl
      
      checkaddrdestp2 dest 
      
      convTheregisterp2: 
      
      convdestp2 dest                  
     
    checksour:    
     lea bx,source
     mov al,[bx] 
     sub al,30h
     mov [bx],al 
     cmp al,9h
     pushf
     jle checkno
     jmp contchecksource
    checkno:
     inc bx  
     mov cl,[bx]
     cmp cl,24h
     je  fixsour                          ;check if the source is a number not a register
     mov al,[bx] 
     sub al,30h
     mov [bx],al 
     mov al,[bx]
     cmp al,9h     
     jle checkno
     checkNL:
     mov al,[bx] 
     sub al,27h
     mov [bx],al 
     mov al,[bx]
     cmp al,0Fh 
     jle checkno
     jmp ERROR                            ;fix source
     fixsour:                                                     
      mov ax,0h 
      dec bx
      mov al,[bx]
      dec bx  
      mov cl,[bx]
      cmp cl,24h 
      je movfixno
      mov dl,[bx]
      shl dl,4
      add al,dl      
      dec bx 
      mov cl,[bx]
      cmp cl,24h
      je movfixno
      mov ah,[bx]      
      dec bx  
      mov cl,[bx]
      cmp cl,24h
      je movfixno 
      mov dl,[bx]
      shl dl,4
      add ah,dl           
      dec bx 
      mov cl,[bx]
      cmp cl,24h
      je movfixno
      mov cl,[bx]
      cmp cl,0
      je movfixnozero              
      jmp ERROR
    
    contchecksource:                        ;   choose which player
                
    cmp defineTurns,0
     je p1cksour
     jmp p2cksour             
                
     p1cksour:
                                             ;check the the source addresing mode
      Add source,30h   
      checkaddrsourp1 source    
                                           ;continue if the source is a register
     skip1:          
     convsourp1 source   
     

     p2cksour:
     
     Add source,30h                        ;check the the source addresing mode
       
      checkaddrsourp2 source    
                                           ;continue if the source is a register
     skip2:          
     convsourp2 source
    
         
     movfixnozero:
     mov [bx],al                        ;   if the first number is zero
     inc bx
     mov [bx],ah
     inc bx 
     mov cl,24h
     mov [bx],cl
     jmp continue                        ; if the first number isnt zero
     movfixno:
     inc bx 
     mov [bx],al
     inc bx
     mov [bx],ah
     inc bx  
     mov cl,24h
     mov [bx],cl
          
     continue:
     
     lea si , comm1                   ; condition the move command
     lea Di , command
     mov cx,4
     REPE CMPSB
     jE pl1mov
     lea si , comm2                  ; condition the Add command
     lea Di , command                 
     mov cx,4
     REPE CMPSB
     jE pl1ADD                             
     lea si , comm3                    ; condition the Adc command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1ADC 
     lea si , comm4
     lea Di , command                  ; condition the sub command
     mov cx,4
     REPE CMPSB
     jE pl1SUB
     lea si , comm5                   ; condition the sbb command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1SBB  
     lea si , comm6                   ; condition the XOR command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1XOR                           
     lea si , comm7                   ; condition the AND command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1AND  
     lea si , comm8                   ; condition the OR command
     lea Di , command     
     mov cx,3
     REPE CMPSB
     jE pl1OR 
     lea si , comm9                   ; condition the SHL command
     lea Di,  command     
     mov cx,4
     REPE CMPSB
     jE pl1SHL
     lea si , comm10                   ; condition the SHR command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1SHR 
     
     lea si , comm11                   ; condition the inc command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1inc
      
     lea si , comm12                   ; condition the dec command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1dec 
     
     lea si , comm13                   ; condition the mul command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1mul
     
     lea si , comm14                   ; condition the div command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1div
     
     lea si , comm15                   ; condition the nop command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1nop
     
       lea si , comm16                   ; condition the clc command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1clc
     
     JMP ERROR                             
   pl1mov:                                    ;enter the mov command 
   
   Movcomm dest,source                       
                                  
   pl1ADD:                                    ;enter the Add command
   
   Addcomm dest,source                     
        
   pl1ADC:                                    ;enter the Adc command
   
   Adccomm dest,source
                                    
   pl1SUB:                                    ;enter the sub command
   
   Subcomm dest,source
   
   pl1SBB:                                    ;enter the sbb command
    
   Sbbcomm dest,source
    
   pl1XOR:                                     ;enter the XOR command
   
    XORcomm dest,source
   
   pl1AND:                                     ;enter the AND command
   
   ANDcomm dest,source 
   
   pl1OR:                                       ;enter the or command
   
    ORcomm dest,source
   
   pl1SHL:
                                                ;enter the shl command
    SHLcomm dest,source
                                                
                                                
   pl1SHR:                                      ;enter the SHR command
   
    SHRcomm dest,source 
    
   pl1inc:


    mov si,word ptr dest
    mov cx,[si]
    inc cx
    mov [si],cx
    clc 
    pushf
    jmp  endcode1
    
   pl1dec:
         
    mov si,word ptr dest
    mov cx,[si]
    dec cx
    mov [si],cx 
    clc 
    pushf
    jmp  endcode1   
      
   pl1mul:
    mov dx,0    
    mov si,word ptr dest
    cmp defineTurns,0
    je p1mul
    mov ax , p1ax
    jmp cmul
    p1mul:
    mov ax, p2ax 
    
    cmul:   
        
    mov cx,[si]
    mul cx 
    pushf
     cmp defineTurns,0
    je p1mul1
    mov p1ax , ax
    mov p1dx,dx
     clc
    jmp  endcode1  
    
    p1mul1:
    mov p2ax, ax 
    mov p2dx, dx 
       
    clc
    jmp  endcode1     
        
    
   pl1div:
    
    mov dx,0    
    mov si,word ptr dest
    cmp defineTurns,0
    je p1div
    mov ax , p1ax
    jmp cdiv
    p1div:
    mov ax, p2ax 
    cdiv:   
    
    
    mov cx,[si]
    div cx 
    pushf
     cmp defineTurns,0
    je p1div1
    mov p1ax , ax
    mov p1dx,dx
     clc
    jmp  endcode1  
    
    p1div1:
    mov p2ax, ax 
    mov p2dx, dx 
       
  
    jmp  endcode1     
        
       
   pl1nop:
     nop   
     jmp endcode1    
   
   pl1clc: 
    mov cx,0
    cmp defineTurns,0
    je clp2flag
    mov p1cf,cx
    jmp endcode1
   clp2flag:
    mov p2cf,cx
    jmp endcode1
       
   ERROR:
   pop bx
   mov ah,9
   lea dx, errorcode
   int 21h
   cmp defineTurns,0
   jne p1turn
p2turn:
   mov defineTurns, 1 
   jmp endturn    
p1turn:
   mov defineTurns, 0         
   jmp endturn 
                
   endcode1:      
   mov ax,0
   pop ax
   and ax,1h 
   cmp defineTurns,0
   je p1chf    
   
   mov p1cf,ax 
   jmp p1turn  
             
   p1chf:               
   mov p2cf,ax 
      
   jmp p2turn 
   
   ERRORF:
   
   mov ah,9
   lea dx, errorforb
   int 21h   
   waittime 27h , 10h 
   cmp defineTurns,0
   jne p1turn     
   jmp p2turn            
endturn: 
ret               
process endp

;__________________________________________________________
 ;powerups
P1PowerUps Proc far

P1RepeatPU:
mov al, 00h     ;Get User Input based on scancodes
mov ah, 0h
int 16h

cmp ah, 59d
je P1ExecuteOnThisCPU
cmp ah, 60d
je P1ExecuteOnBothCPUS
cmp ah, 61d
je P1ChangeOtherForbiddenCharacter
cmp ah, 62d
je P1ClearAllRegisters
cmp ah, 63d
je P1NoPU
mov ah, 0Ch
int 21h
jmp P1RepeatPU

P1ExecuteOnThisCPU:
mov ah, 0Ch
int 21h
mov defineTurns,1h
mov SI, offset P1Command
mov DI, offset P2Command
P1COPYPU2:
cmp byte ptr [SI],0Dh
movsb
jne P1COPYPU2
call Process
mov defineTurns,1h
sub P1Point, 5d
jmp OUTP1PU

P1ExecuteOnBothCPUS:
mov ah, 0Ch
int 21h
mov defineTurns,1h
mov SI, offset P1Command
mov DI, offset P2Command
P1COPYPU3:
cmp byte ptr [SI],0Dh
movsb
jne P1COPYPU3
call Process
call Process
sub P1Point,3d
jmp OUTP1PU

P1ChangeOtherForbiddenCharacter:
mov ah, 0Ch
int 21h
mov ah,07
int 21h
mov p2forbiddenchar+2,al
sub P1Point,8d
call drawGUI
jmp P1RepeatPU

P1ClearAllRegisters:
mov ah, 0Ch
int 21h
mov P1AX,0h
mov P1BX,0h
mov P1CX,0h
mov P1DX,0h
mov P1SI,0h 
mov P1DI,0h
mov P1SP,0h
mov P1BP,0h
mov P2AX,0h
mov P2BX,0h
mov P2CX,0h
mov P2DX,0h
mov P2SI,0h 
mov P2DI,0h
mov P2SP,0h
mov P2BP,0h
sub P1Point,30d
call drawGUI
jmp P1RepeatPU

P1NoPU:
mov ah, 0Ch
int 21h
call process

OUTP1PU:ret
P1PowerUps endp

P2PowerUps Proc far

P2RepeatPU:
mov al, 00h     ;Get User Input based on scancodes
mov ah, 0h
int 16h

cmp ah, 59d
je P2ExecuteOnThisCPU
cmp ah, 60d
je P2ExecuteOnBothCPUS
cmp ah, 61d
je P2ChangeOtherForbiddenCharacter
cmp ah, 62d
je P2ClearAllRegisters
cmp ah, 63d
je P2NoPU
mov ah, 0Ch
int 21h
jmp P2RepeatPU

P2ExecuteOnThisCPU:
mov ah, 0Ch
int 21h
mov defineTurns,0h
mov SI, offset P2Command
mov DI, offset P1Command
P2COPYPU2:
cmp byte ptr [SI],0Dh
movsb
jne P2COPYPU2
call Process
mov defineTurns,0h
sub P2Point, 5d
jmp OUTP2PU

P2ExecuteOnBothCPUS:
mov ah, 0Ch
int 21h
mov defineTurns,0h
mov SI, offset P2Command
mov DI, offset P1Command
P2COPYPU3:
cmp byte ptr [SI],0Dh
movsb
jne P2COPYPU3
call Process
call Process
sub P2Point,3d
jmp OUTP2PU

P2ChangeOtherForbiddenCharacter:
mov ah, 0Ch
int 21h
mov ah,07
int 21h
mov p1forbiddenchar+2,al
sub P2Point,8d
call drawGUI
jmp P2RepeatPU

P2ClearAllRegisters:
mov ah, 0Ch
int 21h
mov P2AX,0h
mov P2BX,0h
mov P2CX,0h
mov P2DX,0h
mov P2SI,0h 
mov P2DI,0h
mov P2SP,0h
mov P2BP,0h
mov P1AX,0h
mov P1BX,0h
mov P1CX,0h
mov P1DX,0h
mov P1SI,0h 
mov P1DI,0h
mov P1SP,0h
mov P1BP,0h
sub P2Point,30d
call drawGUI
jmp P2RepeatPU

P2NoPU:
mov ah, 0Ch
int 21h
call process

OUTP2PU:ret
P2PowerUps endp

updateData proc far


    lea si, player2Name
    lea di, player1Name
    mov cx, 68 
    cmp [defineturns],0
    je loop2
loop1:
    mov ah, [si]
    mov sendbyteee, ah
    call sending
    
    mov ah, sendbyteee
    mov [di], ah 

    inc si
    inc di
    dec cx
    jnz loop1
    mov defineturns,0 
    ret
loop2:
    mov ah, [si]
    mov sendbyteee, ah

    call receiving
    
    mov ah, sendbyteee
    mov [di], ah 

    inc si
    inc di
    dec cx
    jnz loop1
    mov defineturns,1
    ret

    ret
updateData endp

 sending proc near
PUSHA
 

    MOV DX,3FDH
        AGAIN222:
        IN AL,DX
        AND AL,00100000B
        JZ AGAIN222

        MOV DX,3F8H
        MOV AL,sendbyteee
        OUT DX,AL 


popa
ret
sending endp

receiving proc near
pusha
    MOV DX,3FDH
chkk:    IN AL,DX
    AND AL,1 
    JZ chkk

    MOV DX,3F8H
    IN AL,DX
    MOV sendbyteee, AL
 
    popa
    ret
receiving endp


end Main