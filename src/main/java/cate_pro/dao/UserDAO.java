package cate_pro.dao;

import cate_pro.entities.User;

public interface UserDAO {
	public User findByUserName(String username);
	public boolean insertUser(User u);
	
	
}
