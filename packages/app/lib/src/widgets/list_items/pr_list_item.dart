import 'package:app/helpers/ts.dart';
import 'package:app/src/widgets/abstract_card.dart';
import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:flutter/material.dart';

class PrListItem extends StatelessWidget {
  final PullRequest pr;
  const PrListItem({Key? key, required this.pr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbstractCard(
      userName: pr.userName,
      avatar: pr.userAvatarURL,
      children: [
        Text(pr.title, style: ts.title),
        Text(
          pr.body,
          maxLines: 3,
          style: ts.body,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
