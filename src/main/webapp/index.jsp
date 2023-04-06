<%@page import="com.mycompany.estore.helper.Helper"%>
<%@page import="com.mycompany.estore.entities.Category"%>
<%@page import="com.mycompany.estore.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.estore.entities.Product"%>
<%@page import="com.mycompany.estore.dao.ProductDao"%>
<%@page import="com.mycompany.estore.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    User user =(User) session.getAttribute("current-user");
    if (user == null){
        response.sendRedirect("login.jsp");
        return;
    } 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>eStore - Home</title>
        <%@include file = "components/commonCssJS.jsp" %>
    </head>
    <body>
        <%@include file = "components/navbar.jsp" %>

        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%                    
                    String C = request.getParameter("Category");
                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (C == null || C.trim().equals("allProducts")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(C);
                        list = dao.getProductsByCategoryId(cid);
                    }
                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();


                %>

                <!--show Categories-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?Category=allProducts" class="list-group-item list-group-item-action active">
                            All Products
                        </a>

                        <% for (Category cat : clist) {
                        %>

                        <a href="index.jsp?Category=<%=cat.getCategoryId()%>" class="list-group-item list-group-item-action"><%=cat.getCategoryTitle()%></a>

                        <%
                            }
                        %>
                    </div>    
                </div>

                <!--show Products-->
                <div class="col-md-10">

                    <div class="row mt-4">
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%
                                    for (Product p : list) {
                                %>
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img src="images/products/<%= p.getpPhoto()%>" style ="max-height:200px; max-width: 100%; width: auto; " class="card-img-top" alt="Product's photo">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getpName()%></h5>
                                        <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>

                                    </div>
                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" onclick="addToCart(<%=p.getpId()%>, '<%=p.getpName()%>', <%=p.getpPrice()%>)">Add to Cart</button>
                                        <button class="btn btn-outline-success"><%= p.getPriceAfterDiscount()%>DH - <span class="text-secondary discount-label" style="font-size: 12px!important;font-style: italic!important;"><%= p.getpPrice()%>DH , <%= p.getpDiscount()%>% off</span></button>
                                    </div>
                                </div>
                                <%
                                    }
                                    if (list.size() == 0) {
                                        out.println("No items found in this category!");
                                    }
                                %>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>
        <%@include file="components/common_modals.jsp" %> 
    </body>
</html>
