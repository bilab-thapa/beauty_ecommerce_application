class Orders {
  final String? productName;
  final double? productPrice;
  final String? image;
  final int? productQuantity;
  double? totalPrice;

  Orders(
      {required this.productName,
      required this.productPrice,
      required this.image,
      required this.productQuantity,
      required this.totalPrice});
}
