import 'package:app/helpers/helpers.dart';
import 'package:app/src/pages/pull_request_page.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:flutter/material.dart';

class GitRepListItem extends StatelessWidget {
  final GitRep rep;
  const GitRepListItem({Key? key, required this.rep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openScreen(context, PullRequestPage(rep: rep));
      },
      child: Card(
        child: Column(
          children: [
            Text('Nome: ${rep.name}'),
            Text('Descrição: ${rep.description}', maxLines: 1),
            Text('Nome de usuário: ${rep.userName}'),
            Text('Avatar URL: ${rep.userAvatarURL}'),
            Text('Stars: ${rep.stars}'),
            Text('Forks: ${rep.forks}'),
          ],
        ),
      ),
    );
  }
}
