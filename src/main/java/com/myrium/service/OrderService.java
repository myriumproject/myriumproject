package com.myrium.service;

import java.util.List;

import com.myrium.domain.OrderDTO;

public interface OrderService {

	List<OrderDTO> getOrderListByCustomerId(String customerId);

	int insertOrders(OrderDTO orders);

	void insertOrdersProduct(int productid, Long orderId, Long userId, int quantity, String customerName);

	void deletePurchaseCart(Long userId, int productid);

}
