package samsung.spring.musicgram.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import samsung.spring.musicgram.dto.Contents;

@Mapper
public interface ContentsMapper {
	public Contents getContent(int content_no);
	public List<Contents> getContents();
	public int deleteContent(int content_no);
	public int updateContent(Contents content);
	public int createContent(Contents content);
	public int getLike(int content_no);
	public List<Contents> getGenreContents(String genre);
	public List<Contents> getTagContents(String tag);
	public int pressLike(int content_no);
	public int cancelLike(int content_no);
	public List<Contents> getUserContent(String user_id);
	public int countContent(String user_id);
	public List<Contents> infiniteScrollDown(Integer no);
	public Contents getContentLoad(int content_no);
	public int getMaxContentNo();
}
