package com.meowsic.service;

import java.util.List;

import com.meowsic.dao.SongDAO;
import com.meowsic.daoimpl.SongDAOImpl;
import com.meowsic.entity.Role;
import com.meowsic.entity.Song;

public class SongService {

	private final SongDAO songDAO = new SongDAOImpl();

	public void addSong(Song song, Role role) {

//		if (!"admin".equals(role.toString())) {
//			throw new RuntimeException("You don't have authority to add music");
//		}

		if (song == null) {
			throw new RuntimeException("Invalid Song");
		}

		songDAO.save(song);
	}

	public void deleteSong(int id, Role role) {
		
//		if(!"admin".equals(role)) {
//			throw new RuntimeException("Unauthorised Access!!");
//		}
		
		songDAO.deleteById(id);
	}
	
	public List<Song> getAllSongs() {
		
		System.out.println(songDAO.findAll());
		return songDAO.findAll();
	}
	
	public Song getSongById(int id) {
		return songDAO.findById(id);
	}
}
