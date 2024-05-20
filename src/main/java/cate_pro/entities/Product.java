package cate_pro.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Product")
public class Product {
	@Id
	@Column(name = "productId")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;

	@Column(name = "productName")
	@NotEmpty(message = "productName is empty!")
	private String productName;

	@Column(name = "producer")
	@NotEmpty(message = "producer is empty!")
	private String producer;
	@Column(name = "status")
	@NotNull(message = "status is empty!")

	private Boolean status;

	@Column(name = "manufactureDate")
	@NotNull(message = "manufactureDate is empty!")
	@DateTimeFormat(pattern = "yyyy-MM-dd")

	private Date manufactureDate;

	@Column(name = "expirationDate")
	@NotNull(message = "expirationDate is empty!")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	
	private Date expirationDate;

	@Column(name = "price")
	@NotNull(message = "price is empty!")
	private Double price;

	@Column(name = "proImg")
	private String proImg;

	@ManyToOne
	@JoinColumn(name = "categoryId", referencedColumnName = "categoryId")
	private Category cate;

	public Product() {

	}

	public Product(Integer productId, @NotEmpty(message = "productName is empty!") String productName,
			@NotEmpty(message = "producer is empty!") String producer,
			@NotNull(message = "status is empty!") Boolean status,
			@NotNull(message = "manufactureDate is empty!") Date manufactureDate,
			@NotNull(message = "expirationDate is empty!") Date expirationDate,
			@NotNull(message = "price is empty!") Double price, String proImg) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.producer = producer;
		this.status = status;
		this.manufactureDate = manufactureDate;
		this.expirationDate = expirationDate;
		this.price = price;
		this.proImg = proImg;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProducer() {
		return producer;
	}

	public void setProducer(String producer) {
		this.producer = producer;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

	public Date getManufactureDate() {
		return manufactureDate;
	}

	public void setManufactureDate(Date manufactureDate) {
		this.manufactureDate = manufactureDate;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

	public Category getCate() {
		return cate;
	}

	public void setCate(Category cate) {
		this.cate = cate;
	}

}
