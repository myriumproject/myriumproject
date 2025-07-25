package com.myrium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.myrium.domain.Criteria;
import com.myrium.domain.ReplyPageDTO;
import com.myrium.domain.ReplyVO;
import com.myrium.mapper.BoardMapper;
import com.myrium.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper mapper;
	private BoardMapper boardMapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("register....." + vo);
		boardMapper.updateReplyCnt(vo.getBno(), 1);  
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
	      log.info("get....." + rno);
	      return mapper.read(rno);
	}


	@Override
	public int modify(ReplyVO vo) {
	     log.info("modify.... " + vo);
	     return mapper.update(vo);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
	     log.info("remove...." + rno);
		ReplyVO vo = mapper.read(rno);
		boardMapper.updateReplyCnt(vo.getBno(), -1);
	     return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board " + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}
}



