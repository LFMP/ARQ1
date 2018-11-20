extern printf

section .DATA
  fmt1 DB "Fibonacci: %d", 10, 0

section .TEXT
GLOBAL main

main:
  mov RAX, 5 ;Número inteiro n como parâmetro
  call fibonacci
  jmp end

fibonacci:
  push RBP
  mov RBP, RSP
  sub RSP, 8
  mov RBX, 1 ;Retorno da função
  mov RCX, 0 ;Número anterior da sequência
  mov qword [RBP-8], RCX
  mov RDX, 1 ;Número de iterações
  jmp comp

  calc:
    mov qword RCX, [RBP-8]
    mov qword [RBP-8], RBX
    add RBX, RCX
    inc RDX

  comp:
    cmp RDX, RAX
    jb calc

  mov RSP, RBP
  pop RBP
  ret

end:
  mov RSI, RBX
  mov RDI, fmt1
  xor RAX, RAX
  call printf
  ret