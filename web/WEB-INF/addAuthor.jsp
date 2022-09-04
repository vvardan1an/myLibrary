<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04.09.2022
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Author</title>
</head>
<body>

<form action="/authors/add" method="post">
    Please input author name:
    <input name="name" placeholder="Name">
    Please input author surname:
    <input name="surname" placeholder="Surname">
    Please input author age:
    <input type="number" name="age">
    Please input author email:
    <input type="email" name="email" placeholder="example@gmail.com">

    <input type="submit" value="Add">

</form>
</body>
</html>
