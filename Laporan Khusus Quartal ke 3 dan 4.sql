
--2. Membuat Table Laporan Khusus Quartal ke 3 dan 4.

CREATE TABLE Q3_Q4_Review (
	sales_id INT,
	buyer_id INT,
	purchase_date DATE,
	total_price DECIMAL(10,2),
	promo_id INT,
	sales_after_promo INT
);

INSERT INTO Q3_Q4_Review (sales_id, buyer_id, purchase_date, total_price, promo_id, sales_after_promo)
SELECT s.sales_id, s.buyer_id, s.purchase_date, 
       m.price * s.quantity AS total_price, s.promo_id, 
       (m.price * s.quantity) - pc.price_deduction AS sales_after_promo
FROM sales_table s
JOIN marketplace_table m ON s.item_id = m.item_id
JOIN promo_code pc ON s.promo_id = pc.promo_id
WHERE s.purchase_date >= '2022-07-01' AND s.purchase_date <= '2022-12-31';


select * from Q3_Q4_Review