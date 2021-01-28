package samsung.spring.musicgram.dto;

public class Contents {

	private int content_no;
	private String user_id;
	private String youtube_url;
	private String text;
	private String genre;
	private String tag;
	private int like_count;
	private String create_date;

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

	public String getYoutube_url() {
		return youtube_url;
	}

	public void setYoutube_url(String youtube_url) {
		this.youtube_url = youtube_url;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	@Override
	public String toString() {
		return "Contents [content_no=" + content_no + ", user_id=" + user_id + ", youtube_url=" + youtube_url
				+ ", text=" + text + ", genre=" + genre + ", tag=" + tag + ", like_count=" + like_count
				+ ", create_date=" + create_date + "]";
	}

}
