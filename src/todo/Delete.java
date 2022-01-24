package todo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Delete extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		ModelList list = new ModelList();
		boolean result = list.deleteDBData(id);
		if (result) {
			RequestDispatcher dispatcher =  request.getRequestDispatcher("list.jsp");
			dispatcher.forward(request, response);
		}
	}
}
