package samsung.spring.musicgram.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import samsung.spring.musicgram.dto.Comments;

@Mapper
public interface CommentsMapper {
	public List<Comments> getComments(int content_no);
	public int deleteComment(int content_no);
	public int createComment(Comments comment);
}