<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOC TYPE html>
            <html>
            <head>
                <title>Update</title>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <style>
                    body {
                        background: url('https://static.vecteezy.com/system/resources/thumbnails/035/987/056/small_2x/ai-generated-still-life-of-interior-modern-fitness-center-gym-with-a-workout-room-empty-space-for-text-ai-generated-photo.jpg') no-repeat center center fixed;
                        background-size: cover;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        height: 100vh;
                    }

                    .form-container {
                        background-color: rgba(255, 255, 255, 0.9);
                        color: black;
                        border-radius: 25px;
                        margin-top: 200px;
                        padding: 30px;
                        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
                        width: 600px;
                        max-height: 700px;
                        overflow-y: auto;
                    }

                    .fitness-image {
                        width: 6cm;
                        height: 6cm;
                        position: relative;
                        top: -13cm;
                        right: -30cm;
                        animation: fadeIn 5s ease-in-out infinite;
                        opacity: 0;
                    }

                    @keyframes fadeIn {
                        0% {
                            opacity: 0;
                        }

                        50% {
                            opacity: 1;
                        }

                        100% {
                            opacity: 0;
                        }
                    }

                    label {
                        font-size: 14px;
                    }

                    input.form-control,
                    select.form-control {
                        border-radius: 25px;
                        height: 45px;
                        font-size: 14px;
                        border: 1px solid purple;
                    }

                    input.form-control:focus,
                    select.form-control:focus {
                        border-color: #1e3a8a;
                        box-shadow: 0px 5px 10px #1e3a8a;
                    }

                    .btn {
                        border-radius: 25px;
                        height: 45px;
                        font-size: 18px;
                        background-color: green;
                        color: black;
                        border: none;
                    }

                    .btn:hover {
                        background-color: #143362;
                    }

                    .form-check-inline {
                        margin-right: 15px;
                    }

                    @media (max-width: 768px) {
                        .form-container {
                            width: 90%;
                        }
                    }

                    .navbar {
                        display: flex;
                        justify-content: flex-end;
                        list-style-type: none;
                        padding: 3px;
                        margin: 0;
                        background-color: black;
                        width: 100%;
                        position: fixed;
                        top: 0;
                        left: 0;
                        z-index: 1000;
                    }

                    .navbar ul {
                        justify-content: flex-end;
                        list-style-type: none;
                        padding: 0;
                        margin: 0;
                    }

                    .navbar ul li {
                        justify-content: flex-end;
                        margin-right: 30px;
                        display: inline-block;

                    }

                    .navbar ul li a {
                        color: pink;
                        font-size: 18px;
                        font-weight: 600;
                        text-decoration: none;
                        padding: 10px 15px;
                        border-radius: 5px;
                        transition: all 0.3s ease;
                    }

                    .navbar ul li a:hover {
                        background-color: black;
                        color: gray;
                    }

                    .navbar ul li.active a {
                        background-color: red;
                        color: blue;
                    }
                </style>
            </head>

            <body>
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
                            aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="Enquiry.jsp"><i class="fas fa-search"></i> Enquiry</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="search"><i class="fas fa-users"></i> FollowUp</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Registration.jsp"><i class="fas fa-user-plus"></i>
                                        Registration</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="UpdateRegister.jsp"><i class="fas fa-edit"></i>
                                        Update</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="form-container">
                    <!-- Search Form -->
                    <h2 class="text-center">Search and Update Registration</h2>
                    <form action="http://localhost:8080/Shanta_Gym/update" method="post">

                        <div class="form-group col-md-6">
                            <label for="email">Search Email:</label>
                            <input type="text" name="email" class="form-control" id="email">
                            <span id="regiEmail" style="color: red;"></span>
                            <button type="button" class="btn btn-primary" onclick="searchEmail()">Search</button>
                        </div>

                        <div>
                            <label for="packages" class="form-label"><i class="fas fa-gift"></i>Packages</label>
                            <select class="form-control" id="packages" name="packages" required>
                                <option value="" data-amount="0">--select package--</option>
                                <option value="Silver" data-amount="30000">Silver - 30000</option>
                                <option value="Premium" data-amount="40000">Premium - 40000</option>
                                <option value="Gold" data-amount="50000">Gold - 50000</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="trainer">Trainer:</label>
                            <input type="text" name="trainer" class="form-control" id="trainer"
                                value="${details.trainer}" readonly>
                        </div>

                        <div class="form-group">
                            <label for="id">Id:</label>
                            <input type="number" name="id" class="form-control" id="id" value="${details.id}" readonly>
                        </div>

                        <div>
                            <label for="amount" class="form-label"><i class="fas fa-dollar-sign"></i> Amount</label>
                            <input type="number" step="0.01" class="form-control" id="amount" name="amount" readonly
                                required>
                        </div>

                        <div class="form-group">
                            <label for="paid">Paid Amount:</label>
                            <input type="number" name="paid" class="form-control" id="paid" value="${details.paid}">
                        </div>

                        <div>
                            <label for="balance" class="form-label"><i class="fas fa-calculator"></i> Balance</label>
                            <input type="number" step="0.01" class="form-control" id="balance" name="balance" readonly
                                required>
                        </div>

                        <div class="form-group">
                            <label for="installment">Installment:</label>
                            <select name="installment" class="form-control" id="installment"
                                value="${details.installment}">
                                <option value="1" ${details.installment==1 ? 'selected' : '' }>1</option>
                                <option value="2" ${details.installment==2 ? 'selected' : '' }>2</option>
                                <option value="4" ${details.installment==3 ? 'selected' : '' }>3</option>
                                <option value="12" ${details.installment==4 ? 'selected' : '' }>4</option>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>
                </div>

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
                  const paid = parseFloat(document.getElementById('paid').value) || 0;

                  const balance = amount - paid;
                  document.getElementById('balance').value = balance.toFixed(2); // Update balance field
              }

              // Recalculate balance when paid amount is changed
              document.getElementById('paid').addEventListener('input', calculateBalance);

              // Ensure the balance is calculated on page load (if amount is already set)
              window.onload = function () {
                  calculateBalance();
              };
                </script>

                <script>
                    function searchEmail() {
                        var email = document.getElementById('email').value;
                        if (email !== "") {
                            var form = document.createElement('form');
                            form.method = 'POST';
                            form.action = 'searchEmail'; // Adjust the URL for your search action

                            var emailInput = document.createElement('input');
                            emailInput.type = 'hidden';
                            emailInput.name = 'email';
                            emailInput.value = email;

                            form.appendChild(emailInput);
                            document.body.appendChild(form);
                            form.submit();
                        }
                    }
                    
                </script>
            </body>

            </html>