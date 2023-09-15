     ;change all to lower case
     

     fixdatain macro datain , datainnew
     LOCAL  Mystring,  finsh, stringSP, stringS, stringC
   Mov cx,30
   Mov Bx,0h

  LEA Di,datain

  LEA Si,datainnew
     
     Mystring:
     
     Mov Al,[Di+Bx] 
     
     cmp al, 0dh 
     je finsh

            
     Cmp Al,65d     
     jl stringSP
     
     cmp al,91d
     je stringSP

     cmp al,93d
     je stringSP
     
     cmp Al,97d       
     jGE stringS
     
     Sub Al,32d     
     cmp Al,65d     
     jl stringC
      
     stringS:        
     
     Mov [Si+Bx],Al 
     
     Add Bx,1h 
          
     dec cx
     jnz Mystring
     
     stringSP:  
     
     Mov [Si+Bx],Al 
            
     Add Bx,1h
          
     dec cx
     jnz Mystring 
     
     stringC:
     
     add Al,64d       
     Mov [Si+Bx],Al      
     Add Bx,1          
     dec cx
     jnz Mystring

   finsh:
   endm fixdatain