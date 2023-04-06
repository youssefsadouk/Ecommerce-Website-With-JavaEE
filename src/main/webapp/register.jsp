<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <%@include file = "components/commonCssJS.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class ="col-md-4 offset-md-4">
                    <div class="card">
                        <%@include file = "components/message.jsp" %>
                        <div class="card-body ">
                            <div class="text-center">
                                <img src="images/register.png" class="img-fluid" alt="" />
                            </div>
                            <h3 class="text-center"> Sign Up Here !</h3>
                            <form action ="RegisterServlet" method="post">
                                <div class="form-group">
                                  <label for="name">Full Name</label>
                                  <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter your name" aria-describedby="emailHelp">

                                </div>
                                <div class="form-group">
                                  <label for="email">Email Address</label>
                                  <input name="user_email" type="email" class="form-control" placeholder="Enter your email" id="email">
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input name="user_password" type="password" class="form-control" placeholder="Enter your password" id="password">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input name="user_phone" type="number" class="form-control" placeholder="Enter your phone" id="phone">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Address</label>
                                    <textarea name="user_address" style ="resize:none; height: 100px;" class ="form-control" placeholder="Enter your address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>

                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </body>
</html>
