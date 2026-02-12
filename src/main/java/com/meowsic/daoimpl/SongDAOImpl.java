package com.meowsic.daoimpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.meowsic.dao.SongDAO;
import com.meowsic.entity.Song;
import com.meowsic.util.HibernateUtil;

public class SongDAOImpl implements SongDAO {

	@Override
	public void save(Song song) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.persist(song);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			throw e;
		} finally {
			session.close();
		}
	}

	@Override
	public void deleteById(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		try {
			Song song = session.get(Song.class, id);
			if (song != null) {
				session.remove(song);
				transaction.commit();
			}
		} catch (Exception e) {
			transaction.rollback();
			throw e;
		} finally {
			session.close();
		}

	}

	@Override
	public Song findById(int id) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			return session.get(Song.class, id);			
		} finally {
			session.close();
		}
		
	}

	@Override
	public List<Song> findAll() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		
		try {
			String sql = "FROM Song";
			return session.createQuery(sql, Song.class).list();
		} finally {
			session.close();
		}
	}

}
