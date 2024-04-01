// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TasksTab extends StatelessWidget {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          dateTextStyle: TextStyle(
            fontSize: 8.sp,
          ),
          dayTextStyle: TextStyle(
            fontSize: 7.sp,
          ),
          monthTextStyle: TextStyle(
            fontSize: 9.sp,
            fontWeight: FontWeight.w500,
          ),
          daysCount: 365,
          selectionColor: Colors.blue.shade700,
          onDateChange: (date) {},
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.03.sh),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25.r)),
          child: Slidable(
            startActionPane: ActionPane(motion: DrawerMotion(), children: [
              SlidableAction(
                backgroundColor: Colors.red,
                icon: Icons.delete,
                onPressed: (context) {},
                label: "Delete",
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r)),
              ),
              SlidableAction(
                onPressed: (context) {},
                icon: Icons.edit,
                backgroundColor: Colors.blue.shade700,
                label: "Edit",
              ),
            ]),
            child: ListTile(
              title: Text(
                "Title",
                style: TextStyle(fontSize: 14.sp),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.01.sh),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(18.r)),
              ),
              subtitle: Text(
                "description",
                style: TextStyle(fontSize: 11.sp),
              ),
              leading: Container(
                color: Colors.blue,
                width: 0.007.sw,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
