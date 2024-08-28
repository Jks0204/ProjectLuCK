package com.luck.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.luck.domain.AttachFileDTO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j

public class UploadController {
	//테스트용 업로드폼
	@GetMapping("/uploadForm")
	public void uploadForm() {}	
	
	//파일업로드처리
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile,Model mode) {
		//업로드폴더
		String uploadFolder="c:\\upload";
		//다중파일 처리
		for(MultipartFile multipartFile : uploadFile) {
			log.info("----------------------------------------");
			log.info("Upload File Name : "+multipartFile.getOriginalFilename());
			log.info("Upload File Size: "+multipartFile.getSize());
			
			//파일객체생성
			File saveFile=new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);//업로드파일저장
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	//Ajax 파일업로드 테스트 화면
	@GetMapping("/uploadAjax")
	public void uploadAjax() {}
	
	//오늘 날짜 년월일 형식(2024\08\14)을 구하는 함수. 이함수는 Service에 작성하거나 common 패키지에 클래스를 만들어서 사용 권장
	private String getFolder() {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date date=new Date();
		String str=sdf.format(date);
		return str.replace("-", File.separator); //윈도우즈는 File.seperator가 '\'이다.
	}
	
	//첨부파일이 이미지인지 체크
	private boolean checkImageType(File file) {
		try {
			String contentType=Files.probeContentType(file.toPath());
			System.out.println("contentType :"+contentType);
			return contentType.startsWith("image");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
		
	//Ajax 파일업로드 처리
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/uploadAjaxAction",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		//첨부파일목록
		List<AttachFileDTO> list=new ArrayList<>();
		
		//업로드폴더
		String uploadFolder="c:\\upload";
		
		//오늘날짜경로
		String uploadFolderPath=getFolder();
		
		//오늘날짜 폴더 생성
		File uploadPath=new File(uploadFolder,uploadFolderPath);
		if(uploadPath.exists()==false) { //폴더가 존재하지 않으면
			uploadPath.mkdirs(); // 2024\08\14 계층형으로 폴더가 연속 생성됨.
		}	
		
		//다중파일 처리
		for(MultipartFile multipartFile : uploadFile) {
			//AttachFileDTO객체생성
			AttachFileDTO attachDTO=new AttachFileDTO();
			
			String uploadFileName=multipartFile.getOriginalFilename();
			
			attachDTO.setFileName(uploadFileName);//파일명
			
			//UUID생성
			UUID uuid=UUID.randomUUID();			
			uploadFileName=uuid.toString()+"_"+uploadFileName;			
			
			//파일객체생성
			File saveFile=new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);//업로드파일저장
				
				attachDTO.setUuid(uuid.toString());//UUID
				attachDTO.setUploadPath(uploadFolderPath);//upload path				
				
				//첨부파일이 이미지이면 썸네일생성
				if(checkImageType(saveFile)) {
					
					attachDTO.setImage(true); // image여부
					
					FileOutputStream thumbnail=new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);//원본비율에 맞게 생성됨.
					thumbnail.close();
				}
				
				//list에 추가
				list.add(attachDTO);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	//이미지 출력
	@GetMapping("/display")
	@ResponseBody // view로 forwarding되지 않음.리턴값이 json or xml or text 등등.
	public ResponseEntity<byte[]> getFiles(String fileName){
		File file=new File("c:\\upload\\"+fileName);
		ResponseEntity<byte[]> result=null;
		
		try {
			HttpHeaders header=new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;		
	}
	
	//파일삭제
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName,String type){
		File file;
		try {
			// 썸네일 or 일반파일
			file=new File("c:\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
			
			file.delete();//파일삭제
			
			//이미지이면 원본이미지파일도 삭제
			if(type.equals("image")) {
				String largeFileName=file.getAbsolutePath().replace("s_", "");//원본이미지파일구하기
				file=new File(largeFileName);
				file.delete();//파일삭제
			}
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
	
	
	
	
	
	

}
