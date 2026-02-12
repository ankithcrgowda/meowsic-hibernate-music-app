package com.meowsic.daoimpl;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.meowsic.dao.UserDAO;
import com.meowsic.entity.User;
import com.meowsic.util.HibernateUtil;
import com.meowsic.util.PasswordUtil;

public class UserDAOImpl implements UserDAO {

	@Override
	public User findByUserNameAndPassword(String username, String password) {

		Session session = HibernateUtil.getSessionFactory().openSession();

		try {
			String sql = "FROM User WHERE username = :username AND password = :password";
			Query<User> query = session.createQuery(sql, User.class);
			query.setParameter("username", username);
			query.setParameter("password", PasswordUtil.hashPassword(password));

			return query.uniqueResult();
		} finally {
			session.close();
		}
	}

	@Override
	public void save(User user) {

		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();

		try {
			session.persist(user);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			throw e;
		} finally {
			session.close();
		}
	}
}
