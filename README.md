# Listas_Exercicio_Computacionais_Sistema_de_Transmissao_de_dados
Este repositório contempla as listas computacionais do conteúdo de modulação da segunda unidade da disciplina de STD


# Universidade Federal do Rio Grande do Norte

*Engenharia Mecatrônica*  
*Disciplina: Sistemas de transmissão de dados*

#*Lista de exercícios 5: Modulação e Demodulação*

*Aluno(a):* Pedro Arthur Oliveira dos Santos  
*Professor(a):* Luiz Felipe Silveira
*Data:* 07/12/2024

## Questão 1:
Suponha que duas portadoras são separadas em frequência por 1 kHz. Desenhe o espectro
de magnitudes dos seguintes cenários: (a) as portadoras modulam mensagens com largura de
banda igual a 200 Hz, (b) as portadoras modulam mensagens com largura de banda igual a 2
kHz. Comente sobre a possibilidade do filtro passa-faixa, no receptor, separar os dois sinais.

a) Mensagens com 200Hz de largura de banda
![image](https://github.com/user-attachments/assets/5c8a0566-d8cd-432d-bfe7-072acee45caa)

*Figura 1: Sinal com mensagens de largura de banda de 200Hz somadas.*


b) Mensagens com 2kHz de largura de banda
![image](https://github.com/user-attachments/assets/68271c85-80ac-4efb-a9f9-da4061026db0)

*Figura 2: Sinal com mensagens de largura de banda de 200Hz somadas.*

c) Para um filtro passa-faixas conseguir separar os dois sinais na recepção, é preciso que os sinais não se sobreponham na frequência, então
é necessário que os espectros de frequências sejam separados, ou seja

$$
f_2 - B > f_1
$$

ou seja

$$
f_2 - f_1 > B
$$

no caso da letra b), isso não acontece pois $$f_2 - f_1 = 1000 <2000 $$ , por isso não é possível separá-los na recepção.

---

## Questão 2:
A partir do código em filternoise.m crie um filtro que:

a) passe todas as frequências acima
de 500 Hz

![image](https://github.com/user-attachments/assets/1566fca7-311d-4a15-a093-c77fcd62c794)

*Figura 3: Filtro passa-altas com frequência de corte de 500Hz.*


b) passe todas as frequências abaixo de 3 kHz

![image](https://github.com/user-attachments/assets/baf5e784-96a5-4872-9a33-550fb82a109c)

*Figura 4: Filtro passa-baixas com frequência de corte de 3kHz.*


c) rejeite todas as frequênciasentre 1.5 kHz e 2.5 kHz

![image](https://github.com/user-attachments/assets/f12aa764-2659-4152-8649-f816bef68569)

*Figura 5: Filtro rejeita-faixas com frequências de corte 1.5 e 2.5 kHz.*



d) reprojete os três filtros anteriores considerando que a frequência
de amostragem foi alterada para Fs = 20 kHz.
As oscilações nas bandas de rejeição e aceitação ficaram menores


---

## Questão 3:
3. Seja x1(t) um coseno com frequência f1 = 800 Hz, x2(t) um coseno com frequência f2 = 2000
Hz, e x3(t) um coseno com frequência f3 = 4500 Hz. Seja x(t) = x1(t) + 0.5x2(t) + 2x3(t).
Use x(t) como sinal de entrada a cada um dos três filtros projetados no item anterior. Faça o
gráfico dos espectros e explique o que ocorreu.

Filtro 1: Passa-altas com frequência de corte 500Hz
![image](https://github.com/user-attachments/assets/d445d716-308c-48f3-98eb-1350dc6d9b79)
*Figura 6: Sinal filtrado com o Filtro passa-altas com frequência de corte de 500Hz.*

Vemos que o sinal permanece inalterado, ja que o filtro deixa passar frequências acima de 500Hz, e a maior frequência do sinal é 800Hz, que é maior que 500Hz.

Filtro 2: Passa-baixas com frequência de corte 3000Hz
![image](https://github.com/user-attachments/assets/ab06afd7-4a92-49ae-a678-0a7fb0146886)

*Figura 7: Sinal filtrado com o Filtro passa-baixas com frequência de corte de 3kHz.*

Vemos que nesse filtro passa-baixas, o sinal com frequência de 4500Hz é bastante atenuado pelo filtro, e os outros permanecem inalterados.

Filtro 3:Rejeita-faixas com frequ~encias 1.5kHz e 2.5kHz
![image](https://github.com/user-attachments/assets/a777a7b5-be19-4d0e-8027-3f910c50d0b2)

*Figura 8: Sinal filtrado com o Filtro rejeita-faixas com frequências de corte de 1.5 e 2.5 kHz.*

Vemos que um cosseno foi completamente atenuado, e foi justamente o cosseno de 2kHz que está na faixa de rejeição e que foi muito atenuado pelo filtro.

---

## Questão 4:
Justifique porque o processo de modulação deve ser utilizado em sistemas de transmissão via
rádio.

Porque na transmissão via rádio o canal tem frequências altas e os sinais precisam ser deslocados(modulados) com essa frequência para poderem ser transmitido pelo canal 
de comunicação que é o próprio ar, que corta frequências baixas.

---

## Questão 5:
A partir do código modulate.m encontre o espectro da saída y(t) de um modulador (com
frequência de portadora fc = 1 kHz) considerando que a entrada é um sinal de ruído com
largura de banda limitada entre 2 kHz e 2.3 kHz. Dica: Esse ruído pode ser obtido a partir da
filtragem de um ruído branco por um filtro passa-faixa.


![Espectro do sinal suave(ruído filtrado)](https://github.com/user-attachments/assets/cdac5f73-ded8-4a2f-b624-6747a940df0e)

*Figura 9: Espectro do sinal de largura de banda entre 2.1 e 2.3 kHz  utilizando um filtro passa-banda.*


Após passar o sinal no modulador



![Espectro do sinal Modulado](https://github.com/user-attachments/assets/7508a404-aba4-481d-9d33-90d9b527036e)

*Figura 10: Sinal modulado com uma portadora de 1kHz*

Vemos que o sinal foi modulado corretamente, uma vez que seu espectro foi deslocado para a frequência da portadora de 1kHz.


## Questão 6:
A partir de AMlarge.m mostre o gráfico do espectro da mensagem w(t), o espectro da portadora
c(t), e o espectro do sinal recebido v(t). Qual é o espectro do envelope? Quão próximo estão
os resultados experimentais obtidos, dos resultados teóricos?

![image](https://github.com/user-attachments/assets/f3fecbd0-5127-411e-a86e-4727e3da7d6c)

*Figura 11: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado*

O resultado teórico para esse espectro seria o de um impulso na origem e dois impulsos na frequência $$f_m$$ , de acordo com o sinal de mensagem $$w(t)$$ modulado, e vemos que esse comportamento está próximo do esperado, porém o ímpulso devido ao termo DC não está centrado na origem como era de se esperar.


## Questão 7:
Uma das vantagens da transmissão usando AM com portadora incluída é que não é necessário
se conhecer na recepção o valor exato da fase ou frequência da portadora recebida. Verifique
isso a partir de AMlarge.m, como segue: (a) Altere a fase do sinal transmitido; por exemplo,
faça c = cos(2πfct + ϕ) com ϕ = 0.1, 0.5, π/3, π/2, π, e verifique que o envelope recuperado
mantém-se inalterado; (b) Altere a frequência do sinal transmitido; por exemplo, faça c =
cos(2π(fc + g)t) com g = 10, −10, 100, −100, e verifique que o envelope recuperado mantémse inalterado. Pode g ser muito grande?

![image](https://github.com/user-attachments/assets/acac6f65-a910-4f38-8c65-a5d120838e25)

*Figura 12: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com $$g = 100000$$ e $$\phi = \frac{\pi}{3}$$*


Podemos ver que o espectro se manteve inalterado, isso porque o filtro de envoltória é um filtro que já trabalha em frequências altas o suficiente para recuperar o sinal.
Porém se g for muito grande o valor da frequência de amostragem pode ser maior que o limite físico dos circuitos elétricos que se tem hoje em dia, causando problemas para recuperar o sinal.


## Questão 8:
8. A partir de AM.m, faça os espectros de w(t), v(t), x(t), e m(t). Suponha agora diferentes
desvios de fase ϕ = [−π, −π/2, −π/3, −π/6, 0, π/6, π/3, π/2, π]. Quão bem a mensagem
recuperada m(t) se aproxima da mensagem real w(t)? Para cada caso, qual é o espectro de
m(t)?


![image](https://github.com/user-attachments/assets/a0f6176c-8b1b-404d-92e2-0d0dbc5230fd)

*Figura 13: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi = -\pi $$*



![image](https://github.com/user-attachments/assets/69bcc025-27cd-4d4a-9311-de534745a217)

*Figura 14: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi = -\frac{\pi}{2}$$*



![image](https://github.com/user-attachments/assets/9ba5fd19-c3d2-4437-837a-86d9f4a7e953)

*Figura 15: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi =  -\frac{\pi}{3}$$*



![image](https://github.com/user-attachments/assets/99e684b8-603c-47c6-a056-559405ee5521)

*Figura 16: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi = -\frac{\pi}{6}$$*



![image](https://github.com/user-attachments/assets/5cde6b92-d3a6-4831-8ec1-70c433e7a097)

*Figura 17: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi = 0$$*



![image](https://github.com/user-attachments/assets/8aed5501-e296-4d23-987f-31f81edbf654)

*Figura 18: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi = \frac{\pi}{6} $$*



![image](https://github.com/user-attachments/assets/b92e05c5-21c0-49f7-8c14-96dd5ee096a7)

*Figura 19: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi = \frac{\pi}{3} $$*



![image](https://github.com/user-attachments/assets/d48683c7-1b73-4770-8018-2ca83eb6065f)

*Figura 20: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi = \frac{\pi}{2} $$*



![image](https://github.com/user-attachments/assets/3e60c2a7-6ac8-4bc1-ba73-497285f924c3)

*Figura 21: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com deslocamento de fase $$\phi = \pi $$*


para os valores de fase $$\phi = [-\frac{\pi}{2},frac{\pi}{2}]$$, podemos perceber que a distorção foi máxima, uma vez que o sinal em baixas frequências fica multiplicado pelo cosseno dessa fase, e para o caso em que $$\phi = \frac{pi}{2}$$, então o sinal é completamente atenuado, que é o que foi notado no gráfico, porém para os restantes dos valores do vetor $$\phi$$ a distorção foi mínima.



## Questão 9:
9. A partir de AM.m, suponha diferentes desvios de frequência γ = [0.01, 0.1, 1.0, 10]. Quão bem
a mensagem recuperada m(t) se aproxima da mensagem real w(t)? Para cada caso, qual é o
espectro de m(t)?


![image](https://github.com/user-attachments/assets/b4191f1e-da02-45b4-859b-86f594afa0ff)

*Figura 22: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com erro de frequência $$\gamma = 0.01 $$*



![image](https://github.com/user-attachments/assets/fdf7c25e-ae0a-4909-9978-0953a652d2b8)

*Figura 23: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com erro de frequência $$\gamma = 0.1 $$*



![image](https://github.com/user-attachments/assets/bb932de3-9d2a-4332-9584-81ff021dc907)

*Figura 24: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com erro de frequência $$\gamma = 1 $$*



![image](https://github.com/user-attachments/assets/c1f77d87-09a5-4667-8c1a-25a9fd323c9b)

*Figura 25: Espectro de magnitude do sinal recuperado pelo filtro de envoltória modulado com portadora com erro de frequência $$\gamma = 10 $$*


Podemos ver que com o erro de frequências a mensagem $$m(t)$$ começa a apresentar algumas distorções, e para o valor de $$\gamma = 10$$ o sinal recuperado é um cosseno de 10 Hz com um cosseno de 30Hz, ja prejudicando totalmente a demodulação.

## Questão 10:
10. Implemente um código para o modulador da Figura abaixo. Considerando esse modulador:
(a) Crie um sinal w(t) que tem largura de banda de 100 Hz; (b) Module o sinal a 1 kHz; (c)
Demodule utilizando como referência o demodulador AM.m, de forma a recuperar o sinal w(t).

a) e b)

![image](https://github.com/user-attachments/assets/d2db60d8-b9aa-4cf9-89ac-75ba0fb0f2b8)

*Figura 26: Espectro de magnitude do sinal de mensagem com largura de banda de 100Hz enviado e Espectro de magnitude do sinal modulado por lei quadrática*

Pode-se notar que ainda sobrou uma pequena perturbação de um impulso na origem devido a atenuação não completa do filtro não ideal.

c)

![image](https://github.com/user-attachments/assets/f8a6b46a-947c-4fb6-b960-1c59ba8028af)

*Figura 27: Espectro de magnitude do sinal de mensagem com largura de banda de 100Hz enviado e Espectro de magnitude do sinal demodulado*


## Questão 11:
11. Use o modulador do problema anterior para analisar as seguintes questões: (a) quão sensível
é o sistema a erros na frequência da portadora? (b) quão sensível é o sistema a desvios de fase
desconhecidos na portadora?

a)

![image](https://github.com/user-attachments/assets/cb447bf1-94c1-4100-b3b4-4be6d511fd5b)

*Figura 28: Distorção de amplitude no sinal demodulado devido ao erro de fase $$\phi$$*

Foi possível notar que com o erro na fase do cosseno demodulador causou apenas um erro na escala de amplitude da mensagem 




b)

![image](https://github.com/user-attachments/assets/664e54a5-f992-4241-97dd-7e609a12c199)

*Figura 29: Distorção de amplitude no sinal demodulado devido ao erro de frequência $$\gamma = 200$$*


![image](https://github.com/user-attachments/assets/fbc814db-87d5-45ce-9718-9052e4c2508c)

*Figura 30: Distorção de amplitude no sinal demodulado devido ao erro de frequência $$\gamma = 500$$*

Ja com a diferença de frequência, a partir de uma diferença maior que 100Hz ja foi possível notar que isso causava erro na demodulação, e acabava demodulando partes do sinal modulado que não eram interessantes, e com 500Hz acabava demodulando o cosseno.


## Questão 12:
12. A partir do código AM.m, projete um modulador em quadratura que implementa o diagrama
da Figura abaixo. (a) Examine o efeito de um desvio de fase nas portadoras locais (no receptor)
considerando diferentes valores de desvios; (b) Examine o efeito de um desvio de frequência
nas portadoras locais (no receptor) considerando diferentes valores de desvios.

a) 


![image](https://github.com/user-attachments/assets/862ebea4-06ad-4cb0-8769-da554ae40af5)

*Figura 31: Distorção de amplitude no sinal demodulado devido ao erro de frequência $$\gamma = 10Hz$$*


![image](https://github.com/user-attachments/assets/72d4bf45-d6bc-47f5-ba2b-df0821d9c08d)

*Figura 32: Distorção de amplitude no sinal demodulado devido ao erro de frequência $$\gamma = 100Hz$$*


Podemos ver que essa modulação é bastante sensível à distorções na frequência, e com o aumento do erro de frequências $$\gamma$$ a mensagem vai perdendo sua natureza original. 



b)


![image](https://github.com/user-attachments/assets/5e66cd89-ce66-4a0d-9496-217c6f3b7509)

*Figura 33: Distorção de amplitude no sinal demodulado devido ao erro de fase $$\phi = \frac{\pi}{2}$$*



![image](https://github.com/user-attachments/assets/23c06674-5b98-4416-a230-8322c706e01f)

*Figura 34: Distorção de amplitude no sinal demodulado devido ao erro de fase $$\phi = \pi$$*


Podemos ver que o sistema é pouco sensível a erros de fase, uma vez que para $$\phi = \frac{\pi}{2}$$, o seno se torna um cosseno, e o cosseno se torna um seno, e acaba se tornando a mesma coisa.
Para o caso em que  $$\phi = \pi$$, também há pouca distorção considerando a natureza dessas funções.




---


