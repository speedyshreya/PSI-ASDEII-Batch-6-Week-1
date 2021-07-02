package com.controller;
import com.dao.UserDao;
import java.util.*;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.*;
import com.to.*;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
  
		    RequestDispatcher requestDispatcher = null;
		    try
		    {
		    	String s1 = request.getParameter("h1");
		    	String s2= request.getParameter("h2");
		    			
		    	if(s1.equals("Login"))
		    	{
		    		User user = new User(request.getParameter("userid"), request.getParameter("password"), null);
		    		UserDao userDao= new UserDao();
		    		userDao.getUser(user);
		    		requestDispatcher= request.getRequestDispatcher("index.jsp"); //temporary. replace with reservation.jsp later

					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("user", user);
					requestDispatcher.forward(request, response);
		    	}
		    	else if(s2.equals("Register"))
		    	{
		    		
						//CustomerDao customerDao = new CustomerDao();

					/*	Customer customer = new Customer(request.getParameter("cid"), request.getParameter("firstname"),
								request.getParameter("lastname"), request.getParameter("phoneNo"), request.getParameter("city"),
								request.getParameter("dob"), request.getParameter("password")); */

					//	customerDao.insertCustomer(customer);

						requestDispatcher= request.getRequestDispatcher("CustomerRegister.jsp");
						//request.setAttribute("message", "Record inserted");
						
						requestDispatcher.forward(request, response);

					}
		    	
		    	BranchDao branchDao= new BranchDao();
		    	request.setAttribute("branches", branchDao.getAllBranches());

				requestDispatcher = request.getRequestDispatcher("Login.jsp");
				requestDispatcher.forward(request, response);
		    	
		    }
		    catch (Exception e)
		    {
		    	requestDispatcher = request.getRequestDispatcher("Login.jsp");
				request.setAttribute("message", e.getMessage());
				requestDispatcher.forward(request, response);
		    }
		    
	     
	    
	}

}
