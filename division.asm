;Author name: Molita Nuon
;Program title: Demonstrate Numeric IO
;Files in this program: integer_driver.c, division.asm, run.sh
;Course number: CPSC 240
;Assignment number: 1
;Required delivery date: Feb 4, 2019 before 11:59pm
;Purpose: Learn how to embed C library function calls in an X86 module.
;Language of this module: X86 with Intel syntax
;Compile this module: nasm -f elf64 -l division.lis -o division.o division.asm

extern printf
extern scanf
global division

segment .data

initialmessage db "This X86 program will demonstrate operations with integers.", 10, 0
promptmessage db "Please enter the integer: ", 0
outmessage db "The product of these two integers is: %i", 10, 0
promptmessage2 db "Please enter the second integer: ", 0
outmessage2 db "The quotient of the first divided by the second is %i with remainder %i", 10, 0
goodbye db "This assembly function will now return the remainder to the driver.",10, 0

longformat db "%ld", 0
stringformat db "%s", 0

segment .text

division:

push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rsi
push rdi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

;welcome message
mov qword rax, 0
mov rdi, stringformat
mov rsi, initialmessage
call printf

;ask for the integer
mov qword rax, 0
mov rdi, stringformat
mov rsi, promptmessage
call printf

;obtain the Input of the first integer
push qword 0
mov qword rax, 0
mov rdi, longformat
push qword 0
mov rsi, rsp
call scanf
pop r15

;ask for the 2nd integer
mov  rax, 0
mov rdi, stringformat
mov rsi, promptmessage2
call printf

;obtain the 2nd integer
mov  rax, 0
mov rdi, longformat
push qword 0
mov rsi, rsp
call scanf
pop r14

;multiply the two integers
mov r13, r15
imul r15, r14

;print out the product of the two integers
mov rax, 0
mov rdi, outmessage
mov rsi, r15
call printf

;divide first integer by second integer
mov rax, r13
cqo
idiv r14
mov r12, rax
mov r11, rdx

;print the quotient and remainder
mov rax, 0
mov rdi, outmessage2
mov rsi, r12
mov rdx, r11
call printf

;conclusion message
mov qword rax, 0
mov rdi, stringformat
mov rsi, goodbye
call printf

;return the remainder to the driver
mov rax, r13
cqo
idiv r14
mov rax, rdx


popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rdi
pop rsi
pop rdx
pop rcx
pop rcx
pop rbx
pop rbp

ret
