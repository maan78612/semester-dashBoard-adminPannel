import 'package:admin/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SubjectInfo {
  final String? teacherImage, title, type;
  final int? totalHours, hoursCompleted, semester;
  final Color? color;

  SubjectInfo({
    this.teacherImage,
    this.type,
    this.title,
    this.semester,
    this.totalHours,
    this.hoursCompleted,
    this.color,
  });
}

List<SubjectInfo> demoMyFiles = [
  SubjectInfo(
      title: "ItoC",
      hoursCompleted: 36,
      type: "Core",
      teacherImage: "assets/icons/Documents.svg",
      totalHours: 40,
      color: Color(0xffFFCD42),
      semester: 1),
  SubjectInfo(
      title: "English",
      hoursCompleted: 20,
      type: "Core",
      teacherImage: "assets/icons/Documents.svg",
      totalHours: 40,
      color: AppConfig.colors.primaryColor,
      semester: 1),
  SubjectInfo(
      title: "Pak Studies",
      hoursCompleted: 40,
      type: "Uni Elective",
      teacherImage: "assets/icons/Documents.svg",
      totalHours: 40,
      color: AppConfig.colors.primaryColor,
      semester: 1),
  SubjectInfo(
      title: "Calculus",
      hoursCompleted: 24,
      type: "Cs elective",
      teacherImage: "assets/icons/Documents.svg",
      totalHours: 40,
      color: AppConfig.colors.primaryColor,
      semester: 1),
  SubjectInfo(
      title: "PF",
      hoursCompleted: 30,
      type: "Core",
      teacherImage: "assets/icons/Documents.svg",
      totalHours: 40,
      color: AppConfig.colors.primaryColor,
      semester: 2),
];
