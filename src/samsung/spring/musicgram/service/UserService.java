package samsung.spring.musicgram.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

//import samsung.spring.musicgram.dao.UsersDAO;
import samsung.spring.musicgram.dao.UsersMapper;
import samsung.spring.musicgram.dto.Users;

@Service
public class UserService {
	@Autowired
	private UsersMapper usersMapper;
	
	
	@Transactional(readOnly = false)
	public void userJoin(Users user) {
		int resultcount = usersMapper.join(user);
	}
	
	
	public void logout(HttpSession session) {
		usersMapper.logout();
		session.invalidate();
	}
	
	public int updateUser(Users user) {
		return usersMapper.updateUser(user);
	}
	
	public int findPassword(String id, String email) {
		return usersMapper.findPassword(id, email);
	}
	
	public Users getUser(String id) {
		return usersMapper.getUser(id);
	}
}
