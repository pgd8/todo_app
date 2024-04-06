class TaskModel {
  String id;
  String title;
  String description;
  bool isDone;
  int date;

  TaskModel(
      {this.id = "",
      required this.title,
      required this.description,
      this.isDone = false,
      required this.date});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            isDone: json['isDone'],
            date: json['date']);

  // method to return an object we replaced it with the named constructor because it takes a map and return an object
  TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isDone: json['isDone'],
        date: json['date']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isDone": isDone,
      "date": date
    };
  }
}
