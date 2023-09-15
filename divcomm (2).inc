; division command
  

  divcomm macro ch
  
   CMP CH, 1
        JNZ CHEK77
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV AX
        MOV p2Al, AL
        MOV p2Ah, AH 
        MOV p2Dl, DL
        MOV p2Dh, DH 
        pushf
        JMP endcode1
CHEK77: CMP CH, 2
        JNZ CHEK78
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV AL
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK78: CMP CH, 3
        JNZ CHEK79
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV AH
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK79: CMP CH, 4 
        JNZ CHEK80
        MOV CL, p2cl
        MOV CH, p2ch
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV CX
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1 
CHEK80: CMP CH, 5 
        JNZ CHEK81
        MOV CL, p2cl
        MOV CH, p2ch
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV CL
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK81: CMP CH, 6
        JNZ CHEK82
        MOV CL, p2cl
        MOV CH, p2ch
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV CH
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK82: CMP CH, 7 
        JNZ CHEK83
        MOV DL, p2Dl
        MOV DH, p2Dh
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV DX
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK83: CMP CH, 8 
        JNZ CHEK84
        MOV DL, p2Dl
        MOV DH, p2Dh
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV DL
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK84: CMP CH, 9 
        JNZ CHEK85
        MOV DL, p2Dl
        MOV DH, p2Dh
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV DH
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK85: CMP CH, 10            
        JNZ CHEK86
        MOV BL, p2Bl
        MOV BH, p2Bh
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV BL
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK86: CMP CH, 11
        JNZ CHEK87
        MOV BL, p2Bl
        MOV BH, p2Bh
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV BH
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK87: CMP CH, 12
        JNZ CHEK88
        MOV BL, p2Bl
        MOV BH, p2Bh
        MOV AL, p2Al
        MOV AH, p2Ah
        DIV BX
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK88: CMP CH, 13
        JNZ CHEK89
        MOV SI, p2SI
        MOV AL, p2Al
        MOV AH, p2Ah                    
        DIV SI
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK89: CMP CH, 14
        JNZ CHEK90
        MOV DI, p2DI
        MOV AL, p2Al
        MOV AH, p2Ah                    
        DIV DI
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK90: CMP CH, 15
        JNZ CHEK91
        MOV SP, p2SP
        MOV AL, p2Al
        MOV AH, p2Ah                    
        DIV SP
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH 
        pushf
        JMP endcode1
CHEK91: CMP CH, 16
        JNZ CHEK92
        MOV BP, p2BP
        MOV AL, p2Al
        MOV AH, p2Ah                    
        DIV BP
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK92: CMP CH, 17
        JNZ CHEK94
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV BL, p2Bl
        MOV BH, p2Bh
        MOV AL, p2Al
        MOV AH, p2Ah
CHEK93: CMP BX, DX
        JZ  DO13
        INC DI
        INC DX
        DEC CL
        JNZ CHEK93
        JZ  CHEK94
DO13:   DIV [DI]
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK94: CMP CH, 18
        JNZ CHEK96 
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p2Al
        MOV AH, p2Ah 
        MOV SI, p2SI                    
CHEK95: CMP SI, DX
        JZ  DO14
        INC DI
        INC DX
        DEC CL
        JNZ CHEK95
        JZ  CHEK96
DO14:   DIV [DI]
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK96: CMP CH, 19 
        JNZ CHEK98
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p2Al
        MOV AH, p2Ah 
        MOV SI, p2DI                    
CHEK97: CMP SI, DX
        JZ  DO15
        INC DI
        INC DX
        DEC CL
        JNZ CHEK97
        JZ  CHEK98
DO15:   DIV [DI]
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK98: MOV DI, OFFSET P2DATA
        MOV AL, p2Al
        MOV AH, p2Ah
        MOV BL, 20
        MOV CL, 16
CHEK99: CMP CH, BL
        JZ  DO16
        INC AL
        INC DI
        DEC CL
        JNZ CHEK99
DO16:   DIV [DI]
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
endm divcomm