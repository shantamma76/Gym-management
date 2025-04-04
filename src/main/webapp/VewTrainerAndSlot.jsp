<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page isELIgnored="false" %>
            <!DOCTYPE html>
            <html>
            <head>
                <title>View Enquiry Details</title>
                <style>
                    body {
                        font-family: 'Roboto', Arial, sans-serif;
                        background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                        margin: 0px;
                        padding: 0px;
                        color: #f9f9f9;
                        background-size: 1500px 1000px;
                    }

                    /* Header */
                    .header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 15px 30px;
                        position: sticky;
                        top: 0;
                        width: 1350px;
                        height: 55px;
                        z-index: 999;
                        color: white;
                        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                        background-color: #0E0E0E;
                        margin-bottom: 3%;
                    }

                    .logo-img {
                        max-height: 51px;
                        height: auto;
                    }

                    /* Center navigation */
                    .nav {
                        display: flex;
                        align-items: center;
                        gap: 30px;
                        position: absolute;
                        left: 50%;
                        transform: translateX(-50%);

                    }

                    .nav a {
                        color: white;
                        text-decoration: none;
                        font-size: 1rem;
                        transition: color 0.3s;
                    }

                    .nav a:hover {
                        color: #f0c14b;
                    }

                    /* Toggle button */
                    .menu-toggle {
                        display: flex;
                        flex-direction: column;
                        cursor: pointer;
                        margin-right: 8px;
                    }

                    .menu-toggle div {
                        width: 30px;
                        height: 3px;
                        background-color: white;
                        margin: 5px 0;
                        transition: 0.3s;
                    }

                    /* Dropdown menu - hidden by default */
                    .mobile-nav {
                        display: none;
                        flex-direction: column;
                        position: absolute;
                        top: 65px;
                        right: 0;
                        background: rgba(14, 14, 14, 0.9);
                        width: 100%;
                        padding: 15px 0;
                        align-items: center;
                        z-index: 9999;
                    }

                    .mobile-nav a {
                        padding: 10px;
                        color: white;
                        text-decoration: none;
                        font-size: 1rem;
                        text-align: center;
                        display: block;
                        width: 100%;
                        transition: color 0.3s;
                    }

                    .mobile-nav a:hover {
                        color: #f0c14b;
                    }

                    .mobile-nav.show {
                        display: flex;
                    }

                    h2 {
                        text-align: center;
                        color: black;
                    }

                    table {
                        width: 1100px;
                        border-collapse: collapse;
                        margin: 20px auto;
                    }

                    th,
                    td {
                        border: 1px solid black;
                        padding: 10px;
                        text-align: center;
                    }

                    th {
                        background-color: darkblue;
                        color: #fff;
                        font-weight: bold;
                        text-transform: uppercase;
                        font-size: 0.9rem;
                    }

                    td {
                        background-color: white;
                        color: black;
                    }

                    tr:nth-child(even) {
                        background-color: #222;
                    }

                    .container {
                        max-width: 1200px;
                        margin-left: 150px;
                        margin-right: 50px;
                        background: white;
                        border-radius: 8px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                        padding: 20px;
                    }
                </style>

            </head>

            <body>

                <!-- Header Section -->
                <header class="header">
                    <!-- Logo -->
                    <div class="logo">
                        <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="Logo"
                            class="logo-img">
                    </div>

                    <!-- Navigation centered -->
                    <nav class="nav">
                        <a href="Success.jsp">Home</a>
                        <a href="Enquiry.jsp">Enquiry</a>
                        <a href="followup">FollowUp</a>
                        <a href="register">Registration</a>
                    </nav>

                    <!-- Profile Image + Toggle Menu (Right Side) -->
                    <div style="display: flex; align-items: center;">
                        <div class="menu-toggle" onclick="toggleMenu()">
                            <div></div>
                            <div></div>
                            <div></div>
                        </div>
                    </div>
                </header>

                <!-- Toggle Menu -->
                <nav class="mobile-nav">
                    <a href="Success.jsp">Home</a>
                    <a href="Enquiry.jsp">Enquiry</a>
                    <a href="followup">FollowUp</a>
                    <a href="register">Registration</a>
                    <a href="updateRegi">Update</a>
                    <a href="trainerslots">Add Slots & Trainer</a>
                    <a href="assignTrainer">AssignUsers</a>
                    <a href="viewTrainerAssign">View Trainer Assign</a>
                    <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>
                    <a href="index.jsp">Logout</a>
                </nav>

                <script>
                    // Toggle mobile menu visibility
                    function toggleMenu() {
                        const mobileNav = document.querySelector('.mobile-nav');
                        mobileNav.classList.toggle('show');
                    }
                </script>

                <div class="container">

                    <h2>View Assigned Trainers To Users </h2>

                    <table>
                        <thead>
                            <tr>
                                <th>User Name</th>
                                <th>Trainer Name</th>
                                <th>Slots</th>

                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach var="item" items="${assignTrainerList}">
                                <tr>
                                    <td>${item.name}</td>
                                    <td>${item.trainerName}</td>
                                    <td>${item.slotTimings}</td>

                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </body>

            </html>