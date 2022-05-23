import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewPlan extends StatefulWidget {
  final Function addPlan;

  NewPlan(this.addPlan);
  @override
  State<NewPlan> createState() => _NewPlanState();
}

class _NewPlanState extends State<NewPlan> {
  DateTime? _addDate;
  final _planNameController = TextEditingController();

  void submit() {
    if (_planNameController.text.isEmpty || _addDate == null) return;
    widget.addPlan(_planNameController.text, _addDate);
  }

  @override
  Widget build(BuildContext context) {
    void openCalendar(BuildContext context) {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2023))
          .then((select_date) {
        if (select_date != null) {
          setState(() {
            _addDate = select_date;
          });
        }
      });
    }

    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom > 0 ?  MediaQuery.of(context).viewInsets.bottom +16 : 200),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Plan name"),
                controller: _planNameController,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(_addDate == null
                    ? "Reja kuni tanlanmagan"
                    : DateFormat("EEEE, d MMM, y").format(_addDate!)),
                TextButton(
                    onPressed: () {
                      openCalendar(context);
                    },
                    child: Text("KUNNI TANLASH"))
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("BEKOR QILISH"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("salom");
                      submit();
                    },
                    child: Text("KIRITISH"),
                  )
                ],
              )
            ],
          )),
    );
  }
}
