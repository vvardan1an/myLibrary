<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page import="model.Book" %>
<%@ page import="manager.AuthorManager" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 04.09.2022
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
</head>
<body>

<%

    List<Author> authors = (List<Author>) request.getAttribute("authors");

    AuthorManager authorManager = new AuthorManager();
%>

<form action="/books/add" method="post">
    Please input book title:
    <input name="title" placeholder="Title">
    Please input book description:
    <input name="description" placeholder="Description">
    Please input book price:
    <input type="number" name="price">
    Please choose author:
    <select name="author">
        <% for (Author author : authors) { %>
        <%//if (authorManager.getById(author.getId()) != null) {%>
        <option value=" <%=author.getId()%> ">
            <%=author.getName()%> <%=author.getSurname() %>
        </option>
        <%}%>
        <% //} %>
    </select>

    <input type="submit" value="Add">

</form>
</body>
</html>
