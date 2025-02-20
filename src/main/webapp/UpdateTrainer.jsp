
   <%@ page isELIgnored="false" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Form</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      margin: 0;
      background-image: url("https://lumolog.com/wp-content/uploads/2024/04/gym-facilities.jpg");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      color: #000;
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
                 background-color: #1B1E23;
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

    .form-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .form-box {
      background-color: rgba(57, 55, 55, 0.9);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
      width: 40%;
    }
    label {
      color: white;
      font-weight: 500;
    }
    .form-control {
      width: 100%;
    }
    .input-group {
      display: flex;
      align-items: center;
    }
    .input-group-append {
      margin-left: 10px;
      color: white;
      font-weight: 500;
    }
    .btn-submit {
      width: 100%;
      padding: 10px;
      font-size: 1.2rem;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      margin-top: 15px;
    }
    .btn-submit:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<header class="header">
      <!-- Logo -->
      <div class="logo">
        <img src="https://x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" alt="Logo" class="logo-img">
      </div>

      <!-- Navigation centered -->
      <nav class="nav">
        <a href="index.jsp">Home</a>
        <a href="Enquiry.jsp">Enquiry</a>
        <a href="FollowUp.jsp">FollowUp</a>
        <a href="Registration.jsp">Registration</a>
      </nav>

      <!-- Profile Image + Toggle Menu (Right Side) -->
      <div style="display: flex; align-items: center;">

        <div class="menu-toggle" onclick="toggleMenu()">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>

      <!-- Toggle Menu -->
      <nav class="mobile-nav">
        <a href="index.jsp">Home</a>
        <a href="enquiry">Enquiry</a>
        <a href="followup">FollowUp</a>
        <a href="register">Registration</a>
        <a href="registrationUpdate">Update</a>
        <a href="addSlots">Slots</a>
        <a href="viewtrainer">View Trainer</a>
         <a href="AssignUserToTrainer.jsp">AssignUsers</a>
           <a href="index.jsp">Logout</a>
      </nav>
    </header>

  <div class="container form-container">
    <div class="form-box">

      <h2 class="text-center" style="color: white;padding-bottom:30px;">Update Trainer Details</h2>
      <form action="updateTrainer" method="post">
        <div class="form-group">
          <label for="trainerName">Select Trainer</label>
          <select class="form-control" name="trainerName" required>
          <option value="">Select Trainer</option>
            <option value="Yash">Yash</option>
            <option value="Sudeep">Sudeep</option>
            <option value="Druva">Druva</option>
          </select>
        </div>
        <div class="form-group">
          <label for="phoneNumber">Phone Number</label>
          <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" oninput="validData(event)" required>
        <span id="phonevalid"></span>
        </div>
        <div class="form-group">
           <label for="state">Slot Time</label>
                        <select name="trainerDropdown" class="form-control" required>
                          <option value="">Select Time Slot</option>
                            <c:forEach var="trainer" items="${slotsEntityList}">
                                <option>${trainer.startTime} - ${trainer.endTime} (${trainer.duration})</option>
                            </c:forEach>
                        </select>
        </div>
        <button type="submit" class="btn btn-submit">Update</button>
      </form>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
function toggleMenu() {
      document.querySelector('.mobile-nav').classList.toggle('show');
    }

     const validData=(event)=>{
      const {name,value}=event.target;
      var regex2 = /^[0-9]+$/;
       if(name==="phoneNumber" && value.length==10 && regex2.test(value)){
                  document.getElementById("phonevalid").innerHTML="<span></span>";
              }
              else if(name==="phoneNumber" && (value.length!=10 || !regex2.test(value))){
                  document.getElementById("phonevalid").innerHTML="<span style='color:red'}> Phone Number invalid</span>";
              }

     }

</script>

</body>
</html>
