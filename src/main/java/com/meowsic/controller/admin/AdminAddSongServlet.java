package com.meowsic.controller.admin;

import java.io.IOException;

import com.meowsic.entity.Role;
import com.meowsic.entity.Song;
import com.meowsic.service.SongService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/add-song")
public class AdminAddSongServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	SongService songService = new SongService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Role role = (Role)session.getAttribute("role");

//		if (!"admin".equals(role.toString())) {
//			response.sendRedirect("../login.html?access=unauthorised");
//			return;
//		}

		Song song = new Song();
		song.setTitle(request.getParameter("title"));
		song.setArtist(request.getParameter("artist"));
		song.setFile_name(request.getParameter("filename"));
		song.setImage_url(request.getParameter("thumbnail"));

		songService.addSong(song, role);
		response.sendRedirect("songs");
	}

}
