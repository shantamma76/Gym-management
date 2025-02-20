<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e9ecef;
            transition: 0.3s;
        }
    </style>

    <body>
        <div class="container mt-5">
            <h3>Customer and Trainer Details</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Package</th>
                            <th>Trainer</th>
                            <th>Installment</th>
                            <th>Total Amount</th>
                            <th>Balance Amount</th>
                            <th>Paid</th>
                            <th>Trainer Name</th>
                            <th>Slot Timings</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="details" items="${noTrainerList}">
                            <tr>
                                <td>${details.name}</td>
                                <td>${details.phone}</td>
                                <td>${details.packages}</td>
                                <td>${details.trainer}</td>
                                <td>${details.installment}</td>
                                <td>${details.amount}</td>
                                <td>${details.balance}</td>
                                <td>${details.paid}</td>

                                <!-- Trainer Name Dropdown -->
                                <form method="post" action="assignTrainer">
                                    <input type="hidden" id="name" name="name" value="${details.name}"><br>

                                    <td>
                                        <select name="trainerName" class="form-control">
                                            <option value="">Select Trainer</option>
                                            <c:forEach var="trainer" items="${TrainerEntityList}">
                                                <option value="${trainer.trainerName}">${trainer.trainerName}</option><br>
                                            </c:forEach>
                                        </select>
                                    </td>

                                    <!-- Slot Timings Dropdown -->
                                    <td>
                                        <select name="slotTimings" class="form-control">
                                            <option value="">Select Slot</option>
                                            <c:forEach var="trainer" items="${TrainerEntityList}">
                                                <option value="${trainer.slotTimings}">${trainer.slotTimings}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </td>
                                </form>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
        </div>
    </body>
</html>
