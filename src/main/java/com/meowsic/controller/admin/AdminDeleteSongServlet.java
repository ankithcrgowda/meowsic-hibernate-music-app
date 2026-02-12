package com.meowsic.controller.admin;

import java.io.IOException;

import com.meowsic.entity.Role;
import com.meowsic.service.SongService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/delete-song")
public class AdminDeleteSongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final SongService songService = new SongService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Role role = (Role) session.getAttribute("role");

//		if (!"admin".equals(session.getAttribute("role"))) {
//			response.sendRedirect("../login.html");
//			return;
//		}

		int id = Integer.parseInt(request.getParameter("id"));
		songService.deleteSong(id, role);

		response.sendRedirect("songs");	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
