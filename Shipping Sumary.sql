--4. Membuat Shipping Label Khusus Bulan December

CREATE TABLE shipping_summary (
  kode_resi VARCHAR(50) NOT NULL,
  shipping_date DATE NOT NULL,
  seller_name VARCHAR(255) NOT NULL,
  buyer_name VARCHAR(255) NOT NULL,
  buyer_address VARCHAR(255) NOT NULL,
  buyer_city VARCHAR(255) NOT NULL,
  buyer_zipcode VARCHAR(10) NOT NULL,
  PRIMARY KEY (kode_resi)
);

ALTER TABLE buyer_table RENAME COLUMN address TO buyer_address;
ALTER TABLE buyer_table RENAME COLUMN city TO buyer_city;
ALTER TABLE buyer_table RENAME COLUMN zipcode TO buyer_zipcode;

INSERT INTO shipping_summary (kode_resi,shipping_date, seller_name, buyer_name, buyer_address, buyer_city, buyer_zipcode)
SELECT 
CONCAT(s.shipping_id, '-', TO_CHAR(s.purchase_date, 'YYYYMMDD'), '-', TO_CHAR(s.shipping_date, 'YYYYMMDD'), '-', s.buyer_id, '-', s.seller_id) AS kode_resi,
s.shipping_date, st.seller_name, bt.buyer_name, bt.buyer_address, bt.buyer_city, bt.buyer_zipcode
FROM shipping_table s
JOIN seller_table st ON s.seller_id = st.seller_id
JOIN buyer_table bt ON s.buyer_id = bt.buyer_id;

select * from shipping_summary

