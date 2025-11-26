# Library Management System (User Management)

## Overview
This **Library Management System** is a web-based application using **JSP (JavaServer Pages)** and **MySQL**.  
It allows librarians or administrators to manage library users efficiently by providing functionalities to **insert, view (index/list), update, and delete** user records.

---

## Features

1. **Insert User (`insert.jsp`)**  
   - Provides a form to add a new user.  
   - Fields include: **ID, Name, Email, Age**.  
   - On submission, inserts the user into the database.

2. **View Users (`index.jsp` / `list.jsp`)**  
   - Displays all users in a table.  
   - Shows **ID, Name, Email, Age**.  
   - Provides **Update** and **Delete** options for each user.  
   - `index.jsp` can serve as the homepage, and `list.jsp` can specifically list all users.

3. **Update User (`update.jsp`)**  
   - Pre-fills a form with existing user data.  
   - Allows editing **Name, Email, Age**.  
   - Submits changes to update the record in the database.

4. **Delete User (`delete.jsp`)**  
   - Deletes a user record from the database.  
   - Usually triggered from a **Delete button/link** in the user list.

---

## Technologies Used

- **Frontend:** HTML, CSS, JSP  
- **Backend:** Java (Servlets/JSP)  
- **Database:** MySQL  
- **Server:** Apache Tomcat  

---

## Database Schema

```sql
CREATE DATABASE library_db;

USE library_db;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    age INT NOT NULL
);
