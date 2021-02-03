<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            margin: auto;
            border: 1px solid black;
        }

        th, td {
            border: 1px solid gray;
            width: 180px;
        }

        h2, table, div {
            text-align: center;
        }
        a{
            margin: 20px;
        }
    </style>
</head>
<body>
<form method="get">
<table>
    <tr>
        <th colspan=6>All saved tasks</th>
    </tr>
    <tr>
        <th>id</th>
        <th>Title</th>
        <th>Importance</th>
        <th>Date</th>
        <th>Category</th>
        <th>Delete</th>
    </tr>
    <c:forEach items="${tasks}" var="task">
        <tr>
            <td>${task.id}</td>
            <td>${task.title}</td>
            <td>${task.importance}</td>
            <td>${task.deadline}</td>
            <td>${task.category.name}</td>
            <td><a href="/delete/${task.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
    <br>
    <div>
        <a href="${pageContext.request.contextPath}/">Go Home page</a>
    </div>
</form>
</body>
</html>
