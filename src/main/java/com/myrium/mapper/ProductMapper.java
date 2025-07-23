package com.myrium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myrium.domain.ImgpathVO;
import com.myrium.domain.ProductVO;

// 작성자 : 노기원
// 작성일 : 2025.07.23 13:04
// 내용 : 상품 목록 불러오기 및 product_id 일치하는 썸네일 불러오기
@Mapper
public interface ProductMapper {
	
	// 사장님의 선택 카테고리 목록 불러오기
	public List<ProductVO> getceoPickList();
	
	// 썸네일 불러오기
	public ImgpathVO getThumbnail(int productid);
	
}

