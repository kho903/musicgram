package samsung.spring.musicgram.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import samsung.spring.musicgram.dto.Comments;
import samsung.spring.musicgram.service.CommentsService;
import samsung.spring.musicgram.service.ContentsService;

@Controller 
@RequestMapping(path = "/comments")
public class CommentsController {
	
		@Autowired
		CommentsService commentsService;
		
		// 댓글 리스트
		@GetMapping("/{content_no}")
		public String getComments(@PathVariable(name="content_no") int content_no, ModelMap model) {
			List<Comments> commentList = commentsService.getComments(content_no);
			model.addAttribute("comments", commentList);
			return "feed/commentfeed";
		}
				
		// 댓글 생성 
		@PostMapping("/create")
		public String createComment(@ModelAttribute Comments comment) {
			String res = "";
			res = commentsService.createComment(comment) == 1 ?  "redirect:/content/" + comment.getContent_no(): "feed/commentFail";
			return res;
		}
		
				
		// 댓글 삭제
		@GetMapping("/delete/{comment_no}&{content_no}")
		public String deleteComment(@PathVariable("comment_no") int comment_no, @PathVariable("content_no") int content_no, ModelMap model) {
			String res = "";
			res = commentsService.deleteComment(comment_no) == 1 ? "redirect:/content/"+content_no : "feed/commentFail";
			return res;
		}

}