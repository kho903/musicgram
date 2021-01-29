package samsung.spring.musicgram.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import samsung.spring.musicgram.dto.Comments;
import samsung.spring.musicgram.service.CommentsService;

@Controller 
@RequestMapping(path = "/comments")
public class CommentsController {
	
		@Autowired
		CommentsService commentsService;
		
		// 댓글 리스트
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
			res = commentsService.createComment(comment) == 1 ?  "redirect:/comments/" + comment.getContent_no(): "feed/commentFail";
			return res;
		}
		
				
		// 댓글 삭제
		@GetMapping("/delete/{comment_no}")
		public String deleteComment(@PathVariable("comment_no") int comment_no, ModelMap model) {
			String res = "";
			res = commentsService.deleteComment(comment_no) == 1 ? "redirect:/comments/1" : "feed/commentFail";
			return res;
		}
				
		


		
}