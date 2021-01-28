package samsung.spring.musicgram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import samsung.spring.musicgram.dao.PicMapper;
import samsung.spring.musicgram.dto.Pic;

@Service
public class PicService {

	@Autowired
	private PicMapper picMapper;

	public int addPic(Pic pic) {
		return picMapper.addPic(pic);
	}

	public Pic getPic(String user_id) {
		return picMapper.getPic(user_id);
	}

	public int updatePic(Pic pic) {
		return picMapper.updatePic(pic);
	}

}
