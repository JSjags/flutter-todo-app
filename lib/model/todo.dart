class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false
});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: "Wash my clothes", isDone: true),
      ToDo(id: '02', todoText: "Buy Xbox", isDone: true),
      ToDo(id: '03', todoText: "Tidy the house"),
      ToDo(id: '04', todoText: "Visit nieces"),
      ToDo(id: '05', todoText: "Write some code"),
      ToDo(id: '06', todoText: "Kill a vermin"),
    ];
  }
}