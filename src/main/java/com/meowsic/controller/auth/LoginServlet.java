package com.meowsic.controller.auth;

import java.io.IOException;

import com.meowsic.entity.User;
import com.meowsic.service.AuthService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final AuthService authService = new AuthService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = authService.authenticate(username, password);

		if (user == null) {
			response.sendRedirect("login.html?error=true");
			return;
		}

		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		session.setAttribute("role", user.getRole());
		
		if ("admin".equals(user.getRole().toString())) {
			response.sendRedirect(request.getContextPath() + "/admin/songs?admin=true");
		} else {
			response.sendRedirect(request.getContextPath() + "/user/songs?user=true");
		}
	}
}
