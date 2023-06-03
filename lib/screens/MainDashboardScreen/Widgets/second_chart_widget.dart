import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../GetAllRevenueScreen/all_revenue_manager.dart';
import '../GetAllRevenueScreen/all_revenue_model.dart';

class SecondChartWidgets extends StatefulWidget {
  const SecondChartWidgets({Key? key}) : super(key: key);
  @override
  State<SecondChartWidgets> createState() => _SecondChartWidgetsState();
}

class _SecondChartWidgetsState extends State<SecondChartWidgets> {
  @override
  Widget build(BuildContext context) {
    AllRevenueManager allRevenueManager =
    Provider.of(context).fetch(AllRevenueManager);
    return Observer<List<AllRevenueModel>>(
      stream: allRevenueManager.mainList,
      onSuccess: (context,snapshot) {
        List<AllRevenueModel>? data = snapshot;
        AllRevenueModel modelData = data![0];
        var a  = double.parse(modelData.graph.Jan);
        var b  = double.parse(modelData.graph.Feb);
        var c  = double.parse(modelData.graph.Mar);
        var d  = double.parse(modelData.graph.Apr);
        var e  = double.parse(modelData.graph.May);
        var f  = double.parse(modelData.graph.Jun);
        var g  = double.parse(modelData.graph.Jul);
        var h  = double.parse(modelData.graph.Aug);
        var i  = double.parse(modelData.graph.Sep);
        var j  = double.parse(modelData.graph.Oct);
        var k  = double.parse(modelData.graph.Nov);
        var l  = double.parse(modelData.graph.Dec);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Revenue',
                  style: TextStyle(
                      color: Overseer.bgColors,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(modelData.totalEarning,
                  style: TextStyle(
                      color: Overseer.bgColors,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            Sparkline(
              fallbackHeight: 230.h,
              fallbackWidth: 453.w,
              data:  [
                a, b, c, d, e, f, g, h, i, j, k,l,
              ],
              lineColor: Colors.lightGreen[500]!,
              fillMode: FillMode.below,
              fillColor: Colors.green.withOpacity(.3),
              pointsMode: PointsMode.all,
              pointSize: 8.0,
              pointColor: Overseer.bgColor,
              useCubicSmoothing: true,
              lineWidth: 1.0,
              gridLinelabelPrefix: '\$',
              gridLineLabelPrecision: 3,
              enableGridLines: false,
              averageLine: false,
              averageLabel: true,
              kLine: const ['max', 'min', 'first', 'last'],
              enableThreshold: true,
              thresholdSize: 0.1,
              lineGradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Overseer.bgColor, Overseer.bgColor],
              ),
              fillGradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff1D1D41),
                  Color(0xff627EC600)],
              ),
            ),
          ],
        );
      },
      onWaiting: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      onError: (context,error){
        return const Text("Check Your Internet");
      },
    );
  }
}
