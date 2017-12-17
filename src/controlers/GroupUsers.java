package controlers;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.User;
import utils.DbUtil;

/**
 * Servlet implementation class GroupUsers
 */
@WebServlet("/GroupUsers")
public class GroupUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("id")!=null){
			try{
				int id = Integer.parseInt(request.getParameter("id"));
				Connection con = DbUtil.getConnection();
				User[] users = User.loadAllByGroupID(con, id);
				request.setAttribute("users", users);
				getServletContext().getRequestDispatcher("/WEB-INF/Views/users.jsp").forward(request, response);
			}catch(Exception e){
				response.sendRedirect("AllGroups");
			}
		}else{
			response.sendRedirect("AllGroups");
		}
	}

}
