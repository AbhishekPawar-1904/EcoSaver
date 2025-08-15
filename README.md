# EcoSaver: Household Energy Consumption Tracker

## 📌 Overview
**EcoSaver** is a household energy consumption tracking system that helps users monitor energy usage, receive energy-saving tips, and allows utility providers to log consumption data.  
The system has three roles: **Admin**, **User**, and **Utility Provider**.

---

## 👥 Roles & Functionalities

### **Admin**
- Login
- Add/View/Delete Utility Providers
- View Users
- View Consumption Logs

### **User**
- Register
- Login
- View Energy Usage
- Get Saving Tips
- Change Password

### **Utility Provider**
- Login
- Log Consumption Data
- Provide Tips
- Change Password

---

## 🗄 Database Design

**Database Name:** `energyDB`

| Table Name        | Columns |
|-------------------|---------|
| **user**          | id (AI), name, address, contact, email, password |
| **provider**      | id (AI), name, zone, contact, email, password |
| **consumption_logs** | id (AI), userId, providerId, unitsConsumed, logDate |
| **tips**          | id (AI), providerId, tipText, publishDate |

---

## ⚙️ Technology Stack
- **Frontend:** HTML, CSS, JavaScript
- **Backend:** Java (Servlets/JSP)
- **Database:** MySQL
- **Server:** Apache Tomcat
- **Tools:** Eclipse IDE

---

## 🌟 Core Features
- Role-based authentication and access control
- Secure login system for Admin, User, and Utility Provider
- Energy usage tracking with historical logs
- Utility provider management (Add, View, Delete)
- Tips management for energy saving
- Password change functionality for all roles

---

## 🚀 Features
- Secure login for all roles
- Role-based access control
- Energy consumption tracking
- Energy-saving tips management
- Admin control over utility providers

---

## 🔧 Setup Instructions
1. **Clone the repository**
   ```bash
   git clone https://github.com/AbhishekPawar-1904/EcoSaver.git
   Import into Eclipse

.Import into Eclipse
.Open Eclipse → File → Import → Existing Projects into Workspace → Select project folder.
.Configure Database
.Create a MySQL database named energyDB.
.Run the provided SQL script to create tables.
.Deploy on Tomcat
.Add project to Tomcat server in Eclipse.
.Start the server and access via browser.

---


📸 Screenshots

