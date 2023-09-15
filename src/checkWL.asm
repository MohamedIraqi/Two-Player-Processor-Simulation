include includes.inc
.model small
.386
.stack 300h
.data
p1AX    dw  105bH
p2AX    dw  105eH   
 
D_msg   db  'DRAW$$$$'

P1G_msg  db  'P1 has Won!$$$$$'
P2G_msg  db  'P2 has Won!$$$$$'

.code
checkWL proc far
mov ax,@data        
mov ds,ax          

mov bx , [p1AX]
cmp bx , [p2AX]
je draw             

cmp [p1AX] , 105EH
je p1gg

cmp [p2AX] , 105EH
je p2gg
jmp non

draw:
cmp [p1AX],105EH
je draw2
jmp non

draw2:

    VideoMode 03h           ;textmode
    Pagenum 0h              ;page num 0
    clearscreen             ;clearscreen
    settextbackground 0Fh   ;set background color
    setcur 40d , 12d         ;mov cursor
    lea bx , D_msg
    coutstring bx 
    jmp non
    
p1gg:   

    VideoMode 03h           ;textmode
    Pagenum 0h              ;page num 0
    clearscreen             ;clearscreen
    settextbackground 0Ah   ;set background color
    setcur 40d , 12d         ;mov cursor
    lea bx , P1G_msg
    coutstring bx  
    jmp non
    
p2gg:   

    VideoMode 03h           ;textmode
    Pagenum 0h              ;page num 0
    clearscreen             ;clearscreen
    settextbackground 0Ch   ;set background color
    setcur 40d , 12d         ;mov cursor
    lea bx , P2G_msg
    coutstring bx
    jmp non
    
non:

ret        
           
endp checkWL
end 

