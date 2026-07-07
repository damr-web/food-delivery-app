# 🍔 Food Delivery App

> A Full Stack Java Web Application for Online Food Ordering built using Java, JSP, Servlets, JDBC, Maven, MySQL, and Apache Tomcat.

---

# 📖 Overview

The **Food Delivery App** is a web-based application that allows users to browse restaurants, explore menus, add food items to their cart, and place food orders online. The project follows the MVC (Model-View-Controller) architecture and demonstrates Java Enterprise development using Servlets, JSP, JDBC, and MySQL.

This project was developed as a learning project to understand Java Web Development, Database Connectivity, Session Management, and CRUD operations.

---

# 🎯 Project Objectives

The main objectives of this project are:

- Develop a dynamic web application using Java technologies.
- Learn MVC Architecture.
- Perform CRUD operations using JDBC.
- Implement user authentication.
- Manage user sessions securely.
- Create an interactive food ordering platform.
- Integrate MySQL database with Java.
- Deploy the application on Apache Tomcat.

---

# ✨ Features

## 👤 User Module

- User Registration
- Secure Login
- Logout
- Session Management
- View Profile

---

## 🍽 Restaurant Module

- Display available restaurants
- Restaurant details
- Restaurant ratings
- Restaurant descriptions

---

## 🍕 Menu Module

- Browse menu items
- View item price
- View item description
- Food category display

---

## 🛒 Cart Module

- Add food items
- Update quantity
- Remove items
- View cart
- Calculate total price

---

## 💳 Checkout Module

- Review order
- Confirm order
- Store order details
- Generate order confirmation

---

## 📜 Order Module

- Order history
- Previous orders
- Ordered items
- Order details

---

## ⭐ Review Module

- Add reviews
- Display ratings
- Restaurant feedback

---

# 🛠 Technologies Used

## Backend

- Java
- Java Servlets
- JDBC
- Maven

---

## Frontend

- JSP
- HTML5
- CSS3

---

## Database

- MySQL

---

## Server

- Apache Tomcat 10

---

## IDE

- Eclipse IDE

---

## Version Control

- Git
- GitHub

---

# 🏗 Project Architecture

The application follows the **MVC Architecture**.

```
                User
                  │
                  ▼
              JSP Pages
                  │
                  ▼
             Java Servlets
                  │
                  ▼
            DAO Layer (JDBC)
                  │
                  ▼
             MySQL Database
```

### Model

Contains Java classes representing application data.

Example:

- User
- Restaurant
- MenuItem
- CartItem
- Order
- Review

---

### View

Contains JSP pages that display data to users.

Examples:

- index.jsp
- login.jsp
- signup.jsp
- restaurants.jsp
- menu.jsp
- cart.jsp
- checkout.jsp
- order-history.jsp
- order-confirmation.jsp

---

### Controller

Contains Servlets that process user requests.

Examples:

- LoginServlet
- SignupServlet
- RestaurantListServlet
- MenuServlet
- AddToCartServlet
- UpdateCartServlet
- RemoveCartServlet
- CheckoutServlet
- OrderHistoryServlet

---

# 📂 Project Structure

```
food-delivery-app
│
├── src
│   └── main
│       ├── java
│       │
│       └── com.fooddelivery
│           ├── controller
│           ├── dao
│           ├── dao.impl
│           ├── dbutil
│           └── model
│
│       └── webapp
│           ├── css
│           ├── index.jsp
│           ├── home.jsp
│           ├── login.jsp
│           ├── signup.jsp
│           ├── restaurants.jsp
│           ├── menu.jsp
│           ├── cart.jsp
│           ├── checkout.jsp
│           ├── order-confirmation.jsp
│           └── order-history.jsp
│
├── pom.xml
├── README.md
└── .gitignore
```

---

# ⚙ Database

Database: **food_delivery_db**

Main Tables:

- users
- restaurants
- menu
- cart
- orders
- order_items
- reviews

Relationships:

```
Users
   │
   ├──────── Orders
   │             │
   │             └──── Order Items
   │
Restaurants
   │
   └──── Menu
              │
              └──── Reviews
```

---

# 🔄 Application Workflow

```
User Registration
        │
        ▼
Login
        │
        ▼
Restaurant List
        │
        ▼
View Menu
        │
        ▼
Add to Cart
        │
        ▼
Checkout
        │
        ▼
Order Confirmation
        │
        ▼
Order History
```

---

# 🚀 Installation

## Clone Repository

```bash
git clone https://github.com/damr-web/food-delivery-app.git
```

---

## Open in Eclipse

- File
- Import
- Existing Maven Project

---

## Configure MySQL

Create database

```
food_delivery_db
```

Import SQL tables.

Update database credentials in

```
DBUtil.java
```

```java
URL = jdbc:mysql://localhost:3306/food_delivery_db
USERNAME = root
PASSWORD = your_password
```

---

## Run the Project

1. Start MySQL

2. Start Apache Tomcat

3. Deploy project

4. Open browser

```
http://localhost:8080/food-delivery-app/
```

---

# 📸 Application Screens

- Home Page
- Login
- Signup
- Restaurant List
- Menu
- Cart
- Checkout
- Order Confirmation
- Order History


<img width="1920" height="1080" alt="Screenshot (235)" src="https://github.com/user-attachments/assets/e8a24ec5-422e-4d0e-b160-3d6c9f6781ec" />
<img width="1920" height="1080" alt="Screenshot (236)" src="https://github.com/user-attachments/assets/f1158298-4cd5-4044-8a78-5186c9b25a84" />
<img width="1920" height="1080" alt="Screenshot (237)" src="https://github.com/user-attachments/assets/f2e935a0-53b1-4715-a55a-681db7d9b9ae" />
<img width="1920" height="1080" alt="Screenshot (238)" src="https://github.com/user-attachments/assets/70f657c7-37a0-484f-a9c1-ad6b1acd0cc4" />
<img width="1920" height="1080" alt="Screenshot (239)" src="https://github.com/user-attachments/assets/2a19398f-db59-419a-999e-f21cf0fb2f20" />
<img width="1920" height="1080" alt="Screenshot (240)" src="https://github.com/user-attachments/assets/1b942a24-c78a-4d9a-97e6-08a994fa222d" />
<img width="1920" height="1080" alt="Screenshot (241)" src="https://github.com/user-attachments/assets/0e50b097-75b2-482d-b1dc-3d8b276ce344" />
<img width="1920" height="1080" alt="Screenshot (242)" src="https://github.com/user-attachments/assets/ce38ae2f-4f4e-459b-912d-d63d2bf370cb" />
<img width="1920" height="1080" alt="Screenshot (243)" src="https://github.com/user-attachments/assets/094d1744-0fbb-4fcb-824f-4ee1eedf17f0" />
<img width="1920" height="1080" alt="Screenshot (244)" src="https://github.com/user-attachments/assets/21278099-f659-4a85-935e-f47d69a15ebb" />


---

# 📌 Key Concepts Implemented

- MVC Architecture
- Session Management
- JDBC Connectivity
- CRUD Operations
- Java Servlets
- JSP
- DAO Pattern
- SQL Joins
- Maven Project
- Dynamic Web Pages

---

# 🔒 Security Features

- User Authentication
- Session Tracking
- Input Validation
- Database Connection Management

---

# 🚀 Future Enhancements

- Admin Dashboard
- Restaurant Owner Panel
- Online Payment Integration
- Email Notifications
- OTP Verification
- Live Order Tracking
- Google Maps Integration
- Search & Filter Restaurants
- Food Recommendation System
- Responsive Mobile Design

---

# 👨‍💻 Author

**Darshan Maruti Naik**

Computer Science Student

GitHub:
https://github.com/damr-web

---

# 📜 License

This project is developed for educational and learning purposes only.

---

# ⭐ If you like this project

Give this repository a ⭐ on GitHub to support the project.
