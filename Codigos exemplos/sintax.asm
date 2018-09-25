;MOVIMENTAÇÃO
mov destino, fonte
mov rax, 200
mov rbx, 2fh
mov rax, rcx; vai dar errado pelo tamanho
mov rax, [100] ;[n] = acesso direto a memória principal 
mov rbx, [esi] ;[esi] pega o conteúdo dessa posição de memória e coloca em rbx
;ARITIMÉTICAS

add destino, fonte ;destino = destino + fonte
sub destino, fonte ;destino = destino - fonte
mul fonte ;eax = eax*fonte /// usa o edx caso overflow
div fonte ;eax = eax/fonte
inc fonte ;destino = destino+1
dec fonte ;destino = destino-1

;LÓGICAS

not operando
and op1,op2
or op1, op2
cmp op1, op2 ; altera as flags do processador

;SALTO INCONDICIONAL

jmp local
jmp [100]
jmp [rax]

;SALTO CONDICIONAL

je local ; JE -> salta se igual
jne local; JNE -> salta se não igual
jg [100] ; JG -> salta se maior
jge [100] ; JGE -> salta se maior ou igual
jb [RAX] ; JB -> salta se menor
jbe [RAX] ; JBE -> salta se menor ou igual

;PROCEDIMENTO

push param1 ; ->push altera o rsp automaticamente
push param2
call procedimento ; -> salva end. de retorno na pilha
add rsp, 16 ; -> desempilha param1 e param2 
;...
procedimento:
	push rbp ; -> salva rbp antigo
	mov rbp, rsp ; -> atualiza para o rbp local
	;continuar instruções
	mov rsp, rbp ;{
	pop rbp      ;restaura}
	ret VAR ; -> retorna, assume que o código contém o retorno.