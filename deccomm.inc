; decrement command

  deccomm macro ch
   
   CMP CH, 1
        JNZ CHEK31
        MOV AL, p2Al
        MOV AH, p2Ah
        DEC AX
        MOV p2Al, AL
        MOV p2Ah, AH
        JMP endcode
CHEK31: CMP CH, 2
        JNZ CHEK32
        MOV AL, p2Al
        DEC AL
        MOV p2Al, AL
        JMP endcode
CHEK32: CMP CH, 3
        JNZ CHEK33
        MOV AL, p2Ah
        DEC AL
        MOV p2Ah, AL
        JMP endcode
CHEK33: CMP CH, 4 
        JNZ CHEK34
        MOV AL, p2cl
        MOV AH, p2ch
        DEC AX
        MOV p2cl, AL
        MOV p2ch, AH
        JMP endcode
CHEK34: CMP CH, 5 
        JNZ CHEK35
        MOV AL, p2cl
        DEC AL
        MOV p2cl, AL
        JMP endcode
CHEK35: CMP CH, 6
        JNZ CHEK36
        MOV AL, p2ch
        DEC AL
        MOV p2ch, AL
        JMP endcode
CHEK36: CMP CH, 7 
        JNZ CHEK37
        MOV AL, p2Dl
        MOV AH, p2Dh
        DEC AX
        MOV p2Dl, AL
        MOV p2Dh, AH
        JMP endcode
CHEK37: CMP CH, 8 
        JNZ CHEK38
        MOV AL, p2Dl
        DEC AL
        MOV p2Dl, AL
        JMP endcode
CHEK38: CMP CH, 9 
        JNZ CHEK39
        MOV AL, p2Dh
        DEC AL
        MOV p2Dh, AL
        JMP endcode
CHEK39: CMP CH, 10            
        JNZ CHEK40
        MOV AL, p2Bl
        DEC AL
        MOV p2Bl, AL
        JMP endcode
CHEK40: CMP CH, 11
        JNZ CHEK41
        MOV AL, p2Bh
        DEC AL
        MOV p2Bh, AL
        JMP endcode
CHEK41: CMP CH, 12
        JNZ CHEK42
        MOV AL, p2Bl
        MOV AH, p2Bh             
        DEC AX
        MOV p2Bl, AL
        MOV p2Bh, AH
        JMP endcode
CHEK42: CMP CH, 13
        JNZ CHEK43
        MOV Ax, p2SI                    
        DEC AX
        MOV p2SI, Ax
        JMP endcode
CHEK43: CMP CH, 14
        JNZ CHEK44
        MOV Ax, p2DI                    
        DEC AX
        MOV p2DI, Ax
        JMP endcode
CHEK44: CMP CH, 15
        JNZ CHEK45
        MOV Ax, p2SP                    
        DEC AX
        MOV p2SP, Ax
        JMP endcode
CHEK45: CMP CH, 16
        JNZ CHEK46
        MOV Ax, p2BP                    
        DEC AX
        MOV p2BP, Ax
        JMP endcode
CHEK46: CMP CH, 17
        JNZ CHEK47
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H
        MOV AL, p2Bl
        MOV AH, p2Bh
CHEK47: CMP AX, DX
        JZ  DO5
        INC DI
        INC DX
        DEC CL
        JNZ CHEK47
        JZ  CHEK48
DO5:    mov al,[di]
        dec al
        mov [di],al
        JMP endcode
CHEK48: CMP CH, 18
        JNZ CHEK50 
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H 
        MOV AX, p2SI                    
CHEK49: CMP AX, DX
        JZ  DO6
        INC DI
        INC DX
        DEC CL
        JNZ CHEK49
        JZ  CHEK50
DO6:    mov al,[di]
        dec al
        mov [di],al
        JMP endcode
CHEK50: CMP CH, 19 
        JNZ CHEK52
        MOV DI, OFFSET P2DATA
        MOV CL, 16
        MOV DX, 0000H 
        MOV AX, p2DI                    
CHEK51: CMP AX, DX
        JZ  DO7
        INC DI
        INC DX
        DEC CL
        JNZ CHEK51
        JZ  CHEK52
DO7:    mov al,[di]
        dec al
        mov [di],al
        JMP endcode
CHEK52: MOV DI, OFFSET P2DATA
        MOV AL, 20
        MOV CL, 16
CHEK53: CMP CH, AL
        JZ  DO8
        INC AL
        INC DI
        DEC CL
        JNZ CHEK53
DO8:    mov al,[di]
        dec al
        mov [di],al
        JMP endcode
endm deccomm