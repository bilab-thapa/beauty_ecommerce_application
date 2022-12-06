class OrderCart {
  final String? productId;
  final String? productName;
  final double? productPrice;
  final int? productQuantity;

  OrderCart({
    required this.productId,
    required this.productPrice,
    required this.productQuantity,
    required this.productName,
  });
}
