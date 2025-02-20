<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOC TYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assigned Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url("https://cdn.pixabay.com/photo/2016/07/13/16/00/box-1514845_1280.jpg") no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
          background: #0F2027;  /* fallback for old browsers */
          background: -webkit-linear-gradient(to right, #2C5364, #203A43, #0F2027);  /* Chrome 10-25, Safari 5.1-6 */
          background: linear-gradient(to right, #2C5364, #203A43, #0F2027); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            width: 400px;
            max-width: 90%;
            text-align: center;
        }

        .header {
background: #aa4b6b;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #3b8d99, #6b6b83, #aa4b6b);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #3b8d99, #6b6b83, #aa4b6b); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            color: white;
            padding: 10px;
            border-radius: 8px;
            font-size: 20px;
            font-weight: bold;
        }

        table ,h3{
background: #2980B9;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #FFFFFF, #6DD5FA, #2980B9);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #FFFFFF, #6DD5FA, #2980B9); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            border-radius: 8px;
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {



            padding: 10px;
            text-align: center;
        }

        th {

           background: #aa4b6b;  /* fallback for old browsers */
           background: -webkit-linear-gradient(to right, #3b8d99, #6b6b83, #aa4b6b);  /* Chrome 10-25, Safari 5.1-6 */
           background: linear-gradient(to right, #3b8d99, #6b6b83, #aa4b6b); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            border-radius: 8px 8px 0 0 ;

            color: white;
        }

        .back-btn {
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
            width: 50%;
        }

        .back-btn:hover {
            background-color: #45a049;
        }

        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            .header {
                font-size: 18px;
                padding: 8px;
            }

            table, th, td {
                font-size: 14px;
                padding: 8px;
            }

            .back-btn {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">Assigned Trainer To Users</div>

    <h3>Trainer: <c:out value="${trainerName}" /></h3>
    <h3>Slot: <c:out value="${slot}" /></h3>

    <table>
        <tr>
            <th>User Names</th>
        </tr>
        <c:forEach var="user" items="${assignedUsers}">
            <tr>
                <td style="color:#363636"><c:out value="${user}" /></td>
            </tr>
        </c:forEach>
    </table>

    <a href="AssignUsers"><button class="back-btn">Back</button></a>
</div>
</body>
</html>