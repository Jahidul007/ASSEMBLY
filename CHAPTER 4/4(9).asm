.MODEL SMALL
.STACK 100H
.DATA

MSG DB 'ENTER THREE INITIALS: $' 
NEW_LINE DB 13,10,'$'

.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG 
    MOV AH,9
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
    
    LEA DX,NEW_LINE 
    MOV AH,9
    INT 21H 
    
    MOV AH,02
    MOV DL,BL
    INT 21H
             
    LEA DX,NEW_LINE 
    MOV AH,9
    INT 21H 
    
    MOV AH,02
    MOV DL,CL
    INT 21H
    
     LEA DX,NEW_LINE 
    MOV AH,9
    INT 21H 
    
    MOV AH,02
    MOV DL,BH
    INT 21H       
    
    
    MOV AX,4C00H
    INT 21H 
    MAIN ENDP
END MAIN
