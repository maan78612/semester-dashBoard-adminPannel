import 'package:admin/constants/app_constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoard>(builder: (context, dashProvider, _) {
      return SizedBox(
        height: 200,
        child: Stack(
          children: [
            PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 50,
                startDegreeOffset: -90,
                sections: dashProvider.paiChartSelectionDatas,
              ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppConfig.defaultPadding.defaultPadding),
                  Text(
                    "${dashProvider.avg}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 0.5,
                        ),
                  ),
                  Text("of 4")
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
