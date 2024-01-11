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
     

        .login-container {
            margin-top: 5%;
        }

        .login-form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }
        
        .btn  {
            background-color: #22223b;
            color: #fff;
            border: 1px solid #22223b;
        }

        .btn:hover {
            background-color: #4a4e69;
        }
        
    </style>

    <title>Login page</title>
</head>

<body style=" background-color: #f4f4f4;">

    <div class="container login-container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <h1 class="text-center">Login :</h1>

                <%-- Display error message if it exists --%>
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                <p class="error-message"><%= errorMessage %></p>
                <% } %>

                <form action="<%=request.getContextPath()%>/login" method="post" class="login-form">
                    <div class="form-group">
                        <label for="username">UserName</label>
                        <input type="text" name="username" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" required />
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                </form>

                <p class="mt-3 text-center">Don't have an account? <a
                        href="<%= request.getContextPath() %>/register">Registration here</a></p>
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
