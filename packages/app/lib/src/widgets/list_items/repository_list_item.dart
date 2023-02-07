import 'package:app/helpers/helpers.dart';
import 'package:app/helpers/ts.dart';
import 'package:app/src/pages/pull_request_page.dart';
import 'package:app/src/widgets/abstract_card.dart';
import 'package:app/src/widgets/star_fork_widget.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:flutter/material.dart';

class RepositoryListItem extends StatelessWidget {
  final GitRep rep;
  const RepositoryListItem({Key? key, required this.rep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openScreen(context, PullRequestPage(rep: rep));
      },
      child: AbstractCard(
        userName: rep.userName,
        avatar: rep.userAvatarURL,
        children: [
          Text(rep.name, style: ts.title),
          Text(
            rep.description,
            maxLines: 3,
            style: ts.body,
            overflow: TextOverflow.ellipsis,
          ),
          StarForkWidget(forks: rep.forks, stars: rep.stars)
        ],
      ),
    );
  }
}
