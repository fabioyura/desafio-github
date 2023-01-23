import 'dart:convert';
import 'package:core/layers/domain/entities/pull_request.dart';

class PullRequestModel extends PullRequest {
  const PullRequestModel({
    required super.title,
    required super.body,
    required super.userName,
    required super.userAvatarURL,
    required super.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      "user": {'login': userName, 'avatar_url': userAvatarURL},
      'created_at': createdAt.millisecondsSinceEpoch,
    };
  }

  factory PullRequestModel.fromMap(Map<String, dynamic> map) {
    return PullRequestModel(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      userName: map['user']['login'] ?? '',
      userAvatarURL: map['user']['avatar_url'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PullRequestModel.fromJson(String source) =>
      PullRequestModel.fromMap(json.decode(source));
}
