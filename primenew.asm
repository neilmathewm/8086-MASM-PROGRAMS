.MODEL  SMALL
.STACK 100
    .DATA
           VAl1     DB      ?
           NL1      DB      0AH,0DH,'ENTER NO:','$'
           NL2      DB      0AH,0DH,'IT IS NOT PRIME','$'
           NL3      DB      0AH,0DH,'IT IS PRIME','$'
           NL4      DB      0AH,0DH,'IT IS NEITHER PRIME NOR COMPOSITE','$'

           .CODE
    MAIN    PROC

            MOV AX,@DATA
            MOV DS,AX

            LEA DX,NL1  
            MOV AH,09H
            INT 21H
    
            MOV AH,01H
            INT 21H
            SUB AL,30H 
            MOV VAL1,AL
            CMP VAL1,01
            JE LBL4
            
            
            MOV AH,00

            DEC AL
            MOV CL,AL

    LBL1:
            CMP CL,1
            JE LBL3
            MOV AH,00
            MOV AL,VAL1
            DIV CL
            CMP AH,00
            JZ LBL2
            DEC CL
            CMP CL,1
            JNE LBL1
            JMP LBL3
    
    LBL2:
    
            MOV AH,09H
            LEA DX,NL2
            INT 21H
            JMP EXIT    
    
    LBL3:
            MOV AH,09H
            LEA DX,NL3
            INT 21H
            JMP EXIT
    
    LBL4:
            MOV AH,09H
            LEA DX,NL4
            INT 21H
            
   
    EXIT:
            MOV AH,4CH
            INT 21H
    
    MAIN    ENDP
            END     MAIN
    