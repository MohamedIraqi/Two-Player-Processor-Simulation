include includes.inc 
.model small
;public  process
.386
.stack 300
.data 
include bigData.inc            
         
.code
process proc far
  mov Ax, @data
  mov ds, ax 
  mov Es,ax  
  turns: 
     cleardata
     cmp defineTurns,0
     je player1input
     jmp player2input

player1input: 
  mov AH,0AH
  lea dx, P1Command
  int 21h  
   fixdatain  p1forbiddenchar,forbiddencharnew
     
  fixdatain  P1Command,datainnew
  jmp continuexx
  
player2input:
  mov AH,0AH
  lea dx, P2Command
  int 21h  
   fixdatain  p2forbiddenchar,forbiddencharnew    
   fixdatain  P2Command,datainnew    
  ;mov AH,0AH
;  mov dx,offset datain
;  int 21h   
;  lea bx, datain
;  fixdatain datain,datainnew 

continuexx:  
  lea Di, datainnew+2 
  lea si, forbiddencharnew+2
 chfbd: 
   cmpsb
   jz errorf
   dec si 
   mov cl,[di]
   cmp cl,24h
   jnz chfbd
   
   
  lea bx, datainnew+2
  lea si, command
  ;lea DI, instructions 
;  MOV CL, 2 
;  MOV CH,6
 ; SPACE:   
;        mov al,[bx]
;        CMP al, 20H
;        JZ removeSpace
;        JNZ save2ndLetter 
;        
;removeSpace: 
;        
;        INC BX
;        JMP SPACE
        
;save2ndLetter: 
;         
;    MOV DL, [BX+ 1]      
;    push bx 
;    
;  CHECK:
;        CMP [DI+ 1], DL
;        JNZ notthis
;        
;        MOV AL, [BX]
;        CMP [DI], AL
;        JNZ skip6comm
;        ADD BX, 2
;        MOV AL, [BX]        
;        CMP [DI+ 2] , AL
;        JNZ ERROR
;        INC BX 
;        mov dh,[bx]
;        CMP dh, 20H
;        JNZ ERROR
;        JZ  checkPart2 
;        
;  notThis: 
;        DEC CH
;        JZ skip6comm
;        ADD DI, 3         
;        JMP CHECK   
;   skip6comm:
;   
;   pop bx
   com:                          ;seperate the command part from the input
    mov al,[bx] 
    mov [si],al
    inc bx
    inc si
    cmp al,20h
    Jne com
    lea si,dest       
                                  ;seperate the destination part from the input
   des:
     mov al,[bx] 
     mov [si],al
     inc bx
     inc si 
     cmp al,20h
     je  jump6comm
     cmp al,24h
     je continue  
     cmp al,2ch 
     jne des 

     lea si,source  
   sour:                          ;seperate the source part from the input
     mov al,[bx]                                                                               
     mov [si],al
     inc bx
     inc si
     mov cl,[bx]  
     cmp cl,24h      
     jne sour

    

 ;SPACE2:mov cl,[bx]
;        CMP cl, 20H
;        JZ removeSpace2
;        JNZ checkPart2
; removeSpace2: 
;        
;        INC BX
;        JMP SPACE2 
 ;checkPart2:
;        MOV SI, BX
;        lea DI, Registers
;        mov cl,[si]
;        CMP cl, 5BH
;        JZ  SPACE4 
;        MOV CL,16
;        MOV CH, 1
;        mov ah, 2        
;        
;CHECK2: mov al, [si]
;        CMP [di], al
;        jnz chkotherRegister
;        inc si
;        inc di
;        dec ah      
;        JZ DSIGN 
;chkotherRegister:
;cmp ah,2
;jnz chkotherRegister2        
;                     ; check the user enter an error 
;chkotherRegister1: 
;        INC CH 
;        add di,2
;        DEC CL   
;        JNZ CHECK2
;        JZ  trace
;        
;chkotherRegister2: 
;        INC CH 
;        add di,1
;        dec si
;        DEC CL        
;        JNZ CHECK2
;        JZ  ERROR  
 ;SPACE3:mov al,[si] 
;        CMP al, 20H
;        JZ removeSpace3
;        JNZ DSIGN      
;        
; removeSpace3: 
;        
;        INC SI
;        JMP SPACE3
 ;
; DSIGN: mov al,[si+1] 
;        CMP al, 24H
;        Je  FNSH   
;        Jmp ERROR
; SPACE4: mov al,[si+1] 
;        CMP al, 20H
;        JZ removeSpace4
;        JNZ BXSIDI      
;        
; removeSpace4: 
;        
;        INC SI
;        JMP SPACE4
;        
;        
; BXSIDI: MOV CH, 17
;         INC SI
;         MOV CL, 3
;         ADD DI, 12
;  CHECK4: CMPSW
;        JZ SPACE5
;        SUB SI, 2
;        INC CH 
;        DEC CL
;        JNZ CHECK4 
;        JZ  NUMBER 
;        
;  incSI:  INC SI 
;         
;SPACE5: mov al,[si]
;        CMP al, 20H
;        JZ removeSpace5
;        mov al,[si]
;        CMP al, 5DH
;        JZ  DSIGN
;        JNZ ERROR      
;        
;removeSpace5: 
;        
;        INC SI
;        JMP SPACE5
;
;INCSI2: INC SI
;        JMP CONT        
              
        
;NUMBER: mov al,[si]
;        CMP al, 30H
;        JZ  INCSI2
;CONT:   MOV CH, 20
;        MOV CL, 10
;        MOV AL, 30H
;CHECK5: CMP [SI], AL
;        JZ  incSI
;        INC CH
;        INC AL
;        DEC CL
;        JNZ CHECK5                                                 
;        JZ  fromAtoF 
;        
;fromAtoF:
;        DEC SI
;        mov al,[si]
;        CMP al, 30H
;        JNZ ERROR
;        INC SI
;        MOV CH, 30
;        MOV CL, 6
;        MOV AL, 61H
;CHECK6: CMP [SI], AL
;        JZ  incSI
;        INC CH
;        INC AL
;        DEC CL
;        JNZ CHECK6
;        DEC SI
;        mov dh,[si]
;        CMP dh, 30H
;        JNZ ERROR
;        MOV CH, 20
;        JMP incSI
                                                          
;FNSH: mov temp,ch
;     cmp defineTurns,0
;     je player1turn
;     jmp player2turn   
; 
;player1turn:
;        CMP dl, 6EH
;        JZ  increment1
;        CMP dl, 65H     
;        JZ  decrement1
;        CMP dl, 75H        
;        JZ  multiply1
;        CMP dl, 69H
;        JZ  division1
;        CMP dl, 6FH                         
;        JZ  noOperation1
;        CMP dl, 6CH
;        JZ  clearCarry1
;        JNZ ERROR
;        
;player2turn:
;        CMP dl, 6EH
;        JZ  increment2
;        CMP dl, 65H     
;        JZ  decrement2
;        CMP dl, 75H        
;        JZ  multiply2
;        CMP dl, 69H
;        JZ  division2
;        CMP dl, 6FH                         
;        JZ  noOperation2
;        CMP dl, 6CH
;        JZ  clearCarry2
;        JNZ ERROR        
        
 ;increment1:
; 
; inccomm temp 
; 
; decrement1: 
; 
; deccomm temp 
; 
; multiply1: 
; 
; mulcomm temp
; 
; division1:
; 
; divcomm temp
; 
; noOperation1:
;        NOP
;        JMP endcode
;        
;        
;clearCarry1:
;        MOV p2cf, 0000H
;        JMP endcode
; 
;increment2:
; 
; inccom2 temp 
; 
; decrement2: 
; 
; deccom2 temp 
; 
; multiply2: 
; 
; mulcom2 temp
 
; division2:
; 
; divcom2 temp
; 
; noOperation2:
;        NOP
;        JMP endcode
;        
;        
;clearCarry2:
;        MOV p1cf, 0000H
;        JMP endcode 
 
             
     jump6comm: 
     cmp defineTurns,0                     ; choose which player
     je p1ckdest
     jmp p2ckdest
     
      p1ckdest: 
      
      lea bx,dummy1 
      mov cl,'$'
      mov [bx],cl
      mov [bx+1],cl 
      mov cl,0
      mov eightbitck ,cl
      mov sixtenbitck,cl 
      
     checkaddrdestp1 dest           ;check the the destination addresing mode
     
     convTheregisterp1:                               
                                  ;convert the characters into the memory destination
     convdestp1 dest  
     
      p2ckdest:   
      lea bx,dummy1
      mov cl,'$'
      mov [bx],cl
      mov [bx+1],cl
      
       mov cl,0
      mov eightbitck ,cl
      mov sixtenbitck,cl
      
      checkaddrdestp2 dest 
      
      convTheregisterp2: 
      
      convdestp2 dest                  
     
    checksour:    
     lea bx,source
     mov al,[bx] 
     sub al,30h
     mov [bx],al 
     cmp al,9h
     pushf
     jle checkno
     jmp contchecksource
    checkno:
     inc bx  
     mov cl,[bx]
     cmp cl,24h
     je  fixsour                          ;check if the source is a number not a register
     mov al,[bx] 
     sub al,30h
     mov [bx],al 
     mov al,[bx]
     cmp al,9h     
     jle checkno
     checkNL:
     mov al,[bx] 
     sub al,27h
     mov [bx],al 
     mov al,[bx]
     cmp al,0Fh 
     jle checkno
     jmp ERROR                            ;fix source
     fixsour:                                                     
      mov ax,0h 
      dec bx
      mov al,[bx]
      dec bx  
      mov cl,[bx]
      cmp cl,24h 
      je movfixno
      mov dl,[bx]
      shl dl,4
      add al,dl      
      dec bx 
      mov cl,[bx]
      cmp cl,24h
      je movfixno
      mov ah,[bx]      
      dec bx  
      mov cl,[bx]
      cmp cl,24h
      je movfixno 
      mov dl,[bx]
      shl dl,4
      add ah,dl           
      dec bx 
      mov cl,[bx]
      cmp cl,24h
      je movfixno
      mov cl,[bx]
      cmp cl,0
      je movfixnozero              
      jmp ERROR
    
    contchecksource:                        ;   choose which player
                
    cmp defineTurns,0
     je p1cksour
     jmp p2cksour             
                
     p1cksour:
                                             ;check the the source addresing mode
      Add source,30h   
      checkaddrsourp1 source    
                                           ;continue if the source is a register
     skip1:          
     convsourp1 source   
     

     p2cksour:
     
     Add source,30h                        ;check the the source addresing mode
       
      checkaddrsourp2 source    
                                           ;continue if the source is a register
     skip2:          
     convsourp2 source
    
         
     movfixnozero:
     mov [bx],al                        ;   if the first number is zero
     inc bx
     mov [bx],ah
     inc bx 
     mov cl,24h
     mov [bx],cl
     jmp continue                        ; if the first number isnt zero
     movfixno:
     inc bx 
     mov [bx],al
     inc bx
     mov [bx],ah
     inc bx  
     mov cl,24h
     mov [bx],cl
          
     continue:
     
     lea si , comm1                   ; condition the move command
     lea Di , command
     mov cx,4
     REPE CMPSB
     jE pl1mov
     lea si , comm2                  ; condition the Add command
     lea Di , command                 
     mov cx,4
     REPE CMPSB
     jE pl1ADD                             
     lea si , comm3                    ; condition the Adc command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1ADC 
     lea si , comm4
     lea Di , command                  ; condition the sub command
     mov cx,4
     REPE CMPSB
     jE pl1SUB
     lea si , comm5                   ; condition the sbb command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1SBB  
     lea si , comm6                   ; condition the XOR command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1XOR                           
     lea si , comm7                   ; condition the AND command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1AND  
     lea si , comm8                   ; condition the OR command
     lea Di , command     
     mov cx,3
     REPE CMPSB
     jE pl1OR 
     lea si , comm9                   ; condition the SHL command
     lea Di,  command     
     mov cx,4
     REPE CMPSB
     jE pl1SHL
     lea si , comm10                   ; condition the SHR command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1SHR 
     
     lea si , comm11                   ; condition the inc command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1inc
      
     lea si , comm12                   ; condition the dec command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1dec 
     
     lea si , comm13                   ; condition the mul command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1mul
     
     lea si , comm14                   ; condition the div command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1div
     
     lea si , comm15                   ; condition the nop command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1nop
     
       lea si , comm16                   ; condition the clc command
     lea Di , command     
     mov cx,4
     REPE CMPSB
     jE pl1clc
     
     JMP ERROR                             
   pl1mov:                                    ;enter the mov command 
   
   Movcomm dest,source                       
                                  
   pl1ADD:                                    ;enter the Add command
   
   Addcomm dest,source                     
        
   pl1ADC:                                    ;enter the Adc command
   
   Adccomm dest,source
                                    
   pl1SUB:                                    ;enter the sub command
   
   Subcomm dest,source
   
   pl1SBB:                                    ;enter the sbb command
    
   Sbbcomm dest,source
    
   pl1XOR:                                     ;enter the XOR command
   
    XORcomm dest,source
   
   pl1AND:                                     ;enter the AND command
   
   ANDcomm dest,source 
   
   pl1OR:                                       ;enter the or command
   
    ORcomm dest,source
   
   pl1SHL:
                                                ;enter the shl command
    SHLcomm dest,source
                                                
                                                
   pl1SHR:                                      ;enter the SHR command
   
    SHRcomm dest,source 
    
   pl1inc:
   
    mov si,word ptr dest
    mov cl,[si]
    inc cl
    mov [si],cl 
    clc
    jmp  endcode1
    
   pl1dec:
         
    mov si,word ptr dest
    mov cl,[si]
    dec cl
    mov [si],cl 
    clc
    jmp  endcode1   
      
   pl1mul:
    mov dx,0    
    mov si,word ptr dest
    cmp defineTurns,0
    je p1mul
    mov ax , p1ax
    jmp cmul
    p1mul:
    mov ax, p2ax 
    cmul:   
    
    
    mov cx,[si]
    mul cx 
    
     cmp defineTurns,0
    je p1mul1
    mov p1ax , ax
    mov p1dx,dx
     clc
    jmp  endcode1  
    
    p1mul1:
    mov p2ax, ax 
    mov p2dx, dx 
       
    clc
    jmp  endcode1     
                
    
   pl1div:
    
    mov dx,0    
    mov si,word ptr dest
    cmp defineTurns,0
    je p1div
    mov ax , p1ax
    jmp cdiv
    p1div:
    mov ax, p2ax 
    cdiv:   
    
    
    mov cx,[si]
    div cx 
    
     cmp defineTurns,0
    je p1div1
    mov p1ax , ax
    mov p1dx,dx
     clc
    jmp  endcode1  
    
    p1div1:
    mov p2ax, ax 
    mov p2dx, dx 
       
    clc
    jmp  endcode1     
        
       
   pl1nop:
         
     nop
     jmp endcode1    
   
   pl1clc: 
   mov cx,0
    cmp defineTurns,0
    je clp2flag
    mov p1cf,cx
   clp2flag:
    mov p2cf,cx
   
   jmp endcode1
       
   ERROR:
   
   mov ah,9
   lea dx, errorcode
   int 21h
   cmp defineTurns,0
   jne p1turn
p2turn:
   mov defineTurns, 1 
   jmp endturn    
p1turn:
   mov defineTurns, 0         
   jmp endturn 
                
   endcode1:      
   mov ax,0
   pop ax
   and ax,1h 
   cmp defineTurns,0
   je p1chf    
   
   mov p1cf,ax 
   jmp p1turn  
             
   p1chf:               
   mov p2cf,ax 
      
   jmp p2turn 
   
   ERRORF:
   
   mov ah,9
   lea dx, errorforb
   int 21h     
               
endturn: 
;trace:
;
;mov ah,9
;lea dx, here
;int 21h
;
;;mov bl,p2al
;mov al,[si]
;;add al,30h
;mov ah,2
;mov dl,al
;int 21h

;RegOut 'A','X', 06h,16h ,P1Ax,myResout,mycounter 
;RegOut 'B','X', 06h,17h ,P1Bx,myResOut,mycounter
;RegOut 'C','X', 06h,18h ,P1Cx,myResOut,mycounter 
;RegOut 'D','X', 06h,19h ,P1Dx,myResOut,mycounter 
;RegOut 'S','I', 0Eh,16h ,P1SI,myResOut,mycounter 
;RegOut 'D','I', 0Eh,17h ,P1DI,myResOut,mycounter 
;RegOut 'S','P', 0Eh,18h ,P1SP,myResOut,mycounter 
;RegOut 'B','P', 0Eh,19h ,P1BP,myResOut,mycounter 
;
;RegOut 'A','X', 89h,16h ,P2Ax,myResout,mycounter 
;RegOut 'B','X', 89h,17h ,P2Bx,myResOut,mycounter
;RegOut 'C','X', 89h,18h ,P2Cx,myResOut,mycounter 
;RegOut 'D','X', 89h,19h ,P2Dx,myResOut,mycounter 
;RegOut 'S','I', 91h,16h ,P2SI,myResOut,mycounter 
;RegOut 'D','I', 91h,17h ,P2DI,myResOut,mycounter 
;RegOut 'S','P', 91h,18h ,P2SP,myResOut,mycounter 
;RegOut 'B','P', 91h,19h ,P2BP,myResOut,mycounter
  jmp turns 
  
    hlt   ;remove in final stage                 
process endp
end process