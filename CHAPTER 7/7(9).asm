.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB 10,13,'TYPE A CHARACTER:$'
MSG2 DB 10,13,'THE ASCII CODE OF $'
MSG3 DB ' IN HEX IS:$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX 
    
    INPUT:
        LEA DX,MSG1
        MOV AH,9
        INT 21H
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        CMP BL,0DH 
        JE END
        
        LEA DX,MSG2
        MOV AH,9
        INT 21H 
        
        MOV DL,BL
        MOV AH,2
        INT 21H 
        
        LEA DX,MSG3
        MOV AH,9
        INT 21H 
        
        MOV CX,4
    CONVERT:
        MOV DL,BH
        SHR DL,1 ;SHIFT LEFT 4 TIMES
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
        RCL BX,1 ;ROTATE CARRY LEFT 4 TIMES
        RCL BX,1
        RCL BX,1
        RCL BX,1
        LOOP CONVERT
        JMP INPUT
    END:
        MOV AH,4CH
        INT 21H
    MAIN ENDP
END MAIN