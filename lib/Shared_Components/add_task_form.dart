// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/Shared_Components/field_label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskForm extends StatefulWidget {
  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  var formKey = GlobalKey<FormState>();

  var taskTitle = TextEditingController();

  var taskDescription = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Form(
      key: formKey,
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 0.01.sw, vertical: 0.01.sh),
              child: Text(
                AppLocalizations.of(context)!.addNewTask,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              margin:
                  EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.01.sh),
              child: TextFormField(
                controller: taskTitle,
                validator: (value) {
                  if (value == null || value == '') {
                    return "Pleas enter the task title";
                  }
                },
                style: TextStyle(fontSize: 12.sp, color: Colors.black),
                decoration: InputDecoration(
                    isDense: true,
                    errorStyle: TextStyle(fontSize: 11.sp),
                    label: FieldLabel(AppLocalizations.of(context)!.title),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: const BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    )),
              ),
            ),
            Container(
              width: double.infinity,
              margin:
                  EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.01.sh),
              child: TextFormField(
                controller: taskDescription,
                validator: (value) {
                  if (value == null || value == '') {
                    return "Pleas enter the task description";
                  }
                },
                style: TextStyle(fontSize: 12.sp, color: Colors.black),
                decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 10.sp),
                    isDense: true,
                    label:
                        FieldLabel(AppLocalizations.of(context)!.description),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: const BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.01.sh, left: 0.03.sw),
              alignment: Alignment.centerLeft,
              child: Text(
                AppLocalizations.of(context)!.selectDate,
                style: TextStyle(fontSize: 10.sp),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 0.01.sh, left: 0.02.sw, bottom: 0.01.sh),
              child: InkWell(
                onTap: () {
                  selectDate(context);
                },
                child: Text(
                  selectedDate.toString().substring(0, 10),
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0.011.sh),
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: Text(
                    AppLocalizations.of(context)!.addTask,
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  selectDate(BuildContext context) async {
    var chosenDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      initialDate: selectedDate,
      currentDate: selectedDate,
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
