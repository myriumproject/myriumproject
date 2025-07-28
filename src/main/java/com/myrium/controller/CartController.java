package com.myrium.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
@RequiredArgsConstructor
public class CartController {
	
	@GetMapping("/cart")
	public String goCart() {

		return "purchase/cart";
	}
	
	@PostMapping("/cart")
	public String inCrat(){
	
		return "purchase/cart";
	}
}
