# REGISTRADORES
São áreas especiais dentro do processador pra armazenar informações.
* **De uso geral:**
	* **RAX**, usado como acumulador;
	* **RBX**, usado para base;
	* **RCX**, usado como contador;
	* **RDX**, usado para dados.
* **Especiais:**
	* **RSP** e **RBP**, usados em operações na pilha;
	* **RSI**(Reg. Source Index) e **RDI**(Reg. Destination Index), usados em operações com agregados de dados.

# PILHA
* Área na memória pra armazenar dados temporários.
* Usado para armazenas parâmetros e variáveis locais.
* Usamos: 
    * **RBP** (Register Base Pointer) e **RSP** (Register Stack Pointer) para o acesso.
    * Instruções **PUSH** (empilhar) e **POP** (desempilhar) para alterar dados na pilha.

# SEÇÕES
Utilizadas para separar instruções, dados e outras regições de memória.
## **.data**
* local de declaração de variáveis constantes
```assembly
section .data:
	mensagem db "hello word"
	tamanho equ 12
	fmt db "numero = %d", 10, 0
```
## **.text**
* local de declaração de instruções
```assembly
section .text:
	global main
	main:
		mov rax,10
		mov rbx, 5
```

# INTERRUPÇÕES
* São chamadas ao SO para um serviço de baixo nível, o processador tem o seu funcionamento interrompido e precisa tratar a interrupção. É necessária para encerrar o programa, imprimir caracteres, abrir arquivos, etc.
* Para chamar uma interrução precisamos colocar o seu código em **RAX** e executar **int 80h**
Por exemplo:
    ```assembly
    mov rax, 1
    mov rbx, 0
    int 80h
    ```
* Obs.: a instrução **RET** faz os comandos acima automaticamente.
* Obs.: o paramêtro **0** de **RBX** é o parâmetro da função **RET**.

# Introdução à arquitetura e organização de computadores
## Arquitetura
* Caracteristicas visíveis ao programador. Por exemplo, existe instrução para fazer multiplicação?
* Função
    * Operação individual de cada componente;
    * Processamento
    * Armazenamento
    * Movimentação
    * Controle de fluxo
## Organização
* Como os recursos são implementados. Por exemplo, a multiplicação possui um circuito dedicado ou é feita por meio de repetidas adições?
## Decisão de projeto
* decisões sobre a arquitetura ou organização dos computadores pelos projetistas como por exemplo, incluir uma instrução de multiplicação.
## Níveis de abstração
* Alto nível:
    * Programas de usuários;
    * Linguagem de programação de alto nível;
    * Assembly.
* Baixo nível:
    * Unidades funcionais (ula, memória);
    * Portas lógicas;
    * Transistores e fios.
## Estrutura
* E/S
    * Ligada ao Barramento
* Barramento
    * Ligado a E/S, CPU e Memória principal
* Memória principal
    * Ligada somento ao Barramentoo 
## Desempenho
* CPU **vs** Memória
## Histórico
* ENIAC
* IAS
# IAS
Um dos primeiros computadores que implementaram o conceito de programa armazenado
* ### Memória
	* Memória de **1024 palavras**.
	* Dois registradores de uso geral: **AC** e **MQ**.
	* Palavra composta de **40 bits**:
		```
		[opcode1][operando1][opcode2][operando2]
		8 bits	   12 bits   8bits     12 bits
		```
* ### Instruções
    * **Tranferência**:
        ```assembly
    	load mq                 // ac = mq
    	load mq, m(x)           // mq = mem(x)
    	stor m(x)               // mem(x) = ac
    	load m(x)               // ac = mem(x)
    	```
    * **Salto**:
    	* Incondicional:
		```
		jump m(x,0:19)         //0:19 = primeira instrução
		jump m(x,20:39)        //20:39 = segunda instrução
		```
        * Se **AC > 0**:
		```
		jump +m(x,0:19)
		jump +m(x,20:39)
		```
    * **Aritmética**:
        ```assembly
    	add m(x) -> ac = ac + mem(x)
    	sub m(x) -> ac = ac - mem(x)
    	mul m(x) -> mq = mq * mem(x)
    	div m(x) -> mq = mq / mem(x)
        ```
    * **Exemplo:** Programa no IAS para somar dois valores na posição, **100** e **101** da memória e armazenar o valor na posição **110**.
        ```assembly
    	load m(100)
    	add m(101)
    	stor m(110)
        ```
* ### Ciclo de execução
  * **Inicio** :arrow_right: **Busca** :left_right_arrow: **Execução** :arrow_right: **Fim**

* ### Existem registradores internos
    * **PC** (contador de programa);
    * **MBR** (buffer de dados/instruções);
    * **IBR** (buffer de instrução);
    * **MAR** (endereço de memória);
    * **IR** (registrador de instrução)
* ### Ciclo de Busca
    Começa em PC.
    ```
    MAR = PC (enviar sinal de leitura para memória)
    MBR = MEM(MAR)
    IBR = MBR(20:39)
    IR = MBR(0:7)
    MAR = MBR(8:19)
    PC = PC + 1
    ```
# Desempenho
* Segundo a Lei de Moore o número de transistores em um chip dobra a cada 18 meses.
* Como aumentar o desempenho?
	* Empacotamento de instruções
	* Largura de Banda
	* Memória cache
	* Pipeline
	* Busca de instrução => Decodificação => Busca de operandos => Execução => Escrita de resultados
	* Previsão de desvio
	* Manter histórico de saltos
	* Maioria dos saltos é laço de repetição
	* Reorganização das instruções
		```assembly
		add rax, rbx
		add rcx, rax
		```
	* O código acima tem dependencia, a segunda estrução fica esperando na busca de operandos até **RAX** sair da escrita dos resultados.
	* Executação especulativa
		* Previsão de valores e desvio
		* Multinúcleo
		* Hyper-Threading
	* Avaliação de desempenho
		* Clock
		* Métricas
			* **CPI** (ciclos por instrução);
			* **CPI Efetivo** (qtd. de instruções por qtd. de ciclos)
			* **mips** (milhões de instruções executadas por segundo, ou seja,  frequência por CPI Efetivo)
			* **Tempo de execução** (qtd. de ciclos por frequência)
	* **Exemplo**: Considere um processador de 40 MHz e um programa com as instruções abaixo.Calcule o CPI efetivo, mips e o tempo de execução.

	    |     Tipo     | 	Quantidade  |	CPI  |	 Qtd. de Ciclos	  |
	    |--------------|----------------|--------|--------------------|
	    |Aritmética    |	45000	    |	1    |	    45000         |
	    |Transferência |	32000	    |	2    |	    64000         |
	    |Desvio        |	15000	    |	2    |	    30000	  |
	    |armazenamento |	8000	    |	2    |	    16000	  |

	* CPI Efetivo
		* Qtd. de instruções: 100000
		* Qtd. de ciclos(qtd. * cpi): 155000
		* CPI Efetivo = 155000/100000 = 1.55
	* Mips
		* Frequencia: 40 MHz
		* CPI Efetivo: 1,55
		* MIPS: 40x10^6/1.55 =~ 25.8
	* Tempo
		* Qtd. de ciclos: 155000
		* Frequencia: 40x10^6
		* Tempo: 155000/40x10^6 = 0.0038 s

* **Exemplo**: Considere um processador de 500 MHz e um programa com 2 milhões de instruções distribuidas abaixo. Calcule o CPI efetivo, mips e o tempo de execução.

    |     Tipo   	 |  Quantidade   |  CPI   |     Qtd.       |
    |--------------------|---------------|--------|----------------|
    |Aritmética      	 |	60%	 |   1    |    1200000 	   |
    |load/store com cache|	18%	 |   2    |	360000 	   |
    |Desvio          	 |	12%	 |   4    |	240000	   |
    |load/store sem cache|	10%	 |   8    |	200000	   |

	* CPI Efetivo
		* Qtd de instruções = 2000000
		* Qtd de ciclos = 4480000
		* CPI Efetivo = 2.24
	* MIPS
		* 500 MHz/ 2.24 = 223,2 MIPS
	* Tempo
		* 4480000/500 MHz = 0.00896 s

# Barramentos
conecta os principais componentes do computador
* CPU
	* rax, rbx, rcx, rdx, pc, mar, mbr, ir, i/oar, i/obr, ula
* Dispositivos de E/S
	* Memória
* Quais informações passam pelo barramento?
	* Dados
	* Endereços
	* Controle
* Tipos de transferência
	* CPU -> Memória
	* Memória -> CPU
	* E/S -> CPU
	* CPU -> E/S
	* E/S -> Memória (DMA)

# Módulos de E/S
* Controlador
	* Dispositivo 0
	* Dispositivo 1
	* Dispositivo 2
```
		   -------------
	   	   |	       |
leitura/escrita  ->|controlador|-> dados 
		   |	       | 
        endereço ->|    ou     |
		   |	       |
           dados ->|módulo E/S |-> interrupção
		   |           |
		   -------------
```
# Memória
```
		   -------------
		   |           |
leitura/escrita  ->|           | 
		   |	       |
        endereço ->|  Memória  |-> dados
		   |	       |
           dados ->|           |
		   |           |
		   -------------
```
# CPU
```
		    -------------
		    |		|
Instruções/dados  ->|           |-> endereço 
                    |	CPU     |-> controle
      interrupção ->|           |-> dados
		    |		|
		    -------------
```
# Barramento de dados
* Transmite dados.
* A largura do barramento impacta a performance.

# Barremento de endereço
* Transmite endereço (posição).
* A largura impacta a capacidade de memória endereçável.

# Barramento de controle
* Temporização (sinal de clock)
* Leitura/ escrita
* Interrupção

# Características dos barramentos
* Número de barramento:
	* Único:
		* Simplicidade.
	* Múltiplos:
		* Desempenho com a memória principal.
	* Dedicado ou multiplexado:
		* O barramento de dados e endereços é multiplexado no mesmo canal.
* Arbitragem:
	* Decide qual dispositivo usa o barramento
	* Central vs distribuido

**Ex.**: Considere um registrador de 32 bits com barramento de dados de 16 bits, com 8 MHz de frequência, o ciclo de barramento leva 4 ciclos de clock. Qual a taxa de transferência do barramento por segundo?
**R.**: 
	8 Mhz/ 4 ciclos  = 2 MHz
	2 bytes por barramento(16 bits) * 2 MHz = 4 MB/s 

# Aritmética Computacional - Números inteiros
* Todas as operações são realizadas pela ULA.
* Todo sistema computacional existe para fornecer dados para a ula.
* A ULA opera sobre dois tipos, inteiro e ponto flutuantes.
* Como representar tais números?
```
	   -------------
	   |   	       |
operação ->|           |-> Flags
           |    ULA    |
dados    ->|	       |-> Resultado
	   |	       |
	   -------------
```

## Representação sinal-magnitude
* O bit mais a esquerda representa o sinal:
	* 1 é negativo
	* 0 é positivo
* Problema com o "0" e tamanho da representação.

## Representação complemento de dois
* o bit mais a esquerda representa o sinal e os números inteiros são transformados.
* **Passos**:
    * Inverter bits
    * Somar 1
    * Colocar o sinal 1
    * Preencher com 1 o restante

    **Ex.**:
    * 17(base 10) = 00010001(base 2)
    * -17(base 10) = 11101111(base 2)

## Operações aritméticas

### Adição: 
* Normal

### Overflow
* Acontece quando o número precisa de mais bits do que o hardware oferece.
* **Detecção de overflow**:
	* A soma de dois números com sinais diferentes nunca gera overflow;
	* A soma de dois números positivos não pode ser negativo;
	* A soma de dois números negativos não pode ser positivo.

### Multiplicação com inteiros sem sinal
* Geração de produtos parciais
* **Processo**:
	* **Carry = 0**
	* **A = 0**
	* **M = multiplicando**
	* **Q = multiplicador**
    * Quantidade de bits é a quantidade de repetições.
	
	* Se Q(0) = 1 => Carry e A = A + M
	* Deslocar Carry, A, Q para direita
	* Ao final o resultado vai estar em A e Q

* **Ex.**: 13 * 11

    | Carry |  A |   Q 	  |   M     |   Passos      |
    |-------|----|--------|---------|---------------|
    |0	    |0000|  1101  |   1011  |Valores Inicias|
    |       |    |        |         | **Passo 1**   |
    |0	    |1011|  1101  |   1011  | Adição        |
    |0	    |0101|  1110  |   1011  |Deslocamento   |
    |       |    |        |         | **Passo 2**   |
    |0 	    |0010|  1111  |   1011  |Deslocamento   |
    |       |    |        |         | **Passo 3**   |
    |0	    |1101|  1111  |   1011  |Adição         |
    |0	    |0110|  1111  |   1011  |Deslocamento   |
    |       |    |        |         | **Passo 4**   |
    |1	    |0001|  1111  |   1011  |Adição         |
    |0	    |1000|  1111  |   1011  |Deslocamento   |

* **Resultado**: 1000 1111(base 2) = 143

### Multiplicação de inteiros em complemento de 2
* Algoritmo de Booth
    * Multiplicador e multiplicando são armazenados nos registradores Q e M
    * Usamos um registrador de 1 bit posicionado a direita de Q, chamado Q(-1)
    * O resultado é dados nos registradores A e Q
    * No início, A e Q1 são 0
    * O bit menos significativo de Q é o comparado com Q1
    * Se os bits forem iguais, A, Q e Q(-1) são deslocados para a direita
    * Se forem diferentes, o M śerá somado ou subtraído de A, e depois A, Q e Q(-1) serão deslocados para a direita se os bits forem 0-1 soma-se. Se os bits forem 1-0 subtrai-se. Usamos sempre o deslocamento aritmético.

* **Ex.**: 7 * 3

    | A	  |  Q | Q(-1) |   M   |       Passos          |
    |-----|----|-------|-------|-----------------------|
    |0000 |0011|   0   |  0111 |Valores Inicias        |
    |     |    |       |       |**Passo 1**            |
    |1001 |0011|   0   |  0111 |Subtração (a= a - m)   |
    |1100 |1001|   1   |  0111 |Deslocamento a direita |
    |     |    |       |       |**Passo 2**            |
    |1110 |0100|   1   |  0111 |Deslocamento a direita |
    |     |    |       |       |**Passo 3**            |
    |0101 |0100|   1   |  0111 |Adição (a = a + m)     |
    |0010 |1010|   0   |  0111 |Deslocamento           |
    |     |    |       |       |**Passo 4**            |
    |0001 |0101|   0   |  0111 |Deslocamento           |

* **Resultado**: 0001 0101(base 2) = 21

* **Ex.**: 4 * -2

    | A	  |  Q | Q(-1) |   M   |       Passos          |
    |-----|----|-------|-------|-----------------------|
    |0000 |0100|   0   |  1110 |Valores Inicias        |
    |     |    |       |       |**Passo 1**            |
    |0000 |0010|   0   |  1110 |Deslocamento a direita |
    |     |    |       |       |**Passo 2**            |
    |0000 |0001|   0   |  1110 |Deslocamento a direita |
    |     |    |       |       |**Passo 3**            |
    |0000 |0001|   1   |  1110 |Subtração (a = a - m)  |
    |0000 |0000|   1   |  1110 |Deslocamento           |
    |     |    |       |       |**Passo 4**            |
    |1111 |0000|   1   |  1110 |Adição (a = a - m)     |
    |1111 |1000|   0   |  1110 |Deslocamento           |
    
* Resultado 11111000(base 2) = -8

# Aritmética Computacional - Números Reais
```
+- Mantissa x Base ^ expoente
    7,452   x  10  ^   9 = 7 452 000 000(10)
```
* Por exemplo:
    * 11 1010 0000(2) = 1,1101x2^9
    * 0,0000 000101(2) = 1,01x2^-8

* **Padrão IEEE 754**
	* **32 bits**:
		* 1 bit para sinal
		* 8 bits para expoente
		* 23 bits para mantissa
	* **64 bit**:
		* 1 bit para sinal
		* 11 bits expoente 
		* 52 bits para mantissa

* Expoente polarizado
A polarização significa que o valor armazenado será sempre positivo, isso é feito  para evitar um passo extra com a transformação do expoente em complemento de dois. Isso significa somar 127 (32bits) ou 1023 (64bits) no valor do expoente.

* Por exemplo, 5.72(10) no padrão IEEE 754 32 bits:
	* 5,72 = 101,11 = 1,0111x2^2

	  |**Sinal** |**Expoente** |	  **Mantissa**            |
	  |----------|-------------|------------------------------|
	  |     0    | 1000 0001   | 0111 0000 0000 0000 0000 000 |

* Por exemplo, -161.875 no padrão IEEE 756 32 bits:
	* 161,875 = 10100001,111 = 1,010000111x2^7

	  |**Sinal** |**Expoente** |      **Mantissa**            |
	  |----------|-------------|------------------------------|
	  |     1    | 1000 0110   | 0100 0011 1100 0000 0000 000 |

## Operações aritméticas

### Adição e subtração

* alinhamento de expoentes
* adição ou subtração da mantissa
* normalização

Por exemplo: 37 - 4,5

|**Sinal**| **Expoente**   |**Bit I**   |	**Mantissa**            |
|---------|----------------|------------|-------------------------------|
|    0	  |   1000 0100    |	1    	| 0010 1000 0000 0000 0000 000  |
|    1	  |   1000 0001    |	1    	| 0010 0000 0000 0000 0000 000  |
|    	  |                |   		|                               |
|    1    |   1000 0010    |   	0	| 1001 0000 0000 0000 0000 000	|
|    1    |   1000 0011    |    0       | 0100 1000 0000 0000 0000 000	|
|    1    |   1000 0100    |	0    	| 0010 0100 0000 0000 0000 000	|
|    	  |                |   		|                               |
|    0 	  |   1000 0100    |	1   	| 0000 0100 0000 0000 0000 000	|

# Representação da instrução
* A instrução é basicamente uma sequência de bits.
* Para facilitar para o programador as instruções podem ser representadas em Assembly.

* Tipos de instrução
	* Processamento
	* Armazenamento de dados
	* Movimentação de dados para E/S
	* Controle de flexo

* Número de endereços
	* Mais endereços
		* Instruções mais complexas (maiores)
		* Menos instruções por programa

	* Menos endereços
		* Mais intruções por programa
		* Instruções mais simples
		* Execução mais rápida
	* É a quantidade de fontes ou destinos que podemos usar
	* 3 endereços => A = A + B + C
	* 2 endereços => A = A + B
	* 1 endereço => A = A + B
		* O acumulador é usado implicitamente, por exemplo:
		```assembly
		load rax
		add rbx
		store rax
		```
	* 0 endereços => A = A + B
		* A pilha é usada implicitamente
		```assembly
		push rax
		push rbx
		add
		pop rax
		```


**Exercício**: Implemente a operação abaixo em assembly com 3, 2, 1 e 0 endereços:

```
A = ((A-B)+C)*D
```

**R.:**

* 3 endereços
	```assembly
	sub rax, rax, rbx
	add rax, rax, rcx
	mul rax, rax, rdx
	```
* 2 endereços
	```assembly
	sub rax, rbx
	add rax, rcx
	mul rax, rdx
	```
* 1 endereço
	```assembly
	load rax
	sub rbx
	add rcx
	mul rdx
	store rax
	```
* 0 endereços
	```assembly
	push rbx
	push rax
	sub
	push rcx
	add
	push rdx
	mul
	pop rax
	```

* Tipos de operandos
	* Endereços.
	* Números.
	* Caractes(ASCII).
	* Dados lógicos (V/F).

* Tipos de operações
	* Transferência de dados (MOV):
		* Existem arquiteturas que diferenciam movimentações entre registradores e memórias.
	* Aritméticas:
		* Básicas (soma, subtração, multiplicação e divisão).
		* A operação altera as flags internas que são usadas no salto condicional.
	* Lógica:
		* Básicas (NOT, AND, OR e XOR).
		* A comparação também é considerada lógica (CMP).
	* Deslocamento:
		* Move todos os bits de um número uma casa para a direita ou esquerda.
		* **Deslocamento lógico:** o bit que entra é sempre zero.
		* **Deslocamento aritmético:** o sinal do número é mantido.
		* **Rotação:** o bit que sai entra no outro lado.

* Entrada e saída
	* Instruções específicas ou movimentação e interrupção.
	* PRINT de um caracter:
	```assembly
	mov $4,%eax
	mov $1,%ebx
	mov str,%ecx
	mov str_tamanho,%edx
	int 80h
	```

* Controle do sistema
	* Instruções privilegiadas.
	* Normalmente envolvem a manipulação do estado interno.

* Transferência de controle
	* Desvios.
	* Procedimentos.

## Modos de endereçamento

O endereçamento se refere as diferentes maneiras que o programador pode se referir a um operando.

* Endereçamento imediato
	* O campo de endereço contém o próprio valor do operando, ele é parte da instrução.
	* Por exemplo:
	```assembly
	add 5       ;           Instrução de um operando
	add rax, 10 ;           Instrução de dois operandos
	```
	* Instrução:
	```
	|Opcode|Operando|
	```
* Endereçamento direto:
	* O campo de endereço contém o endereço do operando. Normalmente usado nas variáveis do **.section data.**
	* Por exemplo:
	```assembly
	add A
	add rax, fmt
	;assumindo que "A" e "fmt" estão definidos no ".section data"
	```
	* Instrução:
	```
	    |Opcode|Endereço|
			|
			|	 Memória
			|     -------------
			|     |    ...    |
			|     |-----------|
			|---->|	Operando  |
			      |-----------|
			      |	   ...    |
			      -------------
	```
* Endereçamento indireto
	* O campo de endereço contém um endereço de memória que contém o endereço do operando.
	* Por exemplo:
	```assembly
	add [A]
	add rbx, [B]
	;A e B são endereços de memória.
	```
	* Instrução:
	```
	    |Opcode|Endereço|
			|
			|	 Memória
			|     -------------
			|     |    ...    |
			|     |-----------|
			|     |	Operando  |<----|
			|     |-----------|     |
			|     |	   ...    |     |
			|---->|     A     |-----|
			      -------------
	```
* Endereçamento direto por registrador
	* Campo de endereço contém o registrador que contém o operando.
	* Por exemplo:
	```assembly
	add rbx, rax
	```
* Endereçamento indireto por registrador
	* Campo de endereço contém o registrador que contém o endereço do operando.
	* Por exemplo:
	```assembly
	add [rax]
	mov rbx, [rax]
	add [rbp-8],10
	```
* Endereçamento por deslocamento
	* O campo de endereços contém:
		* Endereço base
		* Valor deslocamento
	* Por exemplo:
	```assembly
	add [rbp-8],10
	```
	* Instrução:
	```
	   |Opcode|Endereço|Deslocamento|----|
			|		      |
			|     Registradores   |		Memória
			|     -------------   |      -------------
			|     |    ...    |   |      |    ...    |
			|     |-----------|   |      |-----------|
			|---->|	    R     |--(+)---->|  Operando |
			      |-----------|          |-----------|
			      |	   ...    |          |    ...    |
			      -------------          -------------
	```
* Endereçamento relativo
	* O endereço base é implicito como o endereço da instrução atual. Assim, o campo de endereço contém apenas o valor do deslocamento.
* Endereçamento na pilha
	* Os operandos ficam implicitamento no topo da pilha. Por exemplo:
	```assembly
	push A
	push B
	add
	pop C
	```
## Formato da instrução
* O conjunto de instruções pode possuir instruções com tamanhos diferentes ou com tamanho de campos diferentes.
* Suporte a um conjunto complexo de instruções(CISC).
* Suporte a um conjunto reduzido de instruções(RISC).

# Estrutura do Processador

## Interna

```
  ---------------------         -----       ---------------------
  |       ULA         |         |B I|       |   Registradores   |
  |-------------------|         |A N|       |                   |
|>| Flags de Estado   |<------->|R T|<----->|                   |
| |-------------------|         |R E|       |RAX,RBX            |
|>|Deslocador         |<------->|A R|<----->|                   |
| |-------------------|         |M N|       |RSP,RBP            |
|>|Complementador     |<------->|E O|<----->|                   |
| |-------------------|         |N  |       |PC, MAR, MBR, IR   |
|>|Aritmética e Lógica|<------->|T  |       |                   |
  |-------------------|         |O  |       |                   |
          ^                     -----       ---------------------
          |                       ^                   |
          |                       |                   |
          ---------------------------------------------
```

### Registradores

* Armazenamento temporário de informações.
* De uso geral ou específico (FPU, MMX,SSE).
* A tendecia é usar registradores específicos.
* A quantidade e função variam bastante entre diferentes projetos.
* Quantidade de registradores:
	* Em teoria, quanto mais melhor.
	* Na prática, um número muito grande não traz um ganho de performance considerável.
* Tamanho:
	* Grande para conter o maior endereço do sistema e uma palavra de memória.
	* Desejável combinar dois em um só.
	```c
	int a     // 32 bits
	long b    // 64 bits
	float c   // 32 bits
	double d  // 64 bits
	```
* Organização:
  * Visíveis ao usuário.
	* Controle de estado.
		* Uso do SO para controlar o processo atual, o programador não consegue acessar.
* Registradores visíveis ao usuário:
	* Uso geral (RAX, RBX, RCX, RDX, RSI*, RDI*).
	* Dados.
	* Endereços (RBP, RSP).
  * Códigos condicionais (Flags de estado).

## Processador 8086
* Uso geral : AX, BX, CX, DX
* Endereços : BP, SP, SI, DI
* Segmentos : CS (code), DS (data), SC(stack), ES(extra)
	* Controle de estado.
	* Representam a separação do espaço de memória.
* Estado: FLAGS.

### Registradores de Controle de Estado

* PC
	* Programer Counter: ele contém o endereço da próxima instrução. É incrementado no final do ciclo de busca, é alterado sempre quando se realiza um salto.
* MAR
	* Memory Andress Register: o operando deve estar contido no MAR para ocorrer acesso a memória. 
* MBR
	* Memory Buffer Register: os dados são colocados no MBR para que sejam escritos em memória.
* IR
	* Instructions Register: guarda o opcode da operação atual.

# Função do Processador

* Executar instruções.
```
-> Busca de Instrução  <-----
-> Decodificação            |
-> Busca de Operandos       |
-> Execução                 | Reinicio
-> Escrita dos Resultados   |
-> Interrupção              |
-> --------------------------
```

# PreFetch
* No momento de execução o processador coloca uma instrução para executar e busca a próxima.
* Antecessor do Pipeline.

# Pipeline

* Sobreposição temporal de fases de execução das instruções.
* Semelhante a uma linha de montagem industrial.
* Essa técnica aumenta o número de instruções executadas no geral, porém o tempo para uma instrução individual não é afetado.
* Etapas:
	* Busca de instruções(FI);
	* Decodificação(DI);
	* Cálculo de endereço de operandos(CO);
	* Busca de operandos(FO);
	* Execução(EI);
	* Escrita dos resultados(WO).
* O número de etapas podem variar de acordo com o assembly.
	* Em teoria quanto mais etapas melhor o resultado.


|  Instrução  |  1 |  2 |  3 |  4 |  5 |  6 |  7 |  8 |
|-------------|----|----|----|----|----|----|----|----|
|      1      | FI | DI | CO | FO | EI | WO |    |    |
|      2      |    | FI | DI | CO | FO | EI | WO |    |
|      3      |    |    | FI | DI | CO | FO | EI | WO |
|      4      |    |    |    | FI | DI | CO | FO | EI |
|      5      |    |    |    |    | FI | DI | CO | FO |
|      6      |    |    |    |    |    | FI | DI | CO |
|      7      |    |    |    |    |    |    | FI | DI |
|      8      |    |    |    |    |    |    |    | FI |

* Ao fazer um jump as instruções seguintes são ignoradas, esse processo de limpar o pipeline é chamado de Flush e o pipeline precisa ser preeenchido com as novas instruções, com um pipeline de muitas etapas o tempo para preencher o pipeline e soltar a próxima instrução é muito grande.

## Hazerd de recursos

* Duas ou mais instruções precisam do mesmo recurso.
* Exemplo: vamos supor que a memória principal possua só uma única porta de comunicação (uma única solicitação por ciclo de clock). O processador substitui a instrução por um Stall(bolha), até que a instrução possa ser executada, se o recurso não for aumentado o pipeline ficara com muitos Stall e o uso do pipeline pode não ser muito vantajoso.

## Hazerd de dados

* Leitura após escrita (RAW)
	```assembly
	ADD RAX, RCX
	SUB RBX, RAX
	```
	O Pipeline faz Stall até o valor da primeiro instrução ser escrita.

* Escrita após leitura (WAR)
	```assembly
	ADD RAX, RBX
	SUB RBX, RCX
	```
	Só existe em computadores superescalares.

* Escrita após escrita (WAW)
	```assembly
	ADD R3, R1, R2
	SUB R3, R4, R5
	```

* Técnicas para solucionar Hazard de Dados
	* Reordenamento de instruções.
	* Forwanding.
		* Execução manda o resultado para a etapa de busca de operandos.
	* Stall

## Hazard de controle

* Decisão errada sobre um salto condicional.
	* Múltiplos pipelines podem resolver, porém entramos nos problemos de escrita após leitura por exemplo.
	* Busca antecipada de alvo (intercala os dois caminhos)
	* Buffer de repetição
	* Previsão de desvio
		* Estático
		* Dinâmico

* Previsão de desvio com 2 bits
	* Esquerda = penúltimo salto, direita = último salto

	(00 Não salta) -> (01 Não Salta)

	(01 Não salta) -> (10 Salta) && (11 Salta)

	(10 Salta) -> (00 Não salta) && (01 Não Salta)

	(11 Salta) -> (10 Salta)

# Unidade de Controle

## Operações da Unidade de Controle

* O objetivo da UC é sincronizar e controlar todos os aspectos internos da CPU e a comunicação com os componentes externos.

### Funções

* Sequeciamento e execução de micro operações
* Geração dos sinais de controle para essa execução.

## Micro-Operações

* A execução de uma instrução envolve uma série de etapas mais elementares (chamado de ciclo).
* Por exemplo, uma sequência é ciclo de busca, indireto, execução e interrupção.
* Cada ciclo é realizado por uma série de micro-operações.
* Uma micro-operação é uma operação atômica.
* Tipos de micro-operações:
	* Transferência de dados entre registradores ou com interface externa.
	* Uma operação aritmética ou lógica.

### Ciclo de busca

* Registradores envolvídos: MAR, MBR, IR e PC.
```
t1: MAR = PC
t2: Sinal de leitura para memória
t3: MBR = (MEM)
t4: IR = MBR
t5: PC++
```
### Ciclo indireto
```
t1: MAR = IR(endereço)
t2: Sinal de leitura para memória
t3: MBR = (MEM)
t4: IR(endereço) = MBR
```
* Ao final, o R vai estar como se o endereçamento tivesse sido usado.

### Ciclo de execução

* Depende da instrução.
* Exemplos:
```assembly
ADD R1, X ; R1 um registrador e X uma posição da memória
```
```
t1: MAR = IR(X)
t2: Sinal de leitura para memória
t3: MBR = (MEM)
t4: R1 = R1 + MBR
```
```assembly
ISZ X  ; x-> posição de memória
```
* Incrementa X em 1 e pula a próxima instrução se X for zero.
```
t1: MAR = PC
t2: Sinal de leitura para memória
t3: MBR = (MEM)
t4: MBR = MBR + 1
t5: Sinal de escrita para memória (X = MBR)
t6: Verifica flag de zero, se for -> PC++
```

```assembly
CALL PROC
```
-> Chama uma label e retorna para próxima instrução ao final.
```
t1: MBR = PC
    RSP = RSP-8 (considerando 64 bits)
t2: MAR = RSP
t3: Sinal de escrita para memória (Salva pc no topo da pilha)
    PC = PROC
```

### Ciclo de interrupção

* Ao final, a UC verifica se existe interrupção habilitada.
```
t1: MBR = PC
    RSP = RSP-8
t2: MAR = RSP
t3: Sinal de escrita para a memória
    PC = endereço da rotina de interrupção
```

## Implementação

* Em hardware: complexa e inflexível, depende do número de instruções.
* Em software.
* Possui como entradas:
	* IR.
	* Flags de estado.
	* Clock.
	* Sinais de controle do barramento de controle.
* Possui como saídas:
	* Sinais de controle interno da CPU.
	* Sinais de controle externo.

# Unidade de controle microprogramada

* A lógica da Unidade de Controle é especificada por um **microprograma** contendo **microinstruções**.

## Microinstrução

* Para cada micro-operação a UC gera os sinais de controle correspondentes.
* A microinstrução agrupa os sinais de controle de saída.

## Elementos

* Um bit para cada sinal de controle externo.
* Um bit para cada sinal de controle interno.
* Se houver condição para a micro-operação (não confundir com a instrução JUMP):
	* Condição para salto.
	* Endereço para salto.

## Organização

* O conjunto das microinstruções são armazenadas em uma memória de controle.
* A memória define a sequência de micro-operações executadas em cada ciclo e o sequenciamento dessas micro-operações.
```
Lógica de sequenciamento -----> Registrador de endereço de controle
Lógica de sequenciamento -----(leitura)-> Memória de Controle
Registrador de endereço de controle -----> Memória de Controle
Memória de Controle -----> Lógica de sequenciamento
Memória de Controle -----> Registrador de Buffer de Controle
Registrador de Buffer de Controle -----> Sinais de controle
------------------------------------------------------------------------
Memória de controle composta de Ciclos de busca, Ciclo indireto,
Ciclo de execução, Ciclo de interrupção.
------------------------------------------------------------------------
```
## Vantagens
* Simplicidade
* Flexibilidade

## Desvantagens
* Mais lento que implementado em hardware.

# Memória Cache

* A memória do computador é organizada em uma hierarquia.
* O objetivo da cache é reduzir a necessidade de buscar as informações na memória principal.
* O desafio é fazer com que as informações mais acessadas estejam na memória mais rápida.
* Hierarquia de memória:
	* Chip do processador:
		* Registradores
		* Cache
		* Memória principal
	* SSD/HD
	* CD/DVD/BLURAY (Óptico)
	* Fitas magnéticas
* A medida que descemos na hierarquia de memória:
	* O custo diminui.
	* A capacidade aumenta.
	* Aumenta o tempo de acesso.
* Princípios da cache:
	* Memória pequena e rápida entre a memória principal e o processador.
	* Cada linha da cache armazena múltiplas linhas da memória principal. (Princípio da localidade)

```
|CPU| -----(Palavra)----- |CACHE| ----- (BLOCO) ----- |MEMÓRIA PRINCIPAL|
Bloco = várias linhas da memória principal.
```
## Operação

* CPU solicita o acesso a um local de memória.
* Verifica se os dados estão na cache.
* Se sim (Cache Hit), pega da cache.
* Se não (Cache Miss), lê bloco da memória principal, coloca na cache e entrega para o processador.

## Organização

```
-------                                                       ----------
|     |                                                       |        |
|     |--------------------(ENDEREÇO)------------------------>|        |
|     |                         ^                             |B    D  |
|     |                         |                             |A    E  |
|     |                         V                             |R       |
| CPU |                  |-----------|                        |R    S  |
|     |----(CONTROLE)--->|   CACHE   |------(CONTROLE)------->|A    I  |
|     |                  |-----------|                        |M    S  |
|     |                         ^                             |E    T  |
|     |                         |                             |N    E  |
|     |                         v                             |T    M  |
|     |----------------------(DADOS)------------------------->|O    A  |
|     |                                                       |        |
|     |                                                       |        |
-------                                                       ----------

```

## Endereçamento

* A Cache pode armazenar os dados usando memória virtual ou real.
* Endereços reais:
	```
	|CPU|-|MMU|-|CACHE|-|PRINCIPAL|
	```
* Endereços virtuais:
	```
	|CPU|-|CACHE|-|MMU|-|PRINCIPAL|
	```
* MMU faz a tradução entre virtual e real.

## Tamanho

* Em teoria, quanto maior melhor.
* Mais informaçõeslevam mais tempo para serem trazidas da memória principal.
* O princípio da localidade acaba se perdendo.

## Número de caches

```
|CPU|---| L1 |---| L2 |---| L3 |---|Memória Principal|
L1 = 64 KB
L2 = 256 KB
L3 = 8~12 MB
```
* O objetivo é balancear desempenho e tamanho.

## Algoritmo de substituição:

* A cache é menor que a memória principal, logo quando ela fica cheia as linhas precisam ser substituidas.
* Estratégias:
	* FIFO
	* LRU (Least Recently Used): Menos Recentemente Usado
	* LFU (Least Frequently Used): Menos Frequentemente Usado
	* Aleatória

## Política de escrita

* As alterações são feitas na cache.
* Núcleos diferentes possum caches diferentes.
* E/S pode alterar a memória principal.
* Qual o momento ideal de passar as alterações na memória principal? = Política de escrita.
* Estratégias:
	* Write-Back: Atualização só na hora da substituição.
		* É preciso um circuito auxiliar para manter o sincronismo entre caches de diferentes núcleos.
		* E/S acessa a memóra por meio da cache.
		* Maior desempenho.
	* Write-Through: Atualiza a mamória a cada escrita.
		* Menos problemas porém mais lento.
	* Write-Once: Combinação de Write-Throug com Write-Back.]
		* A primeira alteração é propagada para a memória principal e as demais ficam só na cache.

## Tamanho da linha

* Quantidade de palavras da memória em bloco da cache.
* Princípio da localidade.
* Normalmente ntre 8 e 64 palavras por bloco.

## Cache Unificada vs Separada

* Unificada: Dados e instruções na mesma cache.
	* Simplicidade.
* Separada: Dados e instruções em caches separadas.
	* Facilita pro Pipeline.
	* Evitar hazard de recursos entre as etapas de busca de instrução e operandos.

## Mapeamento

* Responsável por determinar onde cada informação da memória principal vai ser na cache.
* O próprio endereço da memória é usado para o mapeamento.
* Como aumentar o cache hit?

* Memória

	| Endereço | Valor |
	|----------|-------|
	|   0000   |   A   |
	|   0001   |   B   |
	|   0010   |   C   |
	|   0011   |   D   |
	|   0100   |   E   |
	|   0101   |   F   |
	|   0110   |   G   |
	|   0111   |   H   |
	|   1000   |   I   |
	|   1001   |   J   |
	|   1010   |   K   |
	|   1011   |   L   |
	|   1100   |   M   |
	|   1101   |   N   |
	|   1110   |   O   |
	|   1111   |   P   |

* Cache

	| Linha | TAG | Palavra | Palavra |
	|-------|-----|---------|---------|
	|  00   |     |         |         |
	|  01   |     |         |         |
	|  10   |     |         |         |
	|  11   |     |         |         |

### Mapeamento direto:

* Cada bloco da memória principal é mapeado para a mesma linha da cache.
* Então cada endereço é dividido em:
	* TAG: Identifica unicamente cada bloco.
	* Linha: Identifica cada linha da cache.
	* Palavra: Identifica uma palavra dentro do bloco
* Exempĺo:
	* Memória com 16 bits(e bits).
	* Cache com 4 linhas.
	* Bloco com 2 palavras.
	* Endereços:
		* TAG: 1 bit.
		* Linha: 2 bits.
		* Palavra: 1 bit.
	*CPU requisita: 0100, 1000, 0011 e 0111

	| Linha | TAG | Palavra | Palavra |
	|-------|-----|---------|---------|
	|  00   |  1  |    I    |    J    |
	|  01   |  0  |    C    |    D    |
	|  10   |  0  |    E    |    F    |
	|  11   |  0  |    G    |    H    |

	* Em seguida requisita 1101 e 1110

	| Linha | TAG | Palavra | Palavra |
	|-------|-----|---------|---------|
	|  00   |  1  |    I    |    J    |
	|  01   |  0  |    C    |    D    |
	|  10   |  1  |    M    |    N    |
	|  11   |  1  |    O    |    P    |