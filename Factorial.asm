.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV AH, 1
    INT 21H
    SUB AL, 30H
    MOV CL, AL    ; number in CL

    MOV AX, 1

fact:
    MUL CL
    DEC CL
    JNZ fact

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
