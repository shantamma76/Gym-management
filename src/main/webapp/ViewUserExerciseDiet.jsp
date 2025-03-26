<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Weekly Exercise & Monthly Diet Plan</title>
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                }

                body {
                    font-family: Arial, sans-serif;
                    background-image: url('https://easyfitgaragedoor.co.uk/wp-content/uploads/2018/08/DALL%C2%B7E-2024-02-29-15.08.50-Create-an-illustration-of-two-free-weights-specifically-dumbbells-on-a-gym-floor.-The-dumbbells-should-have-a-sleek-modern-design-with-chrome-handl.webp');
                    background-size: 1600px 1300px;
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
                    height: 65px;
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
                }

                .mobile-nav.show {
                    display: flex;
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

                .container,
                .container1 {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    padding: 20px;
                    width: 97%;
                    max-width: 1200px;
                    margin: auto;
                }

                .week-container {
                    background: rgba(0, 0, 0, 0.5);
                    backdrop-filter: blur(10px);
                    border-radius: 8px;
                    padding: 20px;
                    width: 100%;
                    text-align: center;
                    margin-bottom: 20px;
                }

                .week-grid {
                    display: grid;
                    grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
                    gap: 15px;
                    padding: 10px;
                }

                .day {
                    color: white;
                    padding: 15px;
                    border-radius: 8px;
                    text-align: center;
                    font-weight: bold;
                    background: rgba(0, 0, 0, 0.5);
                    backdrop-filter: blur(10px);
                    box-shadow: 0 3px 8px rgb(251, 250, 250);
                    border-radius: 8px;
                }

                .day p {
                    color: yellow;
                }

                .day:hover {
                    transform: scale(1.05);
                    background: #c6c6c6;
                    color: black;
                }

                .month-container {
                    background: rgba(0, 0, 0, 0.5);
                    backdrop-filter: blur(10px);
                    border-radius: 8px;
                    padding: 20px;
                    text-align: center;
                }

                .image-container {
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: center;
                    gap: 20px;
                    margin-top: 20px;
                }

                .month-image {
                    text-align: center;
                    flex-basis: calc(25% - 20px);
                    margin-bottom: 20px;
                    background: rgba(0, 0, 0, 0.5);
                    backdrop-filter: blur(10px);
                    box-shadow: 0 3px 8px rgb(251, 250, 250);
                    border-radius: 8px;
                    padding: 20px;
                    box-sizing: border-box;
                }

                .month-image img {
                    width: 100%;
                    height: 250px;
                    object-fit: cover;
                    border-radius: 8px;
                    box-shadow: 0px 4px 10px rgba(255, 255, 255, 1);
                    margin-top: 30px;
                }

                .month-image p {
                    margin-top: 10px;
                    font-weight: bold;
                    font-size: 1rem;
                    color: yellow;
                }

                @media (max-width: 1200px) {
                    .month-image {
                        flex-basis: calc(33.33% - 20px);
                    }
                }

                @media (max-width: 768px) {
                    .month-image {
                        flex-basis: calc(50% - 20px);
                    }
                }

                @media (max-width: 480px) {
                    .month-image {
                        flex-basis: 100%;
                    }
                }
            </style>
        </head>

        <body>
            <header class="header">

                <div class="logo">
                    <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="Logo"
                        class="logo-img">
                </div>

                <nav class="nav">
                    <a href="userHome">Home</a>
                    <a href="userProfile">User Profile</a>
                    <a href="trainerAndSlot">Trainer And Slot</a>
                    <a href="exerciseDiet">Exercise and Diet</a>
                </nav>

                <div style="display: flex; align-items: center;">
                    <!--   <img src="photo/${list.filePath}" alt="Profile Picture" class="profile-img"> -->
                    <div class="menu-toggle" onclick="toggleMenu()">
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                </div>

                <!-- Mobile Navigation -->
                <nav class="mobile-nav">
                    <a href="userHome">Home</a>
                    <a href="userProfile" class="nav-link"> User Profile</a>
                    <a href="trainerAndSlot" class="nav-link"> Trainer And Slot </a>
                    <a href="exerciseDiet" class="nav-link"> Exercise and Diet </a>
                    <a href="index.jsp">Logout</a>
                </nav>

            </header>

            <div class="container">
                <!-- Weekly Exercise Plan -->
                <div class="week-container">
                    <h2 style="color:#00fdff;margin-bottom:20px;">Weekly Exercise Plan</h2>
                    <c:forEach items="${viewUserExercise}" var="exercisePlan">

                        <div class="week-grid">

                            <div class="day">
                                <h3>Monday</h3>
                                <p>${exercisePlan.monday}</p>
                            </div>

                            <div class="day">
                                <h3>Tuesday</h3>
                                <p>${exercisePlan.tuesday}</p>
                            </div>

                            <div class="day">
                                <h3>Wednesday</h3>
                                <p>${exercisePlan.wednesday}</p>
                            </div>

                            <div class="day">
                                <h3>Thursday</h3>
                                <p>${exercisePlan.thursday}</p>
                            </div>

                            <div class="day">
                                <h3>Friday</h3>
                                <p>${exercisePlan.friday}</p>
                            </div>

                            <div class="day">
                                <h3>Saturday</h3>
                                <p>${exercisePlan.saturday}</p>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="container1">
                <!-- Monthly Diet Plan -->
                <div class="month-container">
                    <h2 style="color:white">Monthly Diet Plan and Image</h2>
                    <div id="all-images-container" class="image-container">
                        <c:forEach var="monthlyImages" items="${monthlyImages}">
                            <div class="month-image">
                                <div class="text-container">
                                    <p><span style="color:#00fdff;">Month:</span> ${monthlyImages.month}</p>
                                    <p><span style="color:#00fdff;">Diet:</span> ${monthlyImages.dietPlan}</p>
                                </div>

                                <img src="photo/${monthlyImages.usermonthlyImage}" alt="Diet Plan for ${monthlyImages.dietPlan}">
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <script>
                function toggleMenu() {
                    document.querySelector('.mobile-nav').classList.toggle('show');
                }
            </script>

    </body>
</html>