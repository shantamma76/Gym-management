<%@page isELIgnored="false" %>
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
                margin: 0;
                padding: 0;
            }

            /* Navigation Menu */
            .navbar {
                display: flex;
                justify-content: flex-end;
                /* Aligns the items to the right */
                list-style-type: none;
                padding: 8px;
                margin: 0;
                background-color: #333;
                width: 100%;
                position: fixed;
                /* Fix the navbar at the top */
                top: 0;
                left: 0;
                z-index: 1000;
                /* Ensures the navbar is above other content */
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
                /* Adds space between icon and text */
            }

            .navbar li a:hover {
                background-color: #575757;
            }

            /* Heading styles */
            h1 {
                text-align: center;
                margin-top: 100px;
                /* Adds space below the fixed navbar */
                font-size: 24px;
            }

            /* Mobile and Desktop Responsiveness */
            @media screen and (min-width: 769px) {
                .navbar {
                    display: block;
                    background-color: #333;
                    width: 100%;
                    text-align: right;
                    padding: 0;
                }

                .navbar li {
                    display: inline-block;
                }

                .navbar li a {
                    padding: 14px 20px;
                    color: white;
                    text-decoration: none;
                }

                .navbar li a:hover {
                    background-color: #575757;
                }
            }

            @media screen and (max-width: 768px) {
                .navbar {
                    display: block;
                    width: 100%;
                }

                .navbar li {
                    text-align: right;
                }

                .navbar li a {
                    padding: 14px 20px;
                    border-bottom: 1px solid #444;
                }

                .navbar li a:hover {
                    background-color: #575757;
                }
            }
        </style>
    </head>

    <body>
        <!-- Navigation Menu -->
        <ul class="navbar">

            <li><a href="index.jsp"><i class="fas fa-home"></i>Home</a></li>
            <li><a href="Enquiry.jsp"><i class="fas fa-question-circle"></i>Enquiry</a></li>
            <li><a href="search"><i class="fas fa-search"></i>Follow Up</a></li>
            <li><a href="register"><i class="fas fa-user-plus"></i>Register</a></li>
            <li><a href="update"><i class="fas fa-edit"></i>Update</a></li>
            <li><a href="trainerslots.jsp"><i class="fas fa-edit"></i>trainerSlots</a></li>
            <li> <a href="trainer" class="nav-link link-body-emphasis">AssignTrai</a></li>
            <li><a href="dietAndExercise" class="nav-link link-body-emphasis">DietAndExercise</a> </li>

        </ul>

        <h1>Login Successfully Done!</h1> <br>
    </body>

    </html>