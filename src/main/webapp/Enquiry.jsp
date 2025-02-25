<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enquiry page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/empty-gym-with-treadmills_564714-18757.jpg');
            background-size: cover;
            background-position: center;
        }
    /* Navbar styling */
    .navbar {
        display: flex;
        justify-content: flex-end;
        list-style-type: none;
        padding: 0;
        margin: 0;
        background-color: #333;
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 1000;
    }

    .navbar-brand img {
        width: 120px; /* Adjust width as needed */
        height: auto;
        margin-right: 500px;
    }

    .navbar li {
        display: inline-block;
        padding: 12px;
    }

    .navbar li a {
        color: white;
        text-decoration: none;
        display: flex;
        align-items: center;
        padding: 10px;
    }

    .navbar li a i {
        margin-right: 8px;
    }

    .navbar li a:hover {
        background-color: #575757;
    }

        /* Form container and card */
        .content {
            padding-top: 70px; /* Adjust for the fixed navbar height */
        }

        .container {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .card {
            max-width: 500px;
             width: 100%;
             border-radius: 12px;
             background-color: rgba(255, 255, 255, 0.8);
             box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .card-body {
            padding: 20px;
        }

        .form-control {
            padding-left: 25px;
        }

        .input-group-text {
            background-color: #e9ecef;
            border-right: none;
        }

        .input-group i {
            font-size: 18px;
            color: #555;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>

<body class="bg-success">

    <!-- Navigation Menu -->
    <ul class="navbar">
    <a class="navbar-brand" href="#">
                    <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="Xworkz Logo">
                </a>
        <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
        <li><a href="Enquiry.jsp"><i class="fas fa-question-circle"></i> Enquiry</a></li>
        <li><a href="search"><i class="fas fa-search"></i> Follow Up</a></li>
        <li><a href="register"><i class="fas fa-user-plus"></i> Register</a></li>
        <li><a href="Update.jsp"><i class="fas fa-edit"></i> Update</a></li>
    </ul>

    <!-- Main Content -->
    <div class="container">

        <div class="card">
            <div class="card-body">
                <h2 class="card-title text-center mb-4">Enquiry Form</h2>

                <form action="enquiry" method="post">
                    <!-- Name Input -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                        <input type="text" class="form-control" id="name" name="name" onChange="onNameChange()"
                            placeholder="Enter your name" required>
                        <span id="nameDemo" style="color:red;"></span>
                    </div>

                    <!-- Area Input -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                        <input type="text" class="form-control" id="area" name="area" onChange="onArea()"
                            placeholder="Enter area" required>
                        <span id="areaDemo" style="color:red;"></span>
                    </div>

                    <!-- Phone Number Input -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text"><i class="fas fa-phone"></i></span>
                        <input type="number" class="form-control" id="phone" name="phone" onChange="onPhone()"
                            placeholder="Enter phone number" required>
                        <br><span id="phoneDemo" style="color:red;"></span>
                    </div>

                    <!-- Distance Input -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                        <input type="number" class="form-control" id="distance" name="distance" onChange="onDistance()"
                            placeholder="Enter distance" required>
                        <span id="distanceDemo" style="color:red;"></span>
                    </div>

                    <!-- Age Input -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                        <input type="number" class="form-control" id="age" name="age" onChange="onAge()"
                            placeholder="Enter age" required>
                        <span id="ageDemo" style="color:red;"></span>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-success w-100">Submit</button>
                </form>
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        function onNameChange() {
            var name = document.getElementById('name');
            var nameValue = name.value;

            if (nameValue.trim().length < 3) {
                document.getElementById("nameDemo").innerHTML = "Name must be at least 3 characters long.";
                return;
            } else {
                document.getElementById("nameDemo").innerHTML = "";
            }

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shanta_Gym/name/" + nameValue);
            xhttp.send();

            xhttp.onload = function () {
                document.getElementById("nameDemo").innerHTML = this.responseText;
            }
        }

        function onArea() {
            var area = document.getElementById('area');
            var areaValue = area.value;

            if (areaValue.trim().length < 4) {
                document.getElementById("areaDemo").innerHTML = "Area must be at least 4 characters long.";
                return;
            } else {
                document.getElementById("areaDemo").innerHTML = "";
            }

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shanta_Gym/area/" + areaValue);
            xhttp.send();

            xhttp.onload = function () {
                document.getElementById("areaDemo").innerHTML = this.responseText;
            }
        }

        function onPhone() {
            var phoneNo = document.getElementById('phone');
            var phoneNoValue = phoneNo.value;

            if (phoneNoValue.trim().length !== 10 || !phoneNoValue.startsWith("6") && !phoneNoValue.startsWith("7")
                && !phoneNoValue.startsWith("8") && !phoneNoValue.startsWith("9")) {
                document.getElementById("phoneDemo").innerHTML = "Phone number must contain 10 digits and should be valid.";
                return;
            } else {
                document.getElementById("phoneDemo").innerHTML = "";
            }

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shanta_Gym/phone/" + phoneNoValue);
            xhttp.send();

            xhttp.onload = function () {
                document.getElementById("phoneDemo").innerHTML = this.responseText;
            }
        }

        function onDistance() {
            var distance = document.getElementById('distance');
            var distanceValue = distance.value;

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shanta_Gym/distance/" + distanceValue);
            xhttp.send();

            xhttp.onload = function () {
                document.getElementById("distanceDemo").innerHTML = this.responseText;
            }
        }

        function onAge() {
            var age = document.getElementById('age');
            var ageValue = age.value;

            if (ageValue <= 18) {
                document.getElementById("ageDemo").innerHTML = "Age should be valid and above 18";
                return;
            } else {
                document.getElementById("ageDemo").innerHTML = "";
            }

            var xhttp = new XMLHttpRequest();
            xhttp.open("GET", "http://localhost:8080/Shanta_Gym/age/" + ageValue);
            xhttp.send();

            xhttp.onload = function () {
                document.getElementById("ageDemo").innerHTML = this.responseText;
            }
        }
    </script>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
