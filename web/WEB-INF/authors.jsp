<%@ page import="java.util.List" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04.09.2022
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
</head>
<body>

<%

    List<Author> authors = (List<Author>) request.getAttribute("authors");

%>

<table style="border: 3px black solid">

    <tr>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>age</th>
    </tr>

    <% for (Author author : authors) { %>

    <tr>
        <td><%=author.getName()%>
        </td>
        <td><%=author.getSurname()%>
        </td>
        <td><%=author.getEmail()%>
        </td>
        <td><%=author.getAge()%>
        </td>
    </tr>

    <% } %>
</table>
</body>
</html>
