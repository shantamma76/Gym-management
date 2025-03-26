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
                body {
                    background-color: #fafafa;
                    font-family: 'Roboto', sans-serif;
                    background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                    background-size: 1600px 1000px;
                    background-repeat: no-repeat;
                    background-position: center;
                }

                .header {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    padding: 15px 30px;
                    position: sticky;
                    top: 0;
                    width: 100%;
                    height: 65px;
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

                .menu-toggle {
                    display: flex;
                    flex-direction: column;
                    cursor: pointer;
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



                .profile-image {
                    width: 150px;
                    height: 150px;
                    border-radius: 50%;
                    border: 3px solid red;
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
                    <a href="userHome">Home</a>
                    <a href="userProfile">User Profile</a>
                    <a href="trainerAndSlot">Trainer And Slot</a>
                    <a href="exerciseDiet">Exercise and Diet</a>
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
                <a href="userHome">Home</a>
                <a href="userProfile" class="nav-link"> User Profile</a>
                <a href="trainerAndSlot" class="nav-link"> Trainer And Slot </a>
                <a href="exerciseDiet" class="nav-link"> Exercise and Diet </a>
                <a href="index.jsp">Logout</a>
            </nav>

            <script>
                // Toggle mobile menu visibility
                function toggleMenu() {
                    const mobileNav = document.querySelector('.mobile-nav');
                    mobileNav.classList.toggle('show');
                }
            </script>

            <div class="container d-flex justify-content-center align-items-center min-vh-100"
                style="margin-top: 80px;">
                <div class="card shadow-sm p-4 w-75">
                    <div class="text-center">
                        <div class="profile-header">My Profile</div>

                        <!-- Profile Image Upload -->

                        <form action="updateProfile" method="get">

                            <div class="mb-3">
                                <img src="photo/${register.filePath}" alt="profile picture ${picPaths}"
                                    class="profile-image mb-3">
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