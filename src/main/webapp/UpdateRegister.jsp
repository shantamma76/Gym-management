<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Register</title>
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
                   margin: 0;
                   padding-top: 80px;
               }

               .form-container {
                   background-color: rgba(255, 255, 255, 0.9);
                   color: black;
                   margin-top:60px;
                   border-radius: 35px;
                   padding: 30px;
                   box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
                   width: 600px;
                   max-height: 700px;
                   overflow-y: auto;
                   z-index: 1;
               }

               .header {
                   display: flex;
                   justify-content: space-between;
                   align-items: center;
                   padding: 10px 30px;
                   position: fixed;
                   top: 0;
                   width: 100%;
                   z-index: 999;
                   color: white;
                   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                   background-color: #0E0E0E;
               }

               .logo-img {
                   max-height: 51px;
                   height: auto;
               }

               .nav {
                   display: flex;
                   align-items: center;
                   gap: 30px;
                   justify-content: center;
                   flex-grow: 1;
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

               .menu-toggle {
                   display: flex;
                   flex-direction: column;
                   cursor: pointer;
                   margin-left: 15px;
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
                   top: 70px;
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

               @media (max-width: 768px) {
                   .nav {
                       display: none;
                   }
                   .menu-toggle {
                       display: flex;
                   }
                   .mobile-nav {
                       display: none;
                   }
                   .mobile-nav.show {
                       display: flex;
                   }
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


    </style>
</head>

<body>
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
                   <a href="assign">AssignUsers</a>
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

    <div class="form-container">
        <!-- Search Form -->
        <h2 class="text-center">Search and Update Registration</h2>
        <form action="http://localhost:8080/Shanta_Gym/updates" method="post">

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
                <input type="text" name="trainer" class="form-control" id="trainer" value="${details.trainer}" readonly>
            </div>

            <div class="form-group">
                <label for="id">Id:</label>
                <input type="number" name="id" class="form-control" id="id" value="${details.id}" readonly>
            </div>

            <div>
                <label for="amount" class="form-label"><i class="fas fa-dollar-sign"></i> Amount</label>
                <input type="number" step="0.01" class="form-control" id="amount" name="amount" readonly required>
            </div>

            <div class="form-group">
                <label for="paid">Paid Amount:</label>
                <input type="number" name="paid" class="form-control" id="paid" value="${details.paid}">
            </div>

            <div>
                <label for="balance" class="form-label"><i class="fas fa-calculator"></i> Balance</label>
                <input type="number" step="0.01" class="form-control" id="balance" name="balance" readonly required>
            </div>

            <div class="form-group">
                <label for="installment">Installment:</label>
                <select name="installment" class="form-control" id="installment" value="${details.installment}">
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
