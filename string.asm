DATA SEGMENT
        STR1 DB "ENTER YOUR STRING HERE ->$"
        STR2 DB "YOUR STRING IS ->$"
        STR3 DB "LENGTH OF STRING IS(DIRECT) ->$"
        STR4 DB "LENGTH OF STRING IS(COUNT) ->$"
        INSTR1 DB 20 DUP("$")
        NEWLINE DB 10,13,"$"
        LN DB 5 DUP("$")
        N DB "$"
        S DB ?

DATA ENDS

CODE SEGMENT
        ASSUME DS:DATA,CS:CODE
START:

        MOV AX,DATA
        MOV DS,AX

        LEA SI,INSTR1

;GET STRING
        MOV AH,09H
        LEA DX,STR1
        INT 21H

        MOV AH,0AH
        MOV DX,SI
        INT 21H


        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H

;PRINT THE STRING

        MOV AH,09H
        LEA DX,STR2
        INT 21H

        MOV AH,09H
        LEA DX,INSTR1+2
        INT 21H

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H

;PRINT LENGTH OF STRING (DIRECT)
        MOV AH,09H
        LEA DX,STR3
        INT 21H

        MOV BL,INSTR1+1

        ADD BL,30H
        MOV AH,02H
        MOV DL,BL
        INT 21H

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H


;PRINT LENGTH OF STRING ANOTHER WAY

        MOV AH,09H
        LEA DX,STR4
        INT 21H
        
        ADD SI,2
        MOV AX,00


     L2:CMP BYTE PTR[SI],"$"
        JE L1
        INC SI
        ADD AL,1
        JMP L2

     L1:SUB AL,1
        ADD AL,30H
                       
        MOV AH,02H
        MOV DL,AL
        INT 21H


        MOV AH,4CH
        INT 21H


CODE ENDS
END START