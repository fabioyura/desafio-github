import 'package:equatable/equatable.dart';

class GitRep extends Equatable {
  final String name;
  final String description;
  final String userName;
  final String userAvatarURL;
  final String pullsURL;
  final int stars;
  final int forks;

  const GitRep({
    required this.name,
    required this.description,
    required this.userName,
    required this.userAvatarURL,
    required this.pullsURL,
    required this.stars,
    required this.forks,
  });

  @override
  List<Object?> get props =>
      [name, description, userName, userAvatarURL, pullsURL, stars, forks];
}
