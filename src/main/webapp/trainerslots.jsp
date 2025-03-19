<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Trainer & Slot Management</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <style>
                body {
                             background-image: url('https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?cs=srgb&dl=action-athlete-barbell-841130.jpg&fm=jpg');
                             background-size: 1600px 1200px;
                             /*width and height */
                             background-repeat: no-repeat;
                             background-position: center;
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



                .container {
                    margin-top: 90px;
                }

                .card {
                    border: none;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                }

                .card-header {
                    background-color: purple;
                    color: #fff;
                    font-weight: bold;
                }

                .btn-primary:hover {
                    background-color: #0056b3;
                }

                .btn-success:hover {
                    background-color: #218838;
                }

                .table th,
                .table td {
                    vertical-align: middle;
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
                <a href="trainerslots">Add Slots & Trainer</a>
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

            <!-- Main Content -->
            <div class="container">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5>Trainer List</h5>
                        <div>
                            <button class="btn btn-warning me-2" data-bs-toggle="modal"
                                data-bs-target="#addSlotsModal">Add Slots</button>
                            <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#addTrainerModal">Add
                                Trainer</button>
                        </div>
                    </div>

                    <div class="card-body">
                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success">${successMessage}</div>
                        </c:if>
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">${errorMessage}</div>
                        </c:if>

                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>TrainerName</th>
                                    <th>Phone Number</th>
                                    <th>Slot Timings</th>
                                    <th>Actions</th> <!-- Added missing column header -->
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="trainer" items="${trainerInfoList}">
                                    <tr>
                                        <td>${trainer.trainerName}</td>
                                        <td>${trainer.phoneNumber}</td>
                                        <td>${trainer.slotTimings}</td>
                                        <td>
                                            <a href="delete?id=${trainer.id}" class="btn btn-sm btn-danger"
                                                onclick="deleteTrainer('${trainer.id}')">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Add Trainer Modal -->
                <div class="modal fade" id="addTrainerModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Trainer</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>

                            <div class="modal-body">
                                <form id="addTrainerForm" action="trainerAddact" method="post">
                                    <div class="mb-2">
                                        <label for="trainerName" class="form-label">Trainer Name:</label>
                                        <input type="text" id="trainerName" class="form-control" name="trainerName"
                                            placeholder="Trainer Name" required>
                                    </div>

                                    <div class="mb-2">
                                        <label for="phoneNumber" class="form-label">Phone Number:</label>
                                        <input type="text" id="phoneNumber" class="form-control" name="phoneNumber"
                                            placeholder="Phone Number" required>
                                    </div>

                                    <div class="mb-2">
                                        <label for="slotTimings" class="form-label">Select Slot Timing:</label>
                                        <select id="slotTimings" class="form-control" name="slotTimings" required>
                                            <option value="">-- Select Slot --</option>
                                            <c:forEach var="slot" items="${slots}">
                                                <option value="${slot.startTimings} - ${slot.endTimings}">
                                                    ${slot.startTimings} - ${slot.endTimings}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Add Slot Modal -->
                <div class="modal fade" id="addSlotsModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Slot</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <form id="addSlotsForm" action="AddSlotact" method="get">
                                    <div class="mb-2">
                                        <label for="startTimings" class="form-label">Start Time:</label>
                                        <input type="time" id="startTimings" class="form-control" name="startTimings"
                                            required oninput="calculateDuration()">
                                    </div>

                                    <div class="mb-2">
                                        <label for="endTimings" class="form-label">End Time:</label>
                                        <input type="time" id="endTimings" class="form-control" name="endTimings"
                                            required oninput="calculateDuration()">
                                    </div>

                                    <div class="mb-2">
                                        <label for="duration" class="form-label">Duration:</label>
                                        <input type="text" id="duration" class="form-control" name="duration" readonly
                                            placeholder="Auto-calculated">
                                    </div>

                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success">Save Slot</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Scripts -->
            <script>
                function deleteTrainer(id) {
                    if (confirm("Are you sure?")) {
                        window.location.href = "DeleteTrainerServlet?id=" + id;
                    }
                }

                function calculateDuration() {
                    let start = document.getElementById("startTimings").value;
                    let end = document.getElementById("endTimings").value;

                    if (start && end) {
                        let startTime = new Date("1970-01-01T" + start);
                        let endTime = new Date("1970-01-01T" + end);

                        let diff = (endTime - startTime) / (1000 * 60);

                        if (diff > 0) {
                            let hours = Math.floor(diff / 60);
                            let minutes = diff % 60;
                            document.getElementById("duration").value = hours + " hr " + minutes + " min";
                        } else {
                            document.getElementById("duration").value = "Invalid Time";
                        }
                    }
                }
            </script>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>