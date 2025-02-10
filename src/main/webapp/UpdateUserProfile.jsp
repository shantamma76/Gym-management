<%@ page isELIgnored = "false"%>
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
        .container {
            max-width: 600px;
            margin-top: 50px;
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
    </style>
</head>

<body>
    <div class="container">
        <h2 class="text-center mb-4">User Update Profile</h2>

        <form action="updateUserProfile" method="post" enctype="multipart/form-data">
            <div class="form-container">
                <div class="form-group">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" id="name" name="name" class="form-control" value="${register.name}" required>
                </div>

                <div class="form-group">
                    <label for="age" class="form-label">Age</label>
                    <input type="number" id="age" name="age" class="form-control" required>
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
                    <label for="picture" class="form-label">Upload Your Picture</label>
                    <input type="file" id="picture" name="picture" class="form-control" required>
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
