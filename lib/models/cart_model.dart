class Cart {
  final String? productId;
  final String? productName;
  final double? productPrice;
  final String? image;
  final int? productQuantity;

  Cart(
      {required this.productId,
      required this.productPrice,
      required this.productQuantity,
      required this.productName,
      required this.image});
}
