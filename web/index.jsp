<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
</head>

<%
    User user = (User) session.getAttribute("user");

%>
<body style="font-size: 4em;font-family: fantasy;margin-left: 4%">
<div style="margin-left: 19%">
    <img src="images/253322.jpg" width="1000" height="750">
</div>
<div style="margin-left: 16%">
    <a href="/authors">Show all authors</a>
    <a href="/books">Show all books</a>
    <a href="/authors/add">Add author</a>
    <%
        if (user != null) {
    %>
    <a href="/books/add">Add book</a>
    <a href="/logout">Logout</a>
    <%} else {%>
    <div style="margin-left: 25%">
        <a href="/login">Login</a>
        <a href="/userReg">Register</a>
        <%}%>
    </div>

</div>
</body>
</html>
