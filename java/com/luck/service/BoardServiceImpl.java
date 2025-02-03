package com.luck.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luck.domain.BoardAttachDTO;
import com.luck.domain.BoardDTO;
import com.luck.domain.Criteria;
import com.luck.mapper.BoardAttachMapper;
import com.luck.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;  // 주입. setter의존성 주입
	
	@Setter(onMethod_=@Autowired)
	private BoardAttachMapper attachMapper; //주입. setter의존성 주입
	

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
	
	//김재혁 시작------------------------------------------------
	@Override
	public BoardDTO get(Long bno) {
		BoardDTO board = mapper.read(bno);
	    board.setAttachList(attachMapper.findByBno(bno));
	    return board;
	}
	
	//정관수 if문 추가
	@Override
	public List<BoardDTO> getList(Criteria cri) {
		List<BoardDTO> list = new ArrayList<>();
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+cri.getCategory());
		if(cri.getCategory()==null||cri.getCategory()=="") {
			list = mapper.getListWithPaging(cri);
		} else {
			list = mapper.getListWithCategory(cri);
		}
		list.forEach(board -> {
	        board.setAttachList(attachMapper.findByBno(board.getBno()));
	    });
	    return list;
	}
	
	@Override
	public int plus(Long bno) {
		return mapper.updateViewCount(bno);
	}
	//김재혁 끝 ------------------------------------------------
	
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
	
	public int getCategoryCount(Criteria cri) {
		return mapper.getCategoryCount(cri);
	}
	
	@Override
	public List<BoardDTO> getSideBar() {
		List<BoardDTO> list = new ArrayList<>();
		list = mapper.getSideBar();
		list.forEach(board -> {
	        board.setAttachList(attachMapper.findByBno(board.getBno()));
	    });
		return list;
	}
	// 정관수 끝------------------------------------------------
	
	
	//민 추가
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardDTO> getList() {
		return null;
	}




//	@Override
//	public List<BoardDTO> getList(Criteria cri) {
//		if (cri.getCategory()!=null) {
//			return mapper.getListWithCategory(cri);
//		}
//		return mapper.getListWithPaging(cri);
//	}
	// 민끝
}
