package controlers;

import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.Excercise;
import pl.coderslab.model.Group;
import pl.coderslab.model.Solution;
import pl.coderslab.model.User;
import utils.DbUtil;

/**
 * Servlet implementation class AdminEx
 */
@WebServlet("/AdminEx")
public class AdminEx extends HttpServlet {
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
				Excercise ex = Excercise.loadExcerciseById(con, id);
				request.setAttribute("ex", ex);
				getServletContext().getRequestDispatcher("/WEB-INF/Views/adminExEdit.jsp").forward(request, response);
			}else if (action.equals("add")){
				getServletContext().getRequestDispatcher("/WEB-INF/Views/adminExAdd.jsp").forward(request, response);
			}else if (action.equals("del")){
				int id = Integer.parseInt(request.getParameter("id"));
				Excercise ex = Excercise.loadExcerciseById(con, id);
				ex.delete(con);
				response.sendRedirect("AdminEx");
			}else if (action.equals("sol")){
				int id = Integer.parseInt(request.getParameter("id"));
				Excercise ex = Excercise.loadExcerciseById(con, id);
				request.setAttribute("ex", ex);
				User[] users = User.loadAllUsers(con);
				request.setAttribute("users", users);
				getServletContext().getRequestDispatcher("/WEB-INF/Views/adminExSolutions.jsp").forward(request, response);
			}else{
				Excercise[] exs = Excercise.loadAllExcercises(con);
				request.setAttribute("exs", exs);
				getServletContext().getRequestDispatcher("/WEB-INF/Views/adminExView.jsp").forward(request, response);
			}
		} catch (Exception e) {
			//e.printStackTrace();
			response.sendRedirect("AdminEx");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection con = DbUtil.getConnection();
			if(request.getParameter("dodaj")!=null ){
				// nowy element
				Excercise ex = new Excercise();
				ex.setTitle(request.getParameter("title"));
				ex.setDescription(request.getParameter("description"));
				ex.saveToDB(con);
			}else if(request.getParameter("edytuj")!=null){
				//edycja
				int id = Integer.parseInt(request.getParameter("id"));
				Excercise ex = Excercise.loadExcerciseById(con, id);
				ex.setTitle(request.getParameter("title"));
				ex.setDescription(request.getParameter("description"));
				ex.saveToDB(con);
			}else if(request.getParameter("przydziel")!=null){
				//przydzielamy zadania użytkownikom
				int exId = Integer.parseInt(request.getParameter("id"));
				if(request.getParameter("solution")!=null){
					for(String rawUserId : request.getParameterValues("solution")){
						int userId = Integer.parseInt(rawUserId);
						Solution solution = new Solution();
						java.sql.Date date = java.sql.Date.valueOf(LocalDate.now());
						solution.setCreated(date);
						solution.setExcercise_id(exId);
						solution.setUser_id(userId);
						solution.saveToDB(con);
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("AdminEx");
	}

}
