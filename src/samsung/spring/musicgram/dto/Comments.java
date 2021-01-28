package samsung.spring.musicgram.dto;

public class Comments {
	private int comment_no;
	private int content_no;
	private String user_id;
	private String comment_text;
	private String create_date;

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getContent_no() {
		return content_no;
	}

	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	@Override
	public String toString() {
		return "Comments [comment_no=" + comment_no + ", content_no=" + content_no + ", user_id=" + user_id
				+ ", comment_text=" + comment_text + ", create_date=" + create_date + "]";
	}

}
