
class ApiInfo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const ApiInfo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ApiInfo.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
        'completed': bool completed,
      } =>
        ApiInfo(
          userId: userId,
          id: id,
          title: title,
          completed: completed,
        ),
      _ => throw const FormatException('Failed to load ApiInfo.'),
    };
  }
}
