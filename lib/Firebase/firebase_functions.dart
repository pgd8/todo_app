import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/DataModules/taskModel.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
            fromFirestore: (snapshot, _) =>
                TaskModel.fromJson(snapshot.data()!),
            toFirestore: (value, _) => value.toJson());
  }

  static Future<void> addTask(TaskModel task) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    task.id = docRef.id;
   return docRef.set(task);
  }

  static Future<QuerySnapshot<TaskModel>> getTask() {
    var collection = getTasksCollection();
   return collection.get();
  }


}
