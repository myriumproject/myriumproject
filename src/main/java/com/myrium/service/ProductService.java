package com.myrium.service;

import java.util.List;

import com.myrium.domain.ImgpathVO;
import com.myrium.domain.ProductDTO;
import com.myrium.domain.ProductVO;


public interface ProductService {
	public List<ProductDTO> getProductWithThumbnailList();

}
