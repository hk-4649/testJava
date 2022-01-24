package todo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		ModelList list = new ModelList();
		boolean result = list.addDBData(name);
		if (result) {
			RequestDispatcher dispatcher =  request.getRequestDispatcher("list.jsp");
			dispatcher.forward(request, response);
		}
	}
}
