macro introText(line, ...)
    if sizeof(...) > 30
        error
        print ""
        print "ERROR: Line <line> is too long. Maximum lenght is 30 characters!"
        print ""
        
    else
        table intro.tbl,ltr
        !a #= 0
        while !a < sizeof(...)
            db $05,$00
            db !a+1,<line>
            if <!a> >= ' ' && <!a> <= 'u'
                dw <!a>
            else
                error
                print ""
                print "Char <!a> not in table!"
                print ""
            endif
            !a #= !a+1
        endif
        cleartable
    endif
endmacro


macro endText(x, y, ...)
    table end.tbl,ltr

    ; Find quantity of spaces
    !spaces #= 0
    !c #= 0   
    while !c < sizeof(...)
        if <!c> >= 'A' && <!c> <= '9'
            if <!c> == ' '
                !spaces #= !spaces+1
            endif
            !c #= !c+1
        else
            error "Char <!c> not in table!"
        endif
    endif
    ;print "SPACES: !spaces"
    
    ; Write Lenght
    !length #= sizeof(...)-!spaces*2
    ;print "LENGTH: !length"
    dw !length
    
    !char #= sizeof(...)-1
    
    ;X Axis Initial Value
    !decx #= !char*8
    
    while !char >= 0
        ;print "CHAR: !char - <!char>"

        if <!char> == ' '
            !decx #= !decx-8
        endif
        if  <!char> != ' '
            ; Write bottom part of letter
            if <x>+!decx >= $0200
                dw <x>+!decx-$0200
            endif
            if <x>+!decx < $0200
                dw <x>+!decx
            endif
            ;dw <x>+!decx
            db <y>+8&$00FF
            dw <!char>+$10
            
            ; Write top part of letter
            if <x>+!decx >= $0200
                dw <x>+!decx-$0200
            endif
            if <x>+!decx < $0200
                dw <x>+!decx
            endif
            ;dw <x>+!decx
            db <y>
            dw <!char>
        
            !decx #= !decx-8
        endif
    
        !char #= !char-1
    endif
    
    cleartable
endmacro
