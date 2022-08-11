WITH al AS
(
SELECT
	a.account_id,
	l.loan_id,
	STR_TO_DATE(l.date, '%y%m%d') AS dt_loan,
	l.amount,
	CASE 
		WHEN l.status = 'B' OR l.status = 'D' THEN 1
		ELSE 0
	END AS status_devedor
FROM
	bank.account a JOIN
	bank.loan l ON (a.account_id = l.account_id)
)
SELECT
	STR_TO_DATE(t.date, '%y%m%d') AS dt_trans,
	DATEDIFF(dt_loan, STR_TO_DATE(t.date, '%y%m%d')) AS num_dias_loan,
	t.account_id AS account_id,
	CASE 
		WHEN t.type = 'PRIJEM' THEN 'DEPOSITO'
		ELSE 'SAQUE'
	END AS tipo_trans,
	CASE
		WHEN t.TYPE = 'PRIJEM' THEN t.amount
		ELSE t.amount * -1
	END AS trans_amount,
	t.balance,
	al.dt_loan,
	al.amount AS loan_amount,
	al.status_devedor
FROM
	bank.trans t JOIN
	al ON (t.account_id = al.account_id)
HAVING
	dt_trans <= dt_loan
ORDER BY
	t.account_id ASC,
	t.date ASC