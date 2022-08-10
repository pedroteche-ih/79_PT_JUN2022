# SQL Review: Case OLIST


Download do DB MySQL:
https://drive.google.com/file/d/1EKlvif0AWv9wmhzw1iCk71eSPyPjxqqR/view?usp=sharing

Fonte de dados:
https://www.kaggle.com/olistbr/brazilian-ecommerce

## 1. O impacto de atrasos
O atraso na entrega é motivo de frustração para clientes de qualquer e-commerce. Gostaríamos de compreender melhor se existem causas estruturais para o atraso e compreender se esses atrasos geram um impacto na percepção do cliente sobre os pedidos.
1) A nossa rede de sellers está espalhada pelo Brasil, assim como nossos clientes. Será que a distância entre sellers e clientes impacta o atraso na entrega?
2) A diversidade de produtos vendidos através de nossa plataforma é grande, será que os atrasos estão concentrados em certos tipos de produto?
3) O impacto sobre a experiência do cliente pode ser mensurado através das diferentes reviews. Qual o impacto dos atrasos sobre estes reviews? Qual seria o impacto se reduzíssemos o número de atrasos em 50%?
4) (BONUS) O tempo de entrega previsto é um dos principais determinantes na escolha de um vendedor especifico em marketplaces online. No entanto ao reduzir a previsão do tempo de entrega corremos o risco de aumentar o número de clientes insatisfeitos. Atualmente as previsões de entrega estão sendo feitas de maneira assertiva? Quais dados você precisaria para analisar os beneficios e riscos de uma previsão de tempo de entrega mais otimista?

### DICAS

* Não se preocupe em medir a distância real: busque construir um indicador categórico que represente indiretamente a distância entre clientes e sellers.
* Qual atributo dos produtos pode dificultar diretamente o frete?
* Adote premissas!

## 2. Balanceando Oferta e Demanda
O custo de frete é uma das principais determinantes na escolha de um vendedor em um e-Commerce. Uma maneira de reduzir o custo de frete médio é aumentando a rede de distribuição (sellers) e garantindo que esta rede tenha uma distribuição de localização semelhante à demanda. A área de marketing responsável pela captação de sellers requisitou uma análise para focar esforços em regiões que apresentem um déficit de sellers em relação à demanda. Além disso gostariam de um primeiro indicio sobre os possíveis impactos sobre vendas caso esse deficit seja suprido.

1) Como estão distribuidas a demanda e a oferta de nossos pedidos históricos?
2) Como podemos medir o desbalanço regional entre oferta e demanda?
3) Levando em conta a Receita Bruta advinda de cada região e o desbalanço mensurado acima, quais deveriam ser prioridade no aumento de oferta?

### DICAS

* Busque construir um indicador de localização *agregado* que facilite a comparação entre regiões.
* Considere a diferença entre indicadores relativos e absolutos!
* Pense em como *valorar* (estimar o preço) do desbalanço de demanda e oferta.

## 3. Rede de Distribuição e Vendas
(BONUS) A Olist pretende criar um programa de capacitação de sellers com o objetivo de aumentar vendas. Precisamos criar um raio-x da base de sellers atuais, olhando diferentes indicadores comerciais tais quais assortment, volume de vendas, margem, região de origem, região atendida e categoria de produtos ofertadas para criar uma recomendação de 10 sellers que, com pequenas alterações em sua dinâmica de negócio poderiam obter grandes incrementos em vendas. Crie este raio-x de sellers com as dimensões que você acha mais pertinentes e proponha um caminho para fazer a seleção de candidatos ao programa.

