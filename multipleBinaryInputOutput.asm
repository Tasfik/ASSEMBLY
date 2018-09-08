.MODEL SMALL
.STACK 200H
.DATA
.CODE

MAIN PROC
    
    XOR BX,BX
    MOV AH,1
    MOV CH,0
    LOOP1:
    INT 21H
    CMP AL,0DH
    JE ENTER
    SUB AL,48
    SHL BX,1
    OR BL,AL
    JMP LOOP1
    
    ENTER:
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    JMP PRINT_BIN  ;WRITE DEC IN PLACE OF BIN 
                   ;IF YOU WANT TO SEE THE O/P IN DECIMAL FORMAT
    
    PRINT_BIN: 
    INC CH 
    CMP CH,16 
    JG EXIT
    ROL BX,1
    JC  ONE
    JNC ZERO
    
    ONE:
    MOV AH,2
    MOV DL,'1'
    INT 21H
    JMP PRINT_BIN 
    
    ZERO:
    MOV AH,2
    MOV DL,'0'
    INT 21H
    JMP PRINT_BIN
    
    PRINT_DEC:
    ADD BL,48
    MOV AH,2
    MOV DL,BL
    INT 21H
   
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
