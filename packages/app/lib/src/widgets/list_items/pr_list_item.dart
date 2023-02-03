import 'package:core/layers/domain/entities/pull_request.dart';
import 'package:flutter/material.dart';

class PrListItem extends StatelessWidget {
  final PullRequest pr;
  const PrListItem({Key? key, required this.pr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Titulo: ${pr.title}'),
          Text('Body: ${pr.body}'),
          Text('UserName: ${pr.userName}'),
          Text('Avatar URL: ${pr.userAvatarURL}'),
        ],
      ),
    );
  }
}
