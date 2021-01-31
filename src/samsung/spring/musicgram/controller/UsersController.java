package samsung.spring.musicgram.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import samsung.spring.musicgram.dto.Pic;
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
	public String join(@ModelAttribute Users user, HttpSession session, HttpServletRequest request) {
		try {
			userService.userJoin(user);
			System.out.println(user);
			return "redirect:/user/loginForm";
		}catch(DuplicateKeyException e) {
			session.setAttribute("errMsg", "이미 존재하는 아이디 입니다.");
			return "redirect:/user/joinForm";
		}catch(DataIntegrityViolationException e) {
			session.setAttribute("errMsg", "빈칸을 채워주세요.");
			return "redirect:/user/joinForm";
		}
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
		try {
			if(userService.getUser(user_id).getPassword().equals(password)) {
				session.setAttribute("user_id", user_id);
				session.setAttribute("password", password);
				return "redirect:/content";
			}else {
				session.setAttribute("errMsg", "비밀번호가 틀렸습니다.");
				return "redirect:/user/loginForm";
			}
		} catch(NullPointerException e) {
			System.out.println(e);
			session.setAttribute("errMsg", "존재하지 않는 아이디 입니다.");
			return "redirect:/user/loginForm";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Users user, Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/user/loginForm";
	}
	
	@GetMapping("/updateProfileForm")
	public String updateProfileForm(@SessionAttribute("user_id") String user_id , Model model) {
		model.addAttribute("user_description", userService.getUser(user_id).getDescription());
		model.addAttribute("user_password", userService.getUser(user_id).getPassword());
		return "profileUpload";
	}
	
	@PostMapping("/updateProfile")
	public String updateProfile(@SessionAttribute("user_id") String user_id,
			@RequestParam("user_password") String user_password, @RequestParam("user_description") String user_description,
			@RequestParam("file") MultipartFile file, HttpSession session) throws IOException {

		if(("").equals(user_password)) {
			session.setAttribute("updateErrMsg", "변경할 비밀번호를 입력해주세요.");
			return "redirect:/user/updateProfileForm";
		}
		Users updateUser = userService.getUser(user_id);
		updateUser.setPassword(user_password);
		updateUser.setDescription(user_description);
		userService.updateUser(updateUser);
		
		Pic userPic = picService.getPic(user_id);
		
		if(file.getSize()!=0) {
			userPic.setFile_data(file.getBytes());
			userPic.setFile_name(file.getOriginalFilename());
			userPic.setFile_size(file.getSize());
			picService.updatePic(userPic);
		}
		return "redirect:/user/"+user_id;
	}
	
}
