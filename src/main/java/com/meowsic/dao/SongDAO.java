package com.meowsic.dao;

import java.util.List;

import com.meowsic.entity.Song;

public interface SongDAO {

	void save(Song song);

	void deleteById(int id);
	
	Song findById(int id);
	
	List<Song> findAll();
}
