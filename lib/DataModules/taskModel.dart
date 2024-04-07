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
            id: json['ID'],
            title: json['Title'],
            description: json['Description'],
            isDone: json['IsDone'],
            date: json['Date']);

  Map<String, dynamic> toJson() {
    return {
      "ID": id,
      "Title": title,
      "Description": description,
      "IsDone": isDone,
      "Date": date
    };
  }
}
