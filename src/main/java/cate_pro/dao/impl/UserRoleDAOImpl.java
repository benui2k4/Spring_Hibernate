package cate_pro.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cate_pro.dao.UserRoleDAO;
import cate_pro.entities.User_Role;

@Repository
public class UserRoleDAOImpl implements UserRoleDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean insertRole(User_Role user_Role) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(user_Role);
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
