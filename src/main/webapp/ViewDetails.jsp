<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Enquiry Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000;
            color: #fff;
        }
        h2 {
            text-align: center;
            color: #fff;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #fff;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #333;
            color: #fff;
            font-weight: bold;
        }
 td {
            background-color: #000;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #222;
        }
    </style>
</head>
<body>

    <h2>View Details</h2>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Area</th>
                <th>Phone Number</th>
                <th>Reasons</th>
            </tr>
        </thead>
        <tbody>

            <c:forEach var="item" items="${enquiryList}">
                <tr>
                                          <td>${item.name}</td>
                                           <td>${item.area}</td>
                                           <td>${item.phone}</td>
                                           <td>${item.reasons}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

