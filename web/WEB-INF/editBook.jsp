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
    Book book = (Book) request.getAttribute("book");

    List<Author> authorList = (List<Author>) request.getAttribute("authors");

%>

<form action="/books/edit" method="post">
    <input type="hidden" name="bookId" value="<%=book.getId()%>">
    Please input book title:
    <input name="title" value="<%=book.getTitle()%>">
    Please input book description:
    <input name="description" value="<%=book.getDescription()%>">
    Please input book price:
    <input type="number" name="price" value="<%=book.getPrice()%>">
    Please choose author:
    <select name="authorId">
        <% for (Author author : authorList) {
            if (author.equals(book.getAuthor())) {
        %>
        <option selected value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%>
        </option>
        <%} else { %>
        <option value="<%=author.getId()%>"><%=author.getName()%> <%=author.getSurname()%>
                <% }} %>

    </select>

    <input type="submit" value="Update">

</form>
</body>
</html>
