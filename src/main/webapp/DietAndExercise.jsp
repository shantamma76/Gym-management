<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer and Trainer Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Table styling */
        table {
            width: 100%;
            margin: 50px;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
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
            color: white;  /* Changed to white */
            text-decoration: none;
            display: block;
        }

        .navbar li a:hover {
            background-color: #575757;
        }

        .navbar .nav-link {
            color: white;
        }

        .navbar li:nth-last-child(-n+2) a {
            color: white !important; /* Ensures last two items are white */
        }

        /* Adjusted margin for content */
        .container {
            margin-top: 90px;  /* Space between navbar and content */
            margin-right:170px;
        }

        h3 {
            margin-top: 40px;  /* Adjusted space between h3 and table */

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
        <li><a href="Registration.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
        <li><a href="update"><i class="fas fa-edit"></i> Update</a></li>
        <li><a href="trainerslots.jsp"><i class="fas fa-chalkboard-teacher"></i> Trainer Slots</a></li>
        <li><a href="noTrainer" class="nav-link link-body-emphasis">Assign Trainer</a></li>
        <li><a href="dietAndExercise" class="nav-link link-body-emphasis">Diet and Exercise</a></li>
    </ul>

    <!-- Content -->
    <div class="container">
        <h3>Diet and Exercise Plan</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>User Name</th>
                    <th>User Age</th>
                    <th>Fitness Goal</th>
                    <th>Diet Plan</th>
                    <th>Exercise Plan</th>
                    <th>Submit</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach var="details" items="${registerList}">
                    <tr>
                        <td>${details.name}</td>
                        <td>${details.age}</td>

                        <!-- Form to submit the diet and exercise plan selection -->
                        <form method="post" action="assignPlane">
                            <input type="hidden" id="name" name="name" value="${details.name}">
                            <input type="hidden" id="age" name="age" value="${details.age}">

                            <!-- Fitness Goal Dropdown -->
                            <td>
                                <select id="fitnessGoal" name="fitnessGoal" required>
                                    <option value="select">---Select---</option>
                                    <option value="Weight Loss">Weight Loss</option>
                                    <option value="Muscle Gain">Muscle Gain</option>
                                    <option value="Balanced">Balanced</option>
                                </select>
                            </td>

                            <!-- Diet Plan Dropdown -->
                            <td>
                                <select id="dietPlan" name="dietPlan" required>
                                    <option value="select">---Select---</option>
                                    <option value="Calorie Deficit">Calorie Deficit</option>
                                    <option value="High Calorie">High Calorie</option>
                                    <option value="Balanced Diet">Balanced Diet</option>
                                </select>
                            </td>

                            <!-- Exercise Plan Dropdown -->
                            <td>
                                <select id="exercisePlan" name="exercisePlan" required>
                                    <option value="select">---Select---</option>
                                    <option value="Cardio Hiit">Cardio & HIIT</option>
                                    <option value="Strength Training">Strength Training</option>
                                    <option value="Mixed">Mixed</option>
                                </select>
                            </td>

                            <!-- Submit button -->
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
