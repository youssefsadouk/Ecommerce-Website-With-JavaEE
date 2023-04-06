<%@page import="java.util.Map"%>
<%@page import="com.mycompany.estore.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.estore.entities.Category"%>
<%@page import="com.mycompany.estore.dao.CategoryDao"%>
<%@page import="com.mycompany.estore.helper.FactoryProvider"%>
<%@page import="com.mycompany.estore.entities.User"%>
<%
    User user =(User) session.getAttribute("current-user");
    if (user == null){
        session.setAttribute("message","You haven't logged in. Please Login first!");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")){
            session.setAttribute("message","You don't have admin privileges!");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>

<%
    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    
//getting the count of users and products
Map<String, Long> map = Helper.getCounts(FactoryProvider.getFactory());
%>
                    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file = "components/commonCssJS.jsp"%>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>
        <div class='container admin'>
            <div class="container-fluid">
                <%@include file = "components/message.jsp" %>
            </div>
            <div class='row mt-3'>
                <div class='col md-4'>
                    <div class='card'>
                        <div class='card-body text-center'>
                            <div class='container'>
                                <img class='img-fluid' style="max-width:100px;" src="images/users.png" alt="alt"/>
                            </div>
                            <h1><%= map.get("userCount"  )%></h1>
                            <h1 class='text-muted'>Users</h1>
                        </div>
                    </div>
                </div>
                <div class='col md-4'>
                    <div class='card'>
                        <div class='card-body text-center'>
                            <div class='container'>
                                <img class='img-fluid' style="max-width:100px;" src="images/categories.png" alt="alt"/>
                            </div>
                            <h1><%= list.size()%></h1>
                            <h1 class='text-muted'>Categories</h1>
                        </div>
                    </div>
                </div>
                <div class='col md-4'>
                    <div class='card'>
                        <div class='card-body text-center'>
                            <div class='container'>
                                <img class='img-fluid' style="max-width:100px;" src="images/products.png" alt="alt"/>
                            </div>
                            <h1><%= map.get("productCount")%></h1>
                            <h1 class='text-muted '>Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class='row mt-3'>
                <div class='col md-6'>
                    <div class='card' data-toggle="modal" data-target="#add-category-modal">
                        <div class='card-body text-center'>
                            <div class='container'>
                                <img class='img-fluid' style="max-width:100px;" src="images/addCategory.png" alt="alt"/>
                            </div>
                            
                            <h1 class='text-muted'>Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class='col md-6'>
                    <div class='card' data-toggle="modal" data-target="#add-product-modal">
                        <div class='card-body text-center'>
                            <div class='container'>
                                <img class='img-fluid' style="max-width:100px;" src="images/addProduct.png" alt="alt"/>
                            </div>
                            
                            <h1 class='text-muted'>Add Product</h1>
                        </div>
                    </div>
                </div>
                
            </div>
                            
                           
        </div>
        
        <!-- AddCategoryModal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Category Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  
                  <form action="ProductOperationServlet" method="post">
                    <input type="hidden" name ="operation"  value="addCategory">
                    <div class="form-group">
                      <input name ="catTitle" type="text" class="form-control" placeholder="Enter category title" required>
                    </div>
                    <div class="form-group">
                      <textarea name="catDescription" style ="resize:none; height: 200px;" class ="form-control" placeholder="Enter category Description"></textarea>
                    </div>
                    <div class="container text-center">
                        <button class="btn btn-outline-success ">Add Category</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
              </div>
              
            </div>
          </div>
        </div>
        
        <!-- AddProductModal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header custom-bg text-white">
                <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  
                  <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name ="operation"  value="addProduct">
                    <div class="form-group">
                        <input name ="pName" type="text" class="form-control" placeholder="Enter product title" required>
                    </div>
                    <div class="form-group">
                      <textarea name="pDesc" style ="resize:none; height: 150px;" class ="form-control" placeholder="Enter product Description"></textarea>
                    </div>
                    <div class="form-group">
                        <input name ="pPrice" type="number" class="form-control" placeholder="Enter product price" required>
                    </div>
                    <div class="form-group">
                        <input name ="pDiscount" type="number" class="form-control" placeholder="Enter product discount" required>
                    </div>
                    <div class="form-group">
                        <input name ="pQuantity" type="number" class="form-control" placeholder="Enter product quantity" required>
                    </div>
                    
                    
                    <div class="form-group">
                        <label for="catId">Select category of the product</label>
                        <select name = "catId" class="form-control">
                            <%
                                for(Category cat:list){
                            %>
                            <option value="<%= cat.getCategoryId()%>"> <%= cat.getCategoryTitle()%></option>
                            <%}
                            %>
                        </select>
                     
                    </div>
                    
                    <!--product picture file-->
                    <div class="form-group">
                        <label for="pPic">Select picture of the product</label>
                        <input name ="pPic" type="file" class="form-control" required>
                    </div>
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success ">Add Product</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </form>
              </div>
              
            </div>
          </div>
        </div>
        <%@include file="components/common_modals.jsp" %>
    </body> 
</html>
