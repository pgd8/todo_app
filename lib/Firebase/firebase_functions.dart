import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/DataModules/taskModel.dart';

class FirebaseFunctions {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  //to add tasks to the fireStore
  void addTask() {
    fireStore.collection("Tasks").withConverter(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  void getTask() {}

  void editTask() {}

  void deleteTask() {}
}
