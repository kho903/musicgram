package samsung.spring.musicgram.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import samsung.spring.musicgram.dto.Users;

@Mapper
public interface UsersMapper {
	public int join(Users user);
	public Users loginUser(Users user);
	public void logout();
	public int updatePassword(Users user);
	public int findPassword(String id, String email);
	public Users getUser(String id);
}
