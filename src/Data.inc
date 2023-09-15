                  player1 label byte

    player1Name     db      '$','$','$','$','$','$','$','$','$','$','$','$','$','$','$','$','$','$'
    cmpplayerna     db      '$'
    P1Score  label byte    
    P1Blue	    db	    0
    P1Red	    db      0
    P1Yellow	    db      0
    P1Cyan	    db      0
    P1Green	    db      0
    P1Point         dw      0
    p1pointmes      db      4,?,'$','$','$','$','$'

    ;Game 1
    p1forbiddenchar db      2,?,'m',0dh,'$'
    p1Ax	    label   word
    p1Al            db      00h
    p1Ah            db      00h

                    p1Bx    label word
    p1Bl            db      00h
    p1Bh            db      00h

                    p1Cx    label word
    p1cl            db      00h
    p1ch            db      00h

                    p1Dx    label word
    p1Dl            db      00h
    p1Dh            db      00h

    p1SI            dw      0000h
    p1DI            dw      0000h
    p1SP            dw      0000h
    p1BP            dw      0000h

    P1DATA          DB      00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 
    p1cf	    Dw     0000h 
    
    P1Command       DB     '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'    
;________________________
                    player2 label byte

    player2Name     db      '$','$','$','$','$','$','$','$','$','$','$','$','$','$','$','$','$','$'
    P2Score  label byte    
    P2Blue	    db	    0
    P2Red	    db      0
    P2Yellow	    db      0
    P2Cyan	    db      0
    P2Green	    db      0  
    P2Point         dw      0
    p2pointmes      db      4,?,'$','$','$','$','$'

    ;Game 2
    p2forbiddenchar db      2,?,'$','$','$'

                    p2Ax    label word
    p2Al            db      00h
    p2Ah            db      00h

                    p2Bx    label word
    p2Bl            db      00h
    p2Bh            db      00h

                    p2Cx    label word
    p2cl            db      00h
    p2ch            db      00h

                    p2Dx    label word
    p2Dl            db      00h
    p2Dh            db      00h

    p2SI            dw      0000h
    p2DI            dw      0000h
    p2SP            dw      0000h
    p2BP            dw      0000h
    P2DATA          DB      00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 
    p2cf	    DW      0000h 
    
    P2Command       DB     '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'    
    ;__________________________________
