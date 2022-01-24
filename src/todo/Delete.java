package todo;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		ModelList list = new ModelList();
		boolean result = list.deleteDBData(id);
		if (result) {
			response.sendRedirect("list.jsp");
		}
		response.sendRedirect("error.jsp");
	}
}
