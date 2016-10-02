 .MODEL SMALL

        .STACK 100H

        .DATA

               STR1 DB 0DH,0AH, 'ENTER THE STRING :- $'
               STR2 DB 0DH,0AH, 'YOUR REVERSED STRING IS   :- $'
               nl db 0dh,0ah,'$' 

        .CODE
     
                MOV AX,@DATA
                MOV DS,AX


         L1:
                LEA DX,STR1
                MOV AH,09H
                INT 21H

                MOV CL,00
                MOV AH,01H

         L2:

                INT 21H


                MOV BL,AL

                PUSH BX
                inc cx
                CMP AL,0DH

                JZ L3
                
                JMP L2
                
         L3:

                LEA DX,STR2
                MOV AH,09H
                INT 21H

                lea dx, nl
                mov ah,09h
                int 21h
                                
         L4:
                MOV AH,02H
                POP BX
                MOV DL,BL
                INT 21H
                LOOP L4


        .EXIT

        END  
