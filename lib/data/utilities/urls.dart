class Urls {
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1';
  static const String registration = '$_baseUrl/registration';
  static const String login = '$_baseUrl/login';
  static const String createTask = '$_baseUrl/createTask';
  static const String newTask = '$_baseUrl/listTaskByStatus/New';
  static const String completeTask = '$_baseUrl/listTaskByStatus/Completed';
  static const String inProgressTask = '$_baseUrl/listTaskByStatus/InProgress';
  static const String cancelledTask = '$_baseUrl/listTaskByStatus/Cancelled';
  static const String taskStatusCount = '$_baseUrl/taskStatusCount';
  static const String updateProfile = '$_baseUrl/profileUpdate';
  static const String resetPassword = '$_baseUrl/RecoverResetPass';

  static String verifyEmail(String Email) =>
      '$_baseUrl/RecoverVerifyEmail/$Email';

  static String verifyOTP(String OTP) => '$_baseUrl/RecoverVerifyEmail/$OTP';

  static String deleteTask(String id) => '$_baseUrl/deleteTask/$id';

  static String updateTaskStatus(String status, String id) =>
      '$_baseUrl/updateTaskStatus/$id/$status';
}
