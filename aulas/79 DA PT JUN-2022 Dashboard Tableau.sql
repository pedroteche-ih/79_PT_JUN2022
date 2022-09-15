CREATE TABLE tb_linha_pedido AS 
SELECT
	oodc.order_id,
	ooidc.price,
	ooidc.freight_value,
	oodc.order_status,
	STR_TO_DATE(oodc.order_approved_at, '%Y-%m-%d %H:%i:%s') AS order_approved_at,
	STR_TO_DATE(ooidc.shipping_limit_date, '%Y-%m-%d %H:%i:%s') AS shipping_limit_date,
	STR_TO_DATE(oodc.order_delivered_carrier_date, '%Y-%m-%d %H:%i:%s') AS order_delivered_carrier_date,
	STR_TO_DATE(oodc.order_delivered_customer_date, '%Y-%m-%d %H:%i:%s') AS order_delivered_customer_date,
	STR_TO_DATE(oodc.order_estimated_delivery_date, '%Y-%m-%d %H:%i:%s') AS order_estimated_delivery_date,
	ocdc.customer_state,
	osdc.seller_state,
	opdc.product_category_name,
	opdc.product_weight_g,
	oordc.review_score 
FROM 
	olist_order_items_dataset_csv ooidc JOIN
	olist_orders_dataset_csv oodc ON (ooidc.order_id = oodc.order_id) JOIN 
	olist_customers_dataset_csv ocdc ON (oodc.customer_id = ocdc.customer_id) JOIN 
	olist_products_dataset_csv opdc ON (ooidc.product_id = opdc.product_id) JOIN
	olist_sellers_dataset_csv osdc ON (osdc.seller_id = ooidc.seller_id) LEFT JOIN 
	olist_order_reviews_dataset_csv oordc ON (oodc.order_id = oordc.order_id) JOIN
	(
		SELECT
			oordc.review_id,
			STR_TO_DATE(oordc.review_creation_date, '%Y-%m-%d %H:%i:%s') AS review_date,
			SUM(1) OVER (PARTITION BY order_id ORDER BY order_id, STR_TO_DATE(oordc.review_creation_date, '%Y-%m-%d %H:%i:%s') DESC) AS cum_review
		FROM 
			olist_order_reviews_dataset_csv oordc
		ORDER BY 
			oordc.order_id,
			STR_TO_DATE(oordc.review_creation_date, '%Y-%m-%d %H:%i:%s') DESC
	) AS lr ON (oordc.review_id = lr.review_id)
WHERE
	lr.cum_review = 1;

SELECT 
	tlp.order_id,
	tlp.order_status,
	tlp.order_approved_at,
	tlp.customer_state,
	tlp.seller_state,
	tlp.price,
	tlp.freight_value,
	tlp.product_weight_g,
	tlp.review_score,
	tlp.product_category_name,
	DATEDIFF(tlp.order_delivered_carrier_date, tlp.order_approved_at) AS tempo_seller_oplog,
	DATEDIFF(tlp.order_delivered_customer_date, tlp.order_delivered_carrier_date) AS tempo_oplog_entrega,
	DATEDIFF(tlp.order_delivered_customer_date, tlp.order_approved_at) AS tempo_frete,
	DATEDIFF(tlp.order_estimated_delivery_date, tlp.order_approved_at) AS tempo_estimado_frete,
	CASE 
		WHEN tlp.order_status = 'delivered' AND DATEDIFF(tlp.order_delivered_customer_date, tlp.order_estimated_delivery_date) > 0 THEN 'ATRASADA'
		WHEN tlp.order_status = 'delivered' AND DATEDIFF(tlp.order_delivered_customer_date, tlp.order_estimated_delivery_date) <= 0 THEN 'ONTIME'
		ELSE 'NAO_ENTREGUE'
	END AS status_log_entrega,
	CASE
		WHEN (tlp.order_status = 'shipped' OR tlp.order_status = 'delivered') AND DATEDIFF(tlp.order_delivered_carrier_date, tlp.shipping_limit_date) > 0 THEN 'ATRASADA'
		WHEN (tlp.order_status = 'shipped' OR tlp.order_status = 'delivered') AND DATEDIFF(tlp.order_delivered_carrier_date, tlp.shipping_limit_date) <= 0 THEN 'ONTIME'
		ELSE 'NAO_ENVIADA'
	END AS status_log_seller
FROM 
	tb_linha_pedido tlp
WHERE
	YEAR(tlp.order_approved_at) > 2016 AND
	tlp.order_approved_at < '2018-08-01';