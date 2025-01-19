<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#" style="font-weight: bold;">BITLAB SHOP</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link active" href="/task1">Top Sales</a>
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

<div class="d-flex justify-content-center align-items-center" style="height: 100vh;">
  <div style="width: 300px; padding: 20px; background-color: white; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);">
    <h2 class="text-center">Login Page</h2>

    <%
      String error = request.getParameter("error");
      if (error != null) {
    %>
    <div class="alert alert-danger" role="alert">
      Incorrect email or password! Please try again.
    </div>
    <%
      }
    %>

    <form action="/login" method="post">
      <div class="mb-4">
        <label for="email" class="form-label mb-0" style="width: 100%;">Email:</label>
        <input type="email" id="email" name="email" class="form-control" required style="height: 40px;">
      </div>

      <div class="mb-4">
        <label for="password" class="form-label mb-0" style="width: 100%;">Password:</label>
        <input type="password" id="password" name="password" class="form-control" required style="height: 40px;">
      </div>

      <button type="submit" class="btn btn-success w-100" style="height: 50px;">Login</button>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
