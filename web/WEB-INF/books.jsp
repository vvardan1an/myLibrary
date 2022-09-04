<%@ page import="model.Book" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04.09.2022
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
</head>
<body>

<%

    List<Book> books = (List<Book>) request.getAttribute("books");

%>

<table style="border: 3px black solid">

    <tr>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>price</th>
        <th>author_id</th>
    </tr>

    <% for (Book book : books) { %>

    <tr>
        <td><%=book.getId()%>
        </td>
        <td><%=book.getTitle()%>
        </td>
        <td><%=book.getDescription()%>
        </td>
        <td><%=book.getPrice()%>
        </td>
        <td><%=book.getAuthor()%>
        </td>
    </tr>

    <% } %>
</table>

</body>
</html>
