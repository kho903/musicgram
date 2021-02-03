package samsung.spring.musicgram.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.UncategorizedSQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import samsung.spring.musicgram.dto.Contents;
import samsung.spring.musicgram.dto.Likes;
import samsung.spring.musicgram.service.CommentsService;
import samsung.spring.musicgram.service.ContentsService;

@Controller
@RequestMapping(path = "/content")
public class ContentsController {

	@Autowired
	private ContentsService contentsService;
	@Autowired
	private CommentsService commentsService;
		
	@GetMapping("/genre")
	public String getGenreContents(@RequestParam(name="genre") String genre, Model model, @SessionAttribute("session_id") String user_id, HttpSession session) {
		//장르별로 검색했을때 메인 피드에 다시 뿌려줌
		HashMap<Contents, Integer> resultMap = contentsService.getGenreContents(genre, user_id);
		session.setAttribute("maxContNo", contentsService.getMaxContentNo());
		session.setAttribute("page", "genre");
		session.setAttribute("genre", genre);
		model.addAttribute("contentList", resultMap);
		return "feed/mainFeed";
	}
	
	@GetMapping("/moreLoad")
	@ResponseBody
	public HashMap<String, Object> getContentLoad(@SessionAttribute("maxContNo") int maxContNo, HttpSession session,
			@SessionAttribute("page") String page,
			@SessionAttribute(value = "genre", required=false) String genre, @SessionAttribute(value = "tag", required=false) String tag) {
		int contentNo = maxContNo;
		Contents cont = new Contents();
		if(page.equals("main")) {
			do {
				cont = contentsService.getContentLoad(contentNo);
				contentNo--;
			} while (cont == null);
		}else if(page.equals("genre")) {
			do {
				cont = contentsService.getContentLoad(contentNo);
				System.out.println(cont.getGenre());
				contentNo--;
			} while (cont == null || cont.getGenre() != genre);
		}else if(page.equals("tag")) {
			do {
				cont = contentsService.getContentLoad(contentNo);
				contentNo--;
			} while (cont == null || cont.getTag() != tag);
		}
		
		Likes like = new Likes();
		like.setContent_no(cont.getContent_no());
		like.setUser_id((String) session.getAttribute("session_id"));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content", cont);
		map.put("isLike", contentsService.isLikeOn(like));
		session.setAttribute("maxContNo", contentNo);
		return map;
	}
	
	@GetMapping("/tag")
	public String getTagContents(@RequestParam(name="tag") String tag, Model model, @SessionAttribute("session_id") String user_id, HttpSession session) {
		HashMap<Contents, Integer> resultMap = contentsService.getTagContents(tag, user_id);
		session.setAttribute("maxContNo", contentsService.getMaxContentNo());
		session.setAttribute("page", "tag");
		session.setAttribute("tag", tag);
		model.addAttribute("tag", tag);
		model.addAttribute("contentList", resultMap);
		return "feed/mainFeed";
	}

	
	@PostMapping("/pressLike") // 좋아요 ajax
	@ResponseBody
	public HashMap<Integer, Integer> pressLike(@SessionAttribute("session_id") String user_id, HttpServletRequest request) {
		int content_no = Integer.parseInt(request.getParameter("content_no"));
		return contentsService.pressLike(content_no, user_id);
	}
	
	@GetMapping("/getLike/{content_no}")
	public String getLike(@PathVariable(name="content_no") int content_no, Model model) {
		int count = contentsService.getLike(content_no);
		model.addAttribute("likeCount", count);
		return "feed/mainFeed";
	}
	
	@GetMapping()
	public String getContents(ModelMap model, @SessionAttribute(value="session_id", required=false) String user_id, HttpSession session) {
		try {
			model.addAttribute("contentList", contentsService.getContents(user_id));
			session.setAttribute("maxContNo", contentsService.getMaxContentNo());
			session.setAttribute("page", "main");
		} catch (Exception e) {
			return "redirect:user/loginForm";
		}
		return "feed/mainFeed";
	}
	
	@RequestMapping(value="/{content_no}" , method = {RequestMethod.GET, RequestMethod.POST})
	public String getContent(@PathVariable(name="content_no") int content_no, ModelMap model, @SessionAttribute(value="session_id", required=false) String user_id) {
		model.addAttribute("content", contentsService.getContent(content_no));
		model.addAttribute("comments", commentsService.getComments(content_no));
		model.addAttribute("checkPressLike", contentsService.isPressLike(content_no, user_id));
		
		return "feed/detailFeed";
	}
	
	@PostMapping("/upload")
	public String createContent(Contents content, HttpSession session) {
			String res = "";
			res = contentsService.createContent(content) == 1 ? "redirect:/content" : "redirect:/upload";
			return res;			
	}
	
	@GetMapping("/update/{content_no}")
	public String updateContent(@PathVariable(name="content_no") int content_no, ModelMap model) {
		model.addAttribute("content", contentsService.getContent(content_no));
		return "feed/updateFeed";
	}
	
	@PostMapping("/update")
	public String updateContent(Contents content, HttpSession session) {
		try {
			String res = "";
			res = contentsService.updateContent(content) == 1 ? "redirect:/content" : "feed/uploadFail";
			return res;
		}catch (UncategorizedSQLException e) {
			session.setAttribute("errMsg", "빈칸을 채워주세요.");
			return "redirect:/content/update/" + content.getContent_no();
		}

	}
	
	@GetMapping("/delete/{content_no}")
	public String deleteContent(@PathVariable(name="content_no") int content_no, ModelMap model) {
		String res = "";
		res = contentsService.deleteContent(content_no) == 1 ? "redirect:/content" : "feed/uploadFail";
		return res;
	}
	
}