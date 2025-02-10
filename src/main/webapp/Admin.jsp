<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/empty-gym-with-treadmills_564714-18757.jpg');
            background-size: cover;
            background-position: center;
            font-family: 'Arial', sans-serif;
        }

        .content {
            padding-top: 40px;
        }

        .card {
            border: none;
            border-radius: 12px;
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .card-body {
            padding: 30px;
        }

        .card-title {
            font-size: 28px;
            font-weight: 600;
            color: #333;
        }

        .input-group-text {
            background-color: #f0f0f0;
            border-right: 1px solid #ddd;
        }

        .form-control {
            border-radius: 15px;
            padding: 15px;
            font-size: 16px;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
            font-weight: 600;
            padding: 12px;
            font-size: 16px;
            border-radius: 10px;
        }

        .btn-success:hover {
            background-color: #218838;
        }

        .reset-link {
            text-align: center;
            margin-top: 15px;
        }

        .reset-link a {
            color: #28a745;
            font-weight: 500;
        }

        .reset-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            text-align: center;
            color: #dc3545;
            font-size: 14px;
        }

        /* Media Queries for responsiveness */
        @media (max-width: 768px) {
            .card-body {
                padding: 20px;
            }

            .form-control {
                font-size: 14px;
            }
        }
    </style>
</head>

<body>

    <!-- Main content area -->
    <div class="container d-flex justify-content-center align-items-center content" style="min-height: 100vh;">
        <div class="card shadow-lg" style="max-width: 400px; width: 100%;">
            <div class="card-body">
                <h2 class="card-title text-center mb-4">Admin Login</h2>

                <form action="signIn" method="get">
                    <!-- Email field with icon -->
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                        <input type="email" class="form-control" id="email" name="email" onChange="onEmailChange()" required placeholder="Enter your email">
                    </div>
                    <span id="emailDemoo" class="error-message"></span>

                    <!-- Password field with icon -->
                    <div class="input-group mb-3">
                        <span class="input-group-text"><i class="fas fa-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" onChange="onPasswordChange()" required placeholder="Enter your password">
                    </div>
                    <span id="jsDemo" class="error-message"></span>

                    <!-- Login Button -->
                    <button type="submit" class="btn btn-success w-100">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </button>
                </form>

                <!-- Additional links for password reset -->
               <!-- <div class="reset-link">
                    <a href="forgetPassword.jsp">Forgot Password?</a>
                </div>
                <div class="reset-link">
                    <p>Don't have an account? <a href="Registration.jsp">Register</a></p>
                </div>  -->
            </div>
        </div>
    </div>

    <script>
        function onEmailChange() {
            console.log('this is on place email');
            var email = document.getElementById('email');
            var emailsValue = email.value;

            if (!emailsValue.includes('@gmail.com') && !emailsValue.includes('@yahoo.com') && !emailsValue.includes('@outlook.com') && !emailsValue.includes('@hotmail.com') &&
                !emailsValue.includes('.edu') && !emailsValue.includes('.org') && !emailsValue.includes('.info') && !emailsValue.includes('.net')) {
                document.getElementById("emailDemoo").innerHTML = "Enter a valid email address.";
            } else {
                document.getElementById("emailDemoo").innerHTML = "";
            }

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shanta_Gym/email/" + emailsValue);
            xhttp.send();

            xhttp.onload = function () {
                document.getElementById("emailDemo").innerHTML = this.responseText;
            }
        }

        function onPasswordChange() {
            console.log('this is on place password');
            var password = document.getElementById('password');
            var passwordValue = password.value;

            if (passwordValue.length < 8 || passwordValue == null || !passwordValue.match(/[A-Z]/) || !passwordValue.match(/[a-z]/) || !passwordValue.match(/[@$!%*?&]/)) {
                document.getElementById("jsDemo").innerHTML = "Enter a valid password with at least 8 characters, one uppercase letter, and one special character.";
            } else {
                document.getElementById("jsDemo").innerHTML = "";
            }

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shanta_Gym/password/" + passwordValue);
            xhttp.send();

            xhttp.onload = function () {
                document.getElementById("passwordDemo").innerHTML = this.responseText;
            }
        }
    </script>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


