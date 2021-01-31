package samsung.spring.musicgram.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import samsung.spring.musicgram.dao.ContentsMapper;
import samsung.spring.musicgram.dao.LikesMapper;
import samsung.spring.musicgram.dto.Contents;

@Service
public class ContentsService {

	@Autowired
	private ContentsMapper contentsMapper;
	
	@Autowired
	private LikesMapper likesMapper;

	public Contents getContent(int content_no) {
		return contentsMapper.getContent(content_no);
	}

	public List<Contents> getContents() {
		return contentsMapper.getContents();
	}

	public int deleteContent(int content_no) {
		return contentsMapper.deleteContent(content_no);
	}

	public int updateContent(Contents content) {
		return contentsMapper.updateContent(content);
	}

	public int createContent(Contents content) {
		content.setYoutube_url(getYoutubeParse(content.getYoutube_url()));
		return contentsMapper.createContent(content);
	}

	public int getLike(int content_no) {
		return contentsMapper.getLike(content_no);
	}

	public List<Contents> getGenreContents(String genre) {
		return contentsMapper.getGenreContents(genre);
	}

	public List<Contents> getTagContents(String tag) {
		return contentsMapper.getTagContents(tag);
	}

	public int isPressLike(int content_no, String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content_no", content_no);
		map.put("user_id", user_id);
		return likesMapper.isPressLike(map);
	}
	public int pressLike(int content_no, String user_id) { 
		//사용자가 좋아요를 눌렀을 때, 이전에 좋아요를 눌렀던 게시물인지 아닌지 확인하고
		//좋아요를 안누른 게시물이였을 경우에 likes 테이블에 정보 추가, contents	테이블에 해당 content의 좋아요 갯수 올리기
		//좋아요를 누른 게시물이였을때는 안함
		//최종적으로 jsp에 좋아요 카운트 정보 뿌리기 위해서 getlike값 리턴.
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content_no", content_no);
		map.put("user_id", user_id);
		if(likesMapper.isPressLike(map) == 0) { //좋아요 안누른 경우 
			likesMapper.pressLike(map);
			contentsMapper.pressLike(content_no);
		}
		return contentsMapper.getLike(content_no);
	}

	public int cancelLike(int content_no,  String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content_no", content_no);
		map.put("user_id", user_id);
		if(likesMapper.isPressLike(map) == 1) { //좋아요를 눌렀을 경우 
			likesMapper.cancelLike(map);
			contentsMapper.cancelLike(content_no);
		}
		return contentsMapper.getLike(content_no);
	}

	
	public static String getYoutubeParse(String url) {
		
		String parsing = "";
		
		if(url.contains("&")) {
			int f_index = url.indexOf("=");
			int l_index = url.indexOf("&");
			parsing = url.substring(f_index+1, l_index);
			
		} else if(url.contains("=")) {
			int index = url.indexOf("=");
			parsing = url.substring(index+1);
			
		} else {
			int index = url.lastIndexOf("/");
			parsing = url.substring(index+1);
		}
		
		return parsing;
	}


	public List<Contents> getUserContent(String user_id) {
		return contentsMapper.getUserContent(user_id);
	}

}
