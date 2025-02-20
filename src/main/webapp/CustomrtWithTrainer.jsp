<%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Sidebar Styling */
            .sidebar {
                height: 100vh;
                width: 250px;
                position: fixed;
                left: 0;
                top: 0;
                background-color: #212529;
                /* Dark background */
                padding-top: 50px;
                border-right: 1px solid #343a40;
                color: white;
            }

            .sidebar h4 a {
                color: #f8f9fa;
                text-decoration: none;
            }

            .sidebar ul {
                padding-left: 0;
            }

            .sidebar .nav-item {
                padding: 20px;
            }

            .sidebar .nav-link {
                color: #f8f9fa;
                font-weight: 500;
                transition: 0.3s;
            }

            .sidebar .nav-link:hover {
                background-color: #495057;
                /* Highlight on hover */
                border-radius: 5px;
            }

            /* Main content */
            .content {
                margin-left: 10px;
                margin-right: 5px;
                padding: 90px;
            }

            /* Table Styling */
            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #ffffff;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
                border-radius: 8px;
                overflow: hidden;
            }

            th,
            td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }

            th {
                background-color: red;
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

            /* Navigation Menu */
            .navbar {
                display: flex;
                justify-content: flex-end;
                /* Aligns the items to the right */
                list-style-type: none;
                padding: 8px;
                margin: 0;
                background-color: #333;
                width: 100%;
                position: fixed;
                /* Fix the navbar at the top */
                top: 0;
                left: 0;
                z-index: 1000;
                /* Ensures the navbar is above other content */
            }

            .navbar li {
                display: inline-block;
                padding: 12px;
                color: white;
            }

            .navbar li a {
                color: white;
                text-decoration: none;
                display: flex;
                align-items: center;
                padding: 10px;
            }

            .navbar li a i {
                margin-right: 8px;
                /* Adds space between icon and text */
            }

            .navbar li a:hover {
                background-color: red;
            }

            /* Heading styles */
            h1 {
                text-align: center;
                margin-top: 100px;
                /* Adds space below the fixed navbar */
                font-size: 24px;
            }

            /* Mobile and Desktop Responsiveness */
            @media screen and (min-width: 769px) {
                .navbar {
                    display: block;
                    background-color: #333;
                    width: 100%;
                    text-align: right;
                    padding: 0;
                }

                .navbar li {
                    display: inline-block;
                    color: white;
                }

                .navbar li a {
                    padding: 14px 20px;
                    color: white;
                    text-decoration: none;
                }

                .navbar li a:hover {
                    background-color: #575757;
                }
            }

            @media screen and (max-width: 768px) {
                .navbar {
                    display: block;
                    width: 100%;
                }

                .navbar li {
                    text-align: right;
                }

                .navbar li a {
                    padding: 14px 20px;
                    border-bottom: 1px solid #444;
                }

                .navbar li a:hover {
                    background-color: #575757;
                }
            }
        </style>

        <body>

            <!-- Navigation Menu -->
            <ul class="navbar">

                <li><a href="index.jsp"><i class="fas fa-home"></i>Home</a></li>
                <li><a href="Enquiry.jsp"><i class="fas fa-question-circle"></i>Enquiry</a></li>
                <li><a href="search"><i class="fas fa-search"></i>Follow Up</a></li>
                <li><a href="Registration.jsp"><i class="fas fa-user-plus"></i>Register</a></li>
                <li><a href="UpdateRegister.jsp"><i class="fas fa-edit"></i>Update</a></li>
                <li><a href="trainerslots.jsp"><i class="fas fa-edit"></i>trainerSlots</a></li>
                <li><a href="noTrainer"><i class="fas fa-edit"></i>NoTrainer</a></li>
                <li><a href="customerTrainer"><i class="fas fa-edit"></i>CustomerWithTrainer</a></li>

            </ul>

            <div class="content">
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Phone Number</th>
                            <th>Package</th>
                            <th>Trainer</th>
                            <th>Installment</th>
                            <th>Total Amount</th>
                            <th>Balance Amount</th>
                            <th>Paid Amount</th>
                            <th>Assign Trainer</th>
                            <th>Timing Slots</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="details" items="${customrtWithTrainer}">
                            <tr>
                                <td>${details.name}</td>
                                <td>${details.phone}</td>
                                <td>${details.packages}</td>
                                <td>${details.trainer}</td>
                                <td>${details.installment}</td>
                                <td>${details.amount}</td>
                                <td>${details.balance}</td>
                                <td>${details.paid}</td>
                                <td>
                                    <form method="post" action="assign/${details.id}">
                                        <select id="trainersName" name="trainersName">
                                            <option disabled selected>Select the Trainer</option>
                                            <c:forEach items="${trainers}" var="trainersName">
                                                <option value="${trainersName}">${trainersName}</option>
                                            </c:forEach>
                                        </select>

                                <td>
                                    <input type="text" id="slot" name="slot" value="${slot}" onclick="getSlot()" />
                                </td>

                                <td>
                                    <button type="submit">Add Trainer</button>
                                </td>

                                </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </body>

        <script>
            function getSlot() {
                let getSlot = document.getElementById("trainersName").value;

                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/slot/" + getSlot);
                xhttp.send();
                xhttp.onload = function () {

                    document.getElementById("slot").value = this.responseText;
                    console.log(this.responseText);
                }
            }
        </script>

        </html>