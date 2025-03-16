<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <title>Success Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Font Awesome CDN -->
    <style>
        /* Basic styles */
        body {
            background-image: url('https://marathonhandbook.com/wp-content/uploads/2022/08/Total-Body-Gym-Workout.jpg');
            font-family: Arial, sans-serif;
            background-size: 1500px 900px;
            margin: 0;
            padding: 0;
        }

        /* Header */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            position: sticky;
            top: 0;
            width: 96.2%;
            height: 50px;
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

            .message-container {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: calc(80vh - 45px);
                    text-align: center;
                }

         h1 {
                    font-size: 2rem;
                    color: black;
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
            <a href="index.jsp">Home</a>
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
        <a href="Success.jsps">Home</a>
        <a href="Enquiry.jsp">Enquiry</a>
        <a href="search">FollowUp</a>
        <a href="register">Registration</a>
        <a href="updateRegi">UpdateRegi</a>
        <a href="trainerslots">Slots</a>
        <a href="assignTrainer">AssignUsers</a>
        <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>
        <a href="index.jsp">Logout</a>
    </nav>


    <!-- Message Centered -->
    <div class="message-container">
        <h1>Login Successfully Done!</h1>
    </div>

    <script>

        // Toggle mobile menu visibility
        function toggleMenu() {
            const mobileNav = document.querySelector('.mobile-nav');
            mobileNav.classList.toggle('show');
        }

    </script>
</body>

</html>
