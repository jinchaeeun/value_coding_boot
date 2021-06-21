package com.hustar.value_coding_boot.common;

import java.io.File;
import java.io.IOException;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hustar.value_coding_boot.vo.BoardFileVO;
import com.hustar.value_coding_boot.vo.BoardVO;

@Component
public class FileUtils {
	
	public List<BoardFileVO> parseFileInfo(BoardVO boardVO, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception, IOException {
		
		if(ObjectUtils.isEmpty(multipartHttpServletRequest)) {
			System.out.println("null!!");
			return null;
		}
		
		List<BoardFileVO> fileList = new ArrayList<BoardFileVO>();
		
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		// 현재 시간
		ZonedDateTime current = ZonedDateTime.now();
		
		// 파일 저장 경로
		String path = "uploadFile/" + current.format(format);
		
		// 파일 생성
		File file = new File(path);
		
		if(file.exists() == false) {
			file.mkdir();
		}
		
		// 여러개의 파일을 가져올 iterator
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		String newFileName, originalFileExtension, contentType;
		
		// 파일이 있으면
		while(iterator.hasNext()) {
			List<MultipartFile> list = multipartHttpServletRequest.getFiles(iterator.next());
			
			for(MultipartFile multipartFile : list) {
				if(multipartFile.isEmpty() == false) {
					
					// 파일의 확장자
					contentType = multipartFile.getContentType();
					
					if(ObjectUtils.isEmpty(contentType)) {
						break;
					}
					
					// 파일 이름을 현재 시간(nanoTime)과 확장자로 저장
					newFileName = Long.toString(System.nanoTime()) + "." + contentType;
					BoardFileVO boardFile = new BoardFileVO();
					
					// 파일 정보 세팅
					boardFile.setPo_num(boardVO.getPo_num());
					boardFile.setFi_filesize(multipartFile.getSize());
					boardFile.setFi_ori_filename(multipartFile.getOriginalFilename());
					boardFile.setFi_filepath(path + "/" + newFileName);
					
					// 파일 리스트에 파일 저장
					fileList.add(boardFile);
					
					file = new File(path + "/" + newFileName);
					multipartFile.transferTo(file);
				}
			}
		}
		
		return fileList;
	}
}
