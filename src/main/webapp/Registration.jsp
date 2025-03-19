<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
            background-size: 1600px 1100px;
            background-repeat: no-repeat;
            background-position: center;
        }

        .container {
            margin-top: 20px;
            margin-bottom: 50px;
        }

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

        .profile-img {
            max-height: 40px;
            width: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

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

        .content {
            padding-top: 10px;
        }

        .form-label i {
            margin-right: 10px;
        }

        .form-control {
            padding-left: 30px;
        }
    </style>
</head>

<body class="bg-success">
    <!-- Header Section -->
    <header class="header">
        <div class="logo">
            <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="Logo" class="logo-img">
        </div>

        <nav class="nav">
            <a href="Success.jsp">Home</a>
            <a href="Enquiry.jsp">Enquiry</a>
            <a href="followup">FollowUp</a>
            <a href="register">Registration</a>
        </nav>

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
        <a href="followup">FollowUp</a>
        <a href="register">Registration</a>
        <a href="updateRegi">Update</a>
         <a href="viewRegistered">View Register Details</a>
        <a href="trainerslots">Slots</a>
        <a href="assignTrainer">Assign Trainer</a>
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

    <!-- Registration Form -->
    <div class="container d-flex justify-content-center align-items-center" style="min-height: 120vh;">
        <div class="card shadow-lg" style="max-width: 600px; width: 100%;">
            <div class="card-body">
                <h2 class="card-title text-center mb-4">Registration Form</h2>
                <form action="register" method="post" onsubmit="return validateForm(event)">

                    <div class="mb-2">

                        <label for="name" class="form-label"><i class="fas fa-user"></i> Name</label>

                       <select class="form-control" id="name" name="name">
                           <option>--Select--</option>
                           <c:forEach items="${listOfNames}" var="list">
                               <option value="${list}">${list}</option>
                           </c:forEach>
                       </select>

                    </div>

                    <div>
                        <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email</label>
                        <input type="email" class="form-control" id="email" name="email" onchange="validateEmail()" required>
                        <span id="emailDemoo" style="color:red;"></span>
                        <span id="emailDemo" style="color:red;"></span>
                    </div>

                    <div>
                        <label for="phone" class="form-label"><i class="fas fa-phone-alt"></i> Phone No</label>
                        <input type="tel" class="form-control" id="phone" name="phone" required>
                        <span id="phoneDemo" style="color:red;"></span>
                    </div>

                    <div>
                        <label for="age" class="form-label"><i class="fas fa-birthday-cake"></i> Age</label>
                        <input type="number" class="form-control" id="age" name="age" onchange="validateAge()" required>
                        <span id="ageDemo" style="color:red;"></span>
                    </div>

                    <div>
                        <label for="packages" class="form-label"><i class="fas fa-gift"></i> Packages</label>
                        <select class="form-control" id="packages" name="packages" required>
                            <option value="" data-amount="0">--select package--</option>
                            <option value="Silver" data-amount="30000">Silver - 30000</option>
                            <option value="Premium" data-amount="40000">Premium - 40000</option>
                            <option value="Gold" data-amount="50000">Gold - 50000</option>
                        </select>
                    </div>


                    <div class="mb-2">
                        <label for="gymName" class="form-label"><i class="fas fa-user"></i> Gym Name</label>
                        <select class="form-control" id="gymName" name="gymName">
                            <option>--Select--</option>
                            <c:forEach items="${listOfGym}" var="list">
                                <option value="${list.gymName}">${list.gymName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <label for="amount" class="form-label"><i class="fas fa-dollar-sign"></i> Amount</label>
                        <input type="number" step="0.01" class="form-control" id="amount" name="amount" readonly required>
                    </div>

                    <div>
                        <label for="discount" class="form-label"><i class="fas fa-percentage"></i> Discount(%)</label>
                        <input type="text" step="0.01" class="form-control" id="discount" name="discount" required>
                    </div>

                    <div>
                        <label for="paid" class="form-label"><i class="fas fa-money-bill-wave"></i> Paid</label>
                        <input type="number" step="0.01" class="form-control" id="paid" name="paid" required>
                        <span id="paidDemo" style="color:red;"></span>
                    </div>

                    <div>
                        <label for="balance" class="form-label"><i class="fas fa-calculator"></i> Balance</label>
                        <input type="number" step="0.01" class="form-control" id="balance" name="balance" readonly required>
                    </div>

                    <div>
                        <label for="installment" class="form-label"><i class="fas fa-calendar-alt"></i> Installment</label>
                        <select name="installment" class="form-control" id="installment">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-info w-100">Submit</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Handle name selection and fetch phone number via AJAX
        document.getElementById('name').addEventListener('change', function () {
            const name = this.value;
            if (name && name !== '--Select--') {
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "getPhoneNumberByName?name=" + name, true);
                xhttp.send();

                xhttp.onload = function () {
                    if (xhttp.status === 200) {
                        const phoneNumber = xhttp.responseText;
                        document.getElementById('phone').value = phoneNumber;
                    } else {
                        console.error("Failed to fetch phone number.");
                    }
                };
            }
        });

        document.getElementById('name').addEventListener('change', function () {
                    const name = this.value;
                    if (name && name !== '--Select--') {
                        var xhttp = new XMLHttpRequest();
                        xhttp.open("GET", "getEmail?name=" + name, true);
                        xhttp.send();

                        xhttp.onload = function () {
                            if (xhttp.status === 200) {
                                const phoneNumber = xhttp.responseText;
                                document.getElementById('email').value = phoneNumber;
                            } else {
                                console.error("Failed to fetch email.");
                            }
                        };
                    }
                });

        // Additional JavaScript for validation and balance calculation (as before)
    </script>

    <!-- Bootstrap JS and
