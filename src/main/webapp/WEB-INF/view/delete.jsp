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
        <th colspan=5>Deleted task</th>
    </tr>
    <tr>
        <th>id</th>
        <th>Title</th>
        <th>Importance</th>
        <th>Date</th>
    </tr>
    <c:forEach items="${deleteTask}" var="delTask">
        <tr>
            <td>${delTask.id}</td>
            <td>${delTask.title}</td>
            <td>${delTask.importance}</td>
            <td>${delTask.deadline}</td>

        </tr>
    </c:forEach>

</table>
    <hr>
    <div>
    <a href="${pageContext.request.contextPath}/allTasks">Show All Tasks</a>
    <a href="${pageContext.request.contextPath}/">Go Home page</a>
    </div>
</form>
</body>
</html>
