import 'package:app/helpers/ts.dart';
import 'package:flutter/material.dart';

class StarForkWidget extends StatelessWidget {
  final int forks;
  final int stars;
  const StarForkWidget({super.key, required this.forks, required this.stars});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 25,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                const Icon(Icons.share, color: Colors.amber),
                const SizedBox(width: 2),
                Text(forks.toString(), style: ts.icon),
              ],
            ),
          ),
          Row(
            children: [
              const Icon(Icons.grade, color: Colors.amber),
              const SizedBox(width: 2),
              Text(stars.toString(), style: ts.icon),
            ],
          ),
        ],
      ),
    );
  }
}
