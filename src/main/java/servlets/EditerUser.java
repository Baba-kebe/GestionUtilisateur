package servlets;

import java.io.IOException;
import java.time.Instant;

import beans.User;
import dao.UserDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/users/update")
public class EditerUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String UPDATE_USER_VIEW = "/WEB-INF/editUser.jsp";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String id = request.getParameter("id");

		if (id.matches("[0-9]+")) {
			User utilisateur = UserDao.get(Integer.parseInt(id));
			
			if(utilisateur != null){
				request.setAttribute("utilisateur", utilisateur);
				getServletContext().getRequestDispatcher(UPDATE_USER_VIEW).forward(request, response);
				return;
			}
		} 
			
		response.sendRedirect("/UserManagament4/users/list");
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String id = request.getParameter("id");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String login = request.getParameter("login");
		
		String date = request.getParameter("datedenaissance") + "T00:00:00Z";
		
		Instant datedenaissance = Instant.parse(date);
		String password = request.getParameter("password");

		User utilisateur = new User(Integer.parseInt(id), nom, prenom, login, datedenaissance, password);
		
		if(UserDao.modifier(utilisateur)) {
			response.sendRedirect("/UserManagament4/users/list");
		} else {
			response.sendRedirect("/UserManagament4/users/users/update?id="+id);
		}
	}	
}
