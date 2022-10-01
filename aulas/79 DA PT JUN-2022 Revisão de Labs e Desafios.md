# Revisão de Labs e Desafios

Às portas do Módulo 3 - ML, precisamos estar com as nossas habilidades de programação e tratamento de dados em Python bem consolidadas. A melhor forma de aprendermos programação é programando: vamos utilizar a aula de hoje para revisar alguns LABs críticos e tentar resolver desafios utilizando as ferramentas que adqurimos ao longo das últimas 16 semanas!

## Labs

O objetivo da aula de hoje é prepara-los para os desafios que enfretaremos ao longo do módulo 3. Vamos praticar nossas habilidades de programação em Python através dos LABs mais críticos para os assuntos que cobriremos ao longo das próximas semanas. Os LABs (assim como as salas de estudo) estão dividios em três grupos:

1. **Python base**: habilidades fundamentais de programação em Python para análise de dados;
1. **Operações com Dados**: habilidades fundamentais na utilização de DataFrames e seus métodos;
1. **Estatística e Probabilidade**: habilidades fundamentais adquiridas nas últimas semanas após a conclusão do projeto de Visualização de Dados.

Durante o densevolvimento dos LABs vocês não devem buscar nas aulas (seja nos notebooks, seja na gravação) como contornar eventuais dúvidas! Pergunte à outro aluno na mesma sala e, caso não consigam resolver, nos chamem e vamos trabalhar para encontrar o caminho da solução.

## Desafios

Se você já está confortável com o material apresentado nos LABs, temos 3 desafios (*Python*, *SQL* e *Modelagem*) para expandir e praticar o que aprendemos até agora!

### Python base

**Programação funcional e list comprehensions:** 
https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M01-L03-list_comprehension

https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M01-L04-functional_programming

https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M01-L16-lambda_functions

**Operações com strings e REGEX:**
https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M01-L02-string_operations

https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M01-L14-advanced_regex

### Operações com Dados

**Agregação e filtros:**
https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M01-L10-data_manipulation_filtering

https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M01-L11-data_manipulation_aggregations

**Cálculos com DataFrames:**
https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M01-L13-dataframe_calculations - **Faça os 2 desafios!**

### Estatística e Probabilidade

**Análise Exploratória**
https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M02-L09-descriptive_statistics

https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M02-L10-statistics_visualization

**Modelagem**
https://github.com/ta-data-sao/55_DAPT/tree/master/Labs/M02-L11-linear_regression


## Desafios

### Desafio Python

Dada uma `array` numérica de tamanho NxM e uma posiçao inicial `(i, j)`, encontre todos os elementos da região contígua à `(i, j)` cujos valores tenham no máximo uma diferença de `k` para o valor de `(i, j)`.

Retorne o resultado como uma `array` de tamanho NxM com 1s indicando a região contínua e 0 nos pontos restantes.

### Desafio SQL

Utilize o SQL+DB OLIST para criar uma tabela de `sellers` com as informações abaixo:

1. ID do Seller;
1. UF de Origem;
1. Região do Brasil de Origem (NO, NE, CO, SE, S);
1. Data da Primeira Venda;
1. Data da Última Venda;
1. Intervalo Médio entre Vendas (em dias);
1. Total de Itens Vendidos no Período;
1. Receita Bruta Total do Período;
1. Maior categoria de itens vendidos;
1. Segunda maior categoria de itens vendidos;
1. Número de Pedidos Atendidos com Atraso na entrega ao Cliente;
1. Número de Pedidos Atendidos com Atraso na entrega ao Operador Logístico;
1. Nota Média dos pedidos atendidos;

Agora, utilize o DB OLIST com SQL+Python para criar uma matriz de destino origem (de qual estado o pedido saiu e em qual estado o pedido foi entregue) dos pedidos atendidos pela Olist.

Cria uma matriz de item-seller que contenha nas linhas cada um dos sellers (ID da tabela) e nas colunas as categorias de itens. Cada célula dessa matriz deve conter um valor binário (1 ou 0) indicando se aquele seller (linha da matriz) já vendeu aquela categoria (coluna da matriz).

### Desafio Modelagem

https://github.com/ta-data-mex/statistical-analysis-project