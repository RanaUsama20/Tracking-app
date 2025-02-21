import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/resources/color_manager.dart';

class WeatherDetailsCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  WeatherDetailsCard(
      {required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 80.h,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.graphite.withAlpha(100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            SizedBox(
              width: 50.w,
              height: 50.h,
              child: Icon(icon, color: ColorManager.skyBlue, size: 30,),
            ),
            SizedBox(height: 8),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 14))
          ]),
          Text(value, style: TextStyle(color: Colors.white, fontSize: 14)),
        ],
      ),
    );
  }
}
