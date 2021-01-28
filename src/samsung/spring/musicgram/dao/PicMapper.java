package samsung.spring.musicgram.dao;

import org.apache.ibatis.annotations.Mapper;

import samsung.spring.musicgram.dto.Pic;
@Mapper
public interface PicMapper {
	public int addPic(Pic pic);
	public Pic getPic(String user_id);
	public int updatePic(Pic pic);
}
