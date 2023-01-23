import 'package:equatable/equatable.dart';

class PullRequest extends Equatable {
  final String title;
  final String body;
  final String userName;
  final String userAvatarURL;
  final DateTime createdAt;

  const PullRequest({
    required this.title,
    required this.body,
    required this.userName,
    required this.userAvatarURL,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [title, body, userName, userAvatarURL, createdAt];
}
