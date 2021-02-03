<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ToDiList</title>
    <style>
        table, div {
            margin: auto;
            border: 1px solid black;
        }

        div {
            border: 2px solid gray;
            width: 930px;
        }

        th, td {
            border: 1px solid gray;
            width: 180px;
        }

        h2, table, div {
            text-align: center;
        }

        span {
            color: mediumvioletred;
        }
    </style>
</head>
<body>
<h2>ToDoList</h2>
<form method="post">
    <table>
        <tr>
            <th colspan=4>Form of create new tasks</th>
        </tr>
        <tr>
            <th>Task title</th>
            <th>Importance</th>
            <th>Date</th>
            <th>Category</th>
        </tr>

        <tr>
            <td><label><input name='title' type='text' required='required' placeholder="Task title"/></label></td>
            <td><label><select name="importance" required>
                <option selected>Choose importance</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select></label></td>
            <td><label><input name='deadline' type='date' required='required' placeholder="Date"/></label></td>
            <td><label><input name='category' type='text' required='required' placeholder="category"/></label></td>
            <td colspan="2"><input type='submit' value=' SAVE '/></td>
        </tr>
    </table>

</form>

<div><span>Number of existing tasks ${tasks.size()}</span>
    <hr>
    <p>Select task by ID</p>
    <c:forEach items="${tasks}" var="task">
        <a href="/findById/${task.id}">${task.id}</a>
    </c:forEach>
    <hr>
    <a href="${pageContext.request.contextPath}/allTasks">Show All Tasks</a>
    <a style="margin-left: 20px" href="${pageContext.request.contextPath}/allCategories">Show All Categories</a>
</div>
</body>
</html>
