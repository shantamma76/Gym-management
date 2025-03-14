<%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>
  <style>
    @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Open Sans", sans-serif;
    }

    body {
      min-height: 100vh;
      width: 100%;
     background-image: url('https://media.istockphoto.com/id/1391410249/photo/sports-and-gym-activities.jpg?s=612x612&w=0&k=20&c=1S-hAmT-CkRtdYV_hcKi1lZdQkXAN_mCy3ebIXlUEnE=');
    <!--  background-position: center;
      background-size: cover;
      background-repeat: no-repeat; -->
      color: white;
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

    /* Adjust layout for small screens */
    @media (max-width: 768px) {
      .nav {
        display: none;
      }
    }

    .center-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      margin-top: 50px;
      text-align: center;
    }

    .center-container img {
      height: 150px;
      width: 150px;
      border-radius: 75px;
      margin-bottom: 20px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }

    .message-container {
      display: flex;
      align-items: center;
      justify-content: center;
      width: auto;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(8px);
      border-radius: 12px;
      text-align: center;
      padding: 20px;
      border: 1px solid rgba(255, 255, 255, 0.1);
      margin-top: 20px;
    }

    .message-container h1 {
      font-size: 2rem;
      font-weight: bold;
      color: red;
    }

    .mobile-nav a {
      display: flex;
      align-items: center;
      justify-content: center; /* Center content */
      gap: 10px;
      padding: 10px;
      color: white;
      text-decoration: none;
      font-size: 1rem;
      text-align: center;
      width: 100%;
      transition: color 0.3s;
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


 <nav class="nav">
      <a href="userHome">Home</a>
       <a href="UserLogin.jsp">SignIn</a>
     <a href="userProfile">UserProfile</a>
     <a href="trainerAndSlot">Trainer And Slot</a>
     <a href="exerciseDiet">Exercise and Diet</a>

      <!--  <a href="userProfile">Personal Profile</a> -->
      <!--  <a href="UpdateUserProfile.jsp">UpdatedUserProfile</a> -->
      <!--  <a href="UserProfile">UserPage</a> -->



 </nav>

    <!-- Toggle Menu (Right Side) -->
    <div style="display: flex; align-items: center;">

      <div class="menu-toggle" onclick="toggleMenu()">
        <div></div>
        <div></div>
        <div></div>
      </div>
    </div>

 <!-- Toggle Menu -->
 <nav class="mobile-nav">
     <a href="UserHomePage">Home</a>

     <a href="userProfile" class="nav-link">
      <!-- <img src="https://i.ibb.co/SXWPRLz/user.png" alt="Personal Profile Icon" style="width: 20px; height: 20px;"> -->
         User Profile
     </a>

     <a href="updateProfile" class="nav-link">
           <!-- <img src="https://i.ibb.co/SXWPRLz/user.png" alt="Personal Profile Icon" style="width: 20px; height: 20px;"> -->
              Udpate User Profile
          </a>
       <a href="trainerAndSlot" class="nav-link">
           <!-- <img src="https://cdn-icons-png.flaticon.com/512/9050/9050508.png" alt="Trainer And Slot Icon" style="width: 20px; height: 20px;"> -->
              Trainer And Slot
          </a>

           <a href="exerciseDiet" class="nav-link">
           <!-- <img src="https://i.ibb.co/zWy1BBG4/exercise-1.png" alt="Trainer And Slot Icon" style="width: 20px; height: 20px;"> -->
                     Exercise and Diet
                    </a>
            +


     <a href="index.jsp">Logout</a>
 </nav>
 </header>

  <!-- Center Section (Image + Welcome Text) -->
  <div class="center-container">
   <!-- <img src="photo/${list.filePath}" alt="Centered Image" class="centreImg"> -->
    <div class="message-container">
      <h1> Hello "${list.name}" <br>  Welcome To Gym</h1>

    </div>
  </div>


  <!-- JavaScript for Menu Toggle -->
  <script>
    function toggleMenu() {
      document.querySelector('.mobile-nav').classList.toggle('show');
    }
  </script>


</body>
</html>