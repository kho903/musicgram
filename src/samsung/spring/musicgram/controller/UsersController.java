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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import samsung.spring.musicgram.dto.Contents;
import samsung.spring.musicgram.dto.Users;
import samsung.spring.musicgram.service.ContentsService;
import samsung.spring.musicgram.service.PicService;
import samsung.spring.musicgram.service.UserService;

@Controller
@RequestMapping("/user")
public class UsersController {
	@Autowired
	private UserService userService;

	@Autowired
	private PicService picService;

	@Autowired
	private ContentsService contentService;

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
		return "redirect:/user/loginForm";
	}
	
	// 유저정보 출력 (안됨)
	@GetMapping("/{user_id}")
	public String getUser(@PathVariable(name="user_id") String user_id, ModelMap model) {
		Users user = userService.getUser(user_id);
		model.addAttribute("user", user);
//		InputStream pic = new ByteArrayInputStream(picService.getPic(user_id).getFile_data());
//		model.addAttribute("pic", pic);
		model.addAttribute("contentList", contentService.getUserContent(user_id));
		return "user/view";
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		return "user/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam(name="user_id", required=true)String user_id, @RequestParam(name="password", required=true) String password, HttpSession session, RedirectAttributes redirectAttributes) {
		if(userService.getUser(user_id).getPassword().equals(password)) {
			session.setAttribute("user_id", user_id);
			session.setAttribute("password", password);
		}else {
			return "redirect:/user/loginForm";
		}
		return "redirect:/content";
	}
	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Users user, Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/user/loginForm";
	}

	
}
