package controlers;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.Group;
import utils.DbUtil;

/**
 * Servlet implementation class AdminGroups
 */
@WebServlet("/AdminGroups")
public class AdminGroups extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String action = request.getParameter("action");
			if(action == null){
				action="";
			}
			Connection con = DbUtil.getConnection();
			if(action.equals("edit")){
				int id = Integer.parseInt(request.getParameter("id"));
				Group group = Group.loadGroupById(con, id);
				request.setAttribute("group", group);
				getServletContext().getRequestDispatcher("/WEB-INF/Views/adminGroupsEdit.jsp").forward(request, response);
			}else if (action.equals("add")){
				getServletContext().getRequestDispatcher("/WEB-INF/Views/adminGroupsAdd.jsp").forward(request, response);
			}else if (action.equals("del")){
				int id = Integer.parseInt(request.getParameter("id"));
				Group group = Group.loadGroupById(con, id);
				group.delete(con);
				response.sendRedirect("AdminGroups");
			}else{
				Group[] groups = Group.loadAllGroups(con);
				request.setAttribute("groups", groups);
				getServletContext().getRequestDispatcher("/WEB-INF/Views/adminGroupsView.jsp").forward(request, response);
			}
		} catch (Exception e) {
			//e.printStackTrace();
			response.sendRedirect("AdminGroups");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection con = DbUtil.getConnection();
			if(request.getParameter("id")==null){
				// nowy element
				Group group = new Group(request.getParameter("name"));
				group.saveToDB(con);
			}else{
				//edytujemy element
				int id = Integer.parseInt(request.getParameter("id"));
				Group group = Group.loadGroupById(con, id);
				group.setName(request.getParameter("name"));
				group.saveToDB(con);
			}
		}catch(Exception e){
			
		}
		response.sendRedirect("AdminGroups");
	}

}
