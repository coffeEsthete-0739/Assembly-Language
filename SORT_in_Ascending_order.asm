.MODEL SMALL
.STACK 100H
.DATA
    arr db 5, 2, 8, 1, 4
    len equ 5
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, len
    DEC CX

outer:
    MOV SI, OFFSET arr
    MOV BX, CX

inner:
    MOV AL, [SI]
    CMP AL, [SI+1]
    JBE skip
    XCHG AL, [SI+1]
    MOV [SI], AL
skip:
    INC SI
    DEC BX
    JNZ inner
    LOOP outer

    ; print sorted array
    MOV SI, OFFSET arr
    MOV CX, len
printLoop:
    MOV DL, [SI]
    ADD DL, 30H
    MOV AH, 2
    INT 21H
    INC SI
    LOOP printLoop

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
