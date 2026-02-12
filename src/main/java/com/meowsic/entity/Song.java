package com.meowsic.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "Song")
public class Song {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(
			name = "artist", 
			columnDefinition = "varchar(100) DEFAULT 'unknown artist'"
	)
	private String artist;
	
	@Column(name = "file_name", nullable = false)
	private String file_name;
	
	@Column(
			name = "image_url", 
			columnDefinition = "varchar(100) DEFAULT 'thumbnails/default.jpg'"
	)
	private String image_url;

	public Song() {
		super();
	}

	public Song(int id, String title, String artist, String file_name, String image_url) {
		super();
		this.id = id;
		this.title = title;
		this.artist = artist;
		this.file_name = file_name;
		this.image_url = image_url;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	@Override
	public String toString() {
		return "Song [id=" + id + ", title=" + title + ", artist=" + artist + ", file_name=" + file_name
				+ ", image_url=" + image_url + "]";
	}
}
