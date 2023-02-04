import 'package:mocktail/mocktail.dart';
import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:core/layers/domain/repositories/i_pull_request_repository.dart';
import 'package:core/layers/data/models/pull_request_model.dart';

class PullRequestMockRepository extends Mock implements IPullRequestRepository {
}

PullRequest pullRequestMockEntity = const PullRequest(
  title: 'title',
  body: 'body',
  userName: 'userName',
  userAvatarURL: 'userAvatarURL',
  //createdAt: DateTime(2020),
);

PullRequestModel pullRequestMockModel = const PullRequestModel(
  title: 'title',
  body: 'body',
  userName: 'userName',
  userAvatarURL: 'userAvatarURL',
  //createdAt: DateTime(2020),
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
