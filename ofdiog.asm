.MODEL SMALL
.STACK 100H


.DATA

M1 DB 1,2,3,4,5,6,7,8,9
M2 DB "SUM IS : $"
N DB 2 ;N-1

.CODE
MOV AX,@DATA
MOV DS,AX

LEA SI,M1

MOV CL,02
MOV AX,0000
MOV AL,[SI+2]

LOOP1:
ADD SI,02H

ADD AL,[SI+2]


DEC CL
JNZ LOOP1
AAA
MOV DX,AX
ADD DH,30H
ADD DL,30H
MOV BX,DX

MOV DL,BH
MOV AH,02H
INT 21H
MOV DL,BL
MOV AH,02H
INT 21H

.EXIT
END

