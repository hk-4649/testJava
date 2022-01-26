package todo;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/delete")
public class Delete extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		TodoModel model = new TodoModel();
		boolean result = model.deleteTodoListItem(id);
		if (result) {
			response.sendRedirect("/");
		} else {
			response.sendRedirect("error.jsp");
		}
	}
}
