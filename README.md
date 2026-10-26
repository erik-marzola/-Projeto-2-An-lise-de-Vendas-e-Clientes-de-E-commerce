🟩Projeto 2 — Análise de Vendas e Clientes de E-commerce

# PROJETO 2 — COMPRA CERTA BRASIL
## Análise de Vendas e Clientes de E-commerce com SQL e Power BI

### 1. Introdução

O CompraCerta Brasil é um projeto autoral de portfólio que simula uma empresa fictícia de comércio eletrônico que atua no mercado brasileiro.

O objetivo é utilizar SQL para consultar e relacionar dados de clientes, pedidos, itens de pedidos e produtos, transformando essas informações em análises que apoiem decisões de negócio.

O projeto será desenvolvido desde a inspeção inicial dos dados e a criação do banco relacional até a realização de consultas SQL, análise dos resultados e construção de um dashboard no Power BI.

Todos os dados utilizados são fictícios e foram criados exclusivamente para fins educacionais e de portfólio.

### 2. Objetivos do projeto

- Analisar faturamento, lucro bruto estimado e evolução das vendas.
- Identificar os produtos e as categorias com melhor desempenho.
- Analisar vendas por estado, região e canal de venda.
- Identificar clientes recorrentes e padrões de compra.
- Calcular indicadores como ticket médio e margem estimada.
- Aprender a consultar e relacionar tabelas utilizando SQL.
- Transformar os resultados das consultas em um dashboard no Power BI.

### 3. Ferramentas utilizadas

- **Excel:** inspeção inicial e visualização da estrutura dos dados.
- **SQLite:** armazenamento e consulta dos dados relacionais.
- **DB Browser for SQLite:** interface utilizada para criar e consultar o banco de dados.
- **SQL:** consulta, filtragem, cruzamento, agrupamento e análise dos dados.
- **Power BI:** construção do dashboard final.

### 4. Estrutura dos dados

O banco possui quatro tabelas:

| Tabela | Registros | Finalidade |
|---|---:|---|
| clientes | 750 | Cadastro, localização e segmento dos clientes |
| pedidos | 2.500 | Data, status, canal de venda e frete |
| itens_pedido | 5.361 | Produtos, quantidades, preços e descontos por pedido |
| produtos | 32 | Produtos, categorias e custos unitários |

Os pedidos abrangem o período de janeiro a dezembro de 2025.

### 5. Relacionamentos entre as tabelas

- Um cliente pode realizar vários pedidos.
- Um pedido pode conter vários itens.
- Um produto pode aparecer em vários itens de pedidos.

Esses relacionamentos permitem cruzar informações de diferentes tabelas para responder às perguntas de negócio.

### 6. Regras de negócio

- Para as análises de vendas reconhecidas, serão considerados os pedidos com status **Entregue**, salvo quando a análise tratar especificamente de status.
- A receita líquida dos itens será calculada por quantidade × preço unitário × (1 − desconto percentual / 100).
- O lucro bruto estimado será calculado pela receita líquida dos itens menos o custo dos produtos vendidos.
- O frete será analisado separadamente da receita dos itens.
- A margem estimada será calculada dividindo o lucro bruto estimado pela receita líquida dos itens.
- O lucro e a margem não representam o resultado líquido real de uma empresa, pois a base não contém todas as despesas operacionais e tributárias.

### 7. Etapas já concluídas

**Etapa 1 — Preparação dos arquivos**
- Baixei a base em Excel e o pacote ZIP com os arquivos CSV e os scripts SQL.
- Organizei as pastas do projeto.
- Instalei o DB Browser for SQLite.

**Etapa 2 — Criação e carga do banco**
- Criei o banco `CompraCerta_Brasil.db`.
- Executei o script `montar_banco_completo.sql`.
- Criei as quatro tabelas e carreguei os dados fictícios.

**Etapa 3 — Validação inicial**
Executei uma consulta SQL com `COUNT(*)` e `UNION ALL` para verificar a quantidade de registros em cada tabela.

Resultados confirmados:
- 750 clientes.
- 2.500 pedidos.
- 5.361 itens de pedidos.
- 32 produtos.

A validação confirmou que as tabelas foram carregadas com as quantidades esperadas.

### 8. Próximas etapas

1. Inspecionar os registros com `SELECT`.
2. Aprender a filtrar dados com `WHERE`.
3. Ordenar resultados com `ORDER BY`.
4. Utilizar agregações como `COUNT`, `SUM` e `AVG`.
5. Relacionar tabelas com `JOIN`.
6. Agrupar resultados com `GROUP BY` e filtrar agrupamentos com `HAVING`.
7. Investigar clientes recorrentes, categorias, produtos, regiões e canais.
8. Validar e interpretar os resultados.
9. Construir o dashboard no Power BI.
10. Documentar os insights e publicar o projeto no portfólio.

### 9. Objetivo profissional

Demonstrar, por meio de um projeto prático, minha capacidade de trabalhar com bancos relacionais, escrever consultas SQL, analisar indicadores comerciais e transformar dados em informações úteis para decisões de negócio.

### Etapa 4 — Primeira consulta SQL: SELECT

Criei minha primeira consulta SQL para inspecionar os dados da tabela `clientes`.

Utilizei `SELECT` para escolher as colunas `cliente_id`, `nome_cliente`, `cidade` e `estado`, `FROM` para indicar a tabela consultada e `LIMIT 10` para retornar somente dez registros.

**Objetivo:** conhecer a estrutura dos dados e entender como recuperar informações específicas do banco sem modificar os registros.

### Etapa 5 — Filtragem e ordenação com WHERE e ORDER BY

Pratiquei consultas SQL utilizando `WHERE` para filtrar clientes por estado e `ORDER BY` para ordenar os resultados por cidade.

Utilizei `ASC` para definir a ordem crescente e `LIMIT 20` para limitar a quantidade de registros exibidos.

**Objetivo:** recuperar informações específicas do banco de dados e organizar os resultados para facilitar a análise.

### Etapa 6 — Agregações com SQL

Pratiquei as funções `COUNT`, `SUM`, `AVG` e `ROUND` para calcular indicadores diretamente no banco de dados.

A consulta contou os registros da tabela de itens de pedidos, somou as unidades, calculou o preço médio unitário e calculou o desconto médio.

**Objetivo:** aprender a resumir dados e calcular indicadores utilizando SQL, preparando a base para análises comerciais mais complexas.

### Etapa 7 — Resumo das vendas entregues

Utilizei `JOIN` para relacionar pedidos, itens de pedidos e produtos. A consulta considera apenas pedidos com status `Entregue` e calcula o número de pedidos, as unidades vendidas, o faturamento líquido dos itens, o custo estimado, o lucro bruto estimado e a margem percentual.

**Objetivo:** combinar dados de diferentes tabelas e calcular indicadores comerciais utilizando SQL, respeitando as regras de negócio definidas para o projeto.

### Etapa 8 — Análise mensal com GROUP BY

Criei uma consulta para agrupar as vendas reconhecidas por mês, calculando o número de pedidos entregues, o faturamento líquido e o lucro bruto estimado de cada período.

Utilizei `strftime` para extrair o ano e o mês da data, `GROUP BY` para consolidar os resultados e `ORDER BY` para organizar a sequência cronológica.

**Objetivo:** identificar variações no desempenho mensal e preparar os dados para análises de tendências e visualizações no Power BI.

### Resultados e interpretação — Etapas 7 e 8

A consulta geral dos pedidos entregues identificou 2.202 pedidos, 8.959 unidades vendidas, faturamento líquido de R$ 3.322.475,87 e lucro bruto estimado de R$ 1.163.741,37, com margem de 35,03%.

Na análise mensal, dezembro apresentou o maior faturamento, com R$ 422.719,52, enquanto fevereiro apresentou o menor, com R$ 188.676,39. O segundo semestre faturou aproximadamente 45,7% a mais que o primeiro semestre.

A soma dos resultados mensais coincidiu com os totais da consulta geral, validando a consistência dos agrupamentos realizados.

**Ponto de atenção:** os resultados descrevem uma base fictícia e não permitem atribuir as variações a causas reais sem investigações adicionais.

### Etapa 9 — Análise por categoria com SQL

Utilizei uma CTE para selecionar os itens de pedidos entregues, relacionando as tabelas `pedidos`, `itens_pedido` e `produtos`.

Depois, agrupei os resultados por categoria e calculei faturamento líquido, lucro bruto estimado, margem, número de pedidos e unidades vendidas.

**Objetivo:** comparar o desempenho comercial e a rentabilidade estimada das categorias utilizando SQL.

### Etapa 10 — Ranking dos 10 produtos com maior faturamento

Criei uma consulta SQL para identificar os dez produtos com maior faturamento líquido entre os pedidos entregues.

A consulta relaciona pedidos, itens de pedidos e produtos, agrupa os resultados por produto e apresenta pedidos, unidades vendidas, faturamento líquido e lucro bruto estimado. Utilizei `ORDER BY` para ordenar o faturamento do maior para o menor e `LIMIT 10` para retornar somente os dez primeiros produtos.

**Objetivo:** identificar quais produtos apresentam maior contribuição financeira para o negócio.

### Etapa 9 — Análise por categoria

Eletrônicos apresentou o maior faturamento, com R$ 1.971.590,69, e o maior lucro bruto estimado, com R$ 590.578,69. A categoria representou aproximadamente 59,3% do faturamento total e apresentou margem estimada de 29,95%, a menor entre as categorias.

Móveis apresentou R$ 1.042.443,01 em faturamento e R$ 402.075,01 em lucro bruto estimado, com margem de 38,57%. Acessórios e Papelaria tiveram margens superiores a 54%, mas participação menor no faturamento.

**Insight:** Eletrônicos concentra a receita, enquanto Acessórios e Papelaria apresentam margens percentuais maiores. Será importante investigar custos, preços e composição dos produtos antes de recomendar mudanças comerciais.

### Etapa 10 — Ranking dos 10 produtos por faturamento

O Notebook i5 liderou o ranking, com R$ 956.852,30 em faturamento líquido e R$ 181.292,30 em lucro bruto estimado. A Mesa de Escritório ficou em segundo lugar em faturamento, com R$ 506.620,63, mas apresentou o maior lucro absoluto entre os dez produtos listados, com R$ 186.300,63.

Os três produtos com maior faturamento — Notebook i5, Mesa de Escritório e Monitor de 27 Polegadas — somaram aproximadamente 56% do faturamento dos pedidos entregues.

**Insight:** o produto que mais fatura não é necessariamente aquele que gera o maior lucro absoluto. Por isso, é importante avaliar faturamento e lucro conjuntamente.

### Etapa 11 — Análise de clientes recorrentes

Utilizei `GROUP BY` para contar os pedidos entregues por cliente e uma CTE para organizar os resultados. Com `CASE WHEN`, identifiquei os clientes com mais de um pedido e calculei sua participação entre os clientes que realizaram compras entregues.

**Objetivo:** avaliar a recorrência de compra e compreender o comportamento da base de clientes.

### Etapa 12 — Ranking dos clientes por frequência de compra

Criei uma consulta que relaciona clientes, pedidos, itens de pedidos e produtos. Agrupei os resultados por cliente e ordenei pela quantidade de pedidos entregues, utilizando o faturamento como critério secundário.

A consulta apresenta pedidos, unidades vendidas, faturamento líquido e lucro bruto estimado para os dez clientes com maior frequência de compra.

**Objetivo:** identificar os clientes mais ativos e comparar frequência de compra com contribuição financeira.

### Etapa 13 — Análise por canal de venda

Utilizei SQL para comparar o desempenho dos canais Site, Aplicativo e Marketplace. Relacionei as tabelas de pedidos, itens de pedidos e produtos, considerando apenas pedidos entregues.

Calculei quantidade de pedidos, unidades vendidas, faturamento líquido, custo estimado, lucro bruto estimado, margem e ticket médio por canal.

**Objetivo:** identificar diferenças de desempenho e rentabilidade entre os canais de venda.

### Etapa 14 — Análise geográfica por região e estado

Relacionei clientes, pedidos, itens de pedidos e produtos para analisar as vendas por região e estado brasileiro.

Calculei pedidos, unidades, faturamento líquido, lucro bruto estimado e margem. Durante a consulta, utilizei `TRIM()` e `UPPER()` para padronizar as siglas dos estados e `COALESCE()` com `NULLIF()` para identificar campos vazios como "Não informado".

**Objetivo:** comparar o desempenho geográfico das vendas e praticar funções SQL de tratamento de texto e valores ausentes.

### Etapa 13 — Análise por canal de venda

O Site liderou em faturamento, com R$ 1.596.543,58, e em lucro bruto estimado, com R$ 560.495,58. O Marketplace apresentou o maior ticket médio, de R$ 1.610,31 por pedido. As margens dos três canais permaneceram próximas, entre 34,84% e 35,13%.

**Insight:** o Site é o principal canal em volume e valor total, enquanto o Marketplace apresenta maior valor médio por pedido. A diferença de margem entre os canais é pequena.

### Etapa 14 — Análise geográfica

São Paulo foi o estado com maior faturamento, com R$ 1.154.420,17, seguido por Rio de Janeiro e Minas Gerais. O Sudeste concentrou aproximadamente 69,7% do faturamento total, incluindo os registros associados à região sem estado informado.

A consulta identificou quatro pedidos entregues de clientes sem estado informado, totalizando R$ 2.177,53.

**Insight:** as vendas estão bastante concentradas no Sudeste, especialmente em São Paulo. Os registros sem estado informado representam uma oportunidade de melhoria da qualidade dos dados.

### Status do desenvolvimento — Etapa SQL

Concluí 11 consultas principais para explorar e analisar o banco de dados CompraCerta Brasil, além de uma consulta inicial de validação da carga.

As consultas abordaram inspeção de dados, filtragem, ordenação, agregações, faturamento mensal, análise por categoria, ranking de produtos, recorrência de clientes, ranking de clientes, canais de venda e desempenho geográfico.

Durante o desenvolvimento, pratiquei `SELECT`, `WHERE`, `ORDER BY`, `COUNT`, `SUM`, `AVG`, `ROUND`, `JOIN`, `GROUP BY`, CTEs e funções de tratamento de texto.

**Próxima fase:** conectar as quatro tabelas no Power BI, configurar seus relacionamentos, criar indicadores e construir um dashboard interativo para apresentar os resultados das análises.

### Etapa 15 — Modelo de dados no Power BI

Importei as quatro tabelas do banco CompraCerta Brasil: `clientes`, `pedidos`, `itens_pedido` e `produtos`.

Configurei os relacionamentos entre clientes e pedidos, pedidos e itens de pedidos, e produtos e itens de pedidos, utilizando os identificadores correspondentes.

Os relacionamentos representam a estrutura relacional do banco e permitem que os filtros e indicadores do Power BI utilizem informações de diferentes tabelas.

**Objetivo:** preparar um modelo de dados consistente para desenvolver medidas DAX e análises interativas no Power BI.

### Etapas 16 e 17 — Medidas DAX e validação no Power BI

Criei sete medidas DAX para calcular faturamento líquido, custo dos produtos, lucro bruto estimado, pedidos entregues, unidades vendidas, margem estimada e ticket médio.

As medidas consideram apenas pedidos com status "Entregue". Para calcular o faturamento, apliquei os descontos registrados nos itens. Para calcular o custo, utilizei o relacionamento com a tabela de produtos.

Por fim, comparei os resultados do Power BI com os valores obtidos nas consultas SQL, verificando a consistência dos cálculos entre as ferramentas.

**Objetivo:** demonstrar a capacidade de modelar dados relacionais, criar indicadores DAX e validar resultados analíticos.

### Etapa 18 — Correção da importação numérica e validação das medidas

Durante a validação das medidas DAX, identifiquei que os valores monetários importados dos arquivos CSV estavam aproximadamente 100 vezes maiores do que os resultados obtidos no SQLite.

A causa foi a interpretação incorreta do separador decimal durante a importação. No Power Query, utilizei a opção **Usar Localidade**, selecionando o tipo Número decimal e a localidade Inglês (Estados Unidos) nas colunas monetárias afetadas.

Após a correção, os indicadores passaram a coincidir com os resultados do SQL quando apresentados com duas casas decimais. Faturamento líquido, custo dos produtos, lucro bruto estimado, quantidade de pedidos, unidades vendidas e margem foram validados.

Também identifiquei a necessidade de ajustar a formatação do ticket médio, que estava exibindo casas decimais desnecessárias.

**Objetivo:** corrigir a interpretação dos dados de origem, validar os cálculos entre ferramentas diferentes e garantir a confiabilidade dos indicadores apresentados no dashboard.


### Etapa 19 — Cartões de indicadores no Power BI

Criei cartões para apresentar os principais indicadores do e-commerce: faturamento líquido, lucro bruto estimado, pedidos entregues, unidades vendidas, margem estimada e ticket médio.

**Objetivo:** destacar os indicadores principais e facilitar a leitura do desempenho geral do negócio.

### Etapa 20 — Faturamento por categoria

Criei um gráfico de barras agrupadas utilizando a categoria dos produtos e a medida de faturamento líquido. O visual permite comparar o desempenho das categorias, considerando apenas pedidos entregues.

**Objetivo:** identificar quais categorias geram maior faturamento e preparar a análise visual para comparação com outros indicadores.

### Etapa 21 — Evolução mensal do faturamento

Criei um gráfico de linhas utilizando a data dos pedidos e a medida de faturamento líquido para visualizar a evolução das vendas ao longo de 2025.

**Objetivo:** identificar tendências e oscilações no faturamento mensal.

### Etapa 22 — Faturamento por canal de venda

Criei um gráfico de barras para comparar o faturamento líquido dos canais Site, Aplicativo e Marketplace, considerando apenas pedidos entregues.

**Objetivo:** comparar o desempenho comercial dos canais de venda.

### Etapa 23 — Faturamento por região

Criei um gráfico de barras para comparar o faturamento líquido por região, utilizando os relacionamentos entre clientes, pedidos e itens de pedidos.

**Objetivo:** identificar as regiões que mais contribuem para o faturamento do e-commerce.

### Etapa 24 — Ranking dos 10 produtos por faturamento

Criei um gráfico de barras para apresentar os dez produtos com maior faturamento líquido, utilizando um filtro Top N baseado na medida DAX Faturamento Líquido.

**Objetivo:** identificar os produtos com maior contribuição financeira para o negócio.

### Etapa 25 — Filtros interativos

Adicionei segmentações de dados para Região, Categoria e Canal de Venda.

Testei as seleções para verificar como os indicadores e gráficos respondem aos filtros.

**Objetivo:** permitir a análise interativa do desempenho comercial por região, categoria e canal de venda.

### Etapa 26 — Ajuste da medida de pedidos entregues

Ajustei a medida DAX `Pedidos Entregues` para contar os identificadores distintos de pedidos na tabela `itens_pedido`, considerando apenas pedidos com status "Entregue".

Essa alteração permite que a contagem responda adequadamente à segmentação por categoria, pois a categoria filtra os produtos e seus respectivos itens de pedidos.

### Etapa 27 — Validação dos filtros e indicadores

Testei as segmentações de Categoria, Canal de Venda e Região, comparando os indicadores exibidos no Power BI com os resultados das consultas SQL já validadas.

**Objetivo:** verificar se os filtros interativos e as medidas DAX apresentam resultados consistentes em diferentes contextos de análise.

### Etapa 27 — Validação das segmentações e indicadores

Testei as segmentações de Categoria, Canal de Venda e Região, comparando os resultados do Power BI com as consultas SQL previamente validadas.

No teste de Eletrônicos, o faturamento líquido foi de R$ 1.971.590,69, com lucro bruto estimado de R$ 590.578,69 e margem de 29,95%.

No teste do canal Site, o faturamento líquido foi de R$ 1.596.543,58, com lucro bruto estimado de R$ 560.495,58 e margem de 35,11%.

No teste da região Sudeste, o faturamento líquido foi de R$ 2.315.370,54, com lucro bruto estimado de R$ 803.070,54 e margem de 34,68%.

Os resultados confirmaram que as segmentações estão filtrando os indicadores e gráficos conforme esperado. Também identifiquei a necessidade de ajustar as unidades de exibição dos cartões para facilitar a leitura dos valores exatos.

**Conclusão da validação:** as medidas DAX e os filtros apresentaram resultados consistentes com as análises SQL.



