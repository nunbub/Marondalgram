package com.nunbub.marondalgram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public static final String FILE_UPLOAD_PATH = "C:\\Users\\Ryu\\OneDrive\\바탕 화면\\프로그래밍\\spring\\test\\marondalgram\\upload";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		
			// 서버에 저장할 위치를 잡아준다
			// 디렉토리(폴더) 생성
			// 사용자 id + 현재 시간을 디렉토리 이름으로 사용
			// UNIX TIME : 1970년 1월 1일을 기준으로 현재까지 흐른 시간 ( millisecond 1/1000 )
			// ex) 1_45651445145
			// C:\\Users\\Ryu\\OneDrive\\바탕 화면\\프로그래밍\\spring\\test\\memo\\upload\\1_45651445145\\asdf.jsp
			
			// /1_21354621/
			String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
			
			// 디렉토리 생성
			String filePath = FILE_UPLOAD_PATH + directoryName;
			File directory = new File(filePath);
			
			if(directory.mkdir() == false) {
				// 디렉토리 생성 실패
				// 디렉토리 생성 실패 로그 추가
				logger.error("FileManagerService - saveFile : file 디렉토리 생성 에러" + filePath);
				
				return null;
			}
			
			
			// 파일 저장
			try {
				byte[] bytes = file.getBytes();
				
				String fileFullPath = filePath + file.getOriginalFilename();
				Path path = Paths.get(fileFullPath);
				Files.write(path, bytes);
				
			} catch (IOException e) {
				
				e.printStackTrace();
				// 파일 저장 실패
				logger.error("FileManagerService - saveFile : 파일 저장 실패");
				return null;
				
			}
			
			// 클라이언트에서 접근 가능한 경로
			// C:\\Users\\Ryu\\OneDrive\\바탕 화면\\프로그래밍\\spring\\test\\memo\\upload 해당 디렉토리 아래 경로
			// /images/~
			
			return "/images" + directoryName + file.getOriginalFilename();
		
		
	}

}
