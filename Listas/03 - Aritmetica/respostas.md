# Aritmética

**1. Explique o funcionamento básico da ULA.**

Os dados são apresentados à ULA em registradores, e os resultados de uma operação são armazenados nos registradores. Esses registradores são locais de armazenamento temporários dentro do processador, que são conectados por meio de sinais à ULA.  A ULA também pode definir flags como resultado de uma operação. Por exemplo, uma flag de overflow (estouro) é definida como 1 se o resultado de um cálculo ultrapassar o tamanho do registrador no qual ele deve ser armazenado. Os valores de flag também são armazenados nos registradores dentro do processador. A unidade de controle oferece sinais que controlam a operação da ULA e o movimento dos dados para dentro e fora da ULA.

**2. Explique a diferença entre as representações de sinal-magnitude e complemento de dois para números binários**

A Representação sinal-magnitude utiliza o bit mais significativo da palavra como um bit de sinal, se o bit mais significativo for 0, o número será positivo, se for 1, o número será negativo. Ao passo que na representação complemento de dois os números positivos são representados na sua forma binária direta, e um bit de sinal 0 é colocado à esquerda.

**3. Converta os valores decimais abaixo para binário.**

* **12345** = 11000000111001

* **98765** = 11000000111001101

* **48201** = 1011110001001001

* **35212** = 1000100110001100

**4. Em uma linguagem de programação, considere um tipo de dado inteiro que utiliza 2 bytes de memória para seu armazenamento. Quantos valores únicos diferentes são possíveis de colocar nesse espaço no decorrer da execução de um programa?**

2 bytes = 16 bits.
2^16 = 65536 valores únicos.

**5. Faça as operações aritméticas abaixo utilizando aritmética de binários de 8 bits (Primeiramente você deve converter os números para binários em complemento de dois):**

* **7 + 8**

000000111 + 000001000 = 000001111

* **10 + 90**

000001010 + 001011010 = 000100100

* **160 - 95**

010100000 - 001011111 = 010100000 + 110100001 = 001000001

* **-10 + 90**

001011010 - 000001010 = 001011010 + 111110110 = 001010000

* **-145 - 50**

-010010001 - 000110010 = 101101111 + 111001110 = 100111101

**6. Faça as operações aritméticas abaixo utilizando aritmética de binários de 4 bits sem sinal.**

* **0011 * 1101**

  | Carry |  A |   Q 	  |   M     |   Passos      |
  |-------|----|--------|---------|---------------|
  |0	    |0000|  0011  |   1101  |Valores Inicias|
  |       |    |        |         | **Passo 1**   |
  |0	    |1101|  0011  |   1101  | Adição        |
  |0	    |0110|  1001  |   1101  |Deslocamento   |
  |       |    |        |         | **Passo 2**   |
  |1	    |0011|  1001  |   1101  |Adição         |
  |0	    |1001|  1100  |   1101  |Deslocamento   |
  |       |    |        |         | **Passo 3**   |
  |0	    |0100|  1110  |   1101  |Deslocamento   |
  |       |    |        |         | **Passo 4**   |
  |0	    |0010|  0111  |   1101  |Deslocamento   |

 	R.: 0010 0111

* **1111 * 1111**

  | Carry |  A |   Q 	  |   M     |   Passos      |
  |-------|----|--------|---------|---------------|
  |0	    |0000|  1111  |   1111  |Valores Inicias|
  |       |    |        |         | **Passo 1**   |
  |0	    |1111|  1111  |   1111  | Adição        |
  |0	    |0111|  1111  |   1111  |Deslocamento   |
  |       |    |        |         | **Passo 2**   |
  |1	    |0110|  1111  |   1111  |Adição         |
  |0	    |1011|  0111  |   1111  |Deslocamento   |
  |       |    |        |         | **Passo 3**   |
  |1	    |1010|  0111  |   1111  |Adição         |
  |0	    |1101|  0011  |   1111  |Deslocamento   |
  |       |    |        |         | **Passo 4**   |
  |1	    |1100|  0011  |   1111  |Adição         |
  |0	    |1110|  0001  |   1111  |Deslocamento   |

  R.: 1110 0001

* **1100 * 1010**

  | Carry |  A |   Q 	  |   M     |   Passos      |
  |-------|----|--------|---------|---------------|
  |0	    |0000|  1100  |   1010  |Valores Inicias|
  |       |    |        |         | **Passo 1**   |
  |0	    |0000|  0110  |   1010  |Deslocamento   |
  |       |    |        |         | **Passo 2**   |
  |0	    |0000|  0011  |   1010  |Deslocamento   |
  |       |    |        |         | **Passo 3**   |
  |0	    |1010|  0011  |   1010  |Adição         |
  |0	    |0101|  0001  |   1010  |Deslocamento   |
  |       |    |        |         | **Passo 4**   |
  |0	    |1111|  0001  |   1010  |Adição         |
  |0	    |0111|  1000  |   1010  |Deslocamento   |

  R.: 0111 1000

**7. Faça as operações aritméticas abaixo utilizando aritmética de binários de 4 bits com complemento de dois.**

* **1100 * 1010**

  | A	  |  Q | Q(-1) |   M   |       Passos          |
  |-----|----|-------|-------|-----------------------|
  |0000 |1100|   0   |  1010 |Valores Inicias        |
  |     |    |       |       |**Passo 1**            |
  |0000 |0110|   0   |  1010 |Deslocamento a direita |
  |     |    |       |       |**Passo 2**            |
  |0000 |0011|   0   |  1010 |Deslocamento a direita |
  |     |    |       |       |**Passo 3**            |
  |0110 |0011|   0   |  1010 |Subtração (a = a - m)  |
  |0011 |0001|   1   |  1010 |Deslocamento           |
  |     |    |       |       |**Passo 4**            |
  |0001 |1000|   1   |  1010 |Deslocamento           |

  R.: 0001 1000

* **0101 * 1010**

  | A	  |  Q | Q(-1) |   M   |       Passos          |
  |-----|----|-------|-------|-----------------------|
  |0000 |0101|   0   |  1010 |Valores Inicias        |
  |     |    |       |       |**Passo 1**            |
  |0110 |0101|   0   |  1010 |Subtração (a = a + m)  |
  |0011 |0010|   1   |  1010 |Deslocamento a direita |
  |     |    |       |       |**Passo 2**            |
  |1101 |0010|   1   |  1010 |Soma (a = a + m)       |
  |1110 |1001|   0   |  1010 |Deslocamento a direita |
  |     |    |       |       |**Passo 3**            |
  |0100 |1001|   0   |  1010 |Subtração (a = a - m)  |
  |0010 |0100|   1   |  1010 |Deslocamento           |
  |     |    |       |       |**Passo 4**            |
  |1100 |0100|   1   |  1010 |Soma (a = a + m)       |
  |1110 |0010|   0   |  1010 |Deslocamento           |

  R.: 1110 0010

* **0011 * 1011**

  | A	  |  Q | Q(-1) |   M   |       Passos          |
  |-----|----|-------|-------|-----------------------|
  |0000 |0011|   0   |  1011 |Valores Inicias        |
  |     |    |       |       |**Passo 1**            |
  |0101 |0011|   0   |  1011 |Adição (a = a + m)     |
  |0010 |1001|   1   |  1011 |Deslocamento a direita |
  |     |    |       |       |**Passo 2**            |
  |0001 |0100|   1   |  1011 |Deslocamento a direita |
  |     |    |       |       |**Passo 3**            |
  |1100 |0100|   1   |  1011 |Soma (a = a + m)       |
  |1110 |0010|   0   |  1011 |Deslocamento           |
  |     |    |       |       |**Passo 4**            |
  |1111 |0001|   0   |  1011 |Deslocamento           |

  R.: 1111 0001

**8. Porque na representação de número em ponto flutuante em um computador não há a necessidade de se representar a base?**

Para números decimais, usamos a notação científica. A base é implícita e não precisa ser armazenada, pois é a mesma para todos os números. Normalmente, considera -se que o ponto fracionário está à direita do bit mais à esquerda (ou mais significativo) do significando. Ou seja, existe um bit à esquerda do ponto fracionário.

**9. O que é um Expoente Polarizado? Qual a utilidade de se utilizar a polarização para a representação de número em ponto flutuante?**

A polarização significa que o valor armazenado será sempre positivo, isso é feito  para evitar um passo extra com a transformação do expoente em complemento de dois. Isso significa somar 127 (32bits) ou 1023 (64bits) no valor do expoente.

**10. Porque não há a necessidade de se representar o primeiro bit da mantissa de um número em ponto flutuante no computador?**

Um número diferente de zero, normalizado na base 2, a mantissa sempre começará por 1. Assim sendo, não há necessidade de se representar o (1, ) pois isso ficaria implícito, bastando representar os dígitos que aparecem depois da vírgula.

**11. Porque número em ponto flutuante muitas vezes precisam ser normalizados?**

Para simplificar as operações sobre números de ponto flutuante.

**12. Explique a diferença entre Overflow e Underflow na representação de número em ponto flutuante. Exemplifique. Porque o Underflow é menos crítico?**

O overflow ocorre quando uma operação aritmética resulta em uma magnitude maior do que pode ser expressa com um expoente de 128 (por exemplo, 2120 × 2100 = 2220). O underflow ocorre quando a magnitude fracionária é muito pequena (por exemplo, 2–120 × 2–100 = 2–220). O underflow é um problema menos sério porque o resultado geralmente pode ser satisfatoriamente aproximado para 0.

**13. Qual é a relação entre os tamanhos dos campos reservados ao significando e ao expoente?**

Existe uma relação estreita entre os tamanhos dos campos reservados ao mantissa e ao expoente.
* Se o número de bits do mantissa aumentar:
* Maior precisão.
* Menor faixa de valores representáveis.
* Se o número de bits do expoente aumentar:
* Menor precisão.
* Maior faixa de valores representáveis.

**14. Cite e explique os passos para as operações de soma/subtração de pontos flutuantes em um computador.**

Passos para adição e subtração:

* Verificação de zero:
	*	A adição e a subtração são idênticas, exceto por uma mudança de sinal.
	* Se for uma operação de subtração, o processo começa alterando o sinal do subtraendo.
	* Em seguida, se algum operando for 0, o outro é informado como o resultado.

* Alinhamento das mantissas (ajustando expoentes):
	* A próxima fase é manipular os números de modo que os dois expoentes sejam iguais.
	* O alinhamento é obtido deslocando repetidamente a parte de magnitude do mantissa 1 dígito para a direita, e aumentando o expoente até que os dois expoentes sejam iguais.
	* Se esse processo resultar em um valor 0 para o mantissa, então o outro número é informado como resultado

* Adição ou subtração das mantissas:
	* As duas mantissas são somadas ou subtraídas.

* Normalização do resultado:
	* A fase final normaliza o resultado.
	* Consiste no deslocamento dos dígitos do significando para a esquerda até que o dígito mais significativo seja diferente de zero.
	* Cada deslocamento causa um decremento do expoente e, portanto, poderá ocasionar um underflow do expoente.
	* Finalmente, o resultado poderá ser arredondado e depois informado.