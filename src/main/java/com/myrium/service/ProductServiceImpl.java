package com.myrium.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myrium.domain.ImgpathVO;
import com.myrium.domain.ProductDTO;
import com.myrium.domain.ProductVO;
import com.myrium.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productmapper;

	@Override
	public List<ProductVO> getProductList() {
		log.info("getList..");
		return productmapper.getProductList();
	}

	@Override
	public ImgpathVO getThumbnail(int productid) {
		log.info("getthumbnail..");
		return productmapper.getThumbnail(productid);
	}

	@Override
	public List<ProductDTO> getProductWithThumbnailList() {
		List<ProductVO> products = productmapper.getProductList();
		List<ProductDTO> productDTOs = new ArrayList<>();

		for (ProductVO product : products) {
			ImgpathVO thumbnail = productmapper.getThumbnail(product.getId());
			ProductDTO dto = new ProductDTO();
			dto.setProduct(product);
			dto.setThumbnail(thumbnail);
			productDTOs.add(dto);
		}
		return productDTOs;
	}

}
