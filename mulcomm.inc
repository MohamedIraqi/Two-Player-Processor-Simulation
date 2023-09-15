; multiply command
   


   mulcomm macro ch

    CMP CH, 1
        JNZ CHEK54
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL AX
        MOV p2Al, AL
        MOV p2Ah, AH 
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf 
        JMP endcode1
CHEK54: CMP CH, 2
        JNZ CHEK55
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL AL
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK55: CMP CH, 3
        JNZ CHEK56
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL AH
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK56: CMP CH, 4 
        JNZ CHEK57
        MOV CL, p2cl
        MOV CH, p2ch
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL CX
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1 
CHEK57: CMP CH, 5 
        JNZ CHEK58
        MOV CL, p2cl
        MOV CH, p2ch
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL CL
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK58: CMP CH, 6
        JNZ CHEK59
        MOV CL, p2cl
        MOV CH, p2ch
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL CH
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK59: CMP CH, 7 
        JNZ CHEK60
        MOV DL, p2Dl
        MOV DH, p2Dh
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL DX
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK60: CMP CH, 8 
        JNZ CHEK61
        MOV DL, p2Dl
        MOV DH, p2Dh
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL DL
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK61: CMP CH, 9 
        JNZ CHEK62
        MOV DL, p2Dl
        MOV DH, p2Dh
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL DH
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK62: CMP CH, 10            
        JNZ CHEK63
        MOV BL, p2Bl
        MOV BH, p2Bh
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL BL
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK63: CMP CH, 11
        JNZ CHEK64
        MOV BL, p2Bl
        MOV BH, p2Bh
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL BH
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK64: CMP CH, 12
        JNZ CHEK65
        MOV BL, p2Bl
        MOV BH, p2Bh
        MOV AL, p2Al
        MOV AH, p2Ah
        MUL BX
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK65: CMP CH, 13
        JNZ CHEK66
        MOV SI, p2SI
        MOV AL, p2Al
        MOV AH, p2Ah                    
        MUL SI
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK66: CMP CH, 14
        JNZ CHEK67
        MOV DI, p2DI
        MOV AL, p2Al
        MOV AH, p2Ah                    
        MUL DI
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK67: CMP CH, 15
        JNZ CHEK68
        MOV SP, p2SP
        MOV AL, p2Al
        MOV AH, p2Ah                    
        MUL SP
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH 
        pushf
        JMP endcode1
CHEK68: CMP CH, 16
        JNZ CHEK69
        MOV BP, p2BP
        MOV AL, p2Al
        MOV AH, p2Ah                    
        MUL BP
        MOV p2Al, AL
        MOV p2Ah, AH
        MOV p2Dl, DL
        MOV p2Dh, DH
        pushf
        JMP endcode1
CHEK69: CMP CH, 17
        JNZ CHEK70
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV BL, p2Bl
        MOV BH, p2Bh
        MOV AL, p2Al
        MOV AH, p2Ah
CHEK70: CMP BX, DX
        JZ  DO9
        INC DI
        INC DX
        DEC CL
        JNZ CHEK70
        JZ  CHEK71
DO9:    mov al,[di]
        mul al
        mov [di],al
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK71: CMP CH, 18
        JNZ CHEK73 
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p2Al
        MOV AH, p2Ah 
        MOV SI, p2SI                    
CHEK72: CMP SI, DX
        JZ  DO10
        INC DI
        INC DX
        DEC CL
        JNZ CHEK72
        JZ  CHEK73
DO10:   mov al,[di]
        mul al
        mov [di],al
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK73: CMP CH, 19 
        JNZ CHEK75
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p2Al
        MOV AH, p2Ah 
        MOV SI, p2DI                    
CHEK74: CMP SI, DX
        JZ  DO11
        INC DI
        INC DX
        DEC CL
        JNZ CHEK74
        JZ  CHEK75
DO11:   mov al,[di]
        mul al
        mov [di],al
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
CHEK75: MOV DI, OFFSET P2DATA
        MOV AL, p2Al
        MOV AH, p2Ah
        MOV BL, 20
        MOV CL, 16
CHEK76: CMP CH, BL
        JZ  DO12
        INC AL
        INC DI
        DEC CL
        JNZ CHEK76
DO12:   mov al,[di]
        mul al
        mov [di],al
        MOV p2Al, AL
        MOV p2Ah, AH
        pushf
        JMP endcode1
endm mulcomm