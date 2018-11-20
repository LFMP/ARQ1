BITS 64
extern printf

section .data
	fmt1 db "Valor = %d", 10, 0

section .text
global main
main:
	mov rdx,0
	mov rax,10
	add rax,15
	add rax,5
	mov rbx,3
	div rbx

	mov rsi, rax
	mov rdi, fmt1
	xor rax, rax
	call printf
	ret