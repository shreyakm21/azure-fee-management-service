# Deployment Guide

## Step 1

Create Resource Group

```
fusion-practices-rg
```

---

## Step 2

Create Azure SQL Database

Database

```
FeeManagementDB
```

Execute

```
create_database.sql
```

---

## Step 3

Create Storage Account

```
feemstorage
```

---

## Step 4

Create Azure Function App

Runtime

```
Python 3.11
```

Publish using

```
func azure functionapp publish feemgmtapi2026shreya
```

---

## Step 5

Configure Application Settings

Add

```
SQL_CONNECTION_STRING
```

---

## Step 6

Test APIs

Get Student Fee

```
GET
/api/GetStudentFee?studentId=1
```

Update Fee

```
POST
/api/UpdateFee
```

---

## Step 7

Import Function into Azure API Management

Create API

Import Azure Function

Test endpoints

---

## Step 8

Monitor using Application Insights

Verify Function executions

View Request Logs