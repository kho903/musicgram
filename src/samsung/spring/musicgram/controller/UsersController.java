package samsung.spring.musicgram.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import samsung.spring.musicgram.dto.Users;
import samsung.spring.musicgram.service.UserService;

@Controller
@RequestMapping("/user")
public class UsersController {
	@Autowired
	private UserService userService;

	// joinForm redirect
	@GetMapping("/joinForm")
	public String joinForm() {
		return "user/join";
	}
	
	// 회원가입 현재 redirect : 임시로 만든 hello
	@PostMapping("/join")
	public String join(@ModelAttribute Users user, HttpServletRequest request) {
		userService.userJoin(user);
		System.out.println(user);
		return "redirect:/hello";
	}
	
	// 유저정보 출력 (안됨)
	@GetMapping("/userInfo/{user_id}")
	public String getUser(@PathVariable(name="user_id") String id, ModelMap model) {
		Users user = userService.getUser(id);
		model.addAttribute("user_id", user);
		return "user/view";
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/login";
	}
//	@PostMapping("/login")
//	public String login(String id, String password, HttpSession session) {
//		try {
//			userService.login(id, password, session);
//			return "user/loginOK";
//		}catch(Exception e) {
//			
//			return "user/loginFail";
//		}
//	}
//	@RequestMapping(value="/loginUser", method=RequestMethod.POST)
//	public String loginUser(Users user, Model model, HttpSession session) {
//		Users result = userService.loginUser(user);
//		if(result == null) {
//			return "login";
//		}else {
//			session.setAttribute("user_id", result.getUser_id());
//			return "hello";
//		}
//	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Users user, Model model, HttpSession session) {
		session.invalidate();		
		return "login";
	}

	
}
