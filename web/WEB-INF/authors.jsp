<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Authors</title>
</head>
<body>

<table border="1px solid">

    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Email</th>
        <th>Age</th>
        <th>Action</th>
        <th>Edit</th>
    </tr>

    <% List<Author> authors = (List<Author>) request.getAttribute("authors");
       for (Author author : authors) {
    %>
    <tr>
        <td>
            <% if(author.getProfilePic() == null || author.getProfilePic().length() == 0) { %>
            <img src="/images/av.jpg" width="100" />
            <% } else { %>
            <img src="/getImage?image=<%=author.getProfilePic()%>" width="100" />
            <% } %>
        </td>
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
