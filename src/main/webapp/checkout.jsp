
<%
    User user =(User) session.getAttribute("current-user");
    if (user == null){
        session.setAttribute("message","You haven't logged in. Please Login first!");
        response.sendRedirect("login.jsp");
        return;
    } 
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file = "components/commonCssJS.jsp" %>
    </head> 
    <body>
        <%@include file = "components/navbar.jsp" %>
        <div class="container">
            <div class="row mt-5">
                
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3">Selected Items </h3>
                            <div class="cart-body">

                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-3">Order Details </h3>
                       
                            <form action="#!" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%=user.getUserEmail()%>" name ="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="<%=user.getUserName()%>" name="name" type="text" class="form-control" id="name" placeholder="Enter your name">
                                </div>
                                
                                <div class="form-group">
                                    <label for="phone">Phone Number</label>
                                    <input value="<%=user.getUserPhone()%>" name="phone" type="text" class="form-control" id="phone" placeholder="Enter your phone number">
                                </div>
                                
                                <div class="form-group">
                                    <label for="address">Shipping Address</label>
                                    <textarea value="<%=user.getUserAddress()%>" id="address" name="user_address" style ="resize:none; height: 100px;" class ="form-control" placeholder="Enter your address"></textarea>
                                </div>

                                <div class="container text-center ">
                                    
                                    <div id="paypal-button-container"></div>
                                </div>
                              

                            </form>
                            
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        
        
        <%@include file="components/common_modals.jsp" %>
<!--         Add the PayPal JavaScript SDK -->
        <script src="https://www.paypal.com/sdk/js?client-id=AToI4oGdAqQpjJfYJzG45zW9Iu5i1zZ_PwlaFMLYjweqK2EnR57KFXmk9duW0VDQQyzUhUI9daOcImYC"></script>

<!--         Add the PayPal Checkout button -->
        
        <script>
            let cartString = localStorage.getItem("cart");
            let cart = JSON.parse(cartString);

            let totalPrice = 0; 
            cart.map(item => {
                totalPrice+= item.productPrice * item.productQuantity;
            })
            console.log(totalPrice)
          paypal.Buttons({
            createOrder: function(data, actions) {
              // Define the transaction details
              return actions.order.create({
                purchase_units: [{
                  amount: {
                    value: totalPrice/10
                 
                  }
                }]
              });
            },
            onApprove: function(data, actions) {
              // Capture the payment
              return actions.order.capture().then(function(details) {
                // Show a success message to the buyer
                alert('Transaction completed by ' + details.payer.name.given_name + '!');
              });
            }
          }).render('#paypal-button-container');
        </script>

    </body>
</html>
