# EcoSaver: Household Energy Consumption Tracker

## 📌 Overview
**EcoSaver** is a comprehensive household energy consumption tracking system designed to promote energy efficiency and awareness.  
It enables **users** to monitor their energy usage in real-time, receive personalized energy-saving tips, and track historical consumption patterns.  
**Utility providers** can log energy usage data, share actionable tips, and manage their consumer base, while **admins** have complete control over managing providers, users, and consumption records.  

This system aims to bridge the gap between consumers and providers by ensuring transparent energy usage monitoring and encouraging sustainable energy practices.  
By centralizing data and offering role-specific features, **EcoSaver** helps reduce unnecessary consumption, lowers energy bills, and contributes to environmental conservation.


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

**Database Name:** `energy_saverdb`

| Table Name        | Columns |
|-------------------|---------|
| **user**          | id (AI), name, address, contact, email, password |
| **provider**      | id (AI), name, zone, contact, email, password |
| **consumption_logs** | id (AI), userId, providerId, unitsConsumed, logDate |
| **tips**          | id (AI), providerId, tipText, publishDate |

---

## ⚙️ Technology Stack
- **Frontend:** HTML5, CSS3
- **Backend:** Java (Servlets/JSP)
- **Database:** MySQL
- **Server:** Apache Tomcat
- **Tools:** Eclipse IDE

---

## 🚀 Core Features
- Role-based authentication and access control
- Secure login system for Admin, User, and Utility Provider
- Energy usage tracking with historical logs
- Utility provider management (Add, View, Delete)
- Tips management for energy saving
- Password change functionality for all roles

---

## 🔧 Setup Instructions
1. Clone the repository

   ```bash
   git clone https://github.com/AbhishekPawar-1904/EcoSaver.git
   Import into Eclipse

### **2. Import into Eclipse**
- Open **Eclipse IDE**
- Go to `File` → `Import` → `Existing Projects into Workspace`
- Select the project folder and click **Finish**

### **3. Configure Database**
- Create a MySQL database named `energy_saverdb`
- Run the provided SQL script to create the required tables

### **4. Deploy on Tomcat**
- In Eclipse, add the project to your configured Apache Tomcat server
- Start the Tomcat server
- Open your browser and go to:


---

## **📸 Screenshots**
<img width="1916" height="1071" alt="image" src="https://github.com/user-attachments/assets/efc4f95f-45ed-4d67-8e83-5776add361a5" />


---

## 📜 License

This project is for educational purposes.


---



