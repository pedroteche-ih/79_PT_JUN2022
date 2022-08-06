-- VOLTAMOS 11H26

SELECT
	c.client_id,
	a.account_id,
	l.loan_id,
	l.status 
FROM 
	bank.client c JOIN 
	bank.disp d ON (c.client_id = d.client_id) JOIN 
	bank.account a ON (d.account_id = a.account_id) JOIN
	bank.loan l ON (a.account_id = l.account_id);

-- CONSTRUIR INDICADORES DEMOGRÁFICOS
SELECT 
	*
FROM 
	bank.district d JOIN
	(
		SELECT
			c.district_id,
			AVG(
				CASE 
					WHEN l.status = 'B' OR l.status = 'D' THEN 1
					ELSE 0
				END
			) AS TX_DEVEDORES,
			COUNT(*) AS NUM_EMPRESTIMOS 
		FROM 
			bank.client c JOIN 
			bank.disp d ON (c.client_id = d.client_id) JOIN 
			bank.account a ON (d.account_id = a.account_id) JOIN
			bank.loan l ON (a.account_id = l.account_id) JOIN 
			bank.district d2 ON (c.district_id = d2.A1)
		GROUP BY 
			c.district_id 
	) AS TX_EMP_DISTRITO ON (TX_EMP_DISTRITO.district_id = d.a1)
;

WITH tx_emp_distrito AS
	(	
		SELECT
			c.district_id,
			AVG(
				CASE 
					WHEN l.status = 'B' OR l.status = 'D' THEN 1
					ELSE 0
				END
			) AS TX_DEVEDORES,
			COUNT(*) AS NUM_EMPRESTIMOS 
		FROM 
			bank.client c JOIN 
			bank.disp d ON (c.client_id = d.client_id) JOIN 
			bank.account a ON (d.account_id = a.account_id) JOIN
			bank.loan l ON (a.account_id = l.account_id) JOIN 
			bank.district d2 ON (c.district_id = d2.A1)
		GROUP BY 
			c.district_id
	 )
SELECT 
	*
FROM 
	bank.district d3 JOIN
	tx_emp_distrito tx ON (d3.a1 = tx.district_id);

CREATE VIEW tx_emp_distrito AS
SELECT
	c.district_id,
	AVG(
		CASE 
			WHEN l.status = 'B' OR l.status = 'D' THEN 1
			ELSE 0
		END
	) AS TX_DEVEDORES,
	COUNT(*) AS NUM_EMPRESTIMOS 
FROM 
	bank.client c JOIN 
	bank.disp d ON (c.client_id = d.client_id) JOIN 
	bank.account a ON (d.account_id = a.account_id) JOIN
	bank.loan l ON (a.account_id = l.account_id) JOIN 
	bank.district d2 ON (c.district_id = d2.A1)
GROUP BY 
	c.district_id;
	
SELECT 
	*
FROM 
	bank.district d JOIN
	bank.tx_emp_distrito ted ON (d.A1 = ted.district_id);