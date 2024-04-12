import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  static Stream<QuerySnapshot<TaskModel>> getTask(DateTime date) {
    var collection = getTasksCollection();
    return collection
        .where("Date", isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> editTask(String id, TaskModel newTask) {
    var collection = getTasksCollection();
    newTask.id = collection.doc().id;
    return collection.doc(id).set(newTask);
  }

  static void deleteTask(String id) {
    var collection = getTasksCollection();
    TasksTabState.tasksLists.remove(collection.doc(id));
    collection.doc(id).delete();
  }
}
