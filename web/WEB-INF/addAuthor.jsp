<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Author</title>
</head>
<body>

<form action="/authors/add" method="post" enctype="multipart/form-data">

    Please input author name:
    <input name="name" placeholder="Name">
    Please input author surname:
    <input name="surname" placeholder="Surname">
    Please input author age:
    <input type="number" name="age">
    Please input author email:
    <input type="email" name="email" placeholder="example@gmail.com">
    Please add your pic:
    <input type="file" name="image">
    <input type="submit" value="Add">

</form>
</body>
</html>
