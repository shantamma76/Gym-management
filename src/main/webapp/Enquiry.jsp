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
                background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                background-size: 1600px 1000px;
                /*width and height */
                background-repeat: no-repeat;
                background-position: center;
            }

            /* Header */
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 15px 30px;
                position: sticky;
                top: 0;
                width: 100%;
                height: 70px;
                z-index: 999;
                color: white;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                background-color: #0E0E0E;
                margin-bottom: 3%;
            }

            .logo-img {
                max-height: 51px;
                height: auto;
            }

            /* Center navigation */
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

            /* Profile Image */
            .profile-img {
                max-height: 40px;
                width: 40px;
                border-radius: 50%;
                margin-right: 10px;
            }

            /* Toggle button */
            .menu-toggle {
                display: flex;
                flex-direction: column;
                cursor: pointer;
                margin-right: 8px;
            }

            .menu-toggle div {
                width: 30px;
                height: 3px;
                background-color: white;
                margin: 5px 0;
                transition: 0.3s;
            }

            /* Dropdown menu - hidden by default */
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

            /* Form container and card */
            .content {
                padding-top: 50px;
                /* Adjust for the fixed navbar height */
            }

            .container {
                min-height: 80vh;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
                position: relative;
            }

            .card {
                max-width: 500px;
                width: 100%;
                border-radius: 12px;
                background-color: rgba(255, 255, 255, 0.8);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                position: relative;
                /* Added to make sure the z-index works correctly */
                z-index: 1;
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

        <!-- Header Section -->
        <header class="header">
            <!-- Logo -->
            <div class="logo">
                <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="Logo" class="logo-img">
            </div>

            <!-- Navigation centered -->
            <nav class="nav">
                <a href="Success.jsp">Home</a>
                <a href="Enquiry.jsp">Enquiry</a>
                <a href="search">FollowUp</a>
                <a href="register">Registration</a>
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
            <a href="Success.jsp">Home</a>
            <a href="Enquiry.jsp">Enquiry</a>
            <a href="search">FollowUp</a>
            <a href="register">Registration</a>
            <a href="update">Update</a>
            <a href="trainerslots">Slots</a>
            <a href="assignTrainer">AssignUsers</a>
            <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>
            <a href="index.jsp">Logout</a>
        </nav>

        <script>
            // Toggle mobile menu visibility
            function toggleMenu() {
                const mobileNav = document.querySelector('.mobile-nav');
                mobileNav.classList.toggle('show');
            }
        </script>

        <!-- Main Content -->
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title text-center mb-4">Enquiry Form</h2>

                    <form action="enquiry" method="post" onsubmit="return validateForm(event)">

                        <!-- Name Input -->
                        <div class="mb-3 input-group">
                            <span id="nameAjax" style="color:red;"></span>
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                            <input type="text" class="form-control" id="name" name="name" onchange="validateName()"
                                placeholder="Enter your name" required>
                        </div>
                        <span id="nameDemo" style="color:red;"></span>

                        <!-- Area Input -->
                        <div class="mb-3 input-group">
                            <span id="areaAjax" style="color:red;"></span><br>
                            <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                            <input type="text" class="form-control" id="area" name="area" onchange="validateArea()"
                                placeholder="Enter ur area" required>
                        </div>
                        <span id="areaDemo" style="color:red;"></span>

                        <!-- Phone Number Input -->
                        <div class="mb-3 input-group">
                            <span id="phoneAjax" style="color:red;"></span>
                            <span class="input-group-text"><i class="fas fa-phone"></i></span>
                            <input type="number" class="form-control" id="phone" name="phone" onblur="validatePhone()"
                                placeholder="Enter phone number" required>
                        </div>
                        <span id="phoneDemo" style="color:red;"></span>

                        <!-- Distance Input -->
                        <div class="mb-3 input-group">
                            <span id="distanceAjax" style="color:red;"></span><br>
                            <span class="input-group-text"><i class="fas fa-ruler"></i></span>
                            <input type="number" class="form-control" id="distance" name="distance"
                                onchange="validateDistance()" placeholder="Enter distance" required>
                        </div>
                        <span id="distanceDemo" style="color:red;"></span>

                        <!-- Age Input -->
                        <div class="mb-3 input-group">
                            <span id="ageAjax" style="color:red;"></span><br>
                            <span class="input-group-text"><i class="fas fa-calendar-alt"></i></span>
                            <input type="number" class="form-control" id="age" name="age" onchange="validateAge()"
                                placeholder="Enter age" required>
                        </div>
                        <span id="ageDemo" style="color:red;"></span>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-success w-100">Submit</button>

                    </form>
                </div>
                <h3>${msg}</h3>
                <h3>${error}</h3>
            </div>
        </div>



        <!-- JavaScript -->
        <script>
            function validateForm(event) {
                let valid = true;
                valid &= validateName();
                valid &= validateArea();
                valid &= validatePhone();
                valid &= validateDistance();
                valid &= validateAge();

                if (!valid) {
                    event.preventDefault(); // Prevent form submission if any field is invalid
                }
                return valid;
            }

            function validateName() {
                var name = document.getElementById('name');
                var nameValue = name.value;

                if (nameValue.trim().length < 3) {
                    document.getElementById("nameDemo").innerHTML = "Name must be at least 3 characters long.";
                    return false;
                } else {
                    document.getElementById("nameDemo").innerHTML = "";
                    return true;
                }
                var xhttp = new XMLHttpRequest();   <!-- For Ajax validation -->
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/name/" + nameValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("nameAjax").innerHTML = this.responseText;
                }
            }

            function validateArea() {
                var area = document.getElementById('area');
                var areaValue = area.value;

                if (areaValue.trim().length < 4) {
                    document.getElementById("areaDemo").innerHTML = "Area must be at least 4 characters long.";
                    return false;
                } else {
                    document.getElementById("areaDemo").innerHTML = "";
                    return true;
                }
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/area/" + areaValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("areaAjax").innerHTML = this.responseText;
                }
            }

            function validatePhone() {
                var phoneNo = document.getElementById('phone');
                var phoneNoValue = phoneNo.value;

                if (phoneNoValue.trim().length !== 10 || !phoneNoValue.startsWith("6") && !phoneNoValue.startsWith("7")
                    && !phoneNoValue.startsWith("8") && !phoneNoValue.startsWith("9")) {
                    document.getElementById("phoneDemo").innerHTML = "Phone number must contain 10 digits and should be valid.";
                    return false;
                } else {
                    document.getElementById("phoneDemo").innerHTML = "";
                    return true;
                }
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/phone/" + phoneNoValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("phoneAjax").innerHTML = this.responseText;
                }

            }

            function validateDistance() {
                var distance = document.getElementById('distance');
                var distanceValue = distance.value;

                if (distanceValue.trim().length === 0 || isNaN(distanceValue) || distanceValue <= 0) {
                    document.getElementById("distanceDemo").innerHTML = "Please enter a valid distance.";
                    return false;
                } else {
                    document.getElementById("distanceDemo").innerHTML = "";
                    return true;
                }
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/distance/" + distanceValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("distanceAjax").innerHTML = this.responseText;
                }
            }

            function validateAge() {
                var age = document.getElementById('age');
                var ageValue = age.value;

                if (ageValue < 18 || ageValue > 55) {
                    document.getElementById("ageDemo").innerHTML = "Age should be between 18 and 55";
                    return false;
                } else {
                    document.getElementById("ageDemo").innerHTML = "";
                    return true;
                }

                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/age/" + ageValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("ageAjax").innerHTML = this.responseText;
                }
            }
        </script>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>