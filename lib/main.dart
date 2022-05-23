import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/models/plan_model.dart';
import 'package:to_do_list/widgets/new_plan.dart';
import 'package:to_do_list/widgets/plans_count.dart';
import 'package:to_do_list/widgets/plans_date.dart';
import 'package:to_do_list/widgets/plans_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: ToDoList(),
    );
  }
}

class ToDoList extends StatefulWidget {
  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  Plans _plans = Plans();
  DateTime _marked_day = DateTime.now();

  void _dateSelection(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: _marked_day,
            firstDate: DateTime(2020),
            lastDate: DateTime(2023))
        .then((select_date) {
      if (select_date != null) {
        setState(() {
          _marked_day = select_date;
        });
      }
    });
  }

  void _beforeDate() {
    setState(() {
      _marked_day =
          DateTime(_marked_day.year, _marked_day.month, _marked_day.day - 1);
    });
  }

  void _afterDate() {
    setState(() {
      _marked_day =
          DateTime(_marked_day.year, _marked_day.month, _marked_day.day + 1);
    });
  }

  void _markAsDone(String planId) {
    setState(() {
      _plans
          .todoByDay(_marked_day)
          .firstWhere((plan) => plan.id == planId).ToggleDone();
    });
  }

  void _deletePlan(String planId) {
    setState(() {
      _plans.removeTodo(planId);
    });
  }

  int plansCount() {
    return _plans.todoByDay(_marked_day).length;
  }

  int get _toggleDoneCount {
    return _plans.todoByDay(_marked_day).where((plan) => plan.isDone).length;
  }

  void _addPlan(String planName, planDate) {
    setState(() {
      _plans.addTodo(planName, planDate);
      Navigator.of(context).pop();
    });
  }

  void _openAddPlanScreen(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return NewPlan(_addPlan);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoList"),
        centerTitle: true,
      ),
      body: Column(children: [
        PlansDate(_dateSelection, _marked_day, _beforeDate, _afterDate),
        PlansCount(plansCount(), _toggleDoneCount),
        Plans_list(_plans.todoByDay(_marked_day), _markAsDone, _deletePlan),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _openAddPlanScreen(context), child: Icon(Icons.add)),
    );
  }
}
