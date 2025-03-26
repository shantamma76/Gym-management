<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page isELIgnored="false" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>View Enquiry Details</title>
                <style>
                    body,
                    h2,
                    table,
                    th,
                    td,
                    a {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                    }


                    body {
                        font-family: 'Roboto', Arial, sans-serif;
                        background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                        background-size: 1600px 1000px;
                        /*width and height */
                        background-repeat: no-repeat;
                        background-position: center;
                    }

                    h2 {
                        text-align: center;
                        color: #333;
                        margin-bottom: 30px;
                    }

                    .header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 15px 30px;
                        position: sticky;
                        top: 0;
                        width: 96%;
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
                        color: black;
                        text-align: center;
                    }


                    .container {
                        max-width: 1200px;
                        margin-left: 100px;
                        margin-right: 50px;
                        background: white;
                        border-radius: 8px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                        padding: 20px;
                    }

                    /* Table Styling */
                    table {
                        width: 100%;
                        margin-bottom: 30px;
                        margin-left: 0px;
                        border-collapse: collapse;
                        background-color: #fff;
                        border-radius: 5px;
                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                    }

                    th,
                    td {
                        padding: 12px 15px;
                        text-align: center;
                        border: 1px solid #ddd;
                    }

                    th {
                        background-color: darkblue;
                        color: white;
                        text-transform: uppercase;
                    }

                    td {
                        background-color: #fafafa;
                    }

                    tr:nth-child(even) td {
                        background-color: #f1f1f1;
                    }

                    /* Pagination Styling */
                    .pagination {
                        text-align: center;
                        margin-top: 20px;
                    }

                    .pagination a,
                    .pagination .current {
                        padding: 10px 15px;
                        margin: 0 5px;
                        text-decoration: none;
                        color: #333;
                        background-color: #f0f0f0;
                        border-radius: 5px;
                    }

                    .pagination a:hover {
                        background-color: #f0c14b;
                    }

                    .pagination .current {
                        background-color: #0E0E0E;
                        color: white;
                    }

                    .pagination a:disabled {
                        color: #ccc;
                        cursor: not-allowed;
                    }
                </style>
            </head>

            <body>
                <!-- Header and other parts of the page here -->
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

                <!-- Main Content -->
                <div class="container">
                    <h2>All Registered Details</h2>

                    <!-- Table for Registered Details -->
                    <table>
                        <thead>
                            <tr>
                                <th>User Name</th>
                                <th>Email</th>
                                <th>Phone No.</th>
                                <th>Gym Name</th>
                                <th>Packages</th>
                                <th>Amount</th>
                                <th>Paid</th>
                                <th>Discount</th>
                                <th>Balance</th>
                                <th>Installment</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${viewRegisterList}">
                                <tr>
                                    <td>${item.name}</td>
                                    <td>${item.email}</td>
                                    <td>${item.phone}</td>
                                    <td>${item.gymName}</td>
                                    <td>${item.packages}</td>
                                    <td>${item.amount}</td>
                                    <td>${item.paid}</td>
                                    <td>${item.discount}</td>
                                    <td>${item.balance}</td>
                                    <td>${item.installment}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Pagination Controls -->
                    <div class="pagination">
                        <c:if test="${currentPage > 1}">
                            <a href="viewRegistered?page=${currentPage - 1}">Previous</a>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <span class="current">${i}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="viewRegistered?page=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <a href="viewRegistered?page=${currentPage + 1}">Next</a>
                        </c:if>
                    </div>
                </div>

            </body>

            </html>