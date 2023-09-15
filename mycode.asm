.model small
.386
.stack 
.data
include abedData.inc
include Data.inc            
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
instructions DB 'incdecmuldivnopclc$'
Registers    DW 'ax','al','ah'   
             DW 'cx','cl','ch'
             DW 'dx','dl','dh'
             DW 'bl','bh','bx'
             DW 'si'
             DW 'di'
             DW 'sp'
             DW 'bp'       
.code
main proc far  
mov ax , @data
mov ds , ax
mov bx,offset p1bx
mov cx,[bx]
add cx,ax
mov word ptr source,cx  
     
main endp
end