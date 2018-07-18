.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    
    MOV AL,3
    MOV BH,5
    
    ADD AL,BH 
    ADD AL,48
    
    
    MOV AH,2  
    MOV DL,AL
    INT 21H
    
    EXIT:  
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    