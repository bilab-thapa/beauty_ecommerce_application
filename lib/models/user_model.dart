class UserModel {
  String? userName;
  String? userEmail;
  String? userGender;
  String? userAddress;
  String? userId;
  String? userImage;
  String? role;

  UserModel(
      {this.userId,
      required this.userEmail,
      required this.userName,
      required this.userAddress,
      required this.userGender,
      this.userImage,
      this.role});
}
