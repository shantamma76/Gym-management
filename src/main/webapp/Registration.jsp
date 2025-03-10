<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
background-image: url('https://img.freepik.com/premium-photo/empty-gym-with-treadmills_564714-18757.jpg');
background-size: cover;
        }

        .container {
            margin-top: 100px;
        }

        /* Navbar styling */
        .navbar {
            display: flex;
            justify-content: flex-end;
            list-style-type: none;
            padding: 3px;
            margin: 0;
            background-color: #333;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar-brand img {
            width: 120px;
            /* Adjust width as needed */
            height: auto;
            margin-right: 570px;
        }

        .navbar li {
            display: inline-block;
            padding: 12px;
        }

        .navbar li a {
            color: white;
            text-decoration: none;
            display: block;
        }

        .navbar li a:hover {
            background-color: #575757;
        }

        /* Add padding to the top of the body to prevent content overlap */
        .content {
            padding-top: 10px;
        }

        .form-label i {
            margin-right: 10px;
        }

        .form-control {
            padding-left: 30px;
            /* Space for icon inside input field */
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
        <li><a href="UpdateRegister.jsp"><i class="fas fa-edit"></i> Update</a></li>
        <li><a href="trainer"><i class="fas fa-edit"></i>Assign Trainer</a></li>
    </ul>

    <div class="container d-flex justify-content-center align-items-center" style="min-height: 120vh;">
        <div class="card shadow-lg" style="max-width: 600px; width: 100%;">
            <div class="card-body">

                <h2 class="card-title text-center mb-4">Registration Form</h2>

                <form action="register" method="post">
                    <div class="mb-2">
                       <label for="name" class="form-label"><i class="fas fa-user"></i> Name</label>

                       <select class="form-control" id="name" name="name">
                       <option>--Select--</option>
                           <c:forEach items="${autocomplete}" var="list">
                                <option value="${list.name}">${list.name}</option>
                           </c:forEach>
                       </select>
                    </div>

                    <div>
                        <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email</label>
                        <input type="email" class="form-control" id="email" name="email" onChange="onEmailChange()" required>
                        <span id="emailDemoo" style="color:red;"></span>
                        <span id="emailDemo" style="color:red;"></span>
                    </div>

                    <div>
                        <label for="phone" class="form-label"><i class="fas fa-phone-alt"></i> Phone No</label>
                        <input type="tel" class="form-control" id="phone" name="phone" onChange="onPhoneChange()" required>
                        <span id="phoneDemo" style="color:red;"></span>
                    </div>

                    <div>
                        <label for="age" class="form-label"><i class="fas fa-birthday-cake"></i> Age</label>
                        <input type="number" class="form-control" id="age" name="age" required>
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

                    <div>
                        <label for="trainer" class="form-label"><i class="fas fa-chalkboard-teacher"></i> Trainer</label>
                        <input type="text" class="form-control" id="trainer" name="trainer" onChange="onTrainerChange()" required>
                        <span id="trainerDemo" style="color:red;"></span>
                    </div>

                    <div>
                        <label for="gymName" class="form-label"><i class="fas fa-building"></i> Gym Name</label>
                        <input type="text" class="form-control" id="gymName" name="gymName" onChange="onGymName()" required>
                        <span id="gymDemo" style="color:red;"></span>
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
                        <input type="number" step="0.01" class="form-control" id="paid" name="paid" onChange="onPaid()" required>
                        <span id="paidDemo" style="color:red;"></span>
                    </div>

                    <div>
                        <label for="balance" class="form-label"><i class="fas fa-calculator"></i> Balance</label>
                        <input type="number" step="0.01" class="form-control" id="balance" name="balance" readonly required>
                    </div>

                    <div>
                        <label for="installment" class="form-label"><i class="fas fa-calendar-alt"></i> Installment</label>
                        <input type="number" step="0.01" class="form-control" id="installment" name="installment" onChange="onInstallment" required>
                        <span id="installmentDemo" style="color:red;"></span>
                    </div>

                    <button type="submit" class="btn btn-info w-100">Submit</button>

                </form>
            </div>
        </div>
    </div>

    <script>
        // Handle name selection and fetch phone number
        document.getElementById('name').addEventListener('change', function () {
            const name = this.value; // Get selected name

            if (name && name !== '--Select--') {
                // Create an AJAX request to get the phone number for the selected name
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "getPhoneNumberByName?name=" + name, true);
                xhttp.send();

                // Handle the response
                xhttp.onload = function () {
                    if (xhttp.status === 200) {
                        const phoneNumber = xhttp.responseText; // The phone number returned from backend
                        document.getElementById('phone').value = phoneNumber; // Set the phone number in the input
                    } else {
                        console.error("Failed to fetch phone number.");
                    }
                };
            }
        });
    </script>


        <script>
            // Update the amount based on the selected package
            document.getElementById('packages').addEventListener('change', function () {
                const packageSelect = this;
                const selectedOption = packageSelect.options[packageSelect.selectedIndex];
                const packageAmount = selectedOption.getAttribute('data-amount');
                document.getElementById('amount').value = packageAmount; // Set the amount field
                calculateBalance(); // Recalculate balance when package is changed
            });

            // Update the balance and discount calculations
            function calculateBalance() {
                const amount = parseFloat(document.getElementById('amount').value) || 0;
                const discount = parseFloat(document.getElementById('discount').value) || 0;
                const paid = parseFloat(document.getElementById('paid').value) || 0;

                const discountedAmount = amount - (amount * (discount / 100));
                const balance = discountedAmount - paid;
                document.getElementById('balance').value = balance.toFixed(2); // Update balance field
            }

            // Recalculate balance when discount value is changed
            document.getElementById('discount').addEventListener('input', calculateBalance);

            // Recalculate balance when paid amount is changed
            document.getElementById('paid').addEventListener('input', calculateBalance);
        </script>

        <script>
            function onEmailChange() {
                console.log('this is on place email');
                var email = document.getElementById('email');
                var emailValue = email.value;

                if (!emailValue.includes('@gmail.com') && !emailValue.includes('@yahoo.com') && !emailValue.includes('@outlook.com') && !emailValue.includes('@hotmail.com') &&
                    !emailValue.includes('.edu') && !emailValue.includes('.org') && !emailValue.includes('.info') && !emailValue.includes('.net')) {
                    document.getElementById("emailDemoo").innerHTML = "Enter a valid email address.";
                } else {
                    document.getElementById("emailDemoo").innerHTML = "";
                }

                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/registration/email/" + emailValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("emailDemo").innerHTML = this.responseText;
                }
            }

            function onPhoneChange() {
                console.log('this is on place phone');
                var phone = document.getElementById('phone');
                var phoneValue = phone.value;

                if (phoneValue.trim().length !== 10 || (!phoneValue.startsWith("6") && !phoneValue.startsWith("7")
                    && !phoneValue.startsWith("8") && !phoneValue.startsWith("9"))) {
                    document.getElementById("phoneDemo").innerHTML = "Phone number must contain 10 digits and should be valid.";
                    return;
                } else {
                    document.getElementById("phoneDemo").innerHTML = "";
                }

                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/phone/" + phoneValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("phoneDemo").innerHTML = this.responseText;
                }
            }

            function onTrainerChange() {
                console.log('this is on place trainer');
                var trainer = document.getElementById('trainer');
                var trainerValue = trainer.value;

                if (trainerValue.trim().length < 3) {
                    document.getElementById("trainerDemo").innerHTML = "Trainer Name must be at least 3 characters long.";
                    return;
                } else {
                    document.getElementById("trainerDemo").innerHTML = "";
                }

                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/registration/trainer/" + trainerValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("trainerDemo").innerHTML = this.responseText;
                }
            }
            function onGymName() {
                console.log('this is on place GymName');
                var gymName = document.getElementById('gymName');
                var gymNameValue = gymName.value;

                if (gymNameValue.trim().length < 3) {
                    document.getElementById("gymDemo").innerHTML = "GymName must be at least 3 characters long.";
                    return;
                } else {
                    document.getElementById("gymDemo").innerHTML = "";
                }

                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Shanta_Gym/registration/gymName/" + gymNameValue);
                xhttp.send();

                xhttp.onload = function () {
                    document.getElementById("gymDemo").innerHTML = this.responseText;
                }
            }
        </script>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>

    </html>