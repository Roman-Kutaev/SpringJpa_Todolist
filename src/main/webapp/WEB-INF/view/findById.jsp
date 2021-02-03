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
<table>
  <tr>
    <th colspan=5>Selected task</th>
  </tr>
  <tr>
    <th>id</th>
    <th>Title</th>
    <th>Importance</th>
    <th>Date</th>
    <th>IdCategory</th>
  </tr>
    <tr>
      <td>${taskById.id}</td>
      <td>${taskById.title}</td>
      <td>${taskById.importance}</td>
      <td>${taskById.deadline}</td>
      <td>${taskById.category.name}</td>
    </tr>

</table>

  <br>
  <div>
    <a href="${pageContext.request.contextPath}/allTasks">Show All Tasks</a>
    <a href="${pageContext.request.contextPath}/">Go Home page</a>
  </div>
<%--</form>--%>

</body>
</html>
