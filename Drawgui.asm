include includes.inc
;Public DrawGui, green, cyan, yellow, red, blue , Player1Name , p1point, p1forbiddenchar
.model small
.386
.stack 300h
.data    
;garbage db 'g'
;include Data.inc
;myCounter db '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
;myResOut  db  '0','0','0','0','$' 
;scoremes  db  'score:','$','$','$','$','$','$','$','$','$','$' 
;pointsmes db  'points:','$','$','$','$','$','$','$','$','$','$'
;CmdMes    db  'Your command$$'
;EnemyCmdMes db  'Enemy command$$'
;chatline1   db  'this is your message $$'
;chatline2   db  'this is the other players message$$'
;Res       db  0 
include bigdata.inc
.code    
DrawGui proc far 
mov ax,@data        
mov ds,ax          

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
StrColorOut player1Name,2h     


setcur 8ah ,14h
StrColorOut player2Name,4h 

;____________________________________________________________
;commands out

DrawRec 06h, 13h, 2d, 17d, 0eh
setcur  07h, 12h ;player1 
StrColorOut    CmdMes   , 0eh  

DrawRec 89h, 13h, 2d, 17d, 4h
setcur  8Ah, 12h ;player1 
StrColorOut    EnemyCmdMes   , 04h 

;el commands ht5og mn el input
;____________________________________________________________
;split screen line
DrawVline 40, 0, 27, 0fh 
     
;____________________________________________________________
;power ups score 34an leh la2, m4 3ayz ntl3 mars kman ?
    ;blue   ;01h        
DrawRec 23d, 24d, 2d, 3d, 1h 
setcur 24d, 23d 
numxlat [P1blue-1],Res,myCounter
colorout [Res+1], 1h  

    ;light red    ;0Ch         
DrawRec 27d, 24d, 2d, 3d, 0Ch 
setcur 28d, 23d 
numxlat [P1red-1],Res,myCounter
colorout [Res+1], 0Ch    

    ;yellow ;0Eh
DrawRec 31d, 24d, 2d, 3d, 0Eh 
setcur 32d, 23d 
numxlat [P1yellow-1],Res,myCounter
colorout [Res+1], 0Eh       
    
    ;Light cyan   ;0Bh 
DrawRec 35d, 24d, 2d, 3d, 0Bh 
setcur 36d, 23d 
numxlat [P1cyan-1],Res,myCounter
colorout [Res+1], 0Bh            
    
    ;green  ;02h
DrawRec 23d, 21d, 2d, 3d, 2h 
setcur 24d, 20d 
numxlat [P1green-1],Res,myCounter
colorout [Res+1], 2h   
;____________________________________________________________
;power ups score 34an leh la2, m4 3ayz ntl3 mars kman ?
    ;blue   ;01h        
DrawRec 41d, 24d, 2d, 3d, 1h 
setcur 42d, 23d 
numxlat [P2blue-1],Res,myCounter
colorout [Res+1], 1h  

    ;light red    ;0Ch         
DrawRec 45d, 24d, 2d, 3d, 0Ch 
setcur 46d, 23d 
numxlat [P2red-1],Res,myCounter
colorout [Res+1], 0Ch    

    ;yellow ;0Eh
DrawRec 49d, 24d, 2d, 3d, 0Eh 
setcur 50d, 23d 
numxlat [P2yellow-1],Res,myCounter
colorout [Res+1], 0Eh       
    
    ;Light cyan   ;0Bh 
DrawRec 53d, 24d, 2d, 3d, 0Bh 
setcur 54d, 23d 
numxlat [P2cyan-1],Res,myCounter
colorout [Res+1], 0Bh            
    
    ;green  ;02h
DrawRec 41d, 21d, 2d, 3d, 2h 
setcur 42d, 20d 
numxlat [P2green-1],Res,myCounter
colorout [Res+1], 2h 
;_______________________________________________________________
;chat 
;names Out
;greem for the player 1,Red for player 2 
setcur 1d , 28d
StrColorOut player1Name,2h     
cout ':'
lea bx , chatline1 
coutstring bx 

setcur 1d , 29d
lea bx , player2Name+2
StrColorOut [bx] , 4h 
cout ':' 
lea bx , chatline2 
coutstring bx

;_______________________________________________________________
;points
setcur 23d, 26d ;player1 
StrColorOut    pointsmes   , 0eh   
numxlat p1point,Res,myCounter
cout Res
 
setcur 41d, 26d ;player2 
StrColorOut    pointsmes   , 4h   
numxlat p1point,Res,myCounter
cout Res  


ret
    
DrawGui endp
end drawgui  
