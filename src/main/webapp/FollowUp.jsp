<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>FollowUp Page</title>
            <!-- Font Awesome CDN -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                rel="stylesheet">
            <style>
                body {
                    font-family: 'Roboto', Arial, sans-serif;
                      background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                    margin: 0;
                    padding: 30px;
                    color: #f9f9f9;
                    background-size: 1600px 1000px;
                }

                .header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 10px 30px;
                    margin-left: -28px;
                    position: fixed;
                    top: 0;
                    width: 96%;
                    z-index: 999;
                    color: white;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                    background-color: #0E0E0E;
                }

                .logo-img {
                    max-height: 51px;
                    height: auto;
                }

                .nav {
                    display: flex;
                    align-items: center;
                    gap: 30px;
                    justify-content: center;
                    flex-grow: 1;
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

                .menu-toggle {
                    display: flex;
                    flex-direction: column;
                    cursor: pointer;
                    margin-left: 15px;
                    background-color: #000;
                    /* Temporary background for visibility */
                    padding: 10px;
                }

                .menu-toggle div {
                    width: 30px;
                    height: 3px;
                    background-color: white;
                    margin: 5px 0;
                    transition: 0.3s;
                }

                .mobile-nav {
                    display: none;
                    flex-direction: column;
                    position: absolute;
                    top: 70px;
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

                @media (max-width: 768px) {
                    .nav {
                        display: none;
                    }

                    .menu-toggle {
                        display: flex;
                    }

                    .mobile-nav {
                        display: none;
                    }

                    .mobile-nav.show {
                        display: flex;
                    }
                }

                @media (max-width: 768px) {
                    .nav {
                        display: none;
                    }

                    .menu-toggle {
                        display: flex;
                    }

                    .mobile-nav {
                        display: flex;
                    }
                }

                h1 {
                    text-align: center;
                    color: black;
                    font-size: 2em;
                    margin-bottom: 20px;

                }

                .container {
                    max-width: 1200px;
                    margin: 100px;
                    background: white;
                    border-radius: 8px;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                    padding: 30px;
                }

                .search-bar {
                    margin-bottom: 15px;
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 20px 0;
                    border-bottom: 2px solid #3e424d;
                }

                .search-bar label {
                    font-size: 1rem;
                    font-weight: bold;
                    color: black;
                }

                .search-bar select {
                    padding: 5px 10px;
                    font-size: 1rem;
                    border: 1px solid #7f8c8d;
                    border-radius: 5px;
                    background-color: white;
                    color: black;
                }

                .search-bar .btn {
                    font-size: 0.9rem;
                    padding: 8px 15px;
                    background-color: #3498db;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }

                .search-bar .btn:hover {
                    background-color: green;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                }

                th,
                td {
                    padding: 12px;
                    text-align: center;
                    border: 1px solid #3e424d;
                }

                th {
                    background-color: darkblue;
                    color: white;
                    text-transform: uppercase;
                    font-size: 0.9rem;
                }


                tr:nth-child(even) {
                    background-color: white;
                    color: black;
                }


                tr:nth-child(odd) {
                    background-color: white;
                    color: black;
                }

                tr:hover {
                    background-color: pink;
                    /* Highlight row on hover */
                }

                td select,
                td input {
                    padding: 5px;
                    font-size: 0.9rem;
                    border: 1px solid black;
                    border-radius: 5px;
                    width: 90%;
                    background-color: white;
                    color: black;
                }

                td .btn {
                    font-size: 0.8rem;
                    padding: 5px 10px;
                    background-color: green;
                    /* Vibrant red for buttons */
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }

                td .btn:hover {
                    background-color: #c0392b;
                }

                @media (max-width: 768px) {

                    table,
                    th,
                    td {
                        font-size: 0.8rem;
                    }

                    .search-bar {
                        flex-direction: column;
                        align-items: flex-start;
                    }

                    .search-bar label {
                        margin-bottom: 10px;
                    }
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

                <!-- Toggle Menu (Right Side) -->
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
                 <a href="viewRegistered">View Register Details</a>
                <a href="trainerslots">Slots</a>
                <a href="assignTrainer">AssignTrainer</a>
                <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>
                <a href="index.jsp">Logout</a>
            </nav>

            <script>
                function toggleMenu() {
                    console.log("Toggling menu");
                    const mobileNav = document.querySelector('.mobile-nav');
                    mobileNav.classList.toggle('show');
                }
            </script>

            <div class="container">
                <h1>FollowUp List</h1>

                <!-- Search Bar -->
                <div class="search-bar">
                    <form action="followup" method="get">
                        <label for="status"><i class="fas fa-filter"></i> Filter by Status:</label>
                        <select name="status" id="status">
                            <option value="">--Select Status--</option>
                            <c:forEach var="status" items="${statusOptions}">
                                <option value="${status}" ${param.status==status ? 'selected' : '' }>
                                    ${status}
                                </option>
                            </c:forEach>
                        </select>
                        <button type="submit" class="btn"><i class="fas fa-search"></i> Search</button>
                    </form>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Area</th>
                            <th>Phone No</th>
                            <th>Distance</th>
                            <th>Age</th>
                            <th>Status</th>
                            <th>Reason</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="enquiry" items="${enquiryList}">
                            <tr>
                                <form action="updateFollowUp" method="post">
                                    <td>${enquiry.name}</td>
                                    <td>${enquiry.area}</td>
                                    <td>${enquiry.phone}</td>
                                    <td>${enquiry.distance}</td>
                                    <td>${enquiry.age}</td>

                                    <td>
                                        <select name="status">
                                        <option>select</option>
                                            <c:forEach var="status" items="${statusOptions}">

                                                <option value="${status}" ${status.equals(enquiry.status) ? 'selected'
                                                    : '' }>
                                                    ${status}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>

                                    <td>
                                        <input type="text" name="reasons" value="${enquiry.reasons}"/>
                                    </td>

                                    <td>
                                        <input type="hidden" name="name" value="${enquiry.name}" />
                                        <button type="submit" class="btn"><i class="fas fa-edit"></i>Update</button>
                                        <a href="view?id=${enquiry.id}" class="btn"><i class="fas fa-eye"></i> View </a>
                                    </td>

                                </form>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </body>

        </html>