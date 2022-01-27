package todo;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import todo.model.TodoModel;
@WebServlet("/add")
public class Add extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		TodoModel model = new TodoModel();
		boolean result = model.insertTodoListItem(name);
		if (result) {
			response.sendRedirect("/");
		} else {
			response.sendRedirect("error.jsp");
		}
	}
}
