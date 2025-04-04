<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Update Profile</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

            <style>

                body {
                    background-color: #fafafa;
                    font-family: 'Roboto', sans-serif;
                    background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                    background-size: 1600px 1300px;
                    /*width and height */
                    background-repeat: no-repeat;
                    background-position: center;
                }

                .container {
                    max-width: 600px;
                    margin-top: 70px;
                    margin-bottom: 20px;
                }

                .form-container {
                    border: 2px solid black;
                    border-radius: 10px;
                    padding: 30px;
                    background-color: #f9f9f9;
                }

                .form-group {
                    margin-bottom: 15px;
                }

                .form-label {
                    font-weight: bold;
                }

                .btn-primary {
                    background-color: #6a11cb;
                    border-color: #6a11cb;
                }

                .form-control {
                    width: 100%;
                    padding: 10px;
                    margin-top: 5px;
                }

                .btn-custom {
                    background-color: #6a11cb;
                    border-color: #6a11cb;
                }

                .btn-custom:hover {
                    background-color: #5a0f9e;
                    border-color: #5a0f9e;
                }

                .logo-img {
                    max-height: 51px;
                    height: auto;
                }

                h2 {
                    color: white;
                    font-weight: bold;
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
                                <a class="nav-link active" href="userProfile">UserProfile</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container">
                <h2 class="text-center mb-4">Update User Profile</h2>

                <form action="updateUserProfile" method="post" enctype="multipart/form-data">

                    <div class="form-container">
                        <div class="form-group">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" id="name" name="name" class="form-control" value="${register.name}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="age" class="form-label">Age</label>
                            <input type="number" id="age" name="age" class="form-control" value="${register.age}"
                                required>
                        </div>

                        <div class="form-group">
                            <label for="height" class="form-label">Height (in cm)</label>
                            <input type="number" id="height" name="height" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="weight" class="form-label">Weight (in kg)</label>
                            <input type="number" id="weight" name="weight" class="form-control" required>
                        </div>

                        <div class="form-group">
                            <label for="filePath" class="form-label">Upload Your Picture</label>
                            <input type="file" id="filePath" name="thisfile" class="form-control" required>
                        </div>

                        <div class="form-group text-center mt-4">
                            <button type="submit" class="btn btn-success btn-lg">Update Changes</button>
                        </div>
                    </div>
                </form>
            </div>

            <!-- Bootstrap JS and dependencies -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>






