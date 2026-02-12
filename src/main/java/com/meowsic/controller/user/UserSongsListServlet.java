package com.meowsic.controller.user;

import java.io.IOException;

import com.meowsic.service.SongService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/songs")
public class UserSongsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	SongService songService = new SongService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		if(session == null || !"user".equals(session.getAttribute("role").toString())) {
			response.sendRedirect("../login.html?error=true");;
			return;
		}
		
		request.setAttribute("songs", songService.getAllSongs());
		request.getRequestDispatcher("/user/user-song-list.jsp")
				.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
