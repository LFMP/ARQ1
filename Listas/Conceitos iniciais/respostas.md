# Conceitos Iniciais

**1. Qual é, em termos gerais, a distinção entre a organização e a arquitetura de computadores?**
	
Arquitetura de computador refere-se aos atributos de um sistema visíveis a um programador ou, em outras palavras, aqueles atributos que possuem um impacto direto sobre a execução lógica de um programa. Organização de computador refere-se às unidades operacionais e suas interconexões que realizam as especificações arquiteturais. 

**2. Qual é, em termos gerais, a distinção entre a estrutura e a função do computador?**

A estrutura diz respeito ao modo como os componentes são organizados, já a função representa a operação individual de cada componente como parte da estrutura.

**3. Quais são as quatro principais funções de um computador?**

* O computador, naturalmente, precisa ser capaz de processar dados. Os dados podem assumir muitas formas e o intervalo de requisitos de processamento é amplo. Porém, veremos que existem apenas alguns métodos fundamentais ou tipos de processamento de dados.
* Também é essencial que um computador armazene dados. Mesmo que o computador esteja processando dados dinamicamente (ou seja, os dados entram, são processados e os resultados saem imediatamente), o computador precisa armazenar temporariamente pelo menos as partes dos dados que estão sendo trabalhadas em determinado momento. Assim, existe pelo menos uma função de armazenamento de dados a curto prazo. Igualmente importante, o computador realiza uma função de armazenamento de dados a longo prazo. Os arquivos de dados são armazenados no computador para subsequente recuperação e atualização.
* O computador precisa ser capaz de movimentar dados entre ele e o mundo exterior. O ambiente operacional do computador consiste em dispositivos que servem como suas origens ou destinos de dados. Quando os dados são recebidos ou entregues a um dispositivo conectado diretamente ao computador, o processo é conhecido como entrada/saída (E/S), e o dispositivo é referenciado como um periférico. Quando os dados são movimentados por distâncias maiores, de ou para um dispositivo remoto, o processo é conhecido como comunicações de dados.
Finalmente, é preciso haver controle dessas três funções, e esse controle é exercido por quem fornece instruções ao computador. Dentro do computador, uma unidade de controle gerencia os recursos do computador e coordena o desempenho de suas partes funcionais em resposta a essas instruções.

**4. Liste e defina os principais componentes estruturais de um computador.**

* Unidade Central de Processamento (cpu): controla a operação do computador e realiza suas funções de processamento de dados; normalmente é chamado apenas de processador.
* Memória principal: armazena dados.
* E/S: move dados entre o computador e seu ambiente externo.
* Interconexão do sistema: algum mecanismo que oferece comunicação entre CPU, memória principal e E/S. Um exemplo comum de interconexão do sistema é por meio de um barramento do sistema, consistindo em uma série de fios condutores aos quais todos os outros componentes se conectam.

**5. Cite os possíveis níveis de um computador. Quais níveis são mais estudados na disciplina de Arquitetura e Organização de Computadores?**

**6. O que é um computador de programa armazenado?**

Em um computador de programa armazenado, os programas são representados em uma forma adequada para armazenar na memória ao lado dos dados. O computador obtém suas instruções lendo-as da memória, e um programa pode ser alterado de acordo com os valores de uma porção da memória.

**7. Cite e explique os componentes do modelo de Von Neumman. Por quê este modelo é importante no ramo da arquitetura de computadores?**

* Uma memória principal, que armazena dados e instruções.
* Uma unidade lógica e aritmética (ALU) capaz de operar sobre dados binários.
* Uma unidade de controle, que interpreta as instruções na memória e faz com que sejam executadas.
* Equipamento de entrada e saída (E/S) operado pela unidade de controle.

Com raras exceções, todos os computadores de hoje têm essa mesma estrutura e função geral, e são conhecidos como máquinas de Von Neumann

**8. O fator crítico de desempenho é na comunicação entre o processador e a memória principal. Explique o que pode/foi feito para melhorar este fator. Como isto está ligado a questão da organização dos computadores?**

* Aumentar a velocidade de hardware do processador. Esse aumento deve-se fundamentalmente ao encolhimento do tamanho das portas lógicas no chip do processador, de modo que mais portas possam ser reunidas mais de perto, aumentando a taxa de clock. Com portas mais próximas, o tempo de propagação para os sinais é significativamente reduzido, permitindo um aumento de velocidade do processador. Um aumento na taxa de clock significa que operações individuais são executadas mais rapidamente.
* Aumentar o tamanho e a velocidade das caches interpostas entre o processador e a memória principal. Em particular, dedicando uma parte do próprio chip do processador à cache, os tempos de acesso à cache caem significativamente.
* 	Fazer mudanças na organização e na arquitetura do processador, que aumentam a velocidade efetiva da execução da instrução. Tipicamente, isso envolve o uso do paralelismo de uma forma ou de outra.

**9. Explique o que são e para que são usados os registradores. Por que eles são importantes?**

São áreas especiais dentro do processador que podem armazenar dados para a realização de operações e seu acesso pelo processadoré praticamente instantâneo.

**10. Explique a Lei de Moore.**

Moore observou que o número de transistores que poderia ser colocado em um
único chip estava dobrando a cada ano e previu corretamente que esse ritmo continuaria no futuro próximo. 

**11. No IAS, como ficaria a instrução de código de máquina (assembly) para carregar o conteúdo do endereço de memória 2? Quantas viagens à memória a CPU precisa fazer para completar essa instrução durante o ciclo de instrução?**

```assembly
LOAD M(2)
```
Cada ciclo de instrução consiste em dois subciclos. Ou seja, duas viagens.

**12. No IAS, descreva o processo que a CPU realiza para ler um valor da memória e escrever um valor na memória em termos do que é colocado em MAR, MBR, barramento de endereço, barramento de dados e barramento de controle.**

Durante o ciclo de busca (fetch cycle), o opcode da próxima instrução é carregado no IR e a parte de endereço é carregada no MAR. Essa instrução pode ser retirada do IBR ou pode ser obtida da memória carregando-se uma palavra no MBR, e depois para o IBR, IR e MAR.

**13. No IBM 360 modelos 65 e 75, os endereços são espalhados em duas unidades separadas de memória principal (Por exemplo, todas as palavras pares em uma unidade e ímpares em outra unidade). Qual poderia ser a finalidade dessa técnica?**

**14. O desempenho do IBM 360 modelo 75 possui um desempenho relativo cinquenta vezes maior que o IBM modelo 30, embora o tempo de ciclo de instrução seja apenas cinco vezes mais rápido (Tabela 4 do Livro). Como você explica essa discrepância.**

No Modelo 30, somente 1 byte (8 bits) poderia ser apanhado da memória principal de cada vez, contra 8 bytes por vez no Modelo 75.

**15. Um programa de benchmark é executado em um processador a 40 MHz. O programa executado consiste em 100000 execuções de instrução, com a seguinte mistura de instruções e quantidade de ciclos de clock (vide tabela no pdf). Determine o CPI efetivo, a taxa de MIPS e o tempo de execução desse programa.**

**16. Considere duas máquinas diferentes, com dois conjuntos de instruções diferentes, ambos tendo uma taxa de clock de 200MHz. As medições a seguir são registradas nas duas máquinas rodando determinado conjunto de programas de benchmark. Determine o CPI efetivo, a taxa MIPS e o tempo de exeução para cada máquina.**

**17. Um computador com um processador de 1.2GHz é mais lento do que um processador de 2.4GHz? Por que?**

**18. O ENIAC era uma máquina decimal, onde um registrador era representado por um anel de dez válvulas. A qualquer momento, somente uma válvula é ativa por vez, representando um dos dez dígitos. Como essa representação poderia ser otimizado?**

**19. Qual a relação da linguagem Assembly com a Arquitetura e Organização de Computadores.**

**20. O que é o computador IAS? Qual a sua importância para a computação?**

**21. Cite e explique resumidamente o funcionamento de cada registrador do IAS.**

**22. Quais são os ciclos realizados pelo IAS para a execução de uma instrução?**

**23. Explique detalhadamente os passos realizados no ciclo de busca de uma instrução no IAS.**

**24. Explique detalhadamente os passos realizados no ciclo de execução de uma instrução de JUMP+ M(X) no IAS.**

**25. Explique detalhadamente os passos realizados no ciclo de execução de uma instrução de STOR M(X) no IAS.**