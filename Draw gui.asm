include includes.inc
Public DrawGui, green, cyan, yellow, red, blue
.model small
.386
.stack 300h
.data    
garbage db 'g'
include Data.inc
myCounter db '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'
myResOut  db  '0','0','0','0','$' 
scoremes  db  'score:','$','$','$','$','$','$','$','$','$','$'
CmdMes    db  'Your command$$'
EnemyCmdMes db  'Enemy command$$'
chatline1   db  'this is your message $$'
chatline2   db  'this is the other players message$$'
Res       db  0
.code    
DrawGui proc far 
mov ax,@data        
mov ds,ax          
mov es,ax
hereeoeo:
;Sets Sartingscreen
VideoMode 12h           ;graphics mode
;Pagenum 0h              ;page num 0
;setBackground 00h       ;set Background color black
;
;outline
setcur 0h,10d
cout 0c4h
cout 0c4h
cout 0c2h
cout 0c4h 
cout 0bfh
;___________________________________________________
;outs player 1 data
include p1DOut.inc
;___________________________________________________
;outs player 2 data
include p2DOut.inc
;_____________________________________________________________________
;outline  
setcur 0d,27d
cout 0c4h 
cout 0c4h
cout 0c1h ;t m2lob
cout 0c4h
cout 0c1h ;t m2lob
repcout 0c4h,70,07h
setcur 75d,27d
cout 0c1h ;t m2lob
cout 0c4h
cout 0c1h ;t m2lob 
cout 0c4h
cout 0c4h
;_____________________________________________________________________     
;print player 1 registers content
setcur 06h,15h
colorout   0DAh,0eh
repcout 0c4h,15d,0eh ;border

RegOut 'A','X', 06h,16h ,P1Ax,myResout,mycounter 
RegOut 'B','X', 06h,17h ,P1Bx,myResOut,mycounter
RegOut 'C','X', 06h,18h ,P1Cx,myResOut,mycounter 
RegOut 'D','X', 06h,19h ,P1Dx,myResOut,mycounter 

RegOut 'S','I', 0Eh,16h ,P1SI,myResOut,mycounter 
RegOut 'D','I', 0Eh,17h ,P1DI,myResOut,mycounter 
RegOut 'S','P', 0Eh,18h ,P1SP,myResOut,mycounter 
RegOut 'B','P', 0Eh,19h ,P1BP,myResOut,mycounter

setcur 16h,15h
colorout   0BFh,0eh 
mov cx,4d
mov bl,16h
Athere:
setcur 16h,bl
colorout 0b3h,0eh  ;draw vline
inc bx
dec cx
cmp cx,0
jne Athere
setcur 16h,1Ah
colorout 0D9h,0eh

setcur 06h,1Ah
colorout   0c0h,0eh
repcout 0c4h,15d,0eh ;border
;_____________________________________________________________________     
;print player 2 registers content
setcur 89h,15h
colorout   0DAh,0eh
repcout 0c4h,15d,0eh ;border

RegOut 'A','X', 89h,16h ,P2Ax,myResout,mycounter 
RegOut 'B','X', 89h,17h ,P2Bx,myResOut,mycounter
RegOut 'C','X', 89h,18h ,P2Cx,myResOut,mycounter 
RegOut 'D','X', 89h,19h ,P2Dx,myResOut,mycounter 

RegOut 'S','I', 91h,16h ,P2SI,myResOut,mycounter 
RegOut 'D','I', 91h,17h ,P2DI,myResOut,mycounter 
RegOut 'S','P', 91h,18h ,P2SP,myResOut,mycounter 
RegOut 'B','P', 91h,19h ,P2BP,myResOut,mycounter

setcur 99h,15h
colorout   0BFh,0eh 
mov cx,4d
mov bl,16h
Athererer:
setcur 99h,bl
colorout 0b3h,0eh  ;draw vline
inc bx
dec cx
cmp cx,0
jne Athererer
setcur 99h,1Ah
colorout 0D9h,0eh

setcur 89h,1Ah
colorout   0c0h,0eh
repcout 0c4h,15d,0eh ;border  
;___________________________________________________________
;kan momken ytgm3 fe macro bs real hustla 3l fady
;___________________________________________________________
;names Out
;greem for the player 1,Red for player 2 
setcur 07h ,14h
StrColorOut player1Name,2h     


setcur 8ah ,14h
StrColorOut player2Name,4h 

;____________________________________________________________
;commands out

DrawRec 06h, 13h, 2d, 17d, 0eh
setcur  07h, 12h ;player1 
StrColorOut    CmdMes   , 0eh  

DrawRec 89h, 13h, 2d, 17d, 4h
setcur  8Ah, 12h ;player1 
StrColorOut    EnemyCmdMes   , 04h 

;el commands ht5og mn el input
;____________________________________________________________
;split screen line
DrawVline 40, 0, 27, 0fh 
;____________________________________________________________
;score
setcur 23d, 25d ;player1 
StrColorOut    scoremes   , 0eh   
numxlat p1score,Res,myCounter
cout Res
 
setcur 41d, 25d ;player2 
StrColorOut    scoremes   , 4h   
numxlat p1score,Res,myCounter
cout Res     
;____________________________________________________________
;power ups score 34an leh la2, m4 3ayz ntl3 mars kman ?
    ;green  ;2h        
DrawRec 23d, 24d, 2d, 3d, 2h 
setcur 24d, 23d 
numxlat [green-1],Res,myCounter
colorout [Res+1], 2h 

    ;cyan   ;3h         
DrawRec 27d, 24d, 2d, 3d, 3h 
setcur 28d, 23d 
numxlat [cyan-1],Res,myCounter
colorout [Res+1], 3h    

    ;yellow ;0Eh
DrawRec 31d, 24d, 2d, 3d, 0eh 
setcur 32d, 23d 
numxlat [yellow-1],Res,myCounter
colorout [Res+1], 0eh       
    
    ;red    ;4h 
DrawRec 35d, 24d, 2d, 3d, 4h 
setcur 36d, 23d 
numxlat [red-1],Res,myCounter
colorout [Res+1], 4h            
    
    ;blue   ;1h
DrawRec 41d, 24d, 2d, 3d, 1h 
setcur 42d, 23d 
numxlat [blue-1],Res,myCounter
colorout [Res+1], 1h 
;_______________________________________________________________
;chat 
;names Out
;greem for the player 1,Red for player 2 
setcur 1d , 28d
StrColorOut player1Name,2h     
cout ':'
lea bx , chatline1 
coutstring bx 

setcur 1d , 29d
StrColorOut player2Name,4h 
cout ':' 
lea bx , chatline2 
coutstring bx

;_______________________________________________________________
;3ayz eh tany?! 5las rw7

  cmp defineTurns,0
     je player1input
     jmp player2input

player1input: 
  setcur  07h, 12h ;player1 
  mov AH,0AH
  lea dx, P1Command
  int 21h
 
  
   fixdatain  p1forbiddenchar,forbiddencharnew
     
  fixdatain  P1Command,datainnew
  jmp continuexx
  
player2input:
  setcur  8Ah, 12h ;player2
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
  lea DI, instructions 
  MOV CL, 2 
  MOV CH,6
  SPACE:   
        mov al,[bx]
        CMP al, 20H
        JZ removeSpace
        JNZ save2ndLetter 
        
removeSpace: 
        
        INC BX
        JMP SPACE
        
save2ndLetter: 
         
    MOV DL, [BX+ 1]      
    push bx 
    
  CHECK:
        CMP [DI+ 1], DL
        JNZ notthis
        
        MOV AL, [BX]
        CMP [DI], AL
        JNZ skip6comm
        ADD BX, 2
        MOV AL, [BX]        
        CMP [DI+ 2] , AL
        JNZ ERROR
        INC BX 
        mov dh,[bx]
        CMP dh, 20H
        JNZ ERROR
        JZ  SPACE2 
        
  notThis: 
        DEC CH
        JZ skip6comm
        ADD DI, 3         
        JMP CHECK   
   skip6comm:
   
   pop bx
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
     jmp jump6comm
    

 SPACE2:mov cl,[bx]
        CMP cl, 20H
        JZ removeSpace2
        JNZ checkPart2
 removeSpace2: 
        
        INC BX
        JMP SPACE2 
 checkPart2:
        MOV SI, BX
        lea DI, Registers
        mov cl,[si]
        CMP cl, 5BH
        JZ  SPACE4 
        MOV CL,16
        MOV CH, 1        
        
CHECK2: CMPSW
        JZ SPACE3          ; check the user enter an error
        SUB SI, 2 
        INC CH
        DEC CL        
        JNZ CHECK2
        JZ  ERROR
 SPACE3:mov al,[si] 
        CMP al, 20H
        JZ removeSpace3
        JNZ DSIGN      
        
 removeSpace3: 
        
        INC SI
        JMP SPACE3

 DSIGN: mov al,[si+1] 
        CMP al, 24H
        JZ  FNSH   
        JNZ ERROR
 SPACE4: mov al,[si+1] 
        CMP al, 20H
        JZ removeSpace4
        JNZ BXSIDI      
        
 removeSpace4: 
        
        INC SI
        JMP SPACE4
        
        
 BXSIDI: MOV CH, 17
         INC SI
         MOV CL, 3
         ADD DI, 12
  CHECK4: CMPSW
        JZ SPACE5
        SUB SI, 2
        INC CH 
        DEC CL
        JNZ CHECK4 
        JZ  NUMBER 
        
  incSI:  INC SI 
         
SPACE5: mov al,[si]
        CMP al, 20H
        JZ removeSpace5
        mov al,[si]
        CMP al, 5DH
        JZ  DSIGN
        JNZ ERROR      
        
removeSpace5: 
        
        INC SI
        JMP SPACE5

INCSI2: INC SI
        JMP CONT        
              
        
NUMBER: mov al,[si]
        CMP al, 30H
        JZ  INCSI2
CONT:   MOV CH, 20
        MOV CL, 10
        MOV AL, 30H
CHECK5: CMP [SI], AL
        JZ  incSI
        INC CH
        INC AL
        DEC CL
        JNZ CHECK5                                                 
        JZ  fromAtoF 
        
fromAtoF:
        DEC SI
        mov al,[si]
        CMP al, 30H
        JNZ ERROR
        INC SI
        MOV CH, 30
        MOV CL, 6
        MOV AL, 61H
CHECK6: CMP [SI], AL
        JZ  incSI
        INC CH
        INC AL
        DEC CL
        JNZ CHECK6
        DEC SI
        mov dh,[si]
        CMP dh, 30H
        JNZ ERROR
        MOV CH, 20
        JMP incSI
                                                          
FNSH:cmp defineTurns,0
     je player1turn
     jmp player2turn   
 
player1turn:
        CMP dl, 6EH
        JZ  increment1
        CMP dl, 65H     
        JZ  decrement1
        CMP dl, 75H        
        JZ  multiply1
        CMP dl, 69H
        JZ  division1
        CMP dl, 6FH                         
        JZ  noOperation1
        CMP dl, 6CH
        JZ  clearCarry1
        JNZ ERROR
        
player2turn:
        CMP dl, 6EH
        JZ  increment2
        CMP dl, 65H     
        JZ  decrement2
        CMP dl, 75H        
        JZ  multiply2
        CMP dl, 69H
        JZ  division2
        CMP dl, 6FH                         
        JZ  noOperation2
        CMP dl, 6CH
        JZ  clearCarry2
        JNZ ERROR        
        
 increment1:
 
 inccomm ch 
 
 decrement1: 
 
 deccomm ch 
 
 multiply1: 
 
 mulcomm ch
 
 division1:
 
 divcomm ch
 
 noOperation1:
        NOP
        JMP endcode
        
        
clearCarry1:
        MOV p2cf, 0000H
        JMP endcode
 
increment2:
 
 inccom2 ch 
 
 decrement2: 
 
 deccom2 ch 
 
 multiply2: 
 
 mulcom2 ch
 
 division2:
 
 divcom2 ch
 
 noOperation2:
        NOP
        JMP endcode
        
        
clearCarry2:
        MOV p1cf, 0000H
        JMP endcode 
 
             
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
     mov al,[bx]
     cmp al,24h
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
      mov al,[bx]
      cmp al,24h
      je movfixno
      mov ah,[bx]      
      dec bx  
      mov al,[bx]
      cmp al,24h
      je movfixno 
      mov dl,[bx]
      shl dl,4
      add ah,dl           
      dec bx 
      mov cl,[bx]
      cmp cl,24h
      je movfixno
      mov al,[bx]
      cmp al,0
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
   je p1turn  
             
   p1chf:               
   mov p2cf,ax 
      
   je p2turn 
   
   ERRORF:
   
   mov ah,9
   lea dx, errorforb
   int 21h 
   endcode:
   cmp defineTurns,0
   jne p1turn
   jmp p2turn     
               
endturn:  
jmp hereeoeo
ret
    
DrawGui endp
end drawgui  
