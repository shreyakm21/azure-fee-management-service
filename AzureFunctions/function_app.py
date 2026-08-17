import azure.functions as func
import logging
import json
from db import get_connection

app = func.FunctionApp()


@app.route(route="GetStudentFee", auth_level=func.AuthLevel.ANONYMOUS)
def GetStudentFee(req: func.HttpRequest) -> func.HttpResponse:

    logging.info("Fetching student fee details.")

    student_id = req.params.get("studentId")

    if not student_id:
        return func.HttpResponse(
            "Please provide studentId.",
            status_code=400
        )

    try:

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            SELECT StudentID,
                   Name,
                   Course,
                   Email,
                   TotalFee,
                   PaidAmount,
                   DueDate
            FROM Students
            WHERE StudentID = ?
        """, student_id)

        row = cursor.fetchone()

        if row is None:
            return func.HttpResponse(
                "Student not found.",
                status_code=404
            )

        total_fee = float(row.TotalFee)
        paid_amount = float(row.PaidAmount)
        due_amount = total_fee - paid_amount

        from datetime import date

        today = date.today()

        if paid_amount >= total_fee:
            status = "Paid"
        elif row.DueDate < today:
            status = "Overdue"
        else:
            status = "Partially Paid"

        result = {
            "StudentID": row.StudentID,
            "Name": row.Name,
            "Course": row.Course,
            "Email": row.Email,
            "TotalFee": total_fee,
            "PaidAmount": paid_amount,
            "DueAmount": due_amount,
            "DueDate": str(row.DueDate),
            "Status": status
        }

        conn.close()

        return func.HttpResponse(
            json.dumps(result),
            mimetype="application/json",
            status_code=200
        )

    except Exception as e:

        logging.exception(e)

        return func.HttpResponse(
            str(e),
            status_code=500
        )

@app.route(route="UpdateFee", methods=["POST"], auth_level=func.AuthLevel.ANONYMOUS)
def UpdateFee(req: func.HttpRequest) -> func.HttpResponse:

    logging.info("Updating student fee.")

    try:

        body = req.get_json()

        student_id = body.get("studentId")
        paid_amount = body.get("paidAmount")

        if student_id is None or paid_amount is None:
            return func.HttpResponse(
                "studentId and paidAmount are required.",
                status_code=400
            )

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("""
            UPDATE Students
            SET PaidAmount = ?
            WHERE StudentID = ?
        """, paid_amount, student_id)

        conn.commit()

        if cursor.rowcount == 0:
            conn.close()
            return func.HttpResponse(
                "Student not found.",
                status_code=404
            )

        conn.close()

        return func.HttpResponse(
            json.dumps({
                "message": "Fee updated successfully",
                "studentId": student_id,
                "paidAmount": paid_amount
            }),
            mimetype="application/json",
            status_code=200
        )

    except Exception as e:

        logging.exception(e)

        return func.HttpResponse(
            str(e),
            status_code=500
        )