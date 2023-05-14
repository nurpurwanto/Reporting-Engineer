Summarizing "Promo Effectiveness Review" Program pada Omnichannel Jubelio

--1. Mengaplikasikan Promo Code dari Tim Budgeting.

CREATE TABLE promo_code (
  promo_id INT PRIMARY KEY,
  promo_name VARCHAR(50),
  price_deduction DECIMAL(10,2),
  description TEXT,
  duration INT
);

--kemudian import file promo_code.csv melalui menu import