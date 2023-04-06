
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - EnsemStore</title>
        <%@include file = "components/commonCssJS.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        <div class="container">
            
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <%@include file = "components/message.jsp"%>
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            
                            <div class="text-center">
                                <img src="images/login.png" class="img-fluid" alt="" />
                            </div>
                            <h3 class="text-center">Login here</h3>

                        </div>
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="exampleInputEmail1">Email address</label>
                                  <input name ="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                  <label for="exampleInputPassword1">Password</label>
                                  <input name="password" type="password" class="form-control" id="exampleInputPassword1">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-2">Don't have an account? Register here</a>
                                
                                <div class="container text-center ">
                                    <button type="submit" class="btn btn-primary custom-bg">Submit</button>
                                </div>
         
                            </form>

                        </div>
     
                        
                    </div>
                    
                    
                </div>
            </div>
        </div>


    </body>
</html>
