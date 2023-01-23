import 'package:mocktail/mocktail.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:core/layers/domain/repositories/i_git_rep_repository.dart';
import 'package:core/layers/data/models/git_rep_model.dart';

class GitRepMockRepository extends Mock implements IGitRepRepository {}

GitRep gitRepMockEntity = const GitRep(
  name: 'LeetCodeAnimation',
  description:
      'Demonstrate all the questions on LeetCode in the form of animation.（用动画的形式呈现解LeetCode题目的思路）',
  userName: 'MisterBooo',
  userAvatarURL: 'https://avatars.githubusercontent.com/u/15308811?v=4',
  pullsURL:
      'https://api.github.com/repos/MisterBooo/LeetCodeAnimation/pulls{/number}',
  stars: 1,
  forks: 1,
);

GitRepModel gitRepMockModel = const GitRepModel(
  name: 'LeetCodeAnimation',
  description:
      'Demonstrate all the questions on LeetCode in the form of animation.（用动画的形式呈现解LeetCode题目的思路）',
  userName: 'MisterBooo',
  userAvatarURL: 'https://avatars.githubusercontent.com/u/15308811?v=4',
  pullsURL:
      'https://api.github.com/repos/MisterBooo/LeetCodeAnimation/pulls{/number}',
  stars: 1,
  forks: 1,
);

gitRepMockToMap() {
  return {
    "name": "LeetCodeAnimation",
    "description":
        "Demonstrate all the questions on LeetCode in the form of animation.（用动画的形式呈现解LeetCode题目的思路）",
    "owner": {
      "login": "MisterBooo",
      "avatar_url": "https://avatars.githubusercontent.com/u/15308811?v=4"
    },
    "pulls_url":
        "https://api.github.com/repos/MisterBooo/LeetCodeAnimation/pulls{/number}",
    "starsgazers_count": 1,
    "forks_count": 1
  };
}

const gitRepMockFromJson = """
{
  "name" : "LeetCodeAnimation",
  "description" : "Demonstrate all the questions on LeetCode in the form of animation.（用动画的形式呈现解LeetCode题目的思路）",
  "owner": 
    {
      "login" : "MisterBooo",
      "avatar_url" : "https://avatars.githubusercontent.com/u/15308811?v=4"
    },
  "pulls_url": "https://api.github.com/repos/MisterBooo/LeetCodeAnimation/pulls{/number}",
  "starsgazers_count" : 1,
  "forks_count" : 1
}
""";
