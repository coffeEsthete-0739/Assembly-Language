.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV BL, AL

    MOV AH, 1
    INT 21H
    SUB AL, 30H

    CMP BL, AL
    JL first
    MOV DL, AL
    JMP print

first:
    MOV DL, BL

print:
    ADD DL, 30H
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
