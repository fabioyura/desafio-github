import 'package:app/helpers/helpers.dart';
import 'package:app/helpers/ts.dart';
import 'package:app/src/pages/pull_request_page.dart';
import 'package:core/layers/domain/entities/git_rep.dart';
import 'package:flutter/material.dart';

//TODO: FIX SIZE TO RESPONSIVE
class GitRepListItem extends StatelessWidget {
  final GitRep rep;
  const GitRepListItem({Key? key, required this.rep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeTs();
    return InkWell(
      onTap: () {
        openScreen(context, PullRequestPage(rep: rep));
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 4.75,
        child: Card(
          color: const Color.fromARGB(255, 246, 244, 244),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(rep.name, style: ts.title),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10, bottom: 15),
                        child: Text(
                          rep.description,
                          maxLines: 3,
                          style: ts.body,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  const Icon(Icons.share, color: Colors.amber),
                                  const SizedBox(width: 2),
                                  Text(rep.forks.toString(), style: ts.icon),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.grade, color: Colors.amber),
                                const SizedBox(width: 2),
                                Text(rep.stars.toString(), style: ts.icon),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 6,
                child: Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                          child: ClipOval(
                              child: Image.network(rep.userAvatarURL))),
                      Text(
                        rep.userName,
                        style: ts.user,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
