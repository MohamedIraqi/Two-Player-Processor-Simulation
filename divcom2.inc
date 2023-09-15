; division command
 divcom2 macro ch
CMP CH, 1
        JNZ CHECK77
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV AX
        MOV p1Al, AL
        MOV p1Ah, AH 
        MOV p1Dl, DL
        MOV p1Dh, DH 
        pushf
        JMP endcode1
CHECK77:CMP CH, 2
        JNZ CHECK78
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV AL
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK78:CMP CH, 3
        JNZ CHECK79
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV AH
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK79:CMP CH, 4 
        JNZ CHECK80
        MOV CL, p1cl
        MOV CH, p1ch
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV CX
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK80:CMP CH, 5 
        JNZ CHECK81
        MOV CL, p1cl
        MOV CH, p1ch
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV CL
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK81:CMP CH, 6
        JNZ CHECK82
        MOV CL, p1cl
        MOV CH, p1ch
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV CH
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK82:CMP CH, 7 
        JNZ CHECK83
        MOV DL, p1Dl
        MOV DH, p1Dh
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV DX
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK83:CMP CH, 8 
        JNZ CHECK84
        MOV DL, p1Dl
        MOV DH, p1Dh
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV DL
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK84:CMP CH, 9 
        JNZ CHECK85
        MOV DL, p1Dl
        MOV DH, p1Dh
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV DH
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK85:CMP CH, 10            
        JNZ CHECK86
        MOV BL, p1Bl
        MOV BH, p1Bh
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV BL
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK86:CMP CH, 11
        JNZ CHECK87
        MOV BL, p1Bl
        MOV BH, p1Bh
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV BH
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK87:CMP CH, 12
        JNZ CHECK88
        MOV BL, p1Bl
        MOV BH, p1Bh
        MOV AL, p1Al
        MOV AH, p1Ah
        DIV BX
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK88:CMP CH, 13
        JNZ CHECK89
        MOV SI, p1SI
        MOV AL, p1Al
        MOV AH, p1Ah                    
        DIV SI
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK89:CMP CH, 14
        JNZ CHECK90
        MOV DI, p1DI
        MOV AL, p1Al
        MOV AH, p1Ah                    
        DIV DI
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK90:CMP CH, 15
        JNZ CHECK91
        MOV SP, p1SP
        MOV AL, p1Al
        MOV AH, p1Ah                    
        DIV SP
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH 
        pushf
        JMP endcode1
CHECK91:CMP CH, 16
        JNZ CHECK92
        MOV BP, p1BP
        MOV AL, p1Al
        MOV AH, p1Ah                    
        DIV BP
        MOV p1Al, AL
        MOV p1Ah, AH
        MOV p1Dl, DL
        MOV p1Dh, DH
        pushf
        JMP endcode1
CHECK92:CMP CH, 17
        JNZ CHECK94
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV BL, p1Bl
        MOV BH, p1Bh
        MOV AL, p1Al
        MOV AH, p1Ah
CHECK93:CMP BX, DX
        JZ  DO29
        INC DI
        INC DX
        DEC CL
        JNZ CHECK93
        JZ  CHECK94
DO29:   mov al,[di]
        div al
        mov [di],al
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK94:CMP CH, 18
        JNZ CHECK96 
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p1Al
        MOV AH, p1Ah 
        MOV SI, p1SI                    
CHECK95:CMP SI, DX
        JZ  DO30
        INC DI
        INC DX
        DEC CL
        JNZ CHECK95
        JZ  CHECK96
DO30:   mov al,[di]
        div al
        mov [di],al
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK96:CMP CH, 19 
        JNZ CHECK98
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p1Al
        MOV AH, p1Ah 
        MOV SI, p1DI                    
CHECK97:CMP SI, DX
        JZ  DO31
        INC DI
        INC DX
        DEC CL
        JNZ CHECK97
        JZ  CHECK98
DO31:   mov al,[di]
        div al
        mov [di],al
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
CHECK98:MOV DI, OFFSET P1DATA
        MOV AL, p1Al
        MOV AH, p1Ah
        MOV BL, 20
        MOV CL, 16
CHECK99:CMP CH, BL
        JZ  DO32
        INC AL
        INC DI
        DEC CL
        JNZ CHECK99
DO32:   mov al,[di]
        div al
        mov [di],al
        MOV p1Al, AL
        MOV p1Ah, AH
        pushf
        JMP endcode1
endm divcom2