package samsung.spring.musicgram.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import samsung.spring.musicgram.dto.Pic;
import samsung.spring.musicgram.service.PicService;

@Controller
@RequestMapping(path = "/profile")
public class PicController {

	@Autowired
	private PicService picService;
	
	@PostMapping("/upload/{user_id}")
	public String addPic(@RequestParam("file") MultipartFile file, 
		@PathVariable("user_id") String user_id) throws IOException {
		Pic pic = new Pic();
		pic.setUser_id(user_id);
		pic.setFile_name(file.getOriginalFilename());
		pic.setFile_size(file.getSize());
		pic.setFile_data(file.getBytes());
		picService.addPic(pic);
		return "redirect:/content";
	}
	
	@RequestMapping("/{user_id}")
	public ResponseEntity<byte[]> getByteImage(@PathVariable("user_id") String user_id) {
	       byte[] imageContent = picService.getPic(user_id).getFile_data();
	       final HttpHeaders headers = new HttpHeaders();
	       headers.setContentType(MediaType.IMAGE_JPEG);
	       return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}
}
