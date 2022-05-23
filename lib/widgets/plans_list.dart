import 'package:flutter/material.dart';
import 'package:to_do_list/models/plan_model.dart';
import 'package:to_do_list/widgets/plan.dart';

class Plans_list extends StatelessWidget {
  final List<PlanModel> list;
  final Function markAsDone;
  final Function deletePlan;


  Plans_list(this.list, this.markAsDone, this.deletePlan);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:list.length>0? ListView.builder(
        itemBuilder: (ctx, index) {
          return Plan(list[index], markAsDone, deletePlan);
        },
        itemCount: list.length,
      ):  Column(
          children: [
            // SizedBox(height: 100,),
            Text("Hozrcha rejalar yo`q", style: TextStyle(
              fontWeight:FontWeight.bold,

            ),),
            SizedBox(height: 20,),
            Image.asset("assets/images/sleep.png",
            fit: BoxFit.cover,
            width: 150,)
          ]
      ),
    );
  }
}
