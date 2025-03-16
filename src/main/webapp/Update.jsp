<%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <style>
                body {
                    background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                    background-repeat: no-repeat;
                    background-position: center;

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

            <!--    .container {
                    margin: 65px;
                    padding: 0px;
                    max-width: 1400px;

                } -->

                   .scrollable-container {
                            max-height: 900px;
                            overflow-y: auto;
                            border: 1px solid black;
                            padding: 10px;
                        }

                        .form-element {
                            margin-bottom: 10px;
                        }

                h3 {

                    text-align: center;
                    margin-top: -8px;
                    /* Remove any top margin */
                    color: white;
                }

                /* Table styling */
                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 25px;
                }

                table th {

                    background-color: darkblue !important;
                    color: white !important;
                    font-weight: bold;
                    text-transform: uppercase !important;


                }

                th,
                td {
                    padding: 12px;
                    text-align: center;
                    border: 1px solid black;
                }


                tr:nth-child(even) {
                    background-color: #f2f2f2;
                }


                tr:hover {
                    background-color: pink;
                    /* Highlight row on hover */
                }
            </style>
        </head>

        <body>
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
                    <a href="followup">FollowUp</a>
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
                <a href="followup">FollowUp</a>
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


            <!-- Main content -->
            <div class="container">
<h3>Update Registered Details</h3>
        <div class="scrollable-container">
            <div class="form-element">


                <table class="table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone No</th>
                            <th>Package</th>
                            <th>Amount</th>
                            <th>Paid</th>
                            <th>Balance</th>
                            <th>Installment</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="details" items="${registerDetails}">
                            <tr>
                                <td>${details.name}</td>
                                <td>${details.email}</td>
                                <td>${details.phone}</td>


                                <form method="post" action="updateDetails">
                                    <input type="hidden" id="name" name="name" value="${details.name}">

                                    <td>
                                        <select class="form-control package" name="packages"
                                            id="packages-${status.index}" required>
                                            <option value="" data-amount="0">select packages</option>
                                            <option value="Silver" data-amount="30000">Silver-30000</option>
                                            <option value="Premium" data-amount="40000">Premium-40000</option>
                                            <option value="Gold" data-amount="50000">Gold-50000</option>
                                        </select>
                                    </td>

                                    <td>
                                        <input type="number" step="0.01" class="form-control amount" name="amount"
                                            id="amount-${status.index}" readonly required>
                                    </td>

                                    <td>
                                        <input type="number" name="paid" class="form-control paid"
                                            id="paid-${status.index}" required>
                                    </td>

                                    <td>
                                        <input type="number" step="0.01" class="form-control balance" name="balance"
                                            id="balance-${status.index}" readonly required>
                                    </td>

                                    <td>
                                        <select name="installment" class="form-control installment"
                                            id="installment-${status.index}">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                        </select>
                                    </td>


                                    <td>
                                        <button type="submit" class="btn btn-success">Update</button>
                                    </td>

                                </form>
                            </tr>

                        </c:forEach>

                    </tbody>

                </table>
                </div>
                </div>

            </div>

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Update the amount based on the selected package
                    document.querySelectorAll('.package').forEach(function (selectElement) {
                        selectElement.addEventListener('change', function () {
                            const selectedOption = this.options[this.selectedIndex];
                            const packageAmount = selectedOption.getAttribute('data-amount');
                            const amountField = this.closest('tr').querySelector('.amount');
                            amountField.value = packageAmount; // Set the amount field
                            calculateBalance(this.closest('tr')); // Recalculate balance when package is changed
                        });
                    });

                    // Update the balance and discount calculations
                    function calculateBalance(row) {
                        const amount = parseFloat(row.querySelector('.amount').value) || 0;
                        const paid = parseFloat(row.querySelector('.paid').value) || 0;

                        const balance = amount - paid;
                        row.querySelector('.balance').value = balance.toFixed(2); // Update balance field
                    }

                    // Recalculate balance when paid amount is changed
                    document.querySelectorAll('.paid').forEach(function (inputElement) {
                        inputElement.addEventListener('input', function () {
                            calculateBalance(this.closest('tr'));
                        });
                    });

                    // Ensure the balance is calculated on page load (if amount is already set)
                    document.querySelectorAll('.amount').forEach(function (amountField) {
                        const row = amountField.closest('tr');
                        calculateBalance(row);
                    });
                });


            </script>

        </body>

        </html>