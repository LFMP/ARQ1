BITS 64
extern printf

section .data
	fmt1 db "Valor = %d", 10, 0 ; -> "fmt1"=nome de uma variável, "10" = ENTER, "0" = "\0"

section .text
global main
main:
	mov rax, 10
	mov rsi, rax
	mov rdi, fmt1
	xor rax, rax
	call printf
	ret