package samsung.spring.musicgram.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import samsung.spring.musicgram.service.PicService;

@Controller
@RequestMapping(path = "/profile")
public class PicController {

	@Autowired
	private PicService picService;
	
	@PostMapping("/upload")
	public String addPic(@RequestParam("file") MultipartFile file) throws IOException {
		System.out.println(file.getName()); // 파일의 파라미터 이름 
		System.out.println(file.getSize()); // 파일의 사이즈 
		System.out.println(file.getOriginalFilename()); // 파일의 실제 이름 
		byte[] data = file.getBytes(); // 파일실제 내용

		return "";
	}
}
