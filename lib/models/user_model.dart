class UserModel {
  final String userId;
  final String userName;
  final String userEmail;
  final String userLocation;
  final String userImageUrl;
  final List<String> userSavedJobs;

  new({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userLocation,
    required this.userImageUrl,
    required this.userSavedJobs,
  });
}
