<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
    <title>Our Employees Management Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            padding-top: 56px;
        }

        .navbar {
            background-color: #22223b; 
            display:flex;
            justify-content:space-between;
        }

        .navbar-dark .navbar-brand {
            color: #ecf0f1;
        }

        .navbar-dark .navbar-nav .nav-link {
            color: #ecf0f1;
        }

        .navbar-dark .navbar-toggler-icon {
            background-color: #ecf0f1;
        }

        .btn-success {
            background-color: #2d6a4f; 
            border-color: #2d6a4f;
        }
    </style>
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top">
            <div>
                <a href="#" class="navbar-brand"> JobEase </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Our Employees</a></li>
            </ul>
        </nav>
    </header>

    <div class="container">
        <h3 class="text-center">List of Employees</h3>
        <hr>
        <div class="container text-left">
            <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New Employee</a>
        </div>
        <br>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Date of Birth</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Contact Number</th>
                        <th>Email</th>
                        <th>Job Title</th>
                        <th>Department</th>
                        <th>Date of Joining</th>
                        <th>Salary</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="employee" items="${listEmployees}">
                        <tr>
                            <td><c:out value="${employee.employeeId}" /></td>
                            <td><c:out value="${employee.firstName}" /></td>
                            <td><c:out value="${employee.lastName}" /></td>
                            <td><c:out value="${employee.dateOfBirth}" /></td>
                            <td><c:out value="${employee.gender}" /></td>
                            <td><c:out value="${employee.address}" /></td>
                            <td><c:out value="${employee.contactNumber}" /></td>
                            <td><c:out value="${employee.email}" /></td>
                            <td><c:out value="${employee.jobTitle}" /></td>
                            <td><c:out value="${employee.department}" /></td>
                            <td><c:out value="${employee.dateOfJoining}" /></td>
                            <td><c:out value="${employee.salary}" /></td>
                            <td><c:out value="${employee.status}" /></td>
                            <td>
                                <a href="edit?id=<c:out value='${employee.employeeId}' />">Edit</a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="delete?id=<c:out value='${employee.employeeId}' />">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</body>

</html>
