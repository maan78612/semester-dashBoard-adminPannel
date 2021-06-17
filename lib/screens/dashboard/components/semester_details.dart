import 'package:admin/constants/app_constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/semesterModal.dart';
import 'package:admin/screens/dashboard/components/semester_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chart.dart';

class SemesterDetails extends StatelessWidget {
  const SemesterDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoard>(builder: (context, dashProvider, _) {
      return Container(
        padding: EdgeInsets.all(AppConfig.defaultPadding.defaultPadding),
        decoration: BoxDecoration(
          color: AppConfig.colors.secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Semester Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: AppConfig.defaultPadding.defaultPadding),
            Chart(),
            Column(
              children:
                  List.generate(dashProvider.semesterData.length, (index) {
                SemesterModal semData = dashProvider.semesterData[index];
                return SemesterInfoCard(
                  semester: index + 1,
                  svgSrc: semesterIcon(index + 1),
                  title: "Semester ${index + 1}",
                  gpa: semData.gpa,
                  numOfSubjects: semData.subjects,
                );
              }),
            ),
          ],
        ),
      );
    });
  }

  String semesterIcon(int sem) {
    switch (sem) {
      case 1:
        {
          return AppConfig.icons.s1;
        }

      case 2:
        {
          return AppConfig.icons.s2;
        }

      case 3:
        {
          return AppConfig.icons.s3;
        }

      case 4:
        {
          return AppConfig.icons.s4;
        }

      case 5:
        {
          return AppConfig.icons.s5;
        }

      case 6:
        {
          return AppConfig.icons.s6;
        }

      case 7:
        {
          return AppConfig.icons.s7;
        }

      case 8:
        {
          return AppConfig.icons.s8;
        }

      default:
        {
          return AppConfig.icons.s1;
        }
        break;
    }
  }
}
