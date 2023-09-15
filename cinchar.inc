;Read one char and put in al without echo
cinchar macro

mov ah,7
int 21h

endm cinchar