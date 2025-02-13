<%@ page import="db.News" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <%@ include file="/heads/header.jsp" %>
    <br>
    <div class="row">
        <%
            List<News> newsList = (List<News>) request.getAttribute("newsList");

            if (newsList != null && !newsList.isEmpty()) {
                for (News n : newsList) {
        %>
        <div class="col-6">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%= n.getTitle() %></h5>
                            <p class="card-text"><%= n.getContent() %></p>
                            <p class="card-text"><%= n.getPostdate() %></p>
                            <p class="card-text"><%= n.getCategory().getName() %></p>

                            <% if (currentUser != null && "1".equals(currentUser.getRole_id())) { %>
                            <a href="/details?id=<%= n.getId() %>" class="btn btn-primary btn-sm">Детали</a>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            }
        }
        %>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
