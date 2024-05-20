package cate_pro.dao;

import java.util.List;

import cate_pro.entities.Category;

public interface CategoryDAO {
	public List<Category> getCategory();

	public boolean insertCategory(Category c);
	

	public Category getCategoryById(String categoryId);

	public boolean updateCategory(Category c);

	public boolean deleteCategory(String categoryId);

	public List<Category> getCategorytByName(String categoryName);
	
	public List<Category> getProductPagination(Integer offset , Integer maxResult);
	
	public Long getTotalCategoryPagination();
}
