package cate_pro.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cate_pro.dao.CategoryDAO;
import cate_pro.entities.Category;


@Repository
public class CategoryDAOImpl implements CategoryDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> getCategory() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Category").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}
	
	    

	@Override
	public boolean insertCategory(Category c) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(c);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public Category getCategoryById(String categoryId) {
		Session session = sessionFactory.openSession();
		try {
			Category category = session.get(Category.class, categoryId);
			return category;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean updateCategory(Category c) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(c);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public boolean deleteCategory(String categoryId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getCategoryById(categoryId));
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return false;
	}

	@Override
	public List<Category> getCategorytByName(String categoryName) {
		if (categoryName == null || categoryName.length() == 0)
			categoryName = "%";
		else
			categoryName = "%" + categoryName + "%";
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Category where categoryName like :categoryName")
					.setParameter("categoryName", categoryName).list();
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}



	@Override
	public List<Category> getProductPagination(Integer offset, Integer maxResult) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Category").setFirstResult(offset).setMaxResults(maxResult).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}



	@Override
	public Long getTotalCategoryPagination() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("select count(*) from Category").list();
			return (Long) list.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}




}
