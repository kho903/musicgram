package samsung.spring.musicgram.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import samsung.spring.musicgram.dto.Contents;
import samsung.spring.musicgram.service.ContentsService;

@Controller
@RequestMapping(path = "/content")
public class ContentsController {

	@Autowired
	private ContentsService contentsService;
	
	@GetMapping
	public String getContents(ModelMap model) {
		model.addAttribute("contentList", contentsService.getContents());
		return "feed/mainFeed";
	}
	
	@GetMapping("/{content_no}")
	public String getContent(@PathVariable(name="content_no") int content_no, ModelMap model) {
		model.addAttribute("content", contentsService.getContent(content_no));
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
