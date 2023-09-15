; increment command
 inccomm macro ch
 CMP CH, 1
        JNZ CHEK8
        MOV AL, p2Al
        MOV AH, p2Ah
        INC AX
        MOV p2Al, AL
        MOV p2Ah, AH
        JMP endcode
CHEK8:  CMP CH, 2
        JNZ CHEK9
        MOV AL, p2Al
        INC AL
        MOV p2Al, AL
        JMP endcode
CHEK9:  CMP CH, 3
        JNZ CHEK10
        MOV AL, p2Ah
        INC AL
        MOV p2Ah, AL
        JMP endcode
CHEK10: CMP CH, 4 
        JNZ CHEK11
        MOV AL, p2cl
        MOV AH, p2ch
        INC AX
        MOV p2cl, AL
        MOV p2ch, AH
        JMP endcode
CHEK11: CMP CH, 5 
        JNZ CHEK12
        MOV AL, p2cl
        INC AL
        MOV p2cl, AL
        JMP endcode
CHEK12: CMP CH, 6
        JNZ CHEK13
        MOV AL, p2ch
        INC AL
        MOV p2ch, AL
        JMP endcode
CHEK13: CMP CH, 7 
        JNZ CHEK14
        MOV AL, p2Dl
        MOV AH, p2Dh
        INC AX
        MOV p2Dl, AL
        MOV p2Dh, AH
        JMP endcode
CHEK14: CMP CH, 8 
        JNZ CHEK15
        MOV AL, p2Dl
        INC AL
        MOV p2Dl, AL
        JMP endcode
CHEK15: CMP CH, 9 
        JNZ CHEK16
        MOV AL, p2Dh
        INC AL
        MOV p2Dh, AL
        JMP endcode
CHEK16: CMP CH, 10
        JNZ CHEK17
        MOV AL, p2Bl
        INC AL
        MOV p2Bl, AL
        JMP endcode
CHEK17: CMP CH, 11
        JNZ CHEK18
        MOV AL, p2Bh
        INC AL
        MOV p2Bh, AL
        JMP endcode
CHEK18: CMP CH, 12
        JNZ CHEK19
        MOV AL, p2Bl
        MOV AH, p2Bh             
        INC AX
        MOV p2Bl, AL
        MOV p2Bh, AH
        JMP endcode
CHEK19: CMP CH, 13
        JNZ CHEK20
        MOV Ax, p2SI                    
        INC AX
        MOV p2SI, Ax
        JMP endcode
CHEK20: CMP CH, 14
        JNZ CHEK21
        MOV Ax, p2DI                    
        INC AX
        MOV p2DI, Ax
        JMP endcode
CHEK21: CMP CH, 15
        JNZ CHEK22
        MOV Ax, p2SP                    
        INC AX
        MOV p2SP, Ax
        JMP endcode
CHEK22: CMP CH, 16
        JNZ CHEK23
        MOV Ax, p2BP                    
        INC AX
        MOV p2BP, Ax
        JMP endcode
CHEK23: CMP CH, 17
        JNZ CHEK24
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p2Bl
        MOV AH, p2Bh
CHEK24: CMP AX, DX
        JZ  DO
        INC DI
        INC DX
        DEC CL
        JNZ CHEK24
        JZ  CHEK25
DO:     mov al,[di]
        inc al
        mov [di],al
        JMP endcode 
CHEK25: CMP CH, 18
        JNZ CHEK27 
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H 
        MOV AX, p2SI                    
CHEK26: CMP AX, DX
        JZ  DO2
        INC DI
        INC DX
        DEC CL
        JNZ CHEK26
        JZ  CHEK27
DO2:    mov al,[di]
        inc al
        mov [di],al
        JMP endcode 
CHEK27: CMP CH, 19 
        JNZ CHEK29
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H 
        MOV AX, p2DI                    
CHEK28: CMP AX, DX
        JZ  DO3
        INC DI
        INC DX
        DEC CL
        JNZ CHEK28
        JZ  CHEK29
DO3:    mov al,[di]
        inc al
        mov [di],al
        JMP endcode
CHEK29: MOV DI, OFFSET P2DATA
        MOV AL, 20
        MOV CL, 16
CHEK30: CMP CH, AL
        JZ  DO4
        INC AL
        INC DI
        DEC CL
        JNZ CHEK30
DO4:    mov al,[di]
        inc al
        mov [di],al
        JMP endcode
endm incomm