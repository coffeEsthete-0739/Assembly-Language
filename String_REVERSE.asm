.MODEL SMALL
.STACK 100H
.DATA
    str db 20, ?, 20 dup('$')   ; buffer for input
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Input string
    MOV AH, 0Ah
    LEA DX, str
    INT 21H

    ; reverse print
    MOV CL, str+1      ; length
    MOV SI, OFFSET str+2
    ADD SI, CX
    DEC SI

printLoop:
    MOV DL, [SI]
    MOV AH, 2
    INT 21H
    DEC SI
    LOOP printLoop

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
