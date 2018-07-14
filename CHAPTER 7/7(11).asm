.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 'TYPE A BINARY NUMBER UPTO 16 DIGITS:$'
MSG2 DB 10,13,'IN HEX IT IS:$'
.CODE
MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        LEA DX,MSG1
        MOV AH,9
        INT 21H
        XOR BX,BX
        MOV AH,1
        INT 21H
    INPUT:
        CMP AL,0DH
        JE EXIT
        AND AL,0FH
        SHL BX,1
        OR BL,AL
        INT 21H
        JMP INPUT
    EXIT:
        LEA DX,MSG2
        MOV AH,9
        INT 21H
        MOV CX,4
    CONVERT:
        MOV DL,BH
        SHR DL,1
        SHR DL,1
        SHR DL,1
        SHR DL,1
        CMP DL,9
        JBE NUM
        ADD DL,55D
        JMP DISPLAY
    NUM:
         ADD DL,30H
    DISPLAY:
        MOV AH,2
        INT 21H
        RCL BX,1
        RCL BX,1
        RCL BX,1
        RCL BX,1
        LOOP CONVERT
    MAIN ENDP
END MAIN