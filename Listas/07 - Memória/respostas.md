# Lista de exercícios sobre Memória

1. **Qual é o desafio do projeto de memórias em um computador?**

2. **Desenhe a pirâmide de hierarquia de memória. O que acontece quando subimos na pirâmide?**

3. **O que é a memória cache? Qual é seu objetivo?**

4. **Cite os princípios de memória cache.**

5. **Desenhe os diagramas de estrutura da cache e da memória principal.**

6. **Explique os passos da operação de uma memória cache.**

7. **O que é um cache hit? E um cache miss?**

8. **Desenhe o diagrama de organização típica de uma memória cache.**

9. **Explique ou desenhe um esquema de funcionamento do mapeamento direto utilizado em memórias cache.**

10. **Quais são os prós e contras do mapeamento direto?**

11. **Explique ou desenhe um esquema de funcionamento do mapeamento associativo utilizado em memórias cache.**

12. **Quais são os prós e contras do mapeamento associativo?**

13. **Explique ou desenhe um esquema de funcionamento do mapeamento associativo em conjunto utilizado em memórias cache.**

14. **Quais são os prós e contras do mapeamento associativo em conjunto?**

15. **Faz sentido um algoritmo de substituição de blocos em uma cache com mapeamento direto? Justifique.**

16. **Cite e explique brevemente os algoritmos de substituição de blocos utilizados em memórias caches.**

17. **Explique o funcionamento da política de escrita Write-though. Qual é seu problema?**

18. **Explique o funcionamento da política de escrita Write-back. Porque esta política não é indicada para sistemas multi-core?**

19. **Explique o funcionamento da política de escrita Write-once. Porque ela é ideal para sistemas multi-core?**

20. **Explique porque a frase se o tamanho dos blocos é aumentado, aumentará também a razão de acerto na cache não é sempre verdadeira.**

21. **Porque não ter mais níveis de cache além de L1, L2 e L3?**

22. **Quais são as vantagens de uma cache unificada? E de uma cache separada? Porque geralmente a cache L1 é separada?**

23. **Uma cache associativa em conjunto consiste de 64 linhas, divididas em conjuntos de quatro linhas. A memória principal contém 4096 blocos de 128 palavras cada. Mostre o formato dos endereços da memória principal.**

24. **Uma cache associativa em conjunto com duas linhas por conjunto possui linhas de 16 bytes e um tamanho total de 8 KBytes. A memória principal de 64 MBytes é endereçavel por byte. Mostre o formato dos endereços da memória principal.**

25. **Considere uma máquina com uma memória principal endereçavel por byte com 2 16 bytes e um tamanho de bloco de 8 bytes. Suponha que uma cache mapeada diretamente, consistindo de 32 linhas, seja usada com essa máquina.**

    1. **Como um endereço de memória de 16 bits é dividido em tag, número de linha e número de byte?**

    2. **Quantos bytes de memória no total podem ser armazenados na cache?**

    3. **Por que a tag também é armazenada na cache?**

26. **Considere uma máquina com uma memória principal endereçavel por byte com 2 16 bytes e um tamanho de bloco de 8 bytes. Suponha que uma cache mapeada diretamente, consistindo de 32 linhas, seja usada com essa máquina. Em que linha seriam armazenados os bytes com cada um dos seguintes endereços:**
    1. **0001 0001 0001 1011**
    2. **1100 0011 0011 0100**
    3. **1101 0000 0001 1101**
    4. **1010 1010 1010 1010**
    5. **0001 1010 0001 1010**

27. **Porque a memória RAM possui este nome?**

28. **O que é uma memória RAM Dinâmica? Porque ela necessita de um circuito chamado de refresh?**

29. **O que é uma memória RAM Estática?**

30. **Quais são as principais diferenças entre uma DRAM e uma SRAM?**

31. **Porque as SRAM são utilizadas para a construção de memórias cache?**

32. **Porque as DRAM são utilizadas para a construção de memórias principais?**

33. **O que é uma Mask-ROM? Qual é seu problema?**

34. **O que é uma PROM? Porque é necessário um equipamento especial para programa-la?**

35. **O que é uma EPROM?**

36. **O que é um EEPROM?**

37. **O que é uma Flash ROM? Porque este é o tipo de memória é utilizada para armazenar BIOS de computadores?**

38. **Explique a diferença entre os formatos (SIMM e DIMM) de memórias DRAM.**

39. **Qual é a diferença entre as tecnologias de memórias DRAM DDR, DDR2 e DDR3?**

40. **O que é um disco magnético? Como ele é constituído?**

41. **Como funciona o mecanismo de gravação de um disco magnético? E o mecanismo de leitura?**

42. **Como se dá a organização de dados em um disco magnético?**

43. **Porque são necessárias lacunas entre as trilhas e setores em um disco?**

44. **Suponha um disco que possua 512 bytes por setor e utilize clusters de 64 setores. Com um arquivo de 256 bytes armazenado neste disco, quantos bytes seriam desperdiçados?**

45. **Explique a diferença entre um disco de cabeça fixa e um disco de cabeça móvel.**

46. **O que significa dizer um HD possui múltiplos discos com múltiplos lados? Quais os benefícios se se espalhar os dados de um arquivo em cilindros?**

47. **Explique porque um disco com 7200 rotações por minuto (RPM) apresenta um melhor desempenho que um disco com 5400 RPM.**

48. **O que é RAID? Para que é utilizado?**

49. **Quais são as características de sistemas RAID?**

50. **O que é o RAID 0? Qual é sua inovação?**

51. **O que é o RAID 1? Porque ele é caro?**

52. **O que são os RAID 2 e 3? Porque não são utilizados hoje em dia?**

53. **O que é o RAID 4?**

54. **O que é o RAID 5? Qual a diferença para o RAID 6?**

55. **Como é composto um CD-ROM? Como funciona seu processo de fabricação?**

56. **Explique o funcionamento da leitura em um CD-ROM.**

57. **Qual a diferença de um CD-ROM para um CD-R?**

58. **Qual é diferença de um CD-R para um CD-RW?**

59. **Porque um DVD consegue armazenar mais dados do que um CD comum?**

60. **Quais diferenças fazem com que o BluRay possua uma capacidade de armazenamento tão superior a todos os outros dispositivos de armazenamento ópticos?**