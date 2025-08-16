.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 1
    INT 21H        ; read char
    CMP AL, 'y'
    JE display
    CMP AL, 'Y'
    JE display
    JMP exit

display:
    MOV DL, AL
    MOV AH, 2
    INT 21H

exit:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
