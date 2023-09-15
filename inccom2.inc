; increment command
 inccom2 macro ch
CMP CH, 1
        JNZ CHECK8
        MOV AL, p1Al
        MOV AH, p1Ah
        INC AX
        MOV p1Al, AL
        MOV p1Ah, AH
        JMP endcode
CHECK8: CMP CH, 2
        JNZ CHECK9
        MOV AL, p1Al
        INC AL
        MOV p1Al, AL
        JMP endcode
CHECK9: CMP CH, 3
        JNZ CHECK10
        MOV AL, p1Ah
        INC AL
        MOV p1Ah, AL
        JMP endcode
CHECK10:CMP CH, 4 
        JNZ CHECK11
        MOV AL, p1cl
        MOV AH, p1ch
        INC AX
        MOV p1cl, AL
        MOV p1ch, AH
        JMP endcode
CHECK11:CMP CH, 5 
        JNZ CHECK12
        MOV AL, p1cl
        INC AL
        MOV p1cl, AL 
        JMP endcode
CHECK12:CMP CH, 6
        JNZ CHECK13
        MOV AL, p1ch
        INC AL
        MOV p1ch, AL
        JMP endcode
CHECK13:CMP CH, 7 
        JNZ CHECK14
        MOV AL, p1Dl
        MOV AH, p1Dh
        INC AX
        MOV p1Dl, AL
        MOV p1Dh, AH
        JMP endcode
CHECK14:CMP CH, 8 
        JNZ CHECK15
        MOV AL, p1Dl
        INC AL
        MOV p1Dl, AL
        JMP endcode
CHECK15:CMP CH, 9 
        JNZ CHECK16
        MOV AL, p1Dh
        INC AL
        MOV p1Dh, AL
        JMP endcode
CHECK16:CMP CH, 10
        JNZ CHECK17
        MOV AL, p1Bl
        INC AL
        MOV p1Bl, AL
        JMP endcode
CHECK17:CMP CH, 11
        JNZ CHECK18
        MOV AL, p1Bh
        INC AL
        MOV p1Bh, AL
        JMP endcode
CHECK18:CMP CH, 12
        JNZ CHECK19
        MOV AL, p1Bl
        MOV AH, p1Bh             
        INC AX
        MOV p1Bl, AL
        MOV p1Bh, AH
        JMP endcode
CHECK19:CMP CH, 13
        JNZ CHECK20
        MOV Ax, p1SI                    
        INC AX
        MOV p1SI, Ax
        JMP endcode
CHECK20:CMP CH, 14
        JNZ CHECK21
        MOV Ax, p1DI                    
        INC AX
        MOV p1DI, Ax
        JMP endcode
CHECK21:CMP CH, 15
        JNZ CHECK22
        MOV Ax, p1SP                    
        INC AX
        MOV p1SP, Ax 
        JMP endcode
CHECK22:CMP CH, 16
        JNZ CHECK23
        MOV Ax, p1BP                    
        INC AX
        MOV p1BP, Ax
        JMP endcode
CHECK23:CMP CH, 17
        JNZ CHECK24
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p1Bl
        MOV AH, p1Bh
CHECK24:CMP AX, DX
        JZ  DO17
        INC DI
        INC DX
        DEC CL
        JNZ CHECK24
        JZ  CHECK25
DO17:   mov ax,[di]
        INC ax
        mov [di],ax 
        JMP endcode
CHECK25:CMP CH, 18
        JNZ CHECK27 
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H 
        MOV AX, p1SI                    
CHECK26:CMP AX, DX
        JZ  DO18
        INC DI
        INC DX
        DEC CL
        JNZ CHECK26
        JZ  CHECK27
DO18:   mov al,[di]
        INC al
        mov [di],al
        JMP endcode
CHECK27:CMP CH, 19 
        JNZ CHECK29
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H 
        MOV AX, p1DI                    
CHECK28:CMP AX, DX
        JZ  DO19
        INC DI
        INC DX
        DEC CL
        JNZ CHECK28
        JZ  CHECK29
DO19:   mov al,[di]
        INC al
        mov [di],al
        JMP endcode
CHECK29:MOV DI, OFFSET P1DATA
        MOV AL, 20
        MOV CL, 16
CHECK30:CMP CH, AL
        JZ  DO20
        INC AL
        INC DI
        DEC CL
        JNZ CHECK30
DO20:   mov al,[di]
        INC al
        mov [di],al
        JMP endcode
ENDM inccom2