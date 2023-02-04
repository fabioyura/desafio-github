import 'package:app/helpers/helpers.dart';
import 'package:app/helpers/ts.dart';
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
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4,
        child: Card(
          child: Row(
            children: [
              Column(
                children: [
                  Text('Nome: ${rep.name}', style: ts.title),
                  Text(
                    'Descrição: ${rep.description}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: ts.body,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.share, color: Colors.amber),
                      Text('Forks: ${rep.forks}', style: ts.icon),
                      Row(
                        children: [
                          const Icon(Icons.grade, color: Colors.amber),
                          Text('Stars: ${rep.stars}', style: ts.icon),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Image.network(rep.userAvatarURL),
                  Text('Nome de usuário: ${rep.userName}', style: ts.user),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
