include includes.inc
.model small
.386
.stack 300h
.data
include bigdata.inc

mes                 db  'For level 1 press (1),For level 2 press (2) :$$$$$$'

errorLvlpg          db  'Error please enter Valid Level Num$'

confirmation        db  'Chosen level is $$$'

forbcharmeslvlpg    db  'Player 1 Forbidden char is: $'
forbcharmeslvlpg2   db  'Player 1 Forbidden char is: $'

level               db  00h

.code 

levelpage proc far
         

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
    mov level , al
    
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
end 
