package com.myrium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myrium.domain.ProductVO;

@Mapper
public interface ProductMapper {
	public List<ProductVO> getList();
}

