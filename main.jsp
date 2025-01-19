<%@ page import="servlets.Items" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div>
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <a class="navbar-brand" href="#" style="font-weight: bold;">BITLAB SHOP</a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link active" href="#">Top Sales</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">New Sales</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">By Category</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/login.jsp">Sign In</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</div>
<div class="container-fluid d-flex flex-column justify-content-center align-items-center" style="height: auto;">
  <a class="navbar-brand" href="#" style="font-weight: bold; font-size: 3rem;">Welcome to BITLAB SHOP</a>
  <a class="navbar-brand" href="#" style="font-size: 1.5rem;">Electronic devices with high quality and service</a>

  <div class="container my-5">
    <div class="container my-5">
      <div class="row g-4">
        <%
          List<Items> itemList = (List<Items>) request.getAttribute("tovar");
          if (itemList != null) {
            for (Items item : itemList) {
        %>
        <div class="col-md-4">
          <div class="card text-center">
            <div class="card-body">
              <h5 class="card-title"><%= item.getName() %></h5>
              <h6 class="card-price text-success">$<%= item.getPrice() %></h6>
              <p class="card-text"><%= item.getDescription() %></p>
              <a href="#" class="btn btn-success">Buy Now</a>
            </div>
          </div>
        </div>
        <%
          }
        } else {
        %>
        <p>No items available</p>
        <%
          }
        %>
      </div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
