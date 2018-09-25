BITS 64
extern printf

section .data
	fmt1 db "Valor = %d", 10, 0

section .text
global main
main:
	mov rdx,2
	mov rax,5
	mul rdx
	mov rbx, 0
	add rbx, rax

	mov rdx,2
	mov rax,5
	mul rdx
	add rbx, rax

	mov rdx,3
	mov rax,10
	mul rdx
	add rbx, rax
	mov rax,0

	mov rdx, 3
	mov rax, 10
	mul rdx
	add rbx, rax

	mov rax, rbx
	mov rbx,8
	mov rdx,0
	div rbx

	mov rsi, rax
	mov rdi, fmt1
	xor rax, rax
	call printf
	ret