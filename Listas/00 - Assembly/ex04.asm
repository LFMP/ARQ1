BITS 64
extern printf

section .data
	fmt1 db "Somatorio = %d", 10, 0

section .text
global main
main:
	mov rbp, rsp; for correct debugging
	
	push 2
	call somatorio
	add rsp, 8
	jmp end

	somatorio:
		push rbp
		mov rbp, rsp
		sub rsp,8
		mov qword [RBP-8],1
		mov qword [RBP-16],1 ; "i"

		mov rax,0
		mov rbx,1
		jmp comp

		multip:
			add rax,rbx
			inc rbx
			mov [RBP-8], rax
			mov [RBP-16], rbx

		comp:
			cmp rbx, [RBP+16]
			jbe multip

		mov rsp, rbp
		pop rbp
		ret
		
	end:
		mov rsi, rax
		mov rdi, fmt1
		xor rax, rax
		call printf
		ret