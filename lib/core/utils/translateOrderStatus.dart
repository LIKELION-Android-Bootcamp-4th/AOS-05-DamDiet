String translateOrderStatus(String status) {
  switch (status) {
    case 'pending':
      return '결제 완료';
    case 'confirmed':
      return '결제 확인 완료';
    case 'preparing':
      return '주문 상품 준비 중';
    case 'shipped':
      return '배송 시작';
    case 'cancelled':
      return '재고 부족으로 인한 취소';
    case 'refunded':
      return '고객 요청에 의한 환불';
    default:
      return '알 수 없음';
  }
}
