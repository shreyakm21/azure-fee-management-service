# Demo Script (5–7 Minutes)

## Introduction

This project is a cloud-native Fee Management System built using Microsoft Azure.

---

## Azure SQL Database

Show

- Students table
- Administrators table

---

## Azure Function

Explain

- GetStudentFee
- UpdateFee

---

## API Management

Show imported APIs

- GetStudentFee
- UpdateFee

---

## Live Demo

Call

GET

```
studentId=1
```

Display response.

---

Update payment

POST

```json
{
    "studentId":1,
    "paidAmount":5000
}
```

Call GET again.

Show updated values.

---

## Monitoring

Open Application Insights

Show successful requests.

---

## Conclusion

The project demonstrates Azure SQL, Azure Functions, API Management, Application Insights and serverless architecture for managing student fee records.