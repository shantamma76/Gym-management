<%@ page isELIgnored="false" %>
    <%@ page contentType="text/html; charset=UTF-8" language="java" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html>

            <head>
                <title>Allot Slot</title>
                <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <!-- Font Awesome CDN for icons -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
                <style>
                    /* Add space for the fixed navbar */
                    body {
                        margin-top: 0px;
                        background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                        background-size: 1600px 1100px;
                        /*width and height */
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

                    h2 {
                    color:white;
                    background-color:;
                    }

                    h4 {
                    color:white;
                    text-align:center;
                    padding-top:5px;

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
                    <a href="updateRegi">Update</a>
                    <a href="viewRegistered">View Register Details</a>
                    <a href="trainerslots">Slots</a>
                    <a href="assignTrainer">AssignUsers</a>
                    <a href="viewTrainerAssign">View Trainer Assign</a>
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



                <div class="container mt-5">
                    <h2 class="text-center mb-4">Allot Slot</h2>

                    <!-- Search Form -->
                    <form action="searchEntity" method="GET" class="mb-4 p-3 border rounded shadow bg-light">
                       <div class="form-row align-items-center">

                         <!--   <div class="col-md-4">
                                <label for="name" class="sr-only">Name</label>
                                <input type="text" id="name" name="name" class="form-control form-control-sm"
                                    placeholder="Name" required>
                            </div> -->

                             <div class="col-md-4">
                                                          <!--  <label for="name" class="fsr-only">Name</label> -->
                                                            <select class="form-control" id="name" name="name">
                                                                <option>--Select--</option>
                                                                <c:forEach items="${registerDetails}" var="list">
                                                                    <option value="${list.name}">${list.name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>

                            <div class="col-md-4">
                                <label for="email" class="sr-only">Email</label>
                                <input type="email" id="email" name="email" class="form-control form-control-sm"
                                    placeholder="Email" required>
                            </div>

                            <div class="col-md-4">
                                <button type="submit" class="btn btn-warning btn-sm btn-block">Search</button>
                            </div>
                       </div>
                    </form>

                    <!-- Entity Details -->
                    <c:if test="${not empty entity}">
                        <input type="hidden" id="entityId" value="${entity.id}">
                        <div class="alert alert-success">
                            <p><strong>Name:</strong> ${entity.name}</p>
                        </div>
                    </c:if>

                    <c:if test="${empty entity}">
                        <div class="alert alert-warning text-center">No user found.</div>
                    </c:if>

                    <!-- Trainer Selection Form -->
                    <form action="assignSlot" method="POST" class="p-3 border rounded shadow bg-light">
                        <input type="hidden" name="entityId" value="${entity.id}">

                        <!-- Slot Timing Dropdown -->
                        <div class="form-group">
                            <label for="slotId"><strong>Select Slot Timing:</strong></label>
                            <select id="slotId" class="form-control form-control-sm" name="slotId" required>
                                <option value="">-- Select Slot --</option>
                                <c:forEach var="slot" items="${list}">
                                    <option value="${slot.id}">${slot.startTimings} - ${slot.endTimings}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Trainer Selection Dropdown -->
                        <div class="form-group">
                            <label for="trainerId"><strong>Select Trainer:</strong></label>
                            <select id="trainerId" class="form-control form-control-sm" name="trainerId" required>
                                <option value="">-- Select Trainer --</option>
                                <c:forEach var="trainer" items="${listofdto}">
                                    <option value="${trainer.id}" data-slot="${trainer.slotTimings}">
                                        ${trainer.trainerName} (${trainer.slotTimings})
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-info btn-sm btn-block">Submit</button>
                    </form>

                   <h4> ${success} </h4>
                   <h4> ${failure}</h4>
                </div>

                <!-- jQuery Script for Filtering Trainers -->
                <script>
                    $(document).ready(function () {
                        $("#slotId").change(function () {
                            var selectedSlot = $(this).find("option:selected").text().trim(); // Get selected slot text

                            $("#trainerId option").each(function () {
                                var trainerSlot = $(this).data("slot"); // Get trainer slot text

                                // Show only trainers whose slot matches the selected slot
                                if (trainerSlot === selectedSlot || $(this).val() === "") {
                                    $(this).show();
                                } else {
                                    $(this).hide();
                                }
                            });

                            // Reset trainer selection
                            $("#trainerId").val("");
                        });
                    });


                     // Handle name selection and fetch phone number
                                    document.getElementById('name').addEventListener('change', function () {
                                        const name = this.value; // Get selected name

                                        if (name && name !== '--Select--') {
                                            // Create an AJAX request to get the phone number for the selected name
                                            var xhttp = new XMLHttpRequest();
                                            xhttp.open("GET", "getEmailByName?name=" + name, true);
                                            xhttp.send();

                                            // Handle the response
                                            xhttp.onload = function () {
                                                if (xhttp.status === 200) {
                                                    const phoneNumber = xhttp.responseText; // The email returned from backend
                                                    document.getElementById('email').value = phoneNumber; // Set the Emailin the input
                                                } else {
                                                    console.error("Failed to fetch Email.");
                                                }
                                            };
                                        }
                                    });
                </script>



            </body>

            </html>