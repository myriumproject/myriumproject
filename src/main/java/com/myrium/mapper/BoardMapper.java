package com.myrium.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import com.myrium.domain.BoardVO;
import com.myrium.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> getList();	
	public void insert(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public BoardVO read(Long id);
	public int delete(Long id);
	public int update(BoardVO board);
	
	public List<BoardVO> getListWithPaging(Criteria cn);
	
	public int getTotalCount(Criteria cri);
	
	public List<BoardVO> searchTest(Map<String, Map<String, String>> map);
	
	public void updateReplyCnt(@Param("id") Long id, @Param("amount") int amount);

}
