.model small
.STACK 100H
.data
m1 db "hello  $"
.code
mov ax,@DATA
MOV DS,AX
LEA DX,M1
MOV AH,09H
INT 21H
.EXIT
END
