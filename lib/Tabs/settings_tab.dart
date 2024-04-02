// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/Tabs/Settings_Tab_Components/language_sheet.dart';
import 'package:todo/Tabs/Settings_Tab_Components/theme_mode_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.04.sh,
          ),
          Text(
            AppLocalizations.of(context)!.changeLanguage,
          ),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return LanguageSheet();
                },
              );
            },
            child: Text(
              AppLocalizations.of(context)!.choose,
              style: TextStyle(
                color: Colors.blue.shade700,
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.changeMode),
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ThemeModeSheet();
                },
              );
            },
            child: Text(
              AppLocalizations.of(context)!.choose,
              style: TextStyle(
                color: Colors.blue.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
