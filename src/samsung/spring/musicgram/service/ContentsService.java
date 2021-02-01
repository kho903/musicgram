package samsung.spring.musicgram.service;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

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

	public HashMap<Contents,Integer> getContents(String user_id) {
		
		List<Contents> contents = contentsMapper.getContents(); // 모든 게시물을 가져오고
		LinkedHashMap<Contents, Integer> resultMap = new LinkedHashMap<Contents, Integer>(); //리턴할 linkedhashmap 생성
		
		for(int i=0; i<contents.size(); i++) { //모든 게시물에 대해서 user가 좋아요를 눌렀는지 확인하기 위한 검사
			HashMap<String, Object> map = new HashMap<String, Object>(); // DB조회를 위한 map 생성
			int content_no = contents.get(i).getContent_no();
			map.put("content_no", content_no); //게시물 번호
			map.put("user_id", user_id); //user_id를 저장
			int result = likesMapper.isPressLike(map); //좋아요를 눌렀는지 확인. 좋아요를 눌렀으면 return 1, 아니면 return 0
			resultMap.put(contents.get(i),result); // 리턴할 linkedhashmap에 넣기.
		}
		return resultMap;
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

	public HashMap<Contents,Integer> getGenreContents(String genre, String user_id) {
		
		List<Contents> genreContents = contentsMapper.getGenreContents(genre);
		LinkedHashMap<Contents, Integer> resultMap = new LinkedHashMap<Contents, Integer>();
		
		for(int i=0; i<genreContents.size(); i++) { //getContent와 동일.
			HashMap<String, Object> map = new HashMap<String, Object>();
			int content_no = genreContents.get(i).getContent_no();
			map.put("content_no", content_no);
			map.put("user_id", user_id);
			int result = likesMapper.isPressLike(map);
			resultMap.put(genreContents.get(i),result);
		}
		
		return resultMap;
	}

	public HashMap<Contents,Integer> getTagContents(String tag, String user_id) {
		
		List<Contents> tagContents = contentsMapper.getTagContents(tag); // 태그로 검색한 게시물을 가져옴
		LinkedHashMap<Contents, Integer> resultMap = new LinkedHashMap<Contents, Integer>();
		
		for(int i=0; i<tagContents.size(); i++) { //getContent와 동일.
			HashMap<String, Object> map = new HashMap<String, Object>();
			int content_no = tagContents.get(i).getContent_no();
			map.put("content_no", content_no);
			map.put("user_id", user_id);
			int result = likesMapper.isPressLike(map);
			resultMap.put(tagContents.get(i),result);
		}
		return resultMap;
	}

	public int isPressLike(int content_no, String user_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("content_no", content_no);
		map.put("user_id", user_id);
		return likesMapper.isPressLike(map);
	}
	public HashMap<Integer, Integer> pressLike(int content_no, String user_id) { 

		int check = 0;
		HashMap<String, Object> map = new HashMap<String, Object>(); //DB조회를 위한 map 생성
		map.put("content_no", content_no);
		map.put("user_id", user_id);
		
		if(likesMapper.isPressLike(map) == 0) { //좋아요 안누른 경우 
			likesMapper.pressLike(map); // 유저가 해당 게시물의 좋아요를 눌렀다고 DB에 반영
			contentsMapper.pressLike(content_no); //해당 게시물 좋아요 수 증가.
			check = 1;
		}
		else { //좋아요 누른 경우
			likesMapper.cancelLike(map); //유저가 해당 게시물의 좋아요를 누른 정보 삭제.
			contentsMapper.cancelLike(content_no); // 해당 게시물 좋아요 수 감소.
		}
		int resultLike = contentsMapper.getLike(content_no); 
		HashMap<Integer, Integer> resultMap = new HashMap<Integer, Integer>();
		resultMap.put(resultLike, check); // 변경된 좋아요 수랑 바뀐 상태를 mainfeed에 전달 
		
		return resultMap;
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
	

	public int countContent(String user_id) {
		return contentsMapper.countContent(user_id);

	public List<Contents> infiniteScrollDown(Integer no){
		return  contentsMapper.infiniteScrollDown(no);

	}

}
