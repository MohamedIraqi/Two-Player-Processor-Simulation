;mohamed iraki,Mail: mailg.mohammed@gmail.com
;21/12/2021
;prints the main screens
EXTRN GameManager:far 
EXTRN GameManageronline:far 
include includes.inc
Public MainPage
.model small
.386
.stack 300h
.data
include Data.inc 
include Notify.inc 
include pagedat.inc
error   db  'error pls try again $'
.code    
MainPage proc far
mov ax,@data        
mov ds,ax          

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
    
    setcur 0d,28d           ;mov cursor
;    lea bx,N1
;    coutstring bx 
    StrColorOut N1 , 0Ah  
    
    
    ;get input
    getinput:
    mov ah,0h
    int 16h
    cmp al,27d
    je mEsc
    
    cmp ah,59d
    je mF1    
    
    
    cmp ah,60d
    je mF2

    cmp ah,61d
    je mF3
    
    setcur 0d,26d           ;mov cursor
    lea bx,errormesssss
    coutstring bx
    jmp getinput
    
    mf1:
    cout 'h'
    jmp getinput
    
    mF2:call GameManager
    jmp reto
    jmp getinput  
    1
    mF3:call GameManagerOnline
    jmp reto
    jmp getinput
    
    Mesc:include ret2dos.inc
    
    
reto: ret     
end MainPage
end