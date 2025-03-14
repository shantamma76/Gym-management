<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <style>
    body {
      background-color: #fafafa;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .form-container {
      background-color: white;
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      max-width: 400px;
      width: 100%;
    }

    .form-container h3 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 1.5rem;
      color: #333;
    }

    .form-container input {
      height: 50px;
      margin-bottom: 20px;
      padding: 0 15px;
      font-size: 1rem;
      border-radius: 5px;
      border: 1px solid #ddd;
    }

    .form-container button {
      background-color: #3897f0;
      color: white;
      font-size: 1.2rem;
      border: none;
      border-radius: 5px;
      padding: 15px;
      width: 100%;
      cursor: pointer;
    }

    .form-container button:hover {
      background-color: #007bff;
    }

    .form-container .alert {
      margin-bottom: 20px;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h3>Reset Your Password</h3>

    <c:if test="${not empty error}">
      <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:if test="${not empty message}">
      <div class="alert alert-success">${msg}</div>
    </c:if>

    <form action="forgetPassword" method="post" onsubmit="return validateForm(event)">
      <input type="email" id="email" name="email" placeholder="Email Address" class="form-control" onchange="validateEmail()" required>
      <span id="emailDemo" style="color:red;"></span>

      <input type="password" id="newPassword" name="newPassword" placeholder="New Password" class="form-control" onchange="validateNewPassword()" required>
      <span id="passDemo" style="color:red;"></span>

      <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" class="form-control" onchange="validateConfirmPassword()" required>
      <span id="confirmPasswordDemo" style="color:red;"></span>

      <button type="submit" class="btn btn-primary">Reset Password</button>
    </form>

  </div>

<script>
    // Form validation
    function validateForm(event) {
        let valid = true;
        valid = valid && validateEmail();
        valid = valid && validateNewPassword();
        valid = valid && validateConfirmPassword();

        if (!valid) {
            event.preventDefault(); // Prevent form submission if any field is invalid
            return false;
        }
        return true;
    }

    function validateEmail() {
        var email = document.getElementById('email');
        var emailValue = email.value;

        if (!emailValue.includes('@') || !emailValue.includes('.')) {
            document.getElementById("emailDemo").innerHTML = "Enter a valid email address.";
            return false;
        } else {
            document.getElementById("emailDemo").innerHTML = "";
            return true;
        }
    }

    function validateNewPassword() {
        var newPassword = document.getElementById('newPassword').value;
        var upperCasePattern = /[A-Z]/;
        var specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/;
        var numberPattern = /[0-9]/;

        if (newPassword.length >= 8 && upperCasePattern.test(newPassword) && specialCharPattern.test(newPassword) && numberPattern.test(newPassword)) {
            document.getElementById("passDemo").innerHTML = "";
            return true;
        } else {
            document.getElementById("passDemo").innerHTML = "Password must be at least 8 characters long and contain at least one uppercase letter, one special character, and one number.";
            return false;
        }
    }

    function validateConfirmPassword() {
        var newPassword = document.getElementById('newPassword').value;
        var confirmPassword = document.getElementById('confirmPassword').value;

        if (newPassword !== confirmPassword) {
            document.getElementById("confirmPasswordDemo").innerHTML = "Passwords do not match.";
            return false;
        } else {
            document.getElementById("confirmPasswordDemo").innerHTML = "";
            return true;
        }
    }
</script>

</body>
</html>
