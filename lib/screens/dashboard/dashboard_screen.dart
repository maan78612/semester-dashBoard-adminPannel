import 'package:admin/constants/app_constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/semester_details.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';
import 'components/my_subjects.dart';
import 'components/recent_files.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppConfig.defaultPadding.defaultPadding),
        child: Column(
          children: [
            Header(),
            SizedBox(height: AppConfig.defaultPadding.defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      MySubjects(),
                      SizedBox(height: AppConfig.defaultPadding.defaultPadding),
                      RecentFiles(),
                      if (Responsive.isMobile(context))
                        SizedBox(
                            height: AppConfig.defaultPadding.defaultPadding),
                      if (Responsive.isMobile(context)) SemesterDetails(),
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  SizedBox(width: AppConfig.defaultPadding.defaultPadding),
                // On Mobile means if the screen is less than 850 we dont want to show it
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: SemesterDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
