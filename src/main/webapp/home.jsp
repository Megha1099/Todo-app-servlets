<%@page import="dto.TodoTask"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<style>
div {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.extra {
	margin-top: 20px;
	margin-left: 305px;
}
</style>
</head>
<body>
	<%
	List<TodoTask> tasks = (List<TodoTask>) request.getAttribute("tasks");
	%>
	<h1 align="center">This is Home Page</h1>
	<%
	if (!tasks.isEmpty()) {
	%>
	<div>
		<table border="1">
			<tr>
				<th>Task Name</th>
				<th>Task Description</th>
				<th>Created Time</th>
				<th>Status</th>
				<th>Delete</th>
				<th>Edit</th>
			</tr>
			<%
			for (TodoTask task : tasks) {
			%>
			<tr>
				<th><%=task.getName()%></th>
				<th><%=task.getDescription()%></th>
				<th><%=task.getCreatedTime()%></th>
				<th>
					<%
					if (task.isStatus()) {
					%>Completed <%
					} else {
					%><a href="complete?id=<%=task.getId()%>"><button>Complete</button></a>
					<%
					}
					%>
				</th>
				<th><a href="delete?id=<%=task.getId()%>"><button>Delete</button></a></th>
				<th><a href="edit-task.jsp?name=<%=task.getName()%>&description=<%=task.getDescription()%>&id=<%=task.getId()%>"><button>Edit</button></a></th>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<%
	}
	%>
	<a href="add-task.html"><button class="extra">Add Task</button></a>
	<a href="logout"><button class="extra">Logout</button></a>
</body>
</html>
