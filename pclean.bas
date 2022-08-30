#COMPILE EXE
#DIM ALL

FUNCTION PBMAIN () AS LONG

    '
    ' PowerClean Log File Sanitizer v1.00
    ' Programming by Robert Wolfe <robert.wolfe@robertwolfe.org>
    ' Originally Written and Compiled Using PowerBASIC/CC v6.0
    ' Code and Binary are in the Public Domain.
    '
    ' If you use this code in your own projects, please give credit
    ' where credit is due. :)
    '

    DIM searchfor AS STRING
    DIM replacewith AS STRING
    DIM original AS STRING
    DIM cleanfile AS STRING
    DIM filedata AS STRING

    original = COMMAND$(1)
    cleanfile = COMMAND$(1) + "_CLEAN"
    searchfor = COMMAND$(2)
    replacewith = COMMAND$(3)

    PRINT
    PRINT "PowerClean Log File Sanitizer v1.00"
    PRINT "Written and Compiled Using PowerBASIC/CC v6.03"
    PRINT "Coding by Robert Wolfe <robert.wolfe@robertwolfe.org>"
    PRINT "Code and Binary are in the Public Domain."
    PRINT
    IF COMMAND$(1) = "" THEN
        PRINT "Use: PCLEAN.EXE <source_file> <search_text> <replace_text>"
        PRINT
        PRINT "<source_file> - The name of the original file that you need cleaned."
        PRINT "<search_text> - The text you want to be replaced."
        PRINT "<replace_txt> - What you want <search_text> to be replaced with."
        PRINT
        PRINT "NOTE!  The cleaned file will be the same filename as <source_file>"
        PRINT "but with '_CLEAN' addded to the end of it and will be create in"
        PRINT "the same directory that this program was run from."
        PRINT
        END
    END IF
    PRINT "    Input Data File: "; UCASE$(original)
    PRINT "Cleaned Output File: "; UCASE$(cleanfile)
    PRINT
    PRINT "Opening original data file for reading. ";
    OPEN original FOR INPUT AS #1
    PRINT "DONE!"
    PRINT "Opening sanitized file for writing. ";
    OPEN cleanfile FOR OUTPUT AS #2
    PRINT "DONE!"
    PRINT
    PRINT "Searching for: "; searchfor
    PRINT "Replacing with: "; replacewith
    WHILE NOT EOF(1)
        LINE INPUT #1, filedata
        REGREPL "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" IN filedata WITH "ip.local"
        REGREPL "[a-z]+\.[a-z]+\.[a-z]+\.[a-z]+" IN filedata WITH "host.local"
        REGREPL "[A-Z]+\.[A-Z]+\.[A-Z]+\.[Z-Z]+" IN filedata WITH "host.local"
    WEND
    CLOSE #1
    CLOSE #2
    PRINT "Processing completed.
END FUNCTION
