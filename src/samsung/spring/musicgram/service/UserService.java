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
	
//	@Autowired
//	private UsersDAO usersDAO;
	
	@Transactional(readOnly = false)
	public void userJoin(Users user) {
		int resultcount = usersMapper.join(user);
	}
	
//	public int login(String id, String password) {
//		return usersMapper.login(id, password);
//	}
//	public String login(String id, String password, HttpSession session) {
//		String name = usersMapper.login(id, password);
//		if(name!=null) {
//			session.setAttribute("user_id", id);
//			session.setAttribute("password", password);
//		}else {
//			
//		}
//		return name;
//	}
	
//	public Users loginUser(Users user) {
//		return usersDAO.loginUser(user);
//	}
	
	public void logout(HttpSession session) {
		usersMapper.logout();
		session.invalidate();
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
