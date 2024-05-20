package cate_pro.entities;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "Category")
public class Category {
	@Id
	@Column(name = "categoryId")
	@NotEmpty(message = "Category Id is empty!")
	private String categoryId;

	@Column(name = "categoryName")
	@NotEmpty(message = "Category Name is empty!")
	private String categoryName;

	@Column(name = "status")
	@NotNull(message = "Status is empty! ")
	private Boolean status;

	@OneToMany(mappedBy = "cate")
	private Set<Product> listProduct;

	public Category() {
	}

	public Category(@NotEmpty(message = "Category Id is empty!") String categoryId,
			@NotEmpty(message = "Category Name is empty!") String categoryName,
			@NotNull(message = "Status is empty! ") Boolean status) {
		super();
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.status = status;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Set<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(Set<Product> listProduct) {
		this.listProduct = listProduct;
	}

}
