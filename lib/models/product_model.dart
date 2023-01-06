class Product {
  final String productName;
  final double productPrice;
  final String productImage;
  final String productCategory;
  String? productId;
  final String productDesc;
  final String? videoUrl;
  final String special;

  Product(
      {required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productCategory,
      required this.productDesc,
      this.productId,
      required this.videoUrl,
      required this.special});
}
