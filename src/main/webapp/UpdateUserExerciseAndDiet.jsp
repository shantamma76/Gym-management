<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>UpdateUserExerciseAndDiet</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                crossorigin="anonymous">
            <style>
                body {
                    min-height: 100vh;
                    margin: 0;
                    background: url('https://static.vecteezy.com/system/resources/thumbnails/035/987/056/small_2x/ai-generated-still-life-of-interior-modern-fitness-center-gym-with-a-workout-room-empty-space-for-text-ai-generated-photo.jpg') no-repeat center center fixed;
                    background-size: cover;
                    background-position: center;
                    background-repeat: no-repeat;
                    background-attachment: fixed;
                    color: #000;

                    overflow: hidden;

                }

                .table-container {
                    margin-top: 0;
                    background-color: #fff;
                    padding: 20px;
                    padding-top: 0px;
                    border-radius: 10px;
                    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
                    max-height: calc(100vh - 170px);
                    overflow-y: auto;
                }

                .table-name {
                    position: sticky;
                    top: 0;
                    background-color: #f8f9fa;
                    padding: 10px;
                    z-index: 2;
                    text-align: center;
                    font-size: 1.25rem;
                    font-weight: bold;
                    border-bottom: 1px solid #dee2e6;
                }

                table thead tr {
                    position: sticky;
                    top: 40px;
                    background-color: #f8f9fa;
                    z-index: 1;

                }

                table th {
                    background-color: #f8f9fa;
                }

                .container {
                    margin-top: 40px;
                    margin-bottom: 50px;
                    width: 100%;

                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
                    transition: background-color 0.3s ease;
                    margin-bottom: 10px;
                }

                .search-message {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    margin-top: 20px;
                    text-align: center;
                }


                .search-row {
                    display: flex;
                    justify-content: right;
                    align-items: center;
                    margin-bottom: 20px;
                }

                .form-control {
                    padding: 10px;
                    font-size: 16px;
                }

                .pagination {
                    display: flex;
                    justify-content: center;
                    margin-top: 20px;
                }

                .page-link {
                    color: #007bff;
                    text-decoration: none;
                    margin: 0 5px;
                    padding: 8px 12px;
                    border: 1px solid #007bff;
                    border-radius: 5px;
                }

                .page-link:hover {
                    background-color: #007bff;
                    color: #fff;
                }

                .page-link.active {
                    background-color: #007bff;
                    color: #fff;
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

                    .table-container {
                        padding-bottom: 30%;
                    }

                    .table-name {
                        position: sticky;
                        top: 0;
                        background-color: #f8f9fa;
                        padding: 10px;
                        width: 180%;
                        z-index: 7;
                        text-align: center;
                        font-size: 1.25rem;
                        font-weight: bold;
                        border-bottom: 1px solid #dee2e6;
                    }
                }

                .update {
                    font-size: 30px;

                }

                #nameValid {
                    margin-top: 10px;
                    color: green;
                }

                .header .profile-img {
                    max-height: 40px;
                    width: 40px;
                    border-radius: 50%;

                }
            </style>

        </head>

        <body>
            <!-- Centered Message -->
            <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
                <h5 style="color: red;">${failure}</h5>
                <p class="update" style="colr:red">${notupdated}</p>
                <p class="update" style="color:green">${enquiryName}</p>

            </div>

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
                    <a href="search">FollowUp</a>
                    <a href="register">Registration</a>
                </nav>

                <!-- Profile Image + Toggle Menu (Right Side) -->
                <div style="display: flex; align-items: center;">
                    <!--   <img src="photo/${listimg.image}" alt="Profile Picture" class="profile-img"> -->
                    <div class="menu-toggle" onclick="toggleMenu()">
                        <div></div>
                        <div></div>
                        <div></div>
                    </div>
                </div>

                <!-- Toggle Menu -->
                <nav class="mobile-nav">
                    <a href="Success.jsp">Home</a>
                    <a href="Enquiry.jsp">Enquiry</a>
                    <a href="followup">FollowUp</a>
                    <a href="register">Registration</a>
                    <a href="updateRegi">Update</a>
                    <a href="trainerslots">Add Slots & Trainer</a>
                    <!-- <a href="viewtrainer">View Trainer</a> -->
                    <a href="assignSlot">AssignUsers</a>
                    <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>
                    <a href="index.jsp">Logout</a>
                </nav>
            </header>


            <div class="container">
                <!-- Search Row -->
                <div class="search-row"
                    style="display: flex; flex-direction: column; gap: 10px; align-items: flex-end;">

                    <form action="searchUser" style="display: flex; gap: 10px; align-items: center;">

                        <input type="text" class="form-control" id="searchName" name="searchName"
                            placeholder="Search name" oninput="onField()" required>
                        <input type="text" class="form-control" id="searchPhone" name="searchPhone"
                            placeholder="Search phone number" oninput="onField()" required>

                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>

                    <!-- Div to display validation or result message below the form -->
                    <div id="nameValid" style="margin-top: 0px; color: red; margin-right:170px"></div>
                </div>

                <!-- This div is for the messages -->
                <div class="search-message">
                    <h4 style="color: red;">${listEmpty}</h4>
                    <h4 style="color: red;">${notFound}</h4>
                </div>


                <!-- Table Container -->
                <c:if test="${not empty list}">
                    <div class="table-container">
                        <h5 style="color:green; text-align:center;padding:10px">${success}</h5>
                        <h4 class="table-name">Registred User Details</h4>

                        <form action="updateDiet">
                            <table class="table table-striped table-bordered table-hover">
                                <colgroup>
                                    <col style="width: 18%;">
                                    <col style="width: 15%;">
                                    <col style="width: 10%;">
                                    <col style="width: 20%;">
                                    <col style="width: 10%;">
                                </colgroup>

                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th>update</th>
                                        <th>View</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach items="${list}" var="enquiry">
                                        <tr>
                                            <form action="updateDiet"> <!-- Form for each row -->
                                                <!-- Hidden input to store the enquiry id -->
                                                <input type="hidden" name="id" value="${enquiry.id}" />

                                                <td>${enquiry.name}</td>
                                                <td>${enquiry.email}</td>
                                                <td>${enquiry.phone}</td>

                                                <td>
                                                    <button type="submit" class="btn btn-success"
                                                        style="margin-left:20px;">Update Diet</button>
                                                    <!-- Update button for each row -->
                                                </td>

                                                <td>
                                                    <a href="viewUserExercise?id=${enquiry.id}"
                                                        class="btn btn-success">View</a>
                                                </td>

                                            </form>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                    </div>

                    <!-- Pagination Links -->
                    <c:if test="${totalPages > 1}">
                        <div class="pagination">
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <!-- <a href="followupoperation?page=${i}" class="page-link ${currentPage == i ? 'active' : ''}">${i}</a> -->
                            </c:forEach>
                        </div>
                    </c:if>
            </div>
            </c:if>
            </div>

            <script>
                function toggleMenu() {
                    document.querySelector('.mobile-nav').classList.toggle('show');
                }

                const onField = () => {
                    var searchName = document.getElementById("searchName").value;
                    var searchPhone = document.getElementById("searchPhone").value;
                    var nameValidDiv = document.getElementById("nameValid");


                    var namePattern = /^[A-Za-z\s]+$/;
                    var phonePattern = /^[0-9]*$/;


                    if (searchName !== "" && !namePattern.test(searchName)) {
                        nameValidDiv.innerHTML = "Please enter only alphabets for the name.";
                        return;
                    }

                    if (searchPhone !== "" && !phonePattern.test(searchPhone)) {
                        nameValidDiv.innerHTML = "Please enter only numbers for the phone number.";
                        return;
                    }

                    nameValidDiv.innerHTML = "";

                    if (searchName !== "" && searchPhone !== "") {
                        var xhttp = new XMLHttpRequest();
                        var url = "http://localhost:8080/Shanta_Gym/search?searchName=" + encodeURIComponent(searchName) + "&searchPhone=" + encodeURIComponent(searchPhone);
                        xhttp.open("GET", url, true);
                        xhttp.send();

                        xhttp.onload = function () {
                            nameValidDiv.innerHTML = this.responseText;
                        };
                    }
                };

            </script>
        </body>

        </html>