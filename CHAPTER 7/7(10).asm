.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 10,13,' TYPE A HEX NUMBER (0 TO FFFF):$'
MSG2 DB 10,13,'ILLEGAL HEX DIGIT,TRY AGAIN:$'
MSG3 DB 10,13,'IN BINARY IT IS $'
.CODE        
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    JMP INPUT
    INVALID:
        LEA DX, MSG2
        MOV AH,9
        INT 21H
    INPUT:
        LEA DX,MSG1
        MOV AH,9
        INT 21H 
        
        XOR BX,BX
        MOV CL,4
        MOV AH,1
        INT 21H
    CONVERT:
        CMP AL,0DH
        JE END_INPUT
        CMP AL,'0'
        JB INVALID
        CMP AL,'F'
        JA INVALID
        CMP AL,39H
        JA LETTER
        AND AL,0FH
        JMP LEFT
    LETTER:
         SUB AL,55D ;CONVERT CHAR TO BINARY
    LEFT:
        SHL BX,CL
        OR BL,AL
        MOV AH,1
        INT 21H
        JMP CONVERT
    END_INPUT:
        LEA DX,MSG3
        MOV AH,9
        INT 21H
        XOR DX,DX
        MOV CX,16
    PRINT_BINARY:
        SHL BX,1 ;CATCH BX BIT
        JC ONE ;CF=1
        MOV DL,30H
        JMP DISPLAY
    ONE:
        MOV DL,31H
    DISPLAY:
        MOV AH,2
        INT 21H
        LOOP PRINT_BINARY
MAIN ENDP
END MAIN




