package com.myrium.controller;

import java.util.List;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myrium.domain.MemberVO;
import com.myrium.domain.ProductDTO;
import com.myrium.security.domain.CustomUser;
import com.myrium.service.MemberService;
import com.myrium.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@RequiredArgsConstructor
public class PurchaseController {
	
	private final MemberService memberservice;
	private final ProductService productservice;
	
	@GetMapping("/purchasepage")
	public String goCart(Model model) {

		// 로그인한 사용자 id 가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUser userDetails = (CustomUser) authentication.getPrincipal();
		Long userId = userDetails.getMember().getId();
		
		// 사용자 정보 불러오기
		MemberVO memberInfo = memberservice.readById(userId);
		
		// 카트 정보 불러오기
		List<ProductDTO> cartList = productservice.CartList(userId);
		
		log.info(cartList);
		
		// 프론트로 정보 보내주기
		model.addAttribute("memberInfo", memberInfo);
		model.addAttribute("cartList", cartList);
		
		
		return "purchase/purchasePage";
	}
}
