<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>user Profile Page</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

            <style>
                .profile-image {
                    width: 150px;
                    height: 150px;
                    border-radius: 50%;
                    border: 3px solid red;
                    /* Optional: Add a border for a sleek look */
                    object-fit: cover;
                }

                .profile-table th,
                .profile-table td {
                    text-align: left;
                }

                .profile-header {
                    font-size: 30px;
                    font-weight: bold;
                    margin-bottom: 20px;
                }

                .btn-custom {
                    background-color: #6a11cb;
                    color: white;
                    padding: 10px 20px;
                    border-radius: 5px;
                }

                .btn-update {
                    background-color: #f44336;
                    color: white;
                    padding: 10px 20px;
                    border-radius: 5px;
                }

                .logo-img {
                    max-height: 51px;
                    height: auto;
                }
            </style>
        </head>

        <body>
            <!-- Navbar with black background and right-aligned items -->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <div class="container-fluid">

                    <div class="logo">
                        <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="Logo"
                            class="logo-img">
                    </div>


                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="userHome">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="UserLogin.jsp">User</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" href="updateProfile">UdpateUserProfile</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" href="exerciseDiet">Exercise and Diet</a>
                            </li>

                        </ul>
                    </div>

                </div>
            </nav>

            <div class="container d-flex justify-content-center align-items-center min-vh-100"
                style="margin-top: 80px;">
                <div class="card shadow-sm p-4 w-75">
                    <div class="text-center">
                        <div class="profile-header">My Profile</div>

                        <!-- Profile Image Upload -->

                        <form action="updateProfile" method="get">

                            <div class="mb-3">
                                <img src="photo/${register.filePath}" alt="profile picture ${register.filePath}" class="profile-image mb-3">
                                <h2>${register.name}</h2>
                            </div>
                        </form>
                    </div>

                    <table class="table table-bordered profile-table">
                        <tr>
                            <th>Full Name</th>
                            <td>${register.name}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>${register.email}</td>
                        </tr>
                        <tr>
                            <th>Age</th>
                            <td>${register.age}</td>
                        </tr>
                        <tr>
                            <th>Contact Number</th>
                            <td>${register.phone}</td>
                        </tr>
                        <tr>
                            <th>Gym Name</th>
                            <td>${register.gymName}</td>
                        </tr>
                        <tr>
                            <th>Gym Package</th>
                            <td>${register.packages}</td>
                        </tr>

                        <tr>
                            <th>Total Amount</th>
                            <td>${register.amount}</td>
                        </tr>
                        <tr>
                            <th>Discount</th>
                            <td>${register.discount}</td>
                        </tr>
                        <tr>
                            <th>Amount Paid</th>
                            <td>${register.paid}</td>
                        </tr>
                        <tr>
                            <th>Balance Amount</th>
                            <td>${register.balance}</td>
                        </tr>
                    </table>

                    <div class="text-center">
                        <a href="updateProfile?id=${register.id}">
                            <button class="btn btn-success">Update User Profile</button>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Bootstrap JS and dependencies -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>