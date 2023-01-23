import 'package:core/layers/data/models/pull_request_model.dart';

PullRequestModel pullRequestMockModel = PullRequestModel(
  title: 'title',
  body: 'body',
  userName: 'userName',
  userAvatarURL: 'userAvatarURL',
  createdAt: DateTime(2020),
);

Map pullRequestMockToMap() {
  return {
    "title": "title",
    "body": "body",
    "user": {"login": "userName", "avatar_url": "userAvatarURL"},
    "created_at": DateTime(2020).millisecondsSinceEpoch
  };
}

const pullRequestMockFromJson = """
{
  "title": "title",
  "body": "body",
  "user": 
  {
    "login": "userName",
    "avatar_url": "userAvatarURL"
  },
  "created_at": 1577847600000
}
""";
