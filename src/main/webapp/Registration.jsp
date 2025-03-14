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
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
                rel="stylesheet">

            <style>
                body {
                    background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                    background-size: 1600px 1100px;
                    /*width and height */
                    background-repeat: no-repeat;
                    background-position: center;
                }

                .container {
                    margin-top: 20px;
                    margin-bottom: 50px;


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
            <!-- Header Section -->
            <header class="header">
                <!-- Logo -->
                <div class="logo">
                    <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="Logo"
                        class="logo-img">
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
                                        <option value="${list.name}">${list.name}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div>
                                <label for="email" class="form-label"><i class="fas fa-envelope"></i> Email</label>
                                <input type="email" class="form-control" id="email" name="email"
                                    onchange="validateEmail()" required>
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
                                <input type="number" class="form-control" id="age" name="age" onchange="validateAge()"
                                    required>
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

                            <div>
                                <label for="gymName" class="form-label"><i class="fas fa-building"></i> Gym Name</label>
                                <input type="text" class="form-control" id="gymName" name="gymName"
                                    onchange="validateGym()" required>
                                <span id="gymDemo" style="color:red;"></span>
                            </div>

                            <div>
                                <label for="amount" class="form-label"><i class="fas fa-dollar-sign"></i> Amount</label>
                                <input type="number" step="0.01" class="form-control" id="amount" name="amount" readonly
                                    required>
                            </div>

                            <div>
                                <label for="discount" class="form-label"><i class="fas fa-percentage"></i>
                                    Discount(%)</label>
                                <input type="text" step="0.01" class="form-control" id="discount" name="discount"
                                    required>
                            </div>

                            <div>
                                <label for="paid" class="form-label"><i class="fas fa-money-bill-wave"></i> Paid</label>
                                <input type="number" step="0.01" class="form-control" id="paid" name="paid" required>
                                <span id="paidDemo" style="color:red;"></span>
                            </div>

                            <div>
                                <label for="balance" class="form-label"><i class="fas fa-calculator"></i>
                                    Balance</label>
                                <input type="number" step="0.01" class="form-control" id="balance" name="balance"
                                    readonly required>
                            </div>

                            <div>
                                <label for="installment" class="form-label"><i class="fas fa-calendar-alt"></i>
                                    Installment</label>
                                <input type="number" step="0.01" class="form-control" id="installment"
                                    name="installment" onchange="validateInstallment()" required>
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

                // Form validation
                function validateForm(event) {
                    let valid = true;
                    valid = valid && validateEmail();
                    valid = valid && validateAge();
                    valid = valid && validateGym();
                    valid = valid && validateInstallment();


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
                        document.getElementById("emailDemoo").innerHTML = "Enter a valid email address.";
                        return false;
                    } else {
                        document.getElementById("emailDemoo").innerHTML = "";
                    }

                    var xhttp = new XMLHttpRequest();
                    xhttp.open("GET", "http://localhost:8080/Shanta_Gym/registration/email/" + emailValue, true);
                    xhttp.send();

                    xhttp.onload = function () {
                        document.getElementById("emailDemo").innerHTML = this.responseText;
                    };

                    return true;
                }

                function validateAge() {
                    var age = document.getElementById('age');
                    var ageValue = age.value;

                    if (ageValue < 18 || ageValue > 55) {
                        document.getElementById("ageDemo").innerHTML = "Age should be between 18 and 55";
                        return false;
                    } else {
                        document.getElementById("ageDemo").innerHTML = "";
                    }
                    return true;
                }

                function validateGym() {
                    var gymName = document.getElementById('gymName');
                    var gymNameValue = gymName.value;

                    if (gymNameValue.trim().length < 3) {
                        document.getElementById("gymDemo").innerHTML = "GymName must be at least 3 characters long.";
                        return false;
                    } else {
                        document.getElementById("gymDemo").innerHTML = "";
                    }
                    return true;
                }

                function validateInstallment() {
                    var installment = document.getElementById('installment');
                    var installmentValue = installment.value;

                    if (installmentValue <= 0 || installmentValue >= 5) {
                        document.getElementById("installmentDemo").innerHTML = "Installment should be greater than 0 and less than 5";
                        return false;
                    } else {
                        document.getElementById("installmentDemo").innerHTML = "";
                    }
                    return true;
                }

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

            <!-- Bootstrap JS and dependencies -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        </body>

        </html>