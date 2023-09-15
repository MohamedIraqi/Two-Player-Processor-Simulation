public GamePageZero  
extrn Player1Name:word 
extrn p1point:word 
extrn p1forbiddenchar:word
include includes.inc
.model small
.386
.stack 300h
.data
namemes         db  'name:$'     ;'please enter your name:$'
ipoints         db  'points:$'    ;'please Enter your suggested initial points:$$$'
forbcharmes     db  'forbChar:$'  ;'please Enter the forbidden Character$$'
.code           

GamePageZeroOnline proc far
mov ax,@data        
mov ds,ax          
        

VideoMode 12h           ;textmode 
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
GamePageZero endp
end GamePageZero
