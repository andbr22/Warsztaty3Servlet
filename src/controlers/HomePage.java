package controlers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.Solution;
import utils.DbUtil;

/**
 * Servlet implementation class HomePage
 */
@WebServlet("/")
public class HomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String limit = getServletContext().getInitParameter("number-solutions");
			request.setAttribute("limit", limit);
			Connection con = DbUtil.getConnection();
			Solution[] solutions = Solution.loadAllSolutions(con);
			request.setAttribute("solutions", solutions);
			getServletContext().getRequestDispatcher("/WEB-INF/Views/index.jsp").forward(request, response);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}



}
