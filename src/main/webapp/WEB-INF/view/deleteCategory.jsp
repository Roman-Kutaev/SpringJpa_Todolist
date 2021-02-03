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
<form method="post">
    <table>
        <tr>
            <th colspan=3>Deleted category</th>
        </tr>
        <tr>
            <th>IdCategory</th>
            <th>Name</th>
            <th>IdTask</th>
        </tr>
        <c:forEach items="${deleteCategories}" var="deleteCategory">
            <tr>
                <td>${deleteCategory.id}</td>
                <td>${deleteCategory.name}</td>
                <td>${deleteCategory.list.get(deleteCategories.indexOf(deleteCategory)).id}</td>

            </tr>
        </c:forEach>

    </table>
    <hr>
    <div>
        <a href="${pageContext.request.contextPath}/allCategories">Show All Categories</a>
        <a href="${pageContext.request.contextPath}/">Go Home page</a>
    </div>
</form>
</body>
</html>
