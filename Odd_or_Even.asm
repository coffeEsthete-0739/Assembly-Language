.MODEL SMALL
.STACK 100H
.DATA
    msgOdd  db "Odd$",0
    msgEven db "Even$",0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 1
    INT 21H
    SUB AL, 30H   ; convert ASCII to number
    MOV BL, AL
    AND BL, 1
    JZ even

    LEA DX, msgOdd
    MOV AH, 9
    INT 21H
    JMP done

even:
    LEA DX, msgEven
    MOV AH, 9
    INT 21H

done:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
