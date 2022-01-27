<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Todoリスト</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
  crossorigin="anonymous">
</head>
<body>
  <div class="container">
    <h3>Todoリスト</h3>
    <table class="table table-striped table-bordered table-sm">
      <thead>
        <tr>
          <th class="text-center" style="width: 80%">Todo名称</th>
          <th class="text-center" style="width: 10%">編集</th>
          <th class="text-center" style="width: 10%">削除</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="obj" items="${list}">
          <tr>
            <td class="align-middle"><c:out value="${obj.name}" /></td>
            <td>
              <form class="center-block" action="/edit.jsp" method="post" style="margin-bottom: 0px; display: flex; justify-content: center; align-items: center;">
                <input type="hidden" name="id" value="${obj.id}" /> <input type="hidden" name="name" value="<c:out value="${obj.name}" />" />
                <button class="btn btn-info" type="submit">
                  <svg width="16" height="16">
                  <use href="/img/edit.svg#edit"></use>
                </svg>
                  編集
                </button>
              </form>
            </td>
            <td>
              <form class="center-block" action="/delete" method="post" onsubmit="return onDelete()" style="margin-bottom: 0px; display: flex; justify-content: center; align-items: center;">
                <input type="hidden" name="id" value="${obj.id}" />
                <button class="btn btn-outline-secondary" type="submit">
                  <svg width="16" height="16">
                  <use href="/img/delete.svg#delete"></use>
                </svg>
                  削除
                </button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="text-right">
      <a class="btn btn-primary" href="add.jsp" role="button" style="width: 120px">追加</a>
    </div>
  </div>
  <script src="js/todo.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>