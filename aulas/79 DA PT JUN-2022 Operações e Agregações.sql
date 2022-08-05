SELECT 
	*
FROM 
	bank.trans t;

SELECT 
	t.trans_id AS id_transacao
FROM
	bank.trans t;

SELECT
	t.amount,
	t.amount + 100 AS amount_100
FROM 
	bank.trans t;

SELECT 
	t.amount,
	LOG((t.amount+100)*2) AS ln_amount
FROM
	bank.trans t;

SELECT
	t.`type`,
	CONCAT(t.`type`, '_', t.operation) AS TIPO_CONSOLIDADO,
	REPLACE(t.`type`, 'PRI', 'CREDITO')
FROM 
	bank.trans t;

SELECT
	t.`date`,
	STR_TO_DATE(t.date, '%y%m%d') AS data_correta,
	YEAR(STR_TO_DATE(t.date, '%y%m%d')) AS ANO,
	MONTH(STR_TO_DATE(t.date, '%y%m%d')) AS MES,
	DAY(STR_TO_DATE(t.date, '%y%m%d')) AS DIA,
	DAYOFWEEK(STR_TO_DATE(t.date, '%y%m%d')) AS DIA_DA_SEMANA,
	TIMESTAMPADD(DAY, 2, STR_TO_DATE(t.date, '%y%m%d')) AS data_2_meses,
	TIMESTAMPDIFF(DAY , '1993-01-04', STR_TO_DATE(t.date, '%y%m%d')) AS diff_inicio
FROM 
	bank.trans t;

SELECT 
	d.A2 AS DISTRICT_NAME,
	d.A4 AS POPULATION,
	d.A10 AS RATIO_URBAN_POP,
	d.A4*d.A10/100 AS POP_URBAN
FROM 
	bank.district d;

SELECT
	c.card_id,
	YEAR(STR_TO_DATE(c.issued, '%y%m%d %H:%i:%s')) AS year_issued
FROM 
	BANK.card c
WHERE 
	c.`type` = 'gold';

SELECT
	t.`type`,
	COUNT(*) AS NUM_TRANSACOES,
	AVG(t.amount) AS AVG_AMOUNT,
	SUM(t.amount) AS TOTAL_AMOUNT
FROM 
	bank.trans t
GROUP BY
	t.`type`
HAVING
	COUNT(*) > 20000
	;

SELECT
	t.`type`,
	t.operation, 
	COUNT(*) AS NUM_TRANSACOES,
	AVG(t.amount) AS AVG_AMOUNT,
	SUM(t.amount) AS TOTAL_AMOUNT
FROM 
	bank.trans t
WHERE
	t.TYPE = 'PRIJEM'
GROUP BY
	t.`type`,
	t.operation
HAVING
	COUNT(*) > 10000;

SELECT
	*
FROM 
	bank.district d ;

SELECT 
	d.A3,+
	count(*)
FROM
	bank.district d
GROUP BY
	d.a3
ORDER BY
	d.A3 ASC
;

SELECT 
	d.A3,
	d.A1,
	count(*)
FROM
	bank.district d;