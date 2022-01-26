<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="todo.ModelList"%>
<%@ page import="todo.TodoObject"%>
<html>
<head>
<title>Todoリスト</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
  crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"">
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
        <%
        ModelList model = new ModelList();
        List<TodoObject> list = model.getDbData();
        for (TodoObject obj : list) {
        %>
        <tr>
          <td class="align-middle"><%=obj.getName()%></td>
          <td>
            <form class="center-block" action="/edit.jsp" method="post" style="margin-bottom: 0px; display: flex; justify-content: center; align-items: center;">
              <input type="hidden" name="id" value="<%=obj.getId()%>" /> <input type="hidden" name="name" value="<%=obj.getName()%>" />
              <button class="btn btn-info" type="submit">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                <path
                    d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z" />
              </svg>
                編集
              </button>
            </form>
          </td>
          <td>
            <form class="center-block" action="/delete" method="post" onsubmit="return onSubmit()" style="margin-bottom: 0px; display: flex; justify-content: center; align-items: center;">
              <input type="hidden" name="id" value="<%=obj.getId()%>" />
              <button class="btn btn-outline-secondary" type="submit">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                <path fill-rule="evenodd"
                    d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
              </svg>
                削除
              </button>
            </form>
          </td>
        </tr>
        <%
        }
        %>
      </tbody>
    </table>
    <div class="text-right">
      <a class="btn btn-primary" href="add.jsp" role="button" style="width: 120px">追加</a>
    </div>
  </div>
  <script>
			function onSubmit() {
				return window.confirm("削除してもよろしいですか？");
			}
		</script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>