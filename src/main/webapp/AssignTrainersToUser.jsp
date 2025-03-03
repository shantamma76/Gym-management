

<!--
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
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

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: flex-end;
            list-style-type: none;
            padding: 10px;
            margin: 0;
            background-color: #333;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar li {
            display: inline-block;
            padding: 12px;
        }

        .navbar li a {
            color: white;
            text-decoration: none;
            display: block;
        }

        .navbar li a:hover {
            background-color: #575757;
        }

        .navbar li:nth-last-child(-n+2) a {
            color: white !important;
        }

        /* Adjust margin and padding for content */
        body {
            margin: 0;
            padding-top: 60px; /* Adjusted padding to provide space between navbar and content */
        }

        /* Container margin adjusted to remove extra space */
        .container {
            margin-top: 30px; /* Space between navbar and content */
        }

        h3 {
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- Navigation Menu -->
    <ul class="navbar">
        <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="Enquiry.jsp"><i class="fas fa-question-circle"></i> Enquiry</a></li>
        <li><a href="search"><i class="fas fa-search"></i> Follow Up</a></li>
        <li><a href="register"><i class="fas fa-user-plus"></i> Register</a></li>
        <li><a href="update"><i class="fas fa-edit"></i> Update</a></li>
        <li><a href="trainerslots.jsp"><i class="fas fa-chalkboard-teacher"></i> Trainer Slots</a></li>
        <li><a href="noTrainer" class="nav-link link-body-emphasis">Assign Trainer</a></li>
        <li><a href="dietAndExercise" class="nav-link link-body-emphasis">Diet and Exercise</a></li>
    </ul>

    <!-- Main content -->
    <div class="container">
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
                    <th>Action</th>
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
                            <input type="hidden" id="name" name="name" value="${details.name}">

                            <td>
                                <select name="trainerName" class="form-control">
                                    <option value="">Select Trainer</option>
                                    <c:forEach var="trainer" items="${TrainerEntityList}">
                                        <option value="${trainer.trainerName}">${trainer.trainerName}</option>
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
-->
