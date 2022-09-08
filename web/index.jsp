<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Menu</title>
</head>

<%
    User user = (User) session.getAttribute("user");

%>
<body style="font-size: 5em;font-family: fantasy;">
<div style="margin-left: 22%">
    <img src="images/253322.jpg" width="1000" height="750">
</div>
<div style="margin-left: 4%">
    <a href="/authors">Show all authors</a>
    <a href="/books">Show all books</a>
    <a href="/authors/add">Add author</a>
    <%
        if (user != null) {
    %>
    <a href="/books/add">Add book</a>
    <a href="/logout">Logout</a>
    <%}%>

    <a href="/userReg">Register</a>
    <a href="/login">Login</a>
</div>
</body>
</html>
