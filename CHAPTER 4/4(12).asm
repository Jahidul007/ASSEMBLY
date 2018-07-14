.MODEL SMALL
.STACK 100H
.DATA 

MSG1 DB '* * * * * * * * * * *',13,10,'$'
MSG2 DB '* * * * $'
NEW_LINE DB 13,10,'$'
SPACE DB ' $'

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
       
    MOV AH,1
    INT 21H
    MOV BH,AL      
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,NEW_LINE
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
    
    MOV DL,BL
    MOV AH,2
    INT 21H 
    
    LEA DX,SPACE
    MOV AH,9
    INT 21H 
    
    MOV DL,CL
    MOV AH,2
    INT 21H
    
    LEA DX,SPACE
    MOV AH,9
    INT 21H 
    
    MOV DL,BH
    MOV AH,2
    INT 21H 
    
    LEA DX,SPACE
    MOV AH,9
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
     
    LEA DX,NEW_LINE
    MOV AH,9
    INT 21H
    
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H