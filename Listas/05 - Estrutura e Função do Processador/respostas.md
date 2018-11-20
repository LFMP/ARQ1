# Lista de exercícios sobre Estrutura e Função do processador

1. **Cite e explique as principais ações que uma CPU deve executar.**

2. **Quais são os tipos de registradores existentes em um computador? Exemplifique.**

3. **Quanto aos registradores visíveis ao usuário. Em quais tipos são subdivididos? Exemplifique.**

4. **Os registradores de uso geral sempre fazem jus a seu nome? Justifique e exemplifique.**

5. **Discurse sobre as vantagens e desvantagens de registradores de especializados sobre registradores uso geral.**

6. **Quantos registradores de uso geral um computador deve possuir? Justifique.**

7. **Qual o tamanho ideal de um registrador de uso geral?**

8. **O que são registradores de código condicional? Para que podem ser usados? Exemplifique.**

9. **Quais são os principais registradores de controle e estado de uma CPU? Para que são utilizados?**

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