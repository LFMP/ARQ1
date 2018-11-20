# Lista de exercícios sobre Estrutura e Função do processador

1. **Cite e explique as principais ações que uma CPU deve executar.**

    * Buscar instrução : o processador lê uma instrução da memória (registrador, cache, memória principal).
    * Interpretar a instrução : a instrução é decodifi cada para determinar qual ação é requerida.
    * Obter os dados : a execução de uma instrução pode requerer leitura de dados da memória ou um módulo de E/S.
    * processar os dados : a execução de uma instrução pode requerer efetuar alguma operação aritmética ou lógica com os dados.
    * gravar os dados : os resultados de uma execução podem requerer gravar dados para memória ou um módulo E/S.

2. **Quais são os tipos de registradores existentes em um computador? Exemplifique.**

    * Registradores visíveis ao usuário : possibilitam que o programador de linguagem de máquina ou assembly minimize as referências à memória, pela otimização do uso de registradores.
    * Registradores de controle e estado : usados pela unidade de controle para controlar a operação do processador e por programas privilegiados do Sistema Operacional para controlar a execução de programas.

3. **Quanto aos registradores visíveis ao usuário. Em quais tipos são subdivididos? Exemplifique.**
    * Registradores de propósito geral: podem ser atribuídos para uma variedade de funções pelo programador. Algumas vezes, seu uso dentro do conjunto de instruções é ortogonal para a operação. Isto é, qualquer registrador de uso geral pode conter um operando para qualquer opcode. Isso permite o verdadeiro uso dos registradores de propósito geral. No entanto, frequentemente existem restrições. Por exemplo, pode haver registradores dedicados para ponto flutuante e operações de pilha. Em alguns casos, os registradores de propósito geral podem ser usados para funções de endereçamento (por exemplo, indireto por registradores, deslocamento). Em outros casos, existe uma separação clara ou parcial entre os registradores de dados e os de endereços.
    * Registradores de dados: podem ser usados apenas para guardar dados e não podem ser empregados para calcular o endereço de um operando.
    * Registradores de endereços: podem ser, de certa forma, de uso geral ou podem ser dedicados para um modo de endereçamento em particular.
    * Registradores de códigos condicionais: os bits de códigos condicionais são coletados em um ou mais registradores. Normalmente eles fazem parte do registrador de controle. Geralmente, as instruções de máquina permitem que esses bits sejam lidos por referência implícita, mas o programador não pode alterá-los.

4. **Os registradores de uso geral sempre fazem jus a seu nome? Justifique e exemplifique.**

    * Não, frequentemente existem restrições. Por exemplo, pode haver registradores dedicados para ponto flutuante e operações de pilha.

5. **Discurse sobre as vantagens e desvantagens de registradores de especializados sobre registradores uso geral.**

    * Uso geral: Aumenta o tamanho e complexidade das instrução. Aumenta a flexibilidade e opções na programação.
    * Uso específico: Menor flexibilidade e opções na programação. Permite referência implícita aos registradores. Diminui o tamanho e complexidade das instruções.  

6. **Quantos registradores de uso geral um computador deve possuir? Justifique.**

    * Não há um número idela. A quantidade afeta o projeto do conjunto de instruções, quanto mais registradores, maior o número de bits para especificar os operandos. O número comum é entre 8 e 32.

7. **Qual o tamanho ideal de um registrador de uso geral?**

    * Grande o suficiente para conter o maior endereço do sistema.
    * Grande o suficiente para conter uma palavra de memória.
    * É desejável que se possa combinar dois registradores de dados para conter valores de tamanho duplo.

8. **O que são registradores de código condicional? Para que podem ser usados? Exemplifique.**

    * Os bits de códigos condicionais são coletados em um ou mais registradores. Normalmente eles fazem parte do registrador de controle. Geralmente, as instruções de máquina permitem que esses bits sejam lidos por referência implícita, mas o programador não pode alterá-los. Exemplo: Jump If Zero (`JZ`).

9. **Quais são os principais registradores de controle e estado de uma CPU? Para que são utilizados?**

    * Contador de programas (`PC`) : contém o endereço de uma instrução a ser lida.
    * Registrador da instrução (`IR`) : contém a instrução lida mais recentemente.
    * Registrador de endereço de memória (`MAR`) : contém o endereço de uma posição de memória.
    * Registrador de buff er de memória (`MBR`) : contém uma palavra de dados para ser escrita na memória ou a palavra lida mais recentemente.

10. **O que é a busca antecipada (pre-fetch)? Ela aumenta a performance da CPU?**

11. **O que é pipelining? O que ele melhora em termos de desempenho da CPU?**

12. **Discurse sobre a frase "O pipeline não reduz o tempo gasto para completar cada instrução individualmente".**

13. **Cite as fases mais comuns de existirem em um pipeline.**

14. **O que é um hazard no pipeline? Quais tipos de hazard podem existir?**

15. **Explique o que é um hazard de recursos. Exemplifique. Qual solução pode ser adotada para resolver este tipo de problema?**

16. **Em quais subtipos podem ser divididos os hazards de dados? Exemplifique cada um desses tipos.**

17. **Geralmente, quando ocorre um hazard no pipeline é necessário que se faça pará-lo por uma quantidade de tempo. Como isto pode ser feito?**

18. **Porque a leitura após escrita (RAW) também é chamada de dependência verdadeira?**

19. **Quais técnicas podemos utilizar para resolver hazards de dados?**

20. **O que é um hazard de controle? Quais formas podem ser utilizadas para lidar com este tipo de problema? Explique brevemente cada uma delas.**

21. **Porque as técnicas para solução de hazards de controle podem ser divididas em estáticas e dinâmicas?**

22. **Explique o funcionamento da técnica de lidar com hazards de controle chamada previsão de desvio.**

23. **Um processador de pipeline tem uma taxa de clock de 2.5 Ghz e executa um programa de 2 milhões de instruções. O pipeline possui cinco estágios e as instruções são emitidas numa taxa e uma por ciclo de clock. Ignore as penalidades por causa das instruções de desvio e execuções fora de ordem.**

    1. **Qual a diferença de velocidade deste processador para este programa comparado a um processador sem pipeline.**

    2. **Qual o rendimento em MIPS do processador com pipeline?**

24. **Um processador sem pipeline tem uma taxa de clock de 2.5 Ghz e um CPI médio de 4. Uma atualização no processador introduz um pipeline de cinco estágios com um CPI médio de 1. No entanto, por causa dos atrasos internos do pipeline, a taxa de clock do novo processador deve ser reduzida para 2 Ghz.**

    1. **Qual o aumento de velocidade obtido para um programa típico?**
  
    2. **Qual a taxa em MIPS para cada processador?**

25. **Considere o seguinte programa na linguagem de montagem:**

    ```assembly
    Move R3, R7
    Load R8, (R3)
    Add R3, R3, 4
    Load R9, (R3)
    BLE R8, R9, L3 ; Salte se R8 <= R9
    ```
* **Este programa inclui dependências WAW, RAW e WAR. Quais?**

26. **Sobre o trecho de código de montagem abaixo:**

    ```assembly
    R1 = 100
    R1 = R2 + R4
    R2 = R4 - 25
    R4 = R1 + R3
    R1 = R1 + 30
    ```
* **Este programa inclui dependências WAW, RAW e WAR. Quais?**