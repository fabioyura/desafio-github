import 'package:app/src/widgets/user_widget.dart';
import 'package:flutter/material.dart';

class AbstractCard extends StatelessWidget {
  final List<Widget> children;
  final String userName;
  final String avatar;
  const AbstractCard(
      {super.key,
      required this.children,
      required this.userName,
      required this.avatar});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.75,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: const Color.fromARGB(255, 246, 244, 244),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 50),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: UserWidget(
                  userName: userName,
                  avatar: avatar,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
