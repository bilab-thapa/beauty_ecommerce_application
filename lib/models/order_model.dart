class OrderModel {
  String? firstName;
  String? lastName;
  String? city;
  String? address;
  String? phoneNumber;
  double total;
  String? status;
  List<dynamic> orders;
  var timestamp;

  OrderModel({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.address,
    required this.phoneNumber,
    required this.total,
    required this.orders,
    required this.status,
    required this.timestamp,
  });
}
