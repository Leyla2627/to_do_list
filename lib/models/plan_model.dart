class PlanModel {
  final String id;
  final String name;
  final DateTime day;
  bool isDone = false;

  PlanModel({required this.id, required this.name, required this.day});

  void ToggleDone() {
    isDone = !isDone;
  }
}

class Plans {
  List<PlanModel> _list = [
    PlanModel(id: "r1", name: "Kitob o`qish", day: DateTime.now()),
    PlanModel(id: "r2", name: "Bozorga borish", day: DateTime.now()),
    PlanModel(id: "r3", name: "Flutter o`rganish", day: DateTime.now()),
    PlanModel(id: "r4", name: "TV ko`rish", day: DateTime.now()),
    PlanModel(id: "r5", name: "kompyuter o`ynash", day: DateTime.now()),
  ];
  List<PlanModel> get list {
    return _list;
  }

  List<PlanModel> todoByDay(DateTime date){
    return _list.where((todo) => todo.day.day == date.day && todo.day.month ==  date.month && todo.day.year ==  date.year).toList();
  }

  void addTodo(String planName, DateTime planDate){
    _list.add(PlanModel(id: "r${_list.length+1}", name: planName, day: planDate));
  }

  void removeTodo (String id){
    _list.removeWhere((element) => element.id == id);
  }
}
