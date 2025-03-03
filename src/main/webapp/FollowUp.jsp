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
                    background-image: url('https://img.freepik.com/premium-photo/empty-gym-with-treadmills_564714-18757.jpg');

                    margin: 0;
                    padding: 20px;
                    color: #f9f9f9;
                }

                h1 {
                    text-align: center;
                    color: black;
                    font-size: 2em;
                    margin-bottom: 20px;
                    text-transform: uppercase;
                }


                .container {
                    max-width: 1200px;
                    margin: 50px;
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
                    border: 1px solid #7f8c8d;
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

                /* Navbar styling */
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
                    padding: 15px;
                }

                .navbar a {
                    text-decoration: none;
                    color: white;
                    font-size: 1.1rem;
                    display: flex;
                    align-items: center;
                }

                .navbar a i {
                    margin-right: 8px;
                }

                .navbar a:hover {
                    background-color: #555;
                    border-radius: 5px;
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
                <li><a href="Update.jsp"><i class="fas fa-edit"></i> Update</a></li>
            </ul>

            <div class="container">
                <h1>FollowUp List</h1>

                <!-- Search Bar -->
                <div class="search-bar">
                    <form action="search" method="get">
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
                                            <c:forEach var="status" items="${statusOptions}">
                                                <option value="${status}" ${status==enquiry.status ? 'selected' : '' }>
                                                    ${status}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>

                                    <td>
                                        <input type="text" name="reasons" value="${enquiry.reasons}" />
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
