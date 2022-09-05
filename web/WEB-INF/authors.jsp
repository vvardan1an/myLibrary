<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
</head>
<body>

<%

    List<Author> authors = (List<Author>) request.getAttribute("authors");

%>

<table border="1px solid">

    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Age</th>
        <th>Action</th>
        <th>Edit</th>
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
        <td>
            <a href="/authors/remove?authorId=<%=author.getId()%>">Remove</a>
        </td>
        <td>
            <a href="/authors/edit?authorId=<%=author.getId()%>">Edit</a>"
        </td>
    </tr>

    <% } %>
</table>
</body>
</html>
