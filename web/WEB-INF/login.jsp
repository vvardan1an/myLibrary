<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 08.09.2022
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>

<%
String message = (String) request.getAttribute("message");
%>


<%
if(message !=null){%>
<p style="color: red"><%=message%>

</p>
<%}%>
<form action="/login" method="post">
    <input type="email" name="email" placeholder="Please input email:">
    <input type="password" name="password" placeholder="Please input password:">
    <input type="submit" value="login">

</form>
</body>
</html>
