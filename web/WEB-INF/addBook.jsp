<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page import="model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Add Book</title>
</head>
<body>

<%
    List<Author> authorList = (List<Author>) request.getAttribute("authors");

    Book book = new Book();
%>

<form action="/books/add" method="post">
    Please input book title:
    <input name="title" placeholder="Title">
    Please input book description:
    <input name="description" placeholder="Description">
    Please input book price:
    <input type="number" name="price">
    Please choose author:
    <select name="authorId">
        <% for (Author author : authorList) { %>
        <option value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%>
        </option>
        <%}%>
    </select>

    <input type="submit" value="Add">

</form>
</body>
</html>
