package cate_pro.entities;

import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "users")
public class User {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "username")
	@NotEmpty(message = "Username is empty!")
	private String userName;

	@Column(name = "password")
	@NotEmpty(message = "Password is empty!")
	private String passWord;

	@Column(name = "enabled")
	private Boolean enabled;

	@Column(name = "fullname")
	@NotEmpty(message = "FullName is empty!")
	private String fullName;

	@Column(name = "gender")
	@NotNull(message = "Gender is empty! (Nam or Nữ)")
	private Boolean gender;

	@Column(name = "birthday")
	@NotNull(message = "Birthday is empty!")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	@Column(name = "address")
	@NotEmpty(message = "Address is empty!")
	private String address;

	@Column(name = "email")
	@NotEmpty(message = "Email is empty!")
	private String email;

	@Column(name = "telephone")
	@Pattern(regexp = "^[0-9]{10}$", message = "Only accepts strings with exactly 10 numeric characters from 0 to 9!")
	@Pattern(regexp = "\\S{10}", message = "must not contain spaces and must be exactly 10 characters!")
	@Size(min = 10, max = 10, message = "Phone number must be 10 digits long!")
	private String telephone;
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Set<User_Role> userRoles;

	public User() {
		super();
	}

	public User(Long id, @NotEmpty(message = "username is empty!") String userName,
			@NotEmpty(message = "password is empty!") String passWord, Boolean enabled,
			@NotEmpty(message = "FullName is empty!") String fullName,
			@NotNull(message = "Gender is empty! (Nam or Nữ)") Boolean gender,
			@NotNull(message = "birthday is empty!") Date birthday,
			@NotEmpty(message = "address is empty!") String address,
			@NotEmpty(message = "email is empty!") String email,
			@Pattern(regexp = "^[0-9]{10}$", message = "Only accepts strings with exactly 10 numeric characters from 0 to 9!") @Pattern(regexp = "\\S{10}", message = "must not contain spaces and must be exactly 10 characters!") @Size(min = 10, max = 10, message = "Phone number must be 10 digits long!") String telephone,
			Set<User_Role> userRoles) {
		super();
		this.id = id;
		this.userName = userName;
		this.passWord = passWord;
		this.enabled = enabled;
		this.fullName = fullName;
		this.gender = gender;
		this.birthday = birthday;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.userRoles = userRoles;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Set<User_Role> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<User_Role> userRoles) {
		this.userRoles = userRoles;
	}
}