<%@ page import="java.util.List" %>
<%@ page import="db.Language" %>
<%@ page import="db.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <%@ include file="/heads/header.jsp" %>
    <% if (currentUser != null && currentUser.getRole_id().equals("1")) { %>
    <form class="p-3 border rounded" action="/addNews" method="post">
        <br>
        <select name="language" class="form-control">
            <% List<Language> languages = (List<Language>) request.getAttribute("languages");
                if (languages != null && !languages.isEmpty()) {
                    for (Language language : languages) { %>
            <option value="<%= language.getId() %>"><%= language.getName() %> - <%= language.getCode() %></option>
            <%     }
            } %>
        </select>

        <br>
        <label class="form-label">Title:</label>
        <input class="form-control" name="title" type="text">

        <label class="form-label">Content:</label>
        <input class="form-control" name="content" type="text">

        <br>
        <% List<Category> categories = (List<Category>) request.getAttribute("categories");
            if (categories != null && !categories.isEmpty()) { %>
        <select class="form-control" name="category">
            <% for (Category cat : categories) { %>
            <option value="<%= cat.getId() %>"><%= cat.getName() %></option>
            <% } %>
        </select>
        <% } %>

        <br>
        <button class="btn btn-success" type="submit">Add News</button>
    </form>
    <% } %>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
