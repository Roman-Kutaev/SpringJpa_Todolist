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
            <th colspan=4>All saved categories</th>
        </tr>
        <tr>
            <th>id</th>
            <th>Name</th>
            <th>IdTask</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${categories}" var="category">
            <tr>
                <td>${category.id}</td>
                <td>${category.name}</td>
                <td>${category.list.get(categories.indexOf(category)).id}</td>
                <td><a href="/deleteCategory/${category.id}">delete</a></td>
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
