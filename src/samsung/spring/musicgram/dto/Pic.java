package samsung.spring.musicgram.dto;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class Pic {
	private int user_pic_no;
	private String user_id;
	private String file_name;
	private long file_size;
	private byte[] file_data;
	
	private MultipartFile file;

	public int getUser_pic_no() {
		return user_pic_no;
	}

	public void setUser_pic_no(int user_pic_no) {
		this.user_pic_no = user_pic_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public long getFile_size() {
		return file_size;
	}

	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}

	public byte[] getFile_data() {
		return file_data;
	}

	public void setFile_data(byte[] file_data) {
		this.file_data = file_data;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Pic [user_pic_no=" + user_pic_no + ", user_id=" + user_id + ", file_name=" + file_name + ", file_size="
				+ file_size + ", file_data=" + Arrays.toString(file_data) + ", file=" + file + "]";
	}
}
