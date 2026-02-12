package com.meowsic.controller.auth;

import java.io.IOException;

import com.meowsic.entity.Role;
import com.meowsic.entity.User;
import com.meowsic.service.RegisterService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final RegisterService registerService = new RegisterService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (registerService.register(username, password, email) == 1) {
			response.sendRedirect("login.html?login=success");
		} else {
			request.setAttribute("errorMessage", "Cannot create account");
			request.getRequestDispatcher("register.html").forward(request, response);
		}
	}

}
