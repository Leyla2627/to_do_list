import 'package:flutter/material.dart';

class PlansCount extends StatelessWidget {
  final int count;
  final int toggleDoneCount;

  PlansCount(this.count, this.toggleDoneCount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              count < 10 ? "0$count" : "$count",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text("Barcha rejalaringiz",
                style: TextStyle(fontSize: 12, color: Colors.black54))
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              toggleDoneCount < 10 ? "0$toggleDoneCount" : "$toggleDoneCount",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            Text("Bajarilgan rejalaringiz",
                style: TextStyle(fontSize: 12, color: Colors.black54))
          ],
        )
      ]),
    );
  }
}
