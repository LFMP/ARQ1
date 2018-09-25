BITS 64
extern printf

section .data
	fmt1 db "Menor = %d", 10, 0
	fmt2 db "Maior = %d", 10, 0

section .text
global main
main:
  mov rbp, rsp; for correct debugging

	mov rax, 3
	mov rbx, 1
	mov rcx, 2

	mov qword [RBP-8], rax ; -> variável "menor"
	mov qword [RBP-16], rax ; ->variável "maior"

	cmp rbx, rax
	jg bma
	cmp rcx, rbx
	jg menorbc
	jmp menorc
	
	bma:
		cmp rcx, rbx
		jb maiorbabc
		mov [RBP-16], rcx
		jmp end

	maiorbabc:
		mov [RBP-16], rbx
		cmp rcx, rax
		jb menorc
		jmp end

	menorc:
		mov [RBP-8], rcx
		jmp end

	menorbc: 
		mov [RBP-8], rbx
		cmp rcx, rax
		jg maiorc
		jmp end

	maiorc:
		mov [rbp-16], rcx
		jmp end

	end:
		sub rsp,16
		mov rsi, [RBP-16]
		mov rdi, fmt2
		xor rax, rax
		call printf

		mov rsi, [RBP-8]
		mov rdi, fmt1
		xor rax, rax
		call printf
		add rsp,16
		ret