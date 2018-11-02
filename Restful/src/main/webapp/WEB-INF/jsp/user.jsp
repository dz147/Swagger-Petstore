<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/addPet" method="post">
    <input type="text">
    <input type="text">
    <input type="text">
    <input type="text">
    <input type="text">
</form>
<c:forEach items="${user}" var="u">
    <h5>${u.id}</h5><h5>${u.userName}</h5>
</c:forEach>
</body>
</html>
