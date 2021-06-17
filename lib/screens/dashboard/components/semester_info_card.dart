import 'package:admin/constants/app_constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SemesterInfoCard extends StatelessWidget {
  const SemesterInfoCard({
    Key? key,
    required this.title,
    required this.semester,
    required this.svgSrc,
    required this.gpa,
    required this.numOfSubjects,
  }) : super(key: key);

  final String title, svgSrc;
  final int numOfSubjects, semester;
  final double gpa;

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoard>(builder: (context, dashProvider, _) {
      return GestureDetector(
        onTap: () {
          dashProvider.selectSemester(sem: semester);
        },
        child: Container(
          margin: EdgeInsets.only(top: AppConfig.defaultPadding.defaultPadding),
          padding: EdgeInsets.all(AppConfig.defaultPadding.defaultPadding),
          decoration: BoxDecoration(
            color: semester == dashProvider.selectedSemester
                ? AppConfig.colors.white
                : AppConfig.colors.secondaryColor,
            border: Border.all(
                width: 2,
                color: AppConfig.colors.primaryColor.withOpacity(0.15)),
            borderRadius: BorderRadius.all(
              Radius.circular(AppConfig.defaultPadding.defaultPadding),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: semester == dashProvider.selectedSemester
                    ? Icon(
                        Icons.done,
                        color: Colors.green,
                      )
                    : SvgPicture.asset(
                        svgSrc,
                      ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConfig.defaultPadding.defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: semester == dashProvider.selectedSemester
                              ? AppConfig.colors.bgColor
                              : AppConfig.colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "$numOfSubjects Subjects",
                        style: Theme.of(context).textTheme.caption!.copyWith(
                            color: semester == dashProvider.selectedSemester
                                ? AppConfig.colors.bgColor
                                : Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              Text("$gpa GPA",
                  style: TextStyle(
                    color: semester == dashProvider.selectedSemester
                        ? AppConfig.colors.bgColor
                        : AppConfig.colors.white,
                  ))
            ],
          ),
        ),
      );
    });
  }
}
