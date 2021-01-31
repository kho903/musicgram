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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import samsung.spring.musicgram.dto.Contents;
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
	public String getGenreContents(@RequestParam(name="genre") String genre, Model model) {
		//장르별로 검색했을때 메인 피드에 다시 뿌려줌
		List<Contents> genreContentsList = contentsService.getGenreContents(genre);
		model.addAttribute("contentList", genreContentsList);
		return "feed/mainFeed";
	}
	
	@GetMapping("/tag")
	public String getTagContents(@RequestParam(name="tag") String tag, Model model, @SessionAttribute("session_id") String user_id) {
		HashMap<Contents, Integer> resultMap = contentsService.getTagContents(tag, user_id);
		model.addAttribute("contentList", contentsService.getTagContents(tag, user_id));
		return "feed/mainFeed";
	}
	
	@GetMapping("/pressLike/{content_no}") //메인 피드에서 좋아요 누를 경우
	public String pressLike(@PathVariable(name="content_no") int content_no, @SessionAttribute("session_id") String user_id) {
		contentsService.pressLike(content_no, user_id);
		return "redirect:/content";
	}
	
	@PostMapping("/pressLike") // 좋아요 ajax
	@ResponseBody

	public HashMap<Integer, Integer> pressLike(@SessionAttribute("session_id") String user_id, HttpServletRequest request) {
		int content_no = Integer.parseInt(request.getParameter("content_no"));
		
		return contentsService.pressLike(content_no, user_id);
	}
	
	@GetMapping("pressLikeDetail/{content_no}") //상세 페이지에서 좋아요 누를 경우
	public String pressLikeDetail(@PathVariable(name="content_no") int content_no, @SessionAttribute("session_id") String user_id) {
		contentsService.pressLike(content_no, user_id);
		return "feed/detailFeed";
	}
	
	@GetMapping("/getLike/{content_no}")
	public String getLike(@PathVariable(name="content_no") int content_no, Model model) {
		int count = contentsService.getLike(content_no);
		model.addAttribute("likeCount", count);
		return "feed/mainFeed";
	}
	
	@GetMapping()
	public String getContents(ModelMap model, @SessionAttribute("session_id") String user_id) {
		model.addAttribute("contentList", contentsService.getContents(user_id));
		return "feed/mainFeed";
	}
	
	@GetMapping("/{content_no}")
	public String getContent(@PathVariable(name="content_no") int content_no, ModelMap model) {
		model.addAttribute("content", contentsService.getContent(content_no));
		model.addAttribute("comments", commentsService.getComments(content_no));
		return "feed/detailFeed";
	}
	
	@PostMapping("/upload")
	public String createContent(Contents content, HttpSession session) {
		try {
			String res = "";
			res = contentsService.createContent(content) == 1 ? "redirect:/content" : "redirect:/upload";
			return res;			
		}catch (DataIntegrityViolationException e) {
			session.setAttribute("errMsg", "빈칸을 채워주세요.");
			return "redirect:/upload.jsp";
		}
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
