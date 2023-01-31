import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:core/layers/domain/entities/git_rep.dart';

class GitRepModel extends GitRep {
  const GitRepModel({
    required super.name,
    required super.description,
    required super.userName,
    required super.userAvatarURL,
    required super.pullsURL,
    required super.stars,
    required super.forks,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "description": description,
      "owner": {"login": userName, "avatar_url": userAvatarURL},
      "pulls_url": pullsURL,
      "stargazers_count": stars,
      "forks_count": forks,
    };
  }

  factory GitRepModel.fromMap(Map<String, dynamic> map) {
    return GitRepModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      userName: map['owner']['login'] ?? '',
      userAvatarURL: map['owner']['avatar_url'] ?? '',
      pullsURL: map['pulls_url'],
      stars: map['stargazers_count']?.toInt() ?? 0,
      forks: map['forks_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GitRepModel.fromJson(String source) =>
      GitRepModel.fromMap(json.decode(source));

  Future<dynamic> fetchData() async {
    final response = await http.get(Uri.parse(pullsURL));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
