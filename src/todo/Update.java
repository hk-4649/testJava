package todo;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/edit")
public class Update extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		ModelList list = new ModelList();
		boolean result = list.updateDBData(id, name);
		if (result) {
			response.sendRedirect("list.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	}
}