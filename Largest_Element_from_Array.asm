.MODEL SMALL
.STACK 100H
.DATA
    arr db 5, 10, 2, 20, 15
    len equ 5
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CL, len
    MOV SI, OFFSET arr
    MOV AL, [SI]
    DEC CL
    INC SI

next:
    CMP AL, [SI]
    JGE skip
    MOV AL, [SI]
skip:
    INC SI
    DEC CL
    JNZ next

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
