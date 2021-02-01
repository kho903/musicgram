package samsung.spring.musicgram.service;

import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	
	public Users getUser(String id) {
		return usersMapper.getUser(id);
	}
	
	// 임시 비밀번호로 업데이트
	public int getTempPw(Users user) {
		return usersMapper.getTempPw(user);
	}
	
	// 메일 보내기 
	public void sendEmail(Users user) {
		// Mail Server 설정 
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "wldbspdlqj";
		String hostSMTPpw = "choi162320*";
		
		// 보내는 사람 Email 제목, 내용 
		String fromEmail = "wldbspdlqj@naver.com";
		String fromName = "Musicgram";
		
		String subject = ""; //메일 제목 
		String msg = ""; //메일 내용 
		String toName = user.getUser_id();


		subject = "Musicgram 비밀번호찾기 임시비밀번호 안내";
		
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += user.getUser_id() + "님의 임시 비밀번호 입니다.</h3>";
		msg += "해당 임시비밀 번호를 입력해 로그인하시고<br> 마이페이지에서 비밀번호를 변경하여 사용하세요.";
		msg += "<p>임시 비밀번호 : " + user.getPassword() + "</p></div>";


		// 받는 사람 E-Mail 주소
		String mail = user.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //gmail 이용시 465

			email.setAuthentication(hostSMTPid, hostSMTPpw);
			email.setTLS(true);
			email.addTo(mail, toName, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//임시 비밀번호 만들어서 보내기  
	public String findpw(HttpServletResponse response, Users user) {

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = null;
		
		//회원정보 불러오기 
		if (user != null) {
			String tempPw = UUID.randomUUID().toString().replace("-", "");
			tempPw = tempPw.substring(0,10);
			
			//System.out.println("임시 비밀번호 확인" + tempPw);
			//비밀번호 재설정 
			user.setPassword(tempPw);
			
			sendEmail(user); //이메일로 보내기 
			
			getTempPw(user); //임시 비밀번호로 업데이트
			
			return "redirect:/user/loginForm"; 
			
		}  else {
			
			result = "commentFail";
		}
		return result;
	}
}