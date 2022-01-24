package todo;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		ModelList list = new ModelList();
		boolean result = list.addDBData(name);
		if (result) {
			response.sendRedirect("list.jsp");
		}
		response.sendRedirect("error.jsp");
	}
}
