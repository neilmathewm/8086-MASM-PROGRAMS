.model small
.stack

prints macro m
lea dx,m
mov ah,09h
int 21h
endm

readn macro
mov ah,01h
int 21h
sub al,30h
endm

printn macro r
add dl,30h
mov ah,02h
int 21h
endm

.data 
msg1 db 0ah,0dh,"enter the no. to find factorial $"
msg2 db 0ah,0dh,"factorial is $"
STR1 DB 10 dup("$")

.code
 
MOV AX,@data
MOV Ds,AX
prints msg1
readn
mov bl,al
prints msg2
mov al,bl
mov ah,00h
mov bh,00h
dec bl
l1: mul bx
dec bl
cmp bl,00h
jnz l1 
 
   ;Beginning of procedure 
   MOV BX, 10     ;Initializes divisor
   MOV CX, 0000H  
   ;Splitting process starts here
loop1:  
   MOV DX, 0000H    ;Clears DX during jump
   DIV BX      ;Divides AX by BX
   PUSH DX     ;Pushes DX(remainder) to stack
   INC CX      ;Increments counter to track the number of digits
   CMP AX, 0     ;Checks if there is still something in AX to divide
JNE loop1     ;Jumps if AX is not zero
    
loop2: 
   POP DX      ;Pops from stack to DX
   ADD DX, 30H     ;Converts to it's ASCII equivalent
   MOV AH, 02H     
   INT 21H      ;calls DOS to display character
LOOP loop2    ;Loops till CX equals zero
  
  .exit
  end