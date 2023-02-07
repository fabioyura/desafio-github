import 'package:app/helpers/ts.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final String userName;
  final String avatar;
  const UserWidget({super.key, required this.userName, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.020),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(child: ClipOval(child: Image.network(avatar))),
          Text(
            userName,
            style: ts.user,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
