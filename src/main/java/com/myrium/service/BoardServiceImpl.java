package com.myrium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.myrium.domain.BoardVO;
import com.myrium.domain.Criteria;
import com.myrium.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;


	@Override
	public BoardVO get(Long id) {
	      log.info("get....." + id);
	      return mapper.read(id);
	}


	@Override
	public boolean modify(BoardVO board) {
	     log.info("modify.... " + board);
	     return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long id) {
	     log.info("remove...." + id);
	     return mapper.delete(id)==1;
	}

	@Override
	public List<BoardVO> getList() {
		log.info("getList.....");
		return mapper.getList();
	}


	@Override
	public void register(BoardVO board) {
		log.info("register....." + board);
		mapper.insertSelectKey(board);
	}
	
	@Override
	public List<BoardVO> getList(Criteria cri){
		log.info("getList...(Criteria cri)");
		//return mapper.getList();
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info(mapper.getTotalCount(cri));
		return mapper.getTotalCount(cri);	}
}
