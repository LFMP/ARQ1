;##################################################################################################
;COMPILAR
;	nasm -FELF64 exemplo.asm -o exemplo.o
;LINKER
;	gcc -o exemplo exemplo.o -no-pie
;##################################################################################################


BITS 64
;##################################################################################################
;Código em C
;
;int a, b, c
;a = 10
;b = 15
;c = ((a+5)*b)-10

;Código em assembly

mov rax,10
mov rbx,15

add rax,5
mul rbx 
sub rax, 10
mov rcx, rax
mov rax,0
mov rbx,0

;##################################################################################################
;Código em C
;
;int b = 1
;if(a > 5)
;	b+=2
;b+=1

;Código em assembly

mov rax, 1
cmp rax,5
jbe l1
	add rax, 2
l1: 
	add rax,1

;##################################################################################################
;Código em C
;
;int b = 2
;if(a == b)
;	c = a*b	
;else
;	c = a-b
;c += 1

;Código em assembly

;mov rax, 10

mov rbx, 2
cmp rax,rbx
jne l2
	mul rbx
	jmp l3
l2: 
	sub rax,rbx
l3:
	mov rcx, rbx
add rcx, 1

;##################################################################################################
;Código em C
;
;int somatorio(int n)
;	int soma=0
;	int n
;	for(i-0,i<n,i++)
;		soma += i
;	return soma

push 10
call somatorio
add rsp,8

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

;##################################################################################################
;Interrupção
mov rax,1 ; -> Finalizar o programa
mov rbx,0 ; -> código de erro
int 80h
;RET faz a instrução acima automaticamente

;##################################################################################################
