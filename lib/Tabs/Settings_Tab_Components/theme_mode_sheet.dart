// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/Providers/my_provider.dart';

class ThemeModeSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.mode),
          Container(
            width: double.infinity,
            margin:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.01.sh),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: provider.mode == ThemeMode.light
                        ? Colors.blue.shade700
                        : Colors.white),
                onPressed: () {
                  provider.changeMode(ThemeMode.light);
                },
                child: Text(
                  AppLocalizations.of(context)!.light,
                  style: TextStyle(
                      color: provider.mode == ThemeMode.light
                          ? Colors.white
                          : Colors.blue.shade700),
                )),
          ),
          Container(
            width: double.infinity,
            margin:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.01.sh),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: provider.mode == ThemeMode.dark
                        ? Colors.blue.shade700
                        : Colors.white),
                onPressed: () {
                  provider.changeMode(ThemeMode.dark);
                },
                child: Text(
                  AppLocalizations.of(context)!.dark,
                  style: TextStyle(
                      color: provider.mode == ThemeMode.dark
                          ? Colors.white
                          : Colors.blue.shade700),
                )),
          ),
        ],
      ),
    );
  }
}
