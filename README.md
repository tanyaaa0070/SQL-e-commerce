# 🛒 E-Commerce SQL Database

A complete **E-Commerce Database Management System** built using **MySQL**. This project demonstrates how an online shopping platform can manage users, products, categories, orders, order items, and payments using a relational database.

## 🚀 Features

- User/customer management
- Product management
- Product category management
- Order management
- Order item tracking
- Payment management
- Stock management
- Customer order tracking
- Product and sales analysis
- SQL JOIN operations
- Aggregate functions
- GROUP BY and ORDER BY queries
- UPDATE and DELETE operations
- Foreign key relationships

## 🛠️ Tech Stack

- **Database:** MySQL
- **Language:** SQL
- **Tool:** MySQL Workbench
- **Version Control:** Git & GitHub

## 📊 Database Schema

The database contains six main tables:

```text
Users
  │
  │
  ▼
Orders ──────────► Payments
  │
  ▼
Order_Items
  │
  ▼
Products
  │
  ▼
Categories
```

### Tables

| Table | Description |
|---|---|
| `users` | Stores customer information |
| `categories` | Stores product categories |
| `products` | Stores product details and stock |
| `orders` | Stores customer orders |
| `order_items` | Stores products included in each order |
| `payments` | Stores payment information |

## 🗂️ Database Structure

### Users

Stores customer details such as name, email, phone number, and address.

```sql
user_id
name
email
phone
address
```

### Categories

Stores product categories.

```sql
category_id
category_name
```

### Products

Stores product information including price, stock, and category.

```sql
product_id
product_name
price
stock
category_id
```

### Orders

Stores customer order information.

```sql
order_id
user_id
order_date
total_amount
status
```

### Order Items

Connects orders with products and stores quantity and price.

```sql
order_item_id
order_id
product_id
quantity
price
```

### Payments

Stores payment information.

```sql
payment_id
order_id
payment_date
amount
payment_method
payment_status
```

## 🔗 Relationships

- One user can place multiple orders.
- One order can contain multiple order items.
- One product can appear in multiple order items.
- One category can contain multiple products.
- Each order is associated with a payment.

## 💻 SQL Concepts Used

This project demonstrates:

- `CREATE DATABASE`
- `CREATE TABLE`
- Primary Keys
- Foreign Keys
- `INSERT`
- `SELECT`
- `UPDATE`
- `DELETE`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `JOIN`
- `LEFT JOIN`
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `DISTINCT`
- `LIMIT`
- Aggregate Functions
- Relational Database Design

## 📈 Example Queries

### Find the most expensive product

```sql
SELECT *
FROM products
ORDER BY price DESC
LIMIT 1;
```

### Find total sales

```sql
SELECT SUM(total_amount) AS total_sales
FROM orders
WHERE status != 'Cancelled';
```

### Display products with their categories

```sql
SELECT
    p.product_name,
    p.price,
    c.category_name
FROM products p
JOIN categories c
ON p.category_id = c.category_id;
```

### Find total orders by customer

```sql
SELECT
    u.name,
    COUNT(o.order_id) AS total_orders
FROM users u
LEFT JOIN orders o
ON u.user_id = o.user_id
GROUP BY u.user_id, u.name;
```

## 📁 Project Structure

```text
ecommerce-sql/
│
├── ecommerce.sql
└── README.md
```

## ⚙️ How to Run

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/ecommerce-sql.git
```

### 2. Open MySQL Workbench

Open the `ecommerce.sql` file.

### 3. Execute the SQL script

Run the complete SQL script to:

- Create the database
- Create all tables
- Create relationships
- Insert sample data
- Execute analysis queries

### 4. Select the database

```sql
USE ecommerce;
```

## 🎯 Project Objective

The main objective of this project is to design and implement a relational database for an e-commerce platform while demonstrating practical SQL concepts such as database normalization, table relationships, data manipulation, joins, aggregation, and business analysis.

## 🔮 Future Improvements

- Add shopping cart functionality
- Add product reviews and ratings
- Add wishlist management
- Add discount and coupon management
- Add shipping and delivery tracking
- Add stored procedures
- Add triggers for automatic stock updates
- Add SQL views for reporting
- Connect the database with a Python/Java/Node.js backend
- Build an e-commerce frontend

## 👩‍💻 Author

**Tanya Singh**

B.Tech – Computer Science Engineering (AI & Machine Learning)

---
