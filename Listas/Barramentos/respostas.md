# Barramentos

**1. O que é o barramento de um computador?**

Tipicamente, um barramento consiste em múltiplos caminhos de comunicação, ou linhas. Cada linha é capaz de transmitir sinais representando o binário 1 e o binário 0. Com o tempo, uma sequência de dígitos binários pode ser transmitida por uma única linha. Juntas, várias linhas de um barramento podem ser usadas para transmitir dígitos binários simultaneamente (em paralelo). Por exemplo, uma unidade de dados de 8 bits pode ser transmitida por oito linhas de barramento.

**2. Quais são os tipos de transferências que podem ocorrer no barramento de um computador.**

* CPU -> Memória
* Memória -> CPU
* E/S -> CPU
* CPU -> E/S
* E/S -> Memória (DMA)

**3. O que é a arbitragem do barramento?**

Apenas um módulo pode controlar o barramento por vez apesar de mais de um módulo poder ler ao mesmo tempo então, faz-se necessário regras para ceder o controle do barramento. As regras definem mestre (que controla) e escravos (que são controlados).

**4. Que tipos de transferências a estrutura de interconexão de computador (por exemplo, barramento) precisa aceitar?**

* CPU -> Memória
* Memória -> CPU
* E/S -> CPU
* CPU -> E/S
* E/S -> Memória (DMA)

**5. Qual é o benefício de usar a arquitetura de barramento múltiplo em comparação com uma arquitetura de barramento único?**

A memória principal pode ser movida do barramento local para o barramento do sistema. Desse modo, as transferências de E/S de e para a memória principal pelo barramento do sistema não interferem com a atividade do processador. É possível conectar controladores de E/S diretamente no barramento do sistema. Uma solução mais eficiente é utilizar um ou mais barramentos de expansão para essa fi nalidade. Uma interface de barramento de expansão coloca em um buffer as transferências de dados entre o barramento do sistema e os controladores de E/S no barramento de expansão. Esse arranjo permite que o sistema aceite uma grande variedade de dispositivos de E/S e, ao mesmo tempo, isole o tráfego memória-para-processador do tráfego de E/S.

**6. Considere um microprocessador de 32 bits hipotético com instruções de 32 bits, compostas de dois campos: o primeiro byte contém o opcode e o restante, o operando imediato ou o endereço de um operando.**

* **Qual é a capacidade de memória máxima endereçavel diretamente (em bytes)?**

* **Qual o impacto sobre o desempenho do sistema se o barramento de endereço possui 32 bits e o barramento de dados possuir 16 bits.**

* **Quantos bits são necessários para o contador do programa (PC) e o registrador de instrução (IR)?**

**7. Considere um microprocessador de 32 bits, com um barramento de dados de 16 bits, controlado por um clock de entrada de 8 MHz. Suponha que esse microprocessador tenha um ciclo de barramento cuja duração mínima seja igual a 4 ciclos de clock. Qual é a taxa de transferência de dados máxima pelo barramento que esse microprocessador pode sustentar, em bytes/s?** 

**8. Considere dois microprocessadores tendo barramentos de dados externos de 8 e 16 bits, respectivamente. Os dois processadores são idênticos em todos os outros aspectos.**

* **Suponha que todas as instruções e operandos tenham 2 bytes de extensão. Qual o fator de diferença entre as taxas máximas de transferência?**

* **Repita considerando que metade dos operandos e instruções tenham 1 byte de extensão.**