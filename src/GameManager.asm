include includes.inc   
extrn GamePageZero
extrn DrawGUI
extrn minigame
public GameManager
.model small
.386
.stack 300h
.data
include Data.inc
.code
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

lea  si , dolar
lea  di , p1command
mov  cx , 20d
rep  movsb

lea  si , dolar
lea  di , p2command
mov  cx , 20d
rep  movsb

call process
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
;call updatedata 

jmp chkwl
chkwlout:
mov P1AX,105Eh
mov P2AX,105Eh
cinchar
loop chkwl
cinchar
chkwl:
call checkWL
cmp [WL] , 1
je ggiZi

jmp mainloopOFFLINE

ggiZi:

ret                   
GameManager endp
end GameManager
