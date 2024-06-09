package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import beans.User;
import dao.UserDao;
import form.AddUserForm;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/users/add")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String ADD_USER_VIEW = "/WEB-INF/addUser.jsp";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		getServletContext().getRequestDispatcher(ADD_USER_VIEW).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		AddUserForm form = new AddUserForm(request);
		form.ajouter();
		
		request.setAttribute("status", form.getStatus());
		request.setAttribute("statusMessage", form.getStatusMessage());
		request.setAttribute("user", form.getUser());
		request.setAttribute("erreurs", form.getErreurs());
		
		getServletContext().getRequestDispatcher(ADD_USER_VIEW).forward(request, response);
		
	}

}
