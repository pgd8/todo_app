// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/Providers/my_provider.dart';

class TasksTab extends StatelessWidget {
  final selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.blue.shade700,
              height: 0.06.sh,
            ),
            DatePicker(
              locale: provider.languageCode,
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
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 0.03.sw, vertical: 0.03.sh),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25.r)),
          child: Slidable(
            startActionPane: ActionPane(motion: const DrawerMotion(), children: [
              SlidableAction(
                backgroundColor: Colors.red,
                icon: Icons.delete,
                onPressed: (context) {},
                label: AppLocalizations.of(context)!.delete,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r)),
              ),
              SlidableAction(
                onPressed: (context) {},
                icon: Icons.edit,
                backgroundColor: Colors.blue.shade700,
                label: AppLocalizations.of(context)!.edit,
              ),
            ]),
            child: ListTile(
              title: Text(
                AppLocalizations.of(context)!.title,
                style: TextStyle(fontSize: 14.sp),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.05.sw, vertical: 0.01.sh),
                decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(18.r)),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                AppLocalizations.of(context)!.description,
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
