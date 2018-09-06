BITS 64
extern printf

section .data
	fmt1 db "Register = %d", 10, 0

section .text
global main
main:
	push 6
	call somatorio
	add rsp,8
	jmp end

	somatorio:
		push rbp
		mov rbp, rsp
		sub rsp,16 ; -> reserva espaço para duas variáveis
		mov qword [RBP-8], 0 ; -> variável "soma"
		mov qword [RBP-16], 0 ; ->variável "i"

		mov rax,0
		jmp l5
		l4:
			add [rbp-8], rax
			inc rax
			mov [rbp-16], rax
		l5:
			cmp rax, [rbp+16]
		jb l4
		mov rax,[rbp-8] ; ->retorno em rax
		mov rsp, rbp
		pop rbp
		ret

	end:
		mov rsi, rax
		mov rdi, fmt1
		xor rax, rax
		call printf
		ret