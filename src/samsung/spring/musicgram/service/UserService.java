package samsung.spring.musicgram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import samsung.spring.musicgram.dao.UsersMapper;
import samsung.spring.musicgram.dto.Users;

@Service
public class UserService {
	@Autowired
	private UsersMapper usersMapper;
	
	public int join(Users user) {
		
		return usersMapper.join(user);
	}
	
	public int login(String id, String password) {
		return usersMapper.login(id, password);
	}
	
	public void logout() {
		usersMapper.logout();
	}
	
	public int updatePassword(Users user) {
		return usersMapper.updatePassword(user);
	}
	
	public int findPassword(String id, String email) {
		return usersMapper.findPassword(id, email);
	}
	
	public Users getUser(String id) {
		return usersMapper.getUser(id);
	}
}
