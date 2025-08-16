.MODEL SMALL
.STACK 100H
.DATA
    arr db 5 dup(?)    
    len equ 5
    msg db "Enter a number: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, len        
    MOV SI, OFFSET arr  

inputLoop:
    ; show message
    MOV AH, 9
    LEA DX, msg
    INT 21H

    ; read one character
    MOV AH, 1
    INT 21H
    SUB AL, 30H        
    MOV [SI], AL       

    INC SI             
    LOOP inputLoop    
    ; now calculate sum (same as before)
    MOV CX, len
    MOV SI, OFFSET arr
    XOR AX, AX

sumLoop:
    ADD AL, [SI]
    INC SI
    LOOP sumLoop

    MOV BL, len
    DIV BL             

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
