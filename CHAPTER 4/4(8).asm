 .MODEL SMALL
 .STACK 100H
 .DATA 
 MSG  DB 'THE SUM OF$'
 MSG1 DB ' $'
 MSG2 DB ' AND $'
 MSG3 DB ' IS $' 
 TEN  DB 10 
 T2   DB 0
 
 .CODE
 MAIN PROC
    MOV DL,'?'
    MOV AH,2
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL  
    
    MOV AH,1
    INT 21H
    MOV CL,AL 
    
    MOV AH,2 
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H     
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG
    MOV AH,9
    INT 21H    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H     
    
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H     
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    ADD BL,CL   
    
    SUB BL,48D 
    
    
    
    MOV DL,BL
    MOV AH,2
    INT 21H
    
    
    MAIN ENDP
 END MAIN
    
    
    
    
    
    



