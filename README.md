# Fee Management Service using Azure Functions

A cloud-native serverless application built on Microsoft Azure that enables students to retrieve fee details and update fee payments through REST APIs. The solution uses Azure Functions, Azure SQL Database, API Management, and Logic Apps (workflow automation).

---

# Project Overview

This project demonstrates a modern serverless architecture where Azure Functions expose REST APIs connected to Azure SQL Database.

The APIs are published through Azure API Management for secure access and future scalability.

The application supports:

- Retrieve student fee information
- Update student fee payments
- Automatic fee status calculation
- API Gateway using Azure API Management
- Workflow automation using Azure Logic Apps (in progress)

---

# Architecture

```
                    Client / Browser
                           │
                           ▼
                Azure API Management
                           │
                           ▼
                  Azure Function App
                           │
                  Python Azure Functions
                  ├──────────────┐
                  ▼              ▼
          GetStudentFee      UpdateFee
                  │              │
                  └──────┬───────┘
                         ▼
                 Azure SQL Database
                         │
                    Students Table
```

---

# Tech Stack

| Service | Technology |
|----------|------------|
| Cloud Platform | Microsoft Azure |
| Compute | Azure Functions |
| Language | Python 3.11 |
| Database | Azure SQL Database |
| API Gateway | Azure API Management |
| Automation | Azure Logic Apps |
| Authentication | SQL Authentication |
| Database Driver | pyodbc + ODBC Driver 18 |
| Deployment | Azure Functions Core Tools |
| IDE | Visual Studio Code |

---

# Folder Structure

```
FeeManagementService/

│
├── function_app.py
├── db.py
├── requirements.txt
├── host.json
├── local.settings.json
├── create_database.sql
├── README.md
│
├── screenshots/
│      architecture.png
│      api-management.png
│      function-app.png
│
└── .venv/
```

---

# Database

## Students Table

| Column | Type |
|---------|------|
| StudentID | INT |
| Name | VARCHAR(100) |
| Course | VARCHAR(100) |
| Email | VARCHAR(100) |
| TotalFee | DECIMAL |
| PaidAmount | DECIMAL |
| DueDate | DATE |

---

# API Endpoints

## 1. Get Student Fee

### Endpoint

```
GET /api/GetStudentFee
```

### Query Parameter

```
studentId
```

Example

```
GET
https://<function-app>.azurewebsites.net/api/GetStudentFee?studentId=1
```

Response

```json
{
    "StudentID":1,
    "Name":"Rahul Sharma",
    "Course":"Computer Science",
    "Email":"rahul@gmail.com",
    "TotalFee":100000,
    "PaidAmount":5000,
    "DueAmount":95000,
    "DueDate":"2026-07-15",
    "Status":"Overdue"
}
```

---

## 2. Update Fee

### Endpoint

```
POST /api/UpdateFee
```

Body

```json
{
    "studentId":1,
    "paidAmount":5000
}
```

Response

```json
{
    "message":"Fee updated successfully",
    "studentId":1,
    "paidAmount":5000
}
```

---

# Fee Status Logic

The API automatically calculates the fee status.

| Condition | Status |
|------------|---------|
| PaidAmount >= TotalFee | Paid |
| DueDate < Today | Overdue |
| Otherwise | Partially Paid |

---

# Azure Resources Used

- Azure SQL Server
- Azure SQL Database
- Azure Function App
- Azure Storage Account
- Azure API Management
- Azure Application Insights
- Azure Logic App

---

# Deployment Steps

## 1. Clone Repository

```bash
git clone <repository-url>
```

---

## 2. Create Virtual Environment

```bash
python -m venv .venv
```

---

## 3. Activate

Windows

```bash
.venv\Scripts\activate
```

---

## 4. Install Packages

```bash
pip install -r requirements.txt
```

---

## 5. Configure Local Settings

Update

```json
SQL_CONNECTION_STRING
```

inside

```
local.settings.json
```

---

## 6. Run Locally

```bash
func start
```

---

## 7. Deploy

```bash
func azure functionapp publish <function-app-name>
```

---

# API Management

Both APIs are imported into Azure API Management.

Available operations:

- GetStudentFee
- UpdateFee

Benefits:

- Central API Gateway
- Monitoring
- Future authentication
- Rate limiting
- Versioning

---

# Logic App (Workflow Automation)

A Logic App is created to automate fee reminder notifications.

Planned workflow:

```
Recurrence Trigger
        │
        ▼
Execute SQL Query
        │
        ▼
Filter Students
        │
        ▼
Send Reminder Email
```

---

# Screenshots

Include screenshots of:

- Azure Function App
- API Management
- Azure SQL Database
- Logic App Workflow
- Successful API Responses
- Architecture Diagram

---

# Future Enhancements

- Azure Key Vault integration
- Azure AD Authentication
- JWT Security
- Email notifications using Outlook
- Application Insights monitoring
- CI/CD using GitHub Actions
- Role-based access control
- Swagger documentation

---

# Learning Outcomes

This project demonstrates:

- Serverless Computing
- REST API Development
- Azure Functions
- Azure SQL Integration
- API Management
- Cloud Deployment
- Database Connectivity
- Workflow Automation
- Azure Resource Management

---

# Author

**Shreya Mamadapur**

B.E. Information Technology

Azure | Python | SQL | Serverless Computing | Data Engineering
