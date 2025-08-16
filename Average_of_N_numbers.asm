.MODEL SMALL
.STACK 100H
.DATA
    arr db 5, 10, 15, 20, 25
    len equ 5
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, len
    MOV SI, OFFSET arr
    XOR AX, AX

sumLoop:
    ADD AL, [SI]
    INC SI
    LOOP sumLoop

    MOV BL, len
    DIV BL       ; AL/BL → quotient in AL

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
