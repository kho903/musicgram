package samsung.spring.musicgram.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import samsung.spring.musicgram.dao.CommentsMapper;
import samsung.spring.musicgram.dto.Comments;

@Service
public class CommentsService {
	@Autowired
	private CommentsMapper commentsMapper;

	public List<Comments> getComments(int content_no) {
		return commentsMapper.getComments(content_no);
	}

	public int deleteComment(int comment_no) {
		return commentsMapper.deleteComment(comment_no);
	}

	public int createComment(Comments comment) {
		return commentsMapper.createComment(comment);
	}

}
