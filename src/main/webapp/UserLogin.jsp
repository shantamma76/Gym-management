<%@ page isELIgnored="false" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Login</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

        <style>
            body {
                background-color: #fafafa;
                font-family: 'Roboto', sans-serif;
                 background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                                background-size: 1600px 1000px;
                                /*width and height */
                                background-repeat: no-repeat;
                                background-position: center;
            }

            .form-container {
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                padding: 30px;
                margin-top: 90px;
            }

            .form-group label {
                font-weight: 600;
            }

            .form-control {
                border-radius: 5px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                padding: 10px;
                font-size: 14px;
                margin-bottom: 20px;
                border: 1px solid #ddd;
            }

            .btn-primary {
                background-color: #3897f0;
                border: none;
                color: #fff;
                font-weight: 600;
                padding: 12px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
            }

            .btn-primary:hover {
                background-color: #1c84d3;
            }

            .reset-link {
                text-align: center;
                margin-top: 15px;
            }

            .reset-link a {
                color: #3897f0;
                font-weight: 500;
            }

            .reset-link a:hover {
                text-decoration: underline;
            }

            .card-footer {
                text-align: center;
                background-color: #fafafa;
                padding: 15px;
                border-top: 1px solid #ddd;
            }

            .card-footer p {
                color: #888;
                font-size: 14px;
            }

            .card-footer a {
                color: #3897f0;
            }

            .card-header h2 {
                font-weight: 600;
                font-size: 24px;
                text-align: center;
                color: #333;
            }

            .error-message {
                text-align: center;
                color: #dc3545;
                font-size: 14px;
            }

            @media (max-width: 768px) {
                .form-container {
                    padding: 20px;
                }
            }
        </style>
    </head>

    <body>
        <!-- Sign In Form -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-sm-12">
                    <div class="form-container">
                        <div class="card-header">
                            <h2>User Login</h2>
                        </div>
                        <div class="card-body">
                            <form action="signIn" method="post">

                                <!-- Email Input -->
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                        placeholder="Enter Your Email Address" required>
                                </div>

                                <!-- Password Input -->
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="Enter Your Email Password" required>
                                </div>

                                <!-- Submit Button -->
                                <button type="submit" class="btn btn-primary btn-block">Login</button>
                            </form>

                            <!-- Forgot Password Link -->
                            <div class="reset-link">
                                <a href="ForgetPassword.jsp">Forgot Password?</a>
                            </div>

                            <!-- Additional Register Link -->
                            <div class="reset-link">
                                <p>Don't have an account? <a href="Registration.jsp">Register</a></p>
                            </div>
                        </div>

                        <!-- Error Message Section -->
                        <div class="card-footer">
                            <h3 class="error-message">${msg}</h3>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

    </html>