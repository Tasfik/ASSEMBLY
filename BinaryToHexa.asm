INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 200H
.DATA
.CODE
MAIN PROC
    
    XOR BX,BX 
    XOR CX,CX
    MOV DH,0
    LOOP1:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE ENTER 
    SUB AL,48
    SHL BX,1
    OR  BL,AL
    JMP LOOP1
    
    ENTER:
    PRINTN 
    
    LOOP2:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JE ENTER2 
    SUB AL,48
    SHL CX,1
    OR  CL,AL
    JMP LOOP2
    
    ENTER2:
    PRINTN 
    
    
    ADD BX,CX
    PRINTN 
    XOR DH,DH
    ;HEXA CONVERTION STARTS HERE 
    LOOP3: 
    INC DH
    CMP DH,4
    JG EXIT
    XOR CX,CX
    MOV CH,BH
    SHR CH,4
    CMP CH,9
    JG LETTER
    ADD CH,48
    MOV AH,2
    MOV DL,CH 
    INT 21H
    THIS:
    ROL BX,4
    JMP LOOP3
    
    LETTER:
    ADD CH,55
    MOV AH,2
    MOV DL,CH 
    INT 21H
    JMP THIS
    ;HEXA CONVERTION ENDS HERE
    ;PRINT:
;    INC DH
;    CMP DH,16 
;    JG EXIT
;    SHL BX,1
;    JC  ONE
;    JNC ZERO
;    
;    
;    ONE:
;    MOV AH,2
;    MOV DL,'1'
;    INT 21H
;    JMP PRINT
;    
;    ZERO:
;    MOV AH,2
;    MOV DL,'0'
;    INT 21H
;    JMP PRINT
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN