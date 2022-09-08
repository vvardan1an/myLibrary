<%@ page import="model.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
</head>
<body>

<%

    List<Book> books = (List<Book>) request.getAttribute("books");

%>

<table border="1px solid">

    <tr>
        <th>Image</th>
        <th>Id</th>
        <th>Title</th>
        <th>Description</th>
        <th>Price</th>
        <th>Author_id</th>
        <th>Action</th>
        <th>Edit</th>
    </tr>

    <% for (Book book : books) { %>

    <tr>
        <td>
            <% if(book.getProfilePicBook() == null || book.getProfilePicBook().length() == 0) { %>
            <img src="/images/av.jpg" width="100" />
            <% } else { %>
            <img src="/getImageBook?image=<%=book.getProfilePicBook()%>" width="100" />
            <% } %>
        </td>
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
        <td>
            <a href="/books/remove?bookId=<%=book.getId()%>">Remove</a>
        </td>
        <td>
            <a href="/books/edit?bookId=<%=book.getId()%>">Edit</a>"
        </td>
    </tr>

    <% } %>
</table>

</body>
</html>
