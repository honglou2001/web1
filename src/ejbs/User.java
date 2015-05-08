package ejbs;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

  
@SuppressWarnings("serial")  
@Entity
@Table(name = "t_authority_users")
public class User  implements Serializable {

	@Id
    @Column(name = "FID")
	private String id;
	
	@Column(name = "FName")
	private String name;
	
	@Column(name = "FPwd")
	private String Pwd;
	
	@Column(name = "FMobile")
	private String Mobile;
	
	@Column(name = "FEmail")
	private String Email;
	
	@Column(name = "FAdress")
	private String Adress;
	
	@Column(name = "FDescription")
	private String description;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return Pwd;
	}
	public void setPwd(String pwd) {
		this.Pwd = pwd;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		this.Email = email;
	}
	
	public String getMobile() {
		return Mobile;
	}
	public void setMobile(String mobile) {
		this.Mobile = mobile;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getAdress() {
		return Adress;
	}
	public void setAdress(String adress) {
		Adress = adress;
	}
	
}
