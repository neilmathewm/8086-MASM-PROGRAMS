.model small
.stack 100h
.data
msg db 0ah,0dh,'enter the year :  $'
yr db 6,0,6 dup('$')
leap db 0ah,0dh,'leap year  $'
ntleap db 0ah,0dh,'nt leap year  $'


.code

mov ax,@data
mov ds,ax
lea dx,msg
mov ah,09h
int 21h
lea dx,yr
mov ah,0ah
int 21h
lea bx,yr+4
mov ah,[bx]
mov al,[bx+1]
aad
mov bl,04h
div bl
and ah,0ffh
jz l1
lea dx,ntleap
mov ah,09h
int 21h
jmp l2
l1:lea dx,leap
mov ah,09h
int 21h
l2:mov ah,4ch
.exit
end