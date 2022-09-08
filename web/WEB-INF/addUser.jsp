<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08.09.2022
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
</head>
<body>
<form action="/userReg" method="post">

    Please input  name:
    <input name="name" placeholder="Name">
    Please input  surname:
    <input name="surname" placeholder="Surname">
    Please input  email:
    <input type="email" name="email" placeholder="example@gmail.com">
    Please input  password:
    <input type="password" name="password" placeholder="password">

    <input type="submit" value="Register">

</form>
</body>
</html>
