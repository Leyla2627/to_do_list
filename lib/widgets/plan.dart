import 'package:flutter/material.dart';
import 'package:to_do_list/models/plan_model.dart';

class Plan extends StatelessWidget {
  final PlanModel plan;
  final Function markAsDone;
  final Function deletePlan;

  Plan(this.plan, this.markAsDone, this.deletePlan);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 6.0),
      leading: IconButton(
        onPressed: () {
          markAsDone(plan.id);
        },
        icon: Icon(
            plan.isDone ? Icons.check_circle_outline : Icons.circle_outlined),
        color: plan.isDone ? Colors.green : Colors.grey,
      ),
      title: Text(
        "${plan.name}",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            decoration:
                plan.isDone ? TextDecoration.lineThrough : TextDecoration.none,
            color: plan.isDone ? Colors.grey : Colors.black),
      ),
      trailing: IconButton(
          onPressed: () {
            deletePlan(plan.id);
            print("icon bosildi");
          },
          icon: Icon(
            Icons.delete_forever_rounded,
            size: 20,
          )),
    );
  }
}
