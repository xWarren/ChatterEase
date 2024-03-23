class UserModel {
  final String image;
  final String fullName;
  final String? message;
  final bool? isActiveNow;
  final int? unreadMessage;
  final String? time;
  const UserModel({
    required this.image,
    required this.fullName,
    this.message,
    this.isActiveNow,
    this.unreadMessage,
    this.time,
  });
}