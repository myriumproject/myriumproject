package com.myrium.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myrium.domain.OrderDTO;
import com.myrium.mapper.OrderMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderMapper orderMapper;

    @Override
    public List<OrderDTO> getOrderListByCustomerId(String customerId) {
        return orderMapper.findOrdersByCustomerId(customerId);
    }

	@Override
	public int insertOrders(OrderDTO orders) {
		
		return orderMapper.insertOrders(orders);
	}


	@Override
	public void insertOrdersProduct(int productid, Long orderId, Long userId, int quantity, String customerName, int payment) {
		
		orderMapper.insertOrdersProduct(productid, orderId, userId, quantity, customerName, payment);
	}


	@Override
	public void deletePurchaseCart(Long userId, int productid) {
		
		orderMapper.deletePurchaseCart(userId, productid);
	}
    
    // 교환/환불 데이터 조회 구현
    @Override
    public List<OrderDTO> getCanceledOrdersByCustomerId(String customerId) {
        return orderMapper.selectCanceledOrdersByCustomerId(customerId);
    }
    
    @Override
    public List<Map<String, Object>> countOrdersByStatus(String customerId) {
        return orderMapper.countOrdersByStatus(customerId);
    }
    
    @Override
    public int getTotalPaidOrderAmount(String customerId) {
        return orderMapper.getTotalPaidOrderAmount(customerId);
    }
    
    @Override
    public List<OrderDTO> getOrderDetail(Long orderId) {
        return orderMapper.findOrderDetailById(orderId);
    }
    
    @Override
    public int getValidOrderTotalAmount(Long orderId) {
        return orderMapper.getValidOrderTotalAmount(orderId);
    }
    
    //교환,환불버튼처리
    @Transactional
    @Override
    public void updateOrderStatus(Long orderId, int productId, int orderStatus) {
        // 1) 라인(상품) 상태만 바꾼다
        orderMapper.updateOrderStatus(orderId, productId, orderStatus);

        // 2) 주문 헤더는 '모든 라인 상태가 동일할 때만' 동기화 (부분취소 보호)
        int total = orderMapper.countOrderItems(orderId);
        int same  = orderMapper.countOrderItemsByStatus(orderId, orderStatus);
        if (total > 0 && same == total) {
            // 전부 같은 상태가 되었을 때만 헤더 상태를 맞춘다
            orderMapper.updateOrdersStatus(orderId, orderStatus);
        }
        // (선택) 전혀 바꾸고 싶지 않으면 위 if 블록 자체를 제거

        // 3) 교환/환불 플래그는 '하나라도 존재하면 1, 아니면 0'으로 집계
        //    (기존처럼 무조건 1로 세팅하면, 다른 라인 때문에 상태가 엇갈릴 때 불일치 발생)
        boolean hasExchange = orderMapper.existsItemWithStatus(orderId, 4); // 교환신청
        boolean hasRefund   = orderMapper.existsItemWithStatus(orderId, 6); // 반품신청
        orderMapper.updateExchangeFlag(orderId, hasExchange ? 1 : 0);
        orderMapper.updateRefundFlag(orderId, hasRefund ? 1 : 0);
    }
    
    //교환,환불 완료처리 주문상태변경
    @Override
    public void checkAndCompleteStatus(Long orderId) {
        // orders 테이블에서 현재 환불/교환 플래그 조회
        OrderDTO order = orderMapper.findOrderById(orderId);
        
        if (order.getIsRefundable() == 1) {
            orderMapper.completeRefundStatus(orderId);
        }
        if (order.getIsExchanged() == 1) {
            orderMapper.completeExchangeStatus(orderId);
        }
    }
  
  	@Override
	public int countOrdersToday(String today) {
		return orderMapper.countOrdersToday(today);
	}
  
	@Override
	public List<OrderDTO> productList(Long orderId) {
		return orderMapper.productList(orderId);
	}

	//상품리뷰
	@Override
	public OrderDTO getOrderProduct(Long orderId, int productId) {
	    return orderMapper.findProductInOrder(orderId, productId);
	}
	
	//주문상태변경
	@Override
	public List<OrderDTO> getOrdersToAutoUpdate() {
		 log.info(">>>> OrderService: getOrdersToAutoUpdate() 호출됨");
	    return orderMapper.findOrdersForStatusUpdate();
	}
	
	 @Override
	    @Transactional
	    public int autoConfirmAfter1Day() {
	        int changed = orderMapper.autoConfirmAfter1Day();
	        log.info("[OrderService] autoConfirmAfter1Day updated rows = " + changed);
	        return changed;
	    }
	
}