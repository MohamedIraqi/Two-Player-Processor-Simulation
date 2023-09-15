EXTRN DRAWGUI:far  ;640,480
extrn green:byte 
extrn cyan:byte
extrn yellow:byte
extrn red:byte
extrn blue:byte

include includes.inc
public minigame
.model small
.386
.stack 64
.data
refresh db '________________________________________________________________________________$$$$$$$$$$$'
TargetColors db 01h, 0Ch, 0Eh, 0Bh, 02h
Seed dw ?
PaddleStartX dw 59d
PaddleStartY dw 255d
PaddleEndX dw 89d
PaddleEndY dw 265d
TargetStartX dw 0d
TargetEndX dw 0d
TargetEndY dw 7d
TargetDirection db 0d
TargetColor db 0d
BulletStartX dw 0d
BulletStartY dw 0d
LeftBoundary dw 50d
MiddleBoundary dw 305d
;RightBoundary dw 0d
TopBoundary dw 150d
BottomBoundary dw 265d
.code    
Minigame proc far
mov ax,@data        
mov ds,ax
          
mov al, 12h ;Set video mode
mov ah, 00h  
int 10h

mov ax, 0000h ;Get Randomizer Seed as sytem time
int 1Ah
mov Seed, dx

call DrawGUI    ;Draw minigame elements in order
       
ControlPaddle:
         
mov al, 00h       ;wait for 100 milliseconds (186Ah:0000h)
mov ah, 86h
mov cx, 0000H
mov dx, 186AH
int 15h 

setcur 0,0
StrColorOut refresh, 0h
                          
scroll 00, 0h, 0006h, 1026h     

  

call DrawPaddle
call DrawTarget
call DrawBullet  

call DetectCollision  ;Detect Target-Bullet Collision

mov ax, 25173d  ;Generate Random number between 1 and 1000 using LCG
mul Seed
add ax, 13849d
mov dx, 0000h
mov Seed, ax
mov bx,1000d
div bx
inc dx    
cmp dx,10d       ;Spawn Target based on percentage
jbe SpawnTarget

mov al, 00h     ;Get User Input based on scancodes
mov ah, 01h
int 16h
cmp ah, 39h
je ShootBullet
cmp ah, 4Bh
je MovePaddleLeft
cmp ah, 4Dh
je MovePaddleRight
cmp ah, 50h
je MovePaddleDown
cmp ah, 48h    
je MovePaddleUp 
jmp ControlPaddle

SpawnTarget:       ;If no target already exists, Spawn a target, randomize spawn direection and color based on generated number 
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
mov TargetStartX, 631d
mov TargetEndX, 639d
jmp ControlPaddle
SpawnLeft:
mov TargetDirection, 1d
mov TargetStartX, 0d
mov TargetEndX, 7d
jmp ControlPaddle
                  
ShootBullet:      ;If no bullet already exists, Spawn a bullet at paddle's midpoint (If paddle is not at top of screen)
mov ah, 07h
int 21h
cmp BulletStartX,0d
jne ControlPaddle
mov ax, PaddleStartY
cmp ax, 1d
jbe  ControlPaddle
sub ax, 2d
mov BulletStartY, ax
mov ax, PaddleEndX 
sub ax, PaddleStartX
mov bh, 02h
div bh
mov ah, 00h
add ax, PaddleStartX
dec ax
mov BulletStartX, ax 
jmp ControlPaddle

MovePaddleLeft:  ;Move paddle left within bounds
mov ah, 07h
int 21h
mov ax, PaddleStartX
cmp ax, LeftBoundary
je ControlPaddle
dec PaddleStartX
dec PaddleEndX 
jmp ControlPaddle

MovePaddleRight: ;Move paddle right within bounds
mov ah, 07h
int 21h
mov ax, PaddleEndX
cmp ax, MiddleBoundary
je ControlPaddle
inc PaddleStartX
inc PaddleEndX 
jmp ControlPaddle

MovePaddleDown:  ;Move paddle down within bounds
mov ah, 07h
int 21h
mov ax, PaddleEndY 
cmp ax, BottomBoundary
je ControlPaddle
inc PaddleStartY
inc PaddleEndY 
jmp ControlPaddle

MovePaddleUp:    ;Move paddle up within bounds
mov ah, 07h
int 21h
mov ax, PaddleStartY
cmp ax, TopBoundary
je ControlPaddle
dec PaddleStartY
dec PaddleEndY 
jmp ControlPaddle

outtahereee:ret      
Minigame endp

DetectCollision proc  ;If bullet exists, compare X,Y to detect collision and destroy target and bullet
    cmp BulletStartX, 0d
    je NoCollision
    mov cx, BulletStartX
    mov dx, BulletStartY
    cmp dx, TargetEndY
    jg NoCollision
    inc dx
    cmp dx, 0
    jb NoCollision
    cmp cx, TargetEndX
    jg NoCollision
    inc cx
    cmp cx, TargetStartX
    jb NoCollision
    mov ah,2h
    mov dl,07h
    int 21h
    cmp TargetColor, 2h
    je lblgreen
    cmp TargetColor, 0ch
    je lblred
    cmp TargetColor, 0bh
    je lblcyan
    cmp TargetColor, 0eh
    je lblyellow
    cmp TargetColor, 1h
    je lblblue
    lblgreen:  inc green
    jmp skipp
    lblcyan:   inc cyan
    jmp skipp
    lblyellow: inc yellow
    jmp skipp
    lblblue:   inc blue
    jmp skipp
    lblred:    inc red
    jmp skipp
skipp:mov TargetDirection, 0d
    mov TargetStartX, 0d
    mov TargetEndX, 0d 
    mov BulletStartX,0d
    mov BulletStartY,0d
    jmp outtahereee     
    NoCollision: 
    ret    
DetectCollision endp

;DrawGUI proc        ;Draw White Screen (Clear Screen)
;    mov dx, 0d
;    NextRow:
;    mov cx, 0d
;    FillRow:
;    mov bh, 00h
;    mov al, 0Fh
;    mov ah, 0Ch
;    int 10h
;    inc cx
;    cmp cx, 640d
;    jb FillRow
;    inc dx
;    cmp dx, 480d
;    jb NextRow
;    ret
;DrawGUI endp

DrawPaddle proc    ;Draw Paddle
    mov dx, PaddleStartY
    PaddleNextRow:
    mov cx, PaddleStartX
    PaddleFillRow:
    mov bh, 00h
    mov al, 0Bh
    mov ah, 0Ch
    int 10h
    inc cx
    cmp cx, PaddleEndX
    jbe PaddleFillRow
    inc dx
    cmp dx, PaddleEndY
    jbe PaddleNextRow
    ret
DrawPaddle endp

DrawTarget proc   ;Draw Target if it exists. The first time it hits a side of the screen, Bounce back. The Second time it hits a side of the screen, Destroy it.
    cmp TargetDirection, 0d     
    je DoneTarget   
    mov dx, 0d
    TargetNextRow:
    mov cx, TargetStartX
    TargetFillRow:
    mov bh, 00h
    mov al, TargetColor
    mov ah, 0Ch
    int 10h
    inc cx
    cmp cx, TargetEndX
    jbe TargetFillRow
    inc dx
    cmp dx, TargetEndY
    jbe TargetNextRow
    
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
    inc TargetStartX
    inc TargetEndX    
    cmp TargetEndX, 639d
    je TargetHitWall
    jmp DoneTarget
    
    HeadingRight:
    dec TargetStartX
    dec TargetEndX 
    cmp TargetStartX, 0d
    je TargetHitWall
    jmp DoneTarget
       
    TargetHitWall:
    add TargetDirection, 2d
    cmp TargetDirection, 4d ;bounces = (n-2)/2
    ja DestroyTarget
    jmp DoneTarget
     
    DestroyTarget:
    mov TargetDirection, 0d
    mov TargetStartX, 0d
    mov TargetEndX, 0d   
    DoneTarget:
    ret
DrawTarget endp

DrawBullet proc  ;Draw Bullet if it exists. if it reaches top of screen, destroy it
    cmp BulletStartX,0d     
    je DoneBullet
    mov dx, BulletStartY
    mov cx, BulletStartX
    mov bh, 00h
    mov al, 04h
    mov ah, 0Ch
    int 10h
    inc cx
    mov bh, 00h
    mov al, 04h
    mov ah, 0Ch
    int 10h
    inc dx
    mov bh, 00h
    mov al, 04h
    mov ah, 0Ch
    int 10h
    dec cx
    mov bh, 00h
    mov al, 04h
    mov ah, 0Ch
    int 10h
    dec BulletStartY
    cmp BulletStartY,0d
    je DestroyBullet
    jmp DoneBullet    
    DestroyBullet:
    mov BulletStartX,0d
    mov BulletStartY,0d
    DoneBullet:
    ret
DrawBullet endp

end Minigame