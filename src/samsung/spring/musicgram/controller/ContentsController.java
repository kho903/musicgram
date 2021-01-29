package samsung.spring.musicgram.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
	@GetMapping("/genre/{genre}")
	public String getGenreContents(@PathVariable(name="genre") String genre, Model model) {
		//장르별로 검색했을때 메인 피드에 다시 뿌려줌
		List<Contents> genreContentsList = contentsService.getGenreContents(genre);
		model.addAttribute("genreContentsList", genreContentsList);
		return "feed/mainFeed";
	}
	
	@GetMapping("/tag/{tag}")
	public String getTagContents(@PathVariable(name="tag") String tag, Model model) {
		List<Contents> tagContentsList = contentsService.getTagContents(tag);
		model.addAttribute("tagContentsList", tagContentsList);
		return "feed/mainFeed";
	}
	
	@GetMapping("/pressLike/{content_no}") //메인 피드에서 좋아요 누를 경우
	public String pressLike(@PathVariable(name="content_no") int content_no) {
		contentsService.pressLike(content_no);
		return "feed/mainFeed";
	}
	
	@GetMapping("pressLikeDetail/{content_no}") //상세 페이지에서 좋아요 누를 경우
	public String pressLikeDetail(@PathVariable(name="content_no") int content_no) {
		contentsService.pressLike(content_no);
		return "feed/detailFeed";
	}
	
	@GetMapping("/cancelLike/{content_no}") //메인 피드에서 좋아요 누를 경우
	public String cancelLike(@PathVariable(name="content_no") int content_no) {
		contentsService.cancelLike(content_no);
		return "feed/mainFeed";
	}
	
	@GetMapping("/cancelLikeDetail/{content_no}") //메인 피드에서 좋아요 누를 경우
	public String cancelLikeDetail(@PathVariable(name="content_no") int content_no) {
		contentsService.cancelLike(content_no);
		return "feed/detailFeed";
	}
	
	@GetMapping("/getLike/{content_no}")
	public String getLike(@PathVariable(name="content_no") int content_no, Model model) {
		int count = contentsService.getLike(content_no);
		model.addAttribute("likeCount", count);
		return "feed/mainFeed";
	}
	
	@GetMapping()
	public String getContents(ModelMap model) {
		model.addAttribute("contentList", contentsService.getContents());
		return "feed/mainFeed";
	}
	
	@GetMapping("/{content_no}")
	public String getContent(@PathVariable(name="content_no") int content_no, ModelMap model) {
		model.addAttribute("content", contentsService.getContent(content_no));
		model.addAttribute("comments", commentsService.getComments(content_no));
		return "feed/detailFeed";
	}
	
	@PostMapping("/upload")
	public String createContent(Contents content) {
		String res = "";
		res = contentsService.createContent(content) == 1 ? "redirect:/content" : "feed/uploadFail";
		return res;
	}
	
	@GetMapping("/update/{content_no}")
	public String updateContent(@PathVariable(name="content_no") int content_no, ModelMap model) {
		model.addAttribute("content", contentsService.getContent(content_no));
		return "feed/updateFeed";
	}
	
	@PostMapping("/update")
	public String updateContent(Contents content) {
		String res = "";
		res = contentsService.updateContent(content) == 1 ? "redirect:/content" : "feed/uploadFail";
		return res;
	}
	
	@GetMapping("/delete/{content_no}")
	public String deleteContent(@PathVariable(name="content_no") int content_no, ModelMap model) {
		String res = "";
		res = contentsService.deleteContent(content_no) == 1 ? "redirect:/content" : "feed/uploadFail";
		return res;
	}
	
}
