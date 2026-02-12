package com.meowsic.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.meowsic.service.SongService;

@WebServlet("/admin/songs")
public class AdminSongListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private SongService songService;

	@Override
	public void init() throws ServletException {

		songService = new SongService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (session == null || !"admin".equals(session.getAttribute("role").toString())) {
			response.sendRedirect("../login.html");
			return;
		}

		request.setAttribute("songs", songService.getAllSongs());
		request.getRequestDispatcher("/admin/admin-song-list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
