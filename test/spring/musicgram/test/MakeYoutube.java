package spring.musicgram.test;

import org.junit.Test;

public class MakeYoutube {
	//모바일 URL
	final String URL1 = "https://youtu.be/hoknJbAsOZY";
	//PC URL	
	final String URL2 = "https://www.youtube.com/watch?v=hoknJbAsOZY";
	//플레이리스트 URL
	final String URL3 = "https://www.youtube.com/watch?v=TgOu00Mf3kI&list=PLJSYV4jabims38bGHuwxo8GDVQ8VISdBX&index=3";
	
	String myParse = "https://www.youtube.com/embed/";
	
	@Test
	public void makingParsing() {
		youtubeTest(URL3);
	}
	
	public void youtubeTest(String url) {
		String parsing ="";
		
		if(url.contains("&")) {
			System.out.println("&있음");
			int f_index = url.indexOf("=");
			int l_index = url.indexOf("&");
			parsing = url.substring(f_index+1, l_index);
			
		} else if(url.contains("=")) {
			System.out.println("=있음");
			int index = url.indexOf("=");
			parsing = url.substring(index+1);
			
		} else {
			System.out.println("=없음");
			int index = url.lastIndexOf("/");
			parsing = url.substring(index+1);
		}
		
		myParse = myParse + parsing;
		System.out.println(myParse);

	}
}
