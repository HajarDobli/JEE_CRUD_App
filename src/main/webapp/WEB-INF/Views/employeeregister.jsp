<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">

    <style>
        body {
            background-color: #f4f4f4;
        }

        .registration-container {
            margin-top: 2%;
        }

        .container  {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .success-message {
            color: green;
            margin-top: 10px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .btn-submit {
            background-color: #22223b;
            color: #fff;
            border: 1px solid #22223b;
        }

        .btn-submit:hover {
            background-color: #4a4e69;
        }

        .login-link {
            color: #007bff;
        }

        .login-link:hover {
            text-decoration: underline;
        }
    </style>

    <title>Registration Page</title>
</head>

<body>

    <div class="container registration-container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <h1 class="text-center mb-4">Please register here</h1>

                <%-- Display success message if it exists --%>
                <% String successMessage = (String) request.getAttribute("successMessage"); %>
                <% if (successMessage != null && !successMessage.isEmpty()) { %>
                <p class="success-message"><%= successMessage %></p>
                <% } %>

                <form action="<%=request.getContextPath()%>/register" method="post" class="registration-form">
                    <div class="form-group">
                        <label for="firstName">First Name</label>
                        <input type="text" name="firstName" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name</label>
                        <input type="text" name="lastName" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" name="username" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" name="address" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="contact">Contact No</label>
                        <input type="text" name="contact" class="form-control" required />
                    </div>
                    <button type="submit" class="btn btn-primary btn-submit btn-block">Register</button>
                </form>

                <p class="mt-3 text-center">Already registered? <a class="login-link"
                        href="<%= request.getContextPath() %>/login">Login here</a></p>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>
