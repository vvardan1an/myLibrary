<%@ page import="model.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Author</title>
</head>
<body>

<%
    Author author = (Author) request.getAttribute("author");
%>

<form action="/authors/edit" method="post">
    <input type="hidden" name="authorId" value="<%=author.getId()%>">
    Please input author name:
    <input name="name" value="<%=author.getName()%>">
    Please input author surname:
    <input name="surname" value="<%=author.getSurname()%>">
    Please input author age:
    <input type="number" name="age" value="<%=author.getAge()%>">
    Please input author email:
    <input type="email" name="email" value="<%=author.getEmail()%>">

    <input type="submit" value="Update">

</form>
</body>
</html>
