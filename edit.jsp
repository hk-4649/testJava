<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>編集画面</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
  crossorigin="anonymous" />
</head>
<body>
  <%
  request.setCharacterEncoding("UTF-8");
  int id = Integer.valueOf(request.getParameter("id")).intValue();
  String name = request.getParameter("name");
  %>
  <div class="container">
    <div class="row">
      <h3>Todo編集画面</h3>
    </div>
    <div class="mt-1">
      <label>Todo編集内容</label>
    </div>
    <form action="/edit" method="post" onsubmit="return onEdit()">
      <div>
        <input type="hidden" name="id" value="<%=id%>"> <input class="form-control" type="text" name="name" maxlength="60" value="<c:out value="<%=name%>" />" required />
      </div>
      <div class="text-right mt-3">
        <span class="mx-2"> <a class="btn btn-outline-secondary" href="/" role="button" style="width: 120px"> キャンセル </a>
        </span> <span class="mx-2"> <input class="btn btn-primary" type="submit" value="変更" style="width: 120px" />
        </span>
      </div>
    </form>
  </div>
  <script src="js/todo.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>