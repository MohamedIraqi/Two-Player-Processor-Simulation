; multiply command
 mulcom2 macro ch
CMP CH, 1
        JNZ CHECK54
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL AX
        MOV p1Al, AL
        MOV p1Ah, AH 
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf 
        JMP endcode1
CHECK54:CMP CH, 2
        JNZ CHECK55
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL AL
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK55:CMP CH, 3
        JNZ CHECK56
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL AH
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK56:CMP CH, 4 
        JNZ CHECK57
        MOV CL, p1cl
        MOV CH, p1ch
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL CX
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK57:CMP CH, 5 
        JNZ CHECK58
        MOV CL, p1cl
        MOV CH, p1ch
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL CL
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK58:CMP CH, 6
        JNZ CHECK59
        MOV CL, p1cl
        MOV CH, p1ch
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL CH
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK59:CMP CH, 7 
        JNZ CHECK60
        MOV DL, p1Dl
        MOV DH, p1Dh
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL DX
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK60:CMP CH, 8 
        JNZ CHECK61
        MOV DL, p1Dl
        MOV DH, p1Dh
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL DL
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK61:CMP CH, 9 
        JNZ CHECK62
        MOV DL, p1Dl
        MOV DH, p1Dh
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL DH
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK62:CMP CH, 10            
        JNZ CHECK63
        MOV BL, p1Bl
        MOV BH, p1Bh
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL BL
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK63:CMP CH, 11
        JNZ CHECK64
        MOV BL, p1Bl
        MOV BH, p1Bh
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL BH
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK64:CMP CH, 12
        JNZ CHECK65
        MOV BL, p1Bl
        MOV BH, p1Bh
        MOV AL, p1Al
        MOV AH, p1Ah
        MUL BX
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK65:CMP CH, 13
        JNZ CHECK66
        MOV SI, p1SI
        MOV AL, p1Al
        MOV AH, p1Ah                    
        MUL SI
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK66:CMP CH, 14
        JNZ CHECK67
        MOV DI, p1DI
        MOV AL, p1Al
        MOV AH, p1Ah                    
        MUL DI
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK67:CMP CH, 15
        JNZ CHECK68
        MOV SP, p1SP
        MOV AL, p1Al
        MOV AH, p1Ah                    
        MUL SP
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH 
        pushf
        JMP endcode1
CHECK68:CMP CH, 16
        JNZ CHECK69
        MOV BP, p1BP
        MOV AL, p1Al
        MOV AH, p1Ah                    
        MUL BP
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK69:CMP CH, 17
        JNZ CHECK70
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV BL, p1Bl
        MOV BH, p1Bh
        MOV AL, p1Al
        MOV AH, p1Ah
CHECK70:CMP BX, DX
        JZ  DO25
        INC DI
        INC DX
        DEC CL
        JNZ CHECK70
        JZ  CHECK71
DO25:   mov al,[di]
        mul al
        mov [di],al
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK71:CMP CH, 18
        JNZ CHECK73 
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p1Al
        MOV AH, p1Ah 
        MOV SI, p1SI                    
CHECK72:CMP SI, DX
        JZ  DO26
        INC DI
        INC DX
        DEC CL
        JNZ CHECK72
        JZ  CHECK73
DO26:   mov al,[di]
        mul al
        mov [di],al
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK73:CMP CH, 19 
        JNZ CHECK75
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p1Al
        MOV AH, p1Ah 
        MOV SI, p1DI                    
CHECK74:CMP SI, DX
        JZ  DO27
        INC DI
        INC DX
        DEC CL
        JNZ CHECK74
        JZ  CHECK75
DO27:   mov al,[di]
        mul al
        mov [di],al
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK75:MOV DI, OFFSET P1DATA
        MOV AL, p1Al
        MOV AH, p1Ah
        MOV BL, 20
        MOV CL, 16
CHECK76:CMP CH, BL
        JZ  DO28
        INC AL
        INC DI
        DEC CL
        JNZ CHECK76
DO28:   mov al,[di]
        mul al
        mov [di],al
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
endm mulcom2