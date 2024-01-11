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
            background-color: #22223b; /* Change this color as needed */
            display:flex;
            justify-content:space-between;
        }

        .navbar-dark .navbar-brand {
            color: #ecf0f1; /* Change this color as needed */
        }

        .navbar-dark .navbar-nav .nav-link {
            color: #ecf0f1; /* Change this color as needed */
        }

        .navbar-dark .navbar-toggler-icon {
            background-color: #ecf0f1; /* Change this color as needed */
        }

        .btn-success {
            background-color: #2d6a4f; /* Change this color as needed */
            border-color: #2d6a4f; /* Change this color as needed */
        }
        .btn-success {
        width: 200px; /* Set the desired width */
        display: block;
        margin: 0 auto; /* Center the button horizontally */
        margin-top: 15px;
    </style>
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark fixed-top" >
            <div>
                <a href="#" class="navbar-brand"> JobEase </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Our Employees</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${our_employees != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${our_employees == null}">
                    <form action="insert" method="post">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${our_employees != null}">
                            Edit Employee
                        </c:if>
                        <c:if test="${our_employees == null}">
                            Add New Employee
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${our_employees != null}">
                    <input type="hidden" name="employeeId" value="<c:out value='${our_employees.employeeId}' />" />
                </c:if>

                <fieldset class="form-group">
                    <label>First Name</label> <input type="text" value="<c:out value='${our_employees.firstName}' />"
                        class="form-control" name="firstName" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Last Name</label> <input type="text" value="<c:out value='${our_employees.lastName}' />"
                        class="form-control" name="lastName" required="required">
                </fieldset>
				<fieldset class="form-group">
				    <label>Date of Birth</label>
				    <input type="date" class="form-control" name="dateOfBirth"
				        value="<c:if test='${our_employees != null}'><c:out value='${our_employees.dateOfBirth}' /></c:if>"
				        required="required">
				</fieldset>						

				<fieldset class="form-group">
				    <label>Gender</label> <input type="text" value="<c:out value='${our_employees.gender}' />"
				        class="form-control" name="gender">
				</fieldset>
				
				<fieldset class="form-group">
				    <label>Address</label> <input type="text" value="<c:out value='${our_employees.address}' />"
				        class="form-control" name="address">
				</fieldset>
				
				<fieldset class="form-group">
				    <label>Contact Number</label> <input type="text" value="<c:out value='${our_employees.contactNumber}' />"
				        class="form-control" name="contactNumber">
				</fieldset>
				
				<fieldset class="form-group">
				    <label>Email</label> <input type="text" value="<c:out value='${our_employees.email}' />"
				        class="form-control" name="email">
				</fieldset>
				
				<fieldset class="form-group">
				    <label>Job Title</label> <input type="text" value="<c:out value='${our_employees.jobTitle}' />"
				        class="form-control" name="jobTitle">
				</fieldset>
				
				<fieldset class="form-group">
				    <label>Department</label> <input type="text" value="<c:out value='${our_employees.department}' />"
				        class="form-control" name="department">
				</fieldset>
				
				<fieldset class="form-group">
				    <label>Date of Joining</label>
				    <input type="date" class="form-control" name="dateOfJoining"
				        value="<c:if test='${our_employees != null}'><c:out value='${our_employees.dateOfJoining}' /></c:if>"
				        required="required">
				</fieldset>
				
				<fieldset class="form-group">
				    <label>Salary</label> <input type="text" value="<c:out value='${our_employees.salary}' />"
				        class="form-control" name="salary">
				</fieldset>
				

				
				<fieldset class="form-group">
				    <label>Status</label> <input type="text" value="<c:out value='${our_employees.status}' />"
				        class="form-control" name="status">
				</fieldset>

                <button type="submit" class="btn btn-success">Save</button>
             </form>
            </div>
        </div>
    </div>
</body>

</html>
