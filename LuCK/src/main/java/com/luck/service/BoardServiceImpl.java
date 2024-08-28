package com.luck.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luck.domain.BoardAttachDTO;
import com.luck.domain.BoardDTO;
import com.luck.mapper.BoardAttachMapper;
import com.luck.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;  // 주입. setter의존성 주입
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper; //주입. setter의존성 주입
	
	@Override
	public List<BoardDTO> getList() {		
		return mapper.getList(); // mapper의 getList()호출
	}

	@Transactional
	@Override
	public void register(BoardDTO board) {
		
		//부모글 등록
		mapper.insertSelectKey(board);	
		//첨부파일이 없으면 중지
		if(board.getAttachList()==null || board.getAttachList().size()<=0) {
			return;
		}
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getBno());//부모글번호저장
			attachMapper.insert(attach); //첨부파일등록
		});
	}
	
	public BoardDTO get(Long bno) {		
		return mapper.read();
	}

	//정관수 시작 ------------------------------------------------
	@Transactional
	@Override
	public boolean update(BoardDTO dto) {	

		// 첨부파일을 모두삭제
		attachMapper.deleteAll(dto.getBno());
		
		//부모글 수정
		boolean updateResult=mapper.update(dto)==1;
		
		//첨부파일을 하나씩 insert
		if(updateResult && dto.getAttachList()!=null) {
			if(dto.getAttachList().size()>0) {
				dto.getAttachList().forEach(attach->{
					attach.setBno(dto.getBno());
					attachMapper.insert(attach);
				});
			}
		}
		return updateResult;
	}

	@Transactional
	@Override
	public boolean delete(Long bno) {
		//첨부파일삭제
		attachMapper.deleteAll(bno);
	
		return mapper.delete(bno)==1;
	}
	
	//실제파일 삭제
	public void deleteFiles(List<BoardAttachDTO> attachList) {
		//첨부파일이 없으면 중지
		if(attachList==null || attachList.size()==0) {
			return;
		}
		
		attachList.forEach(attach->{
			try {
				Path file=Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);//원본파일삭제
				//이미지이면
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail=Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
					Files.delete(thumbNail);//썸네일삭제
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		});
	}
	
	public List<BoardAttachDTO> getAttachList(Long bno) {		
		return attachMapper.findByBno(bno);
	}
	// 정관수 끝------------------------------------------------
}
