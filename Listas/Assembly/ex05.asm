BITS 64
EXTERN printf

section .data
	fmt1 db "valor = %d", 10, 0

section .text
global main
main:
	push 3
	call fatorial
	add rsp,8
	jmp end

	fatorial:
		push rbp
		mov rbp, rsp
		sub rsp,16 ; -> reserva espaço para duas variáveis
		mov qword [RBP-8], 1 ; -> variável "f"
		mov qword [RBP-16], 1 ; ->variável "i"

		mov rax,1
		mov rbx,1
		jmp l2
		l1:
			mul rbx
			inc rbx
			mov [rbp-8], rax
			mov [rbp-16], rbx
		l2:
			cmp rbx, [rbp+16]
			jbe l1
		mov rsp, rbp
		pop rbp
		ret
	end:
		mov rsi, rax
		mov rdi, fmt1
		xor rax, rax
		call printf
		ret