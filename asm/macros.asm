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
    endif
endmacro