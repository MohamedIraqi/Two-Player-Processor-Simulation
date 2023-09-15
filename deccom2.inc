; DECREMENT COMMAND
 deccom2 macro ch
CMP CH, 1
        JNZ CHECK31
        MOV AL, p1Al
        MOV AH, p1Ah
        DEC AX
        MOV p1Al, AL
        MOV p1Ah, AH
        JMP endcode
CHECK31:CMP CH, 2
        JNZ CHECK32
        MOV AL, p1Al
        DEC AL
        MOV p1Al, AL
        JMP endcode
CHECK32:CMP CH, 3
        JNZ CHECK33
        MOV AL, p1Ah
        DEC AL
        MOV p1Ah, AL
        JMP endcode
CHECK33:CMP CH, 4 
        JNZ CHECK34
        MOV AL, p1cl
        MOV AH, p1ch
        DEC AX
        MOV p1cl, AL 
        MOV p1ch, AH
        JMP endcode
CHECK34:CMP CH, 5 
        JNZ CHECK35
        MOV AL, p1cl
        DEC AL
        MOV p2cl, AL
        JMP endcode
CHECK35:CMP CH, 6
        JNZ CHECK36
        MOV AL, p1ch
        DEC AL
        MOV p1ch, AL
        JMP endcode
CHECK36:CMP CH, 7 
        JNZ CHECK37
        MOV AL, p1Dl
        MOV AH, p1Dh
        DEC AX
        MOV p1Dl, AL
        MOV p1Dh, AH 
        JMP endcode
CHECK37:CMP CH, 8 
        JNZ CHECK38
        MOV AL, p1Dl
        DEC AL
        MOV p1Dl, AL
        JMP endcode
CHECK38:CMP CH, 9 
        JNZ CHECK39
        MOV AL, p1Dh
        DEC AL
        MOV p1Dh, AL
        JMP endcode
CHECK39:CMP CH, 10            
        JNZ CHECK40
        MOV AL, p1Bl
        DEC AL
        MOV p1Bl, AL
        JMP endcode
CHECK40:CMP CH, 11
        JNZ CHECK41
        MOV AL, p1Bh
        DEC AL
        MOV p1Bh, AL
        JMP endcode
CHECK41:CMP CH, 12
        JNZ CHECK42
        MOV AL, p1Bl
        MOV AH, p1Bh             
        DEC AX
        MOV p1Bl, AL
        MOV p1Bh, AH
        JMP endcode
CHECK42:CMP CH, 13
        JNZ CHECK43
        MOV Ax, p1SI                    
        DEC AX
        MOV p1SI, Ax
        JMP endcode
CHECK43:CMP CH, 14
        JNZ CHECK44
        MOV Ax, p1DI                    
        DEC AX
        MOV p1DI, Ax 
        JMP endcode
CHECK44:CMP CH, 15
        JNZ CHECK45
        MOV Ax, p1SP                    
        DEC AX
        MOV p1SP, Ax
        JMP endcode
CHECK45:CMP CH, 16
        JNZ CHECK46
        MOV Ax, p1BP                    
        DEC AX
        MOV p1BP, Ax
        JMP endcode
CHECK46:CMP CH, 17
        JNZ CHECK47
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p1Bl
        MOV AH, p1Bh
CHECK47:CMP AX, DX
        JZ  DO21
        INC DI
        INC DX
        DEC CL
        JNZ CHECK47
        JZ  CHECK48
DO21:   mov al,[di]
        dec al
        mov [di],al
        JMP endcode
CHECK48:CMP CH, 18
        JNZ CHECK50 
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H 
        MOV AX, p1SI                    
CHECK49:CMP AX, DX
        JZ  DO22
        INC DI
        INC DX
        DEC CL
        JNZ CHECK49
        JZ  CHECK50
DO22:   mov al,[di]
        dec al
        mov [di],al
        JMP endcode
CHECK50:CMP CH, 19 
        JNZ CHECK52
        MOV DI, OFFSET P1DATA
        MOV CL, 16
        MOV DX, 0000H 
        MOV AX, p1DI                    
CHECK51:CMP AX, DX
        JZ  DO23
        INC DI
        INC DX
        DEC CL
        JNZ CHECK51
        JZ  CHECK52
DO23:   mov al,[di]
        dec al
        mov [di],al
        JMP endcode
CHECK52:MOV DI, OFFSET P1DATA
        MOV AL, 20
        MOV CL, 16
CHECK53:CMP CH, AL
        JZ  DO24
        INC AL
        INC DI
        DEC CL
        JNZ CHECK53
DO24:   mov al,[di]
        dec al
        mov [di],al
        JMP endcode
endm deccom2