 package cate_pro.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cate_pro.dao.UserDAO;
import cate_pro.entities.User;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public User findByUserName(String username) {
		Session session = sessionFactory.openSession();
		try {
			User user = (User) session.createQuery("from User where userName = :userName")
					.setParameter("userName", username).uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertUser(User u) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(u);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			 session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}
}
