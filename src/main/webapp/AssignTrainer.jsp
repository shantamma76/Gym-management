<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>Assign Trainer</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Add FontAwesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background: url('https://static.vecteezy.com/system/resources/thumbnails/035/987/056/small_2x/ai-generated-still-life-of-interior-modern-fitness-center-gym-with-a-workout-room-empty-space-for-text-ai-generated-photo.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            color: black;
            border-radius: 25px;
            margin-top: 100px;
            padding: 30px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            width: 600px;
            max-height: 700px;
            overflow-y: auto;
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

        .navbar {
            display: flex;
            justify-content: flex-end;
            list-style-type: none;
            padding: 10px;
            margin: 0;
            background-color: black;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
        }

        .navbar ul {
            justify-content: flex-end;
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .navbar ul li {
            justify-content: flex-end;
            margin-right: 30px;
            display: inline-block;
        }

        .navbar ul li a {
            color: pink;
            font-size: 18px;
            font-weight: 600;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .navbar ul li a:hover {
            background-color: black;
            color: gray;
        }

        .navbar ul li.active a {
            background-color: red;
            color: blue;
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp"><i class="fas fa-search"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="Enquiry.jsp"><i class="fas fa-search"></i> Enquiry</a></li>
                    <li class="nav-item"><a class="nav-link active" href="search"><i class="fas fa-users"></i> FollowUp</a></li>
                    <li class="nav-item"><a class="nav-link active" href="Registration.jsp"><i class="fas fa-user-plus"></i> Registration</a></li>
                    <li class="nav-item"><a class="nav-link active" href="update"><i class="fas fa-edit"></i> Update</a></li>
                    <li class="nav-item"><a class="nav-link active" href="trainerslots.jsp"><i class="fas fa-edit"></i> Trainer Slots</a></li>
                    <li class="nav-item"><a class="nav-link active" href="trainer"><i class="fas fa-edit"></i> Assign Trainer</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="form-container">
        <h2 class="text-center">Assign Trainer To User</h2>
        <form action="assign" method="post">
            <!-- Name Selection -->
            <div class="form-group">
                <label for="name" class="form-label"><i class="fas fa-user"></i> Name</label>
                <select class="form-control" id="name" name="name">
                    <option value="">--Select--</option>
                    <c:forEach items="${listOfNames}" var="list">
                        <option value="${list.name}">${list.name}</option>
                    </c:forEach>
                </select>
            </div>
            <br>

            <!-- Trainer Selection -->
            <div class="form-group">
                <label for="trainer" class="form-label"><i class="fas fa-gift"></i> Trainer</label>
                <select name="trainerName" class="form-control">
                    <option value="">Select Trainer</option>
                    <c:forEach var="details" items="${TrainerEntityList}">
                        <option value="${details.trainerName}">${details.trainerName}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Slot Selection -->
            <div class="form-group">
                <label for="slots" class="form-label"><i class="fas fa-clock"></i> Slot</label>
                <select name="slotTimings" class="form-control">
                    <option value="">Select Slot</option>
                    <c:forEach var="trainer" items="${TrainerEntityList}">
                        <option value="${trainer.slotTimings}">${trainer.slotTimings}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Submit Button -->
            <div>
                <button type="submit" class="btn btn-primary">Assign Trainer</button>
            </div>
        </form>
    </div>

</body>

</html>
