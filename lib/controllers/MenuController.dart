import 'package:admin/constants/app_constants.dart';
import 'package:admin/models/semesterModal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashBoard extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  List<PieChartSectionData> paiChartSelectionDatas = [];

  int selectedSemester = 1;

  void selectSemester({required int sem}) {
    selectedSemester = sem;
    notifyListeners();
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
    notifyListeners();
  }

  //Semester List
  List<SemesterModal> semesterData = [];

  init() {
    addSemesterData();
    pieChart();
    notifyListeners();
  }

  double avg = 0.0;

  void addSemesterData() {
    semesterData.add(SemesterModal(gpa: 2.7, subjects: 5));
    semesterData.add(SemesterModal(gpa: 3, subjects: 5));
    semesterData.add(SemesterModal(gpa: 3.8, subjects: 5));
    semesterData.add(SemesterModal(gpa: 2.1, subjects: 6));
    semesterData.add(SemesterModal(gpa: 1.8, subjects: 6));
    semesterData.add(SemesterModal(gpa: 3.7, subjects: 6));
    semesterData.add(SemesterModal(gpa: 3.2, subjects: 5));
    semesterData.add(SemesterModal(gpa: 3.9, subjects: 5));
    notifyListeners();

    // average();
  }

  ///pie chart///

  void pieChart() {
    double sum = 0;
    avg = 0;
    for (int i = 0; i < semesterData.length; i++) {
      paiChartSelectionDatas.add(PieChartSectionData(
          color: semesterPieColor(i + 1),
          radius: 25,
          showTitle: true,
          title: "S ${i + 1}",
          titleStyle: TextStyle(color: AppConfig.colors.white),
          value: semesterData[i].gpa));
      sum = semesterData[i].gpa + sum;
    }
    avg = sum / semesterData.length;
    notifyListeners();
  }

  Color semesterPieColor(int sem) {
    switch (sem) {
      case 1:
        {
          return AppConfig.colors.s1;
        }

      case 2:
        {
          return AppConfig.colors.s2;
        }

      case 3:
        {
          return AppConfig.colors.s3;
        }

      case 4:
        {
          return AppConfig.colors.s4;
        }

      case 5:
        {
          return AppConfig.colors.s5;
        }

      case 6:
        {
          return AppConfig.colors.s6;
        }

      case 7:
        {
          return AppConfig.colors.s7;
        }

      case 8:
        {
          return AppConfig.colors.s8;
        }

      default:
        {
          return AppConfig.colors.s1;
        }
    }
  }
}
