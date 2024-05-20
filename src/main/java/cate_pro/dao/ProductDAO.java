package cate_pro.dao;

import java.util.List;

import cate_pro.entities.Product;

public interface ProductDAO {
	public List<Product> getProduct();

	public boolean insertProduct(Product p);

	public Product getProductById(Integer productId);

	public boolean updateProduct(Product p);

	public boolean deleteProduct(Integer productId);

	public List<Product> getProductByName(String productName);
	
	public List<Product> getProductPagination(Integer offset , Integer maxResult);
	
	public Long getTotalProductPagination();
}
