SELECT 
	d.A4 AS total_pop,
	d.A9 AS num_cities,
	d.A10 AS urb_pop_ratio,
	(d.A12 + d.A13) AS avg_unemploy,
	(d.A15 + d.A16)/(2 * d.A4) AS avg_crime_rate,
	tx_emp_distrito.TX_DEVEDORES AS tx_devedores,
	tx_emp_distrito.NUM_EMPRESTIMOS AS num_emprestimos
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