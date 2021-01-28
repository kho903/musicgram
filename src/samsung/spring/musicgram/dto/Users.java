package samsung.spring.musicgram.dto;

public class Users {
	private String user_id;
	private String password;
	private String email;
	private String description;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "Users [user_id=" + user_id + ", password=" + password + ", email=" + email + ", description="
				+ description + "]";
	}

}
