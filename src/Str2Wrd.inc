;ismail
;1/8/2022
StringToWord macro strn,des
Local Done
pusha
mov ax, 0h
mov dx, 0h
lea bx, strn+2
cmp byte ptr [bx],0Dh
je Done
mov dl,[bx]
sub dl,30h
add ax, dx
inc bx
cmp byte ptr [bx],0Dh
je Done
mov dl, 10d
mul dl
mov dl,[bx]
sub dl,30h
add ax, dx
inc bx
cmp byte ptr [bx],0Dh
je Done
mov dl, 10d
mul dl
mov dl,[bx]
sub dl,30h
add ax, dx
inc bx
cmp byte ptr [bx],0Dh
je Done
mov dl, 10d
mul dl
mov dl,[bx]
sub dl,30h
add ax, dx
Done:
mov des, ax      
popa       
endm StringToWord 