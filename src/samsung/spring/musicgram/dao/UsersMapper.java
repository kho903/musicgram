package samsung.spring.musicgram.dao;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import samsung.spring.musicgram.dto.Users;

@Mapper
public interface UsersMapper {
	public int join(Users user);
	public Users loginUser(Users user);
	public void logout();
	public int updateUser(Users user);
	public Users getUser(String id);
	public void sendEmail(Users user);
	public void findPw(Users user);
	public int getTempPw(Users user);
}
