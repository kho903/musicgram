package samsung.spring.musicgram.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import samsung.spring.musicgram.dto.Comments;
import samsung.spring.musicgram.service.CommentsService;

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
		
		@GetMapping("/ajax/{content_no}")
		@ResponseBody 
		public List<Comments> getCommnets(HttpServletRequest request){
			int content_no = Integer.parseInt(request.getParameter("content_no"));
			List<Comments> commentList = commentsService.getComments(content_no);
			return commentList;
			
		}
		// 댓글 생성 
		@PostMapping("/create")
		@ResponseBody
		public Comments createComment(HttpServletRequest request, @SessionAttribute("session_id") String user_id, HttpSession session) {
			String res = "";
			
			int content_no = Integer.parseInt(request.getParameter("content_no"));
			String comment_text = request.getParameter("comment");
			
			Comments comment = new Comments();
			
			comment.setComment_text(comment_text);
			comment.setContent_no(content_no);
			comment.setUser_id(user_id);
			commentsService.createComment(comment);
			
			List<Comments> result = commentsService.getComments(content_no);
			session.setAttribute("session_id", user_id);
			
			return result.get(result.size()-1);
		}
		
		@PostMapping("/delete/ajax/{comment_no}")
		@ResponseBody
		public void deleteComment(HttpServletRequest request) {
			int comment_no = Integer.parseInt(request.getParameter("comment_no"));
			commentsService.deleteComment(comment_no);
		}
				
		// 댓글 삭제
		@GetMapping("/delete/{comment_no}&{content_no}")
		public String deleteComment(@PathVariable("comment_no") int comment_no, @PathVariable("content_no") int content_no, ModelMap model) {
			String res = "";
			res = commentsService.deleteComment(comment_no) == 1 ? "redirect:/content/"+content_no : "feed/commentFail";
			return res;
		}

}