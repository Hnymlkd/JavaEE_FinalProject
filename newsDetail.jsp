<%@ page import="db.News" %>
<%@ page import="db.Users" %>
<%@ page import="db.Category" %>
<%@ page import="db.Language" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Редактировать новость</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <%@ include file="/heads/header.jsp" %>
    <br>
    <%
        News news = (News) request.getAttribute("news");
        if (news != null) {
            if (currentUser != null && currentUser.getRole_id().equals("1")) {
    %>
    <form method="post" action="/saveNews">
        <input type="hidden" name="id" value="<%= news.getId() %>" />
        <div class="mb-3">
            <label for="title" class="form-label">Title:</label>
            <input type="text" class="form-control" id="title" name="title" value="<%= news.getTitle() %>">
        </div>

        <div class="mb-3">
            <label for="content" class="form-label">Content:</label>
            <textarea class="form-control" id="content" name="content" rows="5"><%= news.getContent() %></textarea>
        </div>

        <br>
        <% List<Category> categories = (List<Category>) request.getAttribute("categories");
            if (categories != null && !categories.isEmpty()) { %>
        <select class="form-control" name="category">
            <% for (Category cat : categories) { %>
            <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
            <% } %>
        </select>
        <% } %>

        <div class="mb-3">
            <label for="postdate" class="form-label">Postdate:</label>
            <input type="text" class="form-control" id="postdate" name="postdate" value="<%= news.getPostdate() %>">
        </div>

        <button type="submit" class="btn btn-primary">Save Changes</button>
    </form>
    <%
            }
        }
    %>

    <form method="post" action="/deleteNews">
        <input type="hidden" name="id" value="<%= news.getId() %>" />
        <button type="submit" class="btn btn-danger">Delete News</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
