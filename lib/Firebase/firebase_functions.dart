import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/DataModules/taskModel.dart';
import 'package:todo/Tabs/tasks_tab.dart';

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

  static editTask(String id,TaskModel newTask) {
    var collection = getTasksCollection();
    collection.doc(id).set(newTask);
  }

  static void deleteTask(String id) {
    var collection = getTasksCollection();
    TasksTabState.tasksLists.remove(collection.doc(id));
    collection.doc(id).delete();
  }
}
