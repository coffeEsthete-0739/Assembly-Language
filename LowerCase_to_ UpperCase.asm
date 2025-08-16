.MODEL SMALL
.STACK 100H
.DATA
    msg db "Enter a letter: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Print message
    MOV AH, 9
    LEA DX, msg
    INT 21H

    ; Read char
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; If lowercase (a–z), convert to uppercase
    CMP BL, 'a'
    JL checkUpper
    CMP BL, 'z'
    JG checkUpper
    SUB BL, 20H
    JMP printChar

checkUpper:
    ; If uppercase (A–Z), convert to lowercase
    CMP BL, 'A'
    JL done
    CMP BL, 'Z'
    JG done
    ADD BL, 20H

printChar:
    MOV DL, BL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
