package com.myrium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.myrium.domain.OrderDTO;

public interface OrderMapper {
	List<OrderDTO> findOrdersByCustomerId(String customerId);

	int insertOrders(OrderDTO orders);

	void insertOrdersProduct(@Param("productid") int productid, @Param("orderId") Long orderId,
			@Param("userId") Long userId, @Param("quantity") int quantity, @Param("customerName") String customerName);

	void deletePurchaseCart(@Param("userId") Long userId, @Param("productid") int productid);
}
