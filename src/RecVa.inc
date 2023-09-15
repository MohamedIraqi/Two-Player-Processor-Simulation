;iraki 1/8/22
;receives string and puts it in VALUE
	recVa macro VALUE
		local rec, chk
	rec:
		mov dx , 3FDH		; Line Status Register
	CHK:	in al , dx 
  		test al , 1
  		JZ CHK

 ;If Ready read the VALUE in Receive data register
  		mov dx , 03F8H
  		in al , dx 
  		mov VALUE , al
	cmp AL,'$'
        jne rec
endm RecVa