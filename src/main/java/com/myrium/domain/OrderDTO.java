package com.myrium.domain;

import lombok.Data;

@Data
public class OrderDTO {
		private Long id; // 시퀀스 아이디
	    private String customerId; // 고객 아이디
	    private String receiver; // 성함
	    private String phoneNumber; // 핸드폰 번호
	    private String address; // 주소
	    private String orderId; // 주문번호 (20250804-00000001)
	    private String orderDate; // 주문한 날짜
	    private String productName; // 상품 이름
	    private int productPrice; // 상품 가격
	    private int quantity; // 상품 수량
	    private String orderStatus; // 주문 상태
	    private String zipcode; // 우편 주소
	    private Long userId; // 유저 아이디 
	    private String title; // 제목
	    private String content; // 내용
	    private String message; // 상품요청사항
	    private String payment; // 결제
	    
	}
