p;include includes.inc
.model small
;.386
.stack 300h
.data
include data.inc
namemes         db  'please enter your name:$'
ipoints         db  'please Enter your suggested initial points:$$$'
forbcharmes     db  'please Enter the forbidden Character$$'
.code           
GamePageZero proc far
mov ax,@data        
mov ds,ax          

VideoMode 02h           ;textmode 
clearscreen             ;clearscreen
settextbackground 0Ah   ;black back ground ligh green foreground
;_________________________________________________________________
;take input from player one
Setcur 0 , 0   
StrColorOut namemes     , 2h
mov AH , 0Ah
lea DX , P1Name
int 21h 

Setcur 0 , 2 
StrColorOut ipoints     , 2h
mov AH , 0Ah
lea DX , p1point
int 21h 

Setcur 0 , 4
StrColorOut forbcharmes , 2h
mov AH , 0Ah
lea DX , p1forbiddenchar
int 21h 



hlt                   
endp
end main
