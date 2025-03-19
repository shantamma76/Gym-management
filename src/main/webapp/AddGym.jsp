<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Gym Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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



        .form-container {
            max-width: 500px;
            margin:auto;
            margin-top:100px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-submit {
            background: #007bff;
            border: none;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            color: #fff;
            border-radius: 5px;
        }
        .btn-submit:hover {
            background: #0056b3;
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
                <a href="followup">FollowUp</a>
                <a href="register">Registration</a>
                <a href="AddGym.jsp">Add Gym Details</a>
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
            <a href="updateRegi">Update</a>
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

    <div class="form-container">
        <h2>Add Gym Details</h2>
        <form action="addGymDetails" method="POST">
            <div class="mb-3">
                <label for="gymName" class="form-label">Gym Name</label>
                <input type="text" class="form-control" id="gymName" name="gymName" placeholder="Enter Gym Name" required>
            </div>
            <div class="mb-3">
                <label for="ownerName" class="form-label">Owner Name</label>
                <input type="text" class="form-control" id="ownerName" name="ownerName" placeholder="Enter Owner's Full Name" required>
            </div>
            <div class="mb-3">
                <label for="location" class="form-label">Gym Location</label>
                <input type="text" class="form-control" id="location" name="location" placeholder="Enter Gym Location" required>
            </div>
            <button type="submit" class="btn-submit">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
