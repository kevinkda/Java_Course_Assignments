<%--
  ~ Copyright (c) 2020 Kevin KDA. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: kevinkda
  Date: 2020/2/24
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.kevin.job20200225.dao.CartDao" %>
<%@ page import="com.kevin.job20200225.entity.CartItems" %>
<%@ page import="java.util.ArrayList" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%
    //Object obj=request.getAttribute("list");
//List<News> list=(List<News>)obj;
    String account;
    account = session.getAttribute("account").toString();
    String sessionId = session.getId();
//    ArrayList<CartItems> list = (ArrayList<CartItems>) request.getAttribute("list");
    ArrayList<CartItems> cartItems = CartDao.getCartItemsByUserAcc(account);
//    request.setAttribute("cart",list);
    request.setAttribute("carts", cartItems);
//转发的数据的作用域范围只在我的转发的页面
%>
<%
    int count = 0;
%>
<head>
    <title>job20200225</title>
    <%--    <link rel="stylesheet" href="../../css/index.css">--%>
    <style>
        .container {
            width: 1400px;
        }

        .core-wapper {
            width: 1350px;
        }

        .table-wapper {
            width: 1300px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="top-wapper">
        <h1 id="top-word">job20200225</h1>
    </div>

    <div class="core-wapper">

        <p>
        <h1>SUCCESS 欢迎你:<%=account%>
        </h1></p>
        <p><%=sessionId%>
        </p>

        <div class="table-wapper">
            <form action="${pageContext.request.contextPath}/DeleteCartItem0225Servlet" method="post">
                <table>
                    <thead>
                    <th>SN</th>
                    <%--                <th>Check</th>--%>
                    <th>Good Name</th>
                    <th>Good Model</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <%--                <th>Total</th>--%>
                    <th>Modify</th>
                    </thead>
                    <c:forEach items="${carts}" var="item">
                        <tr>
                            <%request.setAttribute("count", ++count);%>
                                <%--                        项目计数--%>
                            <td><c:out value="${count}"></c:out></td>
                                <%--                        勾选框--%>
                                <%--                        <td><input type="checkbox" name="cartItemCheck"></td>--%>
                                <%--                        商品名--%>
                            <td><c:out value="${item.strGoodsName}"></c:out></td>
                                <%--                        商品型号--%>
                            <td><c:out value="${item.strGoodsModel}"></c:out></td>
                                <%--                        商品单价--%>
                            <td><c:out value="${item.douGoodsPrice}"></c:out></td>
                                <%--                        商品数量--%>
                            <td><c:out value="${item.intItemQuantity}"></c:out></td>
                                <%--                        单个商品总价--%>
                                <%--                        <td><c:out value="${(count)}"></c:out></td>--%>
                                <%--                        删除选项调用删除Servlet?商品名--%>
                            <td>
                                    <%--                                                                    <input type="hidden"name="intSn" value="${item.id}">--%>
                                    <%--                                                                    <input type="submit" value="Delete">--%>
                                <%
//                                    String s = String.valueOf(cartItems.get(count - 1).getId());
//                                    int s=cartItems.get(count-1).getId();
//                                    request.setAttribute("ssssid", s);
                                %>
<%--                                <a href="${pageContext.request.contextPath}/DeleteCartItem0225Servlet?intSn=<%=cartItems.get(count).getId()%>>">Delete</a>--%>
<%--                                        <a href="${pageContext.request.contextPath}/DeleteCartItem0225Servlet?intSn=${ssssid}">Delete</a>--%>
                                    <%--                                <a href="${pageContext.request.contextPath}/DeleteCartItem0225Servlet?intSn=${item.strid}">Delect</a>--%>
                                                                <a href="${pageContext.request.contextPath}/DeleteCartItem0225Servlet?account=<%=account%>&deleteItem=<c:out value="${item.strGoodsName}"></c:out>">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>

    <div class="bottom-wapper">
        <hr>
        <p class="complete">Modification Date: February 22, 2020</p>
    </div>
</div>
</body>
<script src="../../js/Copyright.js"></script>
<link rel="stylesheet" href="../../css/index.css">
</html>