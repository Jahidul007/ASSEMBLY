.MODEL SMALL
.STACK 100H
.DATA

MSG  DB 'ENTER A HEX DIGIT: $'
MSG1 DB 13,10,'IN DECIMAL IT IS $'    

.CODE 

MAIN PROC    
    
    MOV AX, @DATA 
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,17D 
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
       
    MOV AH,2
    MOV DL,49D 
    INT 21H
          
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MAIN ENDP
END MAIN
    