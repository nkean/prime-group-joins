-- 1. Get all customers and their addresses.

SELECT * FROM "customers"
JOIN "addresses" ON "addresses"."customer_id" = "customers"."id"
ORDER BY "addresses"."id";

-- 2. Get all orders and their line items.

SELECT * FROM "orders"
JOIN "line_items" ON "line_items"."order_id" = "orders"."id"
ORDER BY "line_items"."id";

-- 3. Which warehouses have cheetos?

SELECT "warehouse"."warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'cheetos';

-- 4. Which warehouses have diet pepsi?

SELECT "warehouse"."warehouse"
FROM "warehouse"
JOIN "warehouse_product" ON "warehouse"."id" = "warehouse_product"."warehouse_id"
JOIN "products" ON "warehouse_product"."product_id" = "products"."id"
WHERE "products"."description" = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT "first_name", "last_name", COUNT(*) FROM "customers"
JOIN "addresses" ON "customers"."id" = "addresses"."customer_id"
JOIN "orders" ON "addresses"."id" = "orders"."address_id"
GROUP BY "first_name", "last_name";

-- 6. How many customers do we have?

SELECT COUNT(*) FROM "customers";

-- 7. How many products do we carry?

SELECT COUNT(*) FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?

SELECT SUM("on_hand") FROM "warehouse_product"
JOIN "products" ON "products"."id" = "warehouse_product"."product_id"
WHERE "products"."description" = 'diet pepsi';