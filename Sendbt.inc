;iraki 1/8/22
;sends string from tobesent
	sendbyte macro tobesent
		local send, AGAIN
   send:mov dx , 3FDH		; Line Status Register
 	In al , dx 			;Read Line Status
  		test al , 00100000b
  		JZ AGAIN

;If empty put the VALUE in Transmit data register
  		mov dx , 3F8H		; Transmit data register
        mov al , tobesent
  		out dx , al
	AGAIN:
endm sendbyte