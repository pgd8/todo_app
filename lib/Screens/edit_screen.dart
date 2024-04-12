import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/DataModules/taskModel.dart';
import 'package:todo/Firebase/firebase_functions.dart';
import 'package:todo/Shared_Components/field_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditScreen extends StatefulWidget {
  static const String routeName = "Edit Task Screen";

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var titleCon = TextEditingController();

  var descriptionCon = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var task = ModalRoute.of(context)!.settings.arguments as TaskModel;
    titleCon.text = task.title;
    descriptionCon.text = task.description;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          textDirection: TextDirection.ltr,
        ),
        leading: const BackButton(),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppLocalizations.of(context)!.editYourTask),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: TextFormField(
                        controller: titleCon,
                        validator: (value) {
                          if (value == null || value == " ") {
                            return AppLocalizations.of(context)!.titleError;
                          }
                        },
                        style: TextStyle(fontSize: 10.sp),
                        decoration: InputDecoration(
                            isDense: true,
                            label:
                                FieldLabel(AppLocalizations.of(context)!.title),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.r))),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 5),
                      child: TextFormField(
                        controller: descriptionCon,
                        validator: (value) {
                          if (value == null || value == " ") {
                            return AppLocalizations.of(context)!
                                .descriptionError;
                          }
                        },
                        style: TextStyle(fontSize: 10.sp),
                        decoration: InputDecoration(
                            isDense: true,
                            label: FieldLabel(
                                AppLocalizations.of(context)!.description),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.r))),
                      ),
                    ),
                    SizedBox(
                      height: 0.02.sh,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseFunction.editTask(
                              task.id,
                              TaskModel(
                                  title: titleCon.text,
                                  description: descriptionCon.text,
                                  date: task.date));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.submit,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
