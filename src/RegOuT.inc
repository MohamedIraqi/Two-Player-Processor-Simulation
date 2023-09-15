;mohamed iraki
;27/12/2021
;outs register in project
;a,b register initials
;x,y cursor position
;src reg in data ,des to mydata
;RegOut a,b, x,y ,src,des,table 
RegOut macro a,b, x,y ,src,des,table 
pusha
setcur x,y
colorout 0b3h,0eh
colorout  A,0eh
colorout  B,0eh
colorout ':',0eh    

hexxlat src,des,table

lea bx,des
coutstring bx
popa
endm RegOut