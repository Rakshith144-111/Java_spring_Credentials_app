<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.application.model.User" %> <%-- Import the User class from the appropriate package --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
    <title>project | home</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <script>
        // JavaScript to handle mode switching based on a backend-provided mode
        function showSection(mode) {
            // Hide all sections initially
            document.getElementById("homediv").style.display = "none";
            document.getElementById("registerdiv").style.display = "none";
            document.getElementById("allUsersDiv").style.display = "none";
            document.getElementById("logindiv").style.display = "none";
            document.getElementById("updateDiv").style.display = "none";

            // Show the section based on the mode
            if (mode === 'MODE_HOME') {
                document.getElementById("homediv").style.display = "block";
            } else if (mode === 'MODE_REGISTER') {
                document.getElementById("registerdiv").style.display = "block";
            } else if (mode === 'ALL_USERS') {
                document.getElementById("allUsersDiv").style.display = "block";
            } else if (mode === 'MODE_LOGIN') {
                document.getElementById("logindiv").style.display = "block";
            }else if (mode === 'MODE_UPDATE'){
            	document.getElementById("updateDiv").style.display = "block";
            }
        }
        
        // On page load, check if an error message exists and display it
        const error = '<%= request.getAttribute("error") %>';
        if (error) {
            const errorMessageDiv = document.getElementById("errorMessage");
            errorMessageDiv.style.display = 'block';
            errorMessageDiv.textContent = error; // Display the error message in the div
        }
   
    </script>
</head>
<body onload="showSection('<%= request.getAttribute("mode") %>')">
    <!-- Navigation -->
    <div role="navigation">
        <div class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a href="/welcome" class="navbar-brand">HOME PAGE</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="/login">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="/register">New Registration</a></li>
                    <li class="nav-item"><a class="nav-link" href="/show-users">All Users</a></li>
                   <!--  <li class="nav-item"><a class="nav-link" href="/Update">Update Users</a></li> -->
                </ul>
            </div>
        </div>
    </div>

    <!-- Home Section -->
    <div class="container" id="homediv" style="display:none;">
        <div class="jumbotron text-center">
            <h1>Welcome to The WEBSITE</h1>
            <h3>Mainly focused on Backend</h3>
        </div>
    </div>

    <!-- Registration Section -->
   <div class="container" id="registerdiv" style="display:none;">
        <h3>New Registration</h3>
        <hr>
        <form class="form-horizontal" method="POST" action="save-user">
            <input type="hidden" name="id" value="${user.id}" />
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Username</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="username" value="${user.username}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">First Name</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="firstname" value="${user.firstname}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Last Name</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="lastname" value="${user.lastname}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Age</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="age" value="${user.age}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Password</label>
                <div class="col-md-7">
                    <input type="password" class="form-control" name="password" value="${user.password}" />
                </div>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Register" />
            </div>
        </form>
    </div>
    
    <div class="container" id="updateDiv" style="display:none;">
        <h3>Update User</h3>
        <hr>
        <form class="form-horizontal" method="POST" action="save-user">
            <input type="hidden" name="id" value="${user.id}" />
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Username</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="username" value="${user.username}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">First Name</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="firstname" value="${user.firstname}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Last Name</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="lastname" value="${user.lastname}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Age</label>
                <div class="col-md-3">
                    <input type="text" class="form-control" name="age" value="${user.age}" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Password</label>
                <div class="col-md-7">
                    <input type="password" class="form-control" name="password" value="${user.password}" />
                </div>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Update" />
            </div>
        </form>
    </div>

    <!-- All Users Section -->
    <div class="container" id="allUsersDiv" style="display:none;">
        <h3>All Users</h3>
        <hr>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Username</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Age</th>
                        <th>Delete</th>
                        <th>Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<User> users = (List<User>) request.getAttribute("users");
                        if (users != null) {
                            for (User user : users) {
                    %>
                    <tr>
                        <td><%= user.getId() %></td>
                        <td><%= user.getUsername() %></td>
                        <td><%= user.getFirstname() %></td>
                        <td><%= user.getLastname() %></td>
                        <td><%= user.getAge() %></td>
                        <td><a href="/delete-user?id=<%= user.getId() %>"><span class="fas fa-trash-alt"></span></a></td>
                        <td><a href="/edit-user?id=<%= user.getId() %>"><span class="fas fa-pencil-alt"></span></a></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No users found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Login Section -->
    <div class="container" id="logindiv" style="display:none;">
        <h3>Login</h3>
        <hr>
       <%-- Display error message if it exists --%>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
            <div id="errorMessage" class="alert alert-danger">
                <%= error %>
            </div>
        <%
            }
        %>
        <form class="form-horizontal" method="POST" action="/login-user">
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Username</label>
                <div class="col-md-7">
                    <input type="text" class="form-control" name="username" />
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label">Password</label>
                <div class="col-md-7">
                    <input type="password" class="form-control" name="password" />
                </div>
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-primary" value="Login" />
            </div>
        </form>
    </div>
</body>
</html>
