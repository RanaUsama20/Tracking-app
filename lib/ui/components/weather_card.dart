import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracking_app/core/resources/color_manager.dart';

class WeatherCard extends StatefulWidget {
  final String? icon;
  final double temp;
  final String condition;
  final String date;
  final bool isSelected;

  WeatherCard(
      {required this.icon,
      required this.temp,
      required this.condition,
      required this.date,
      required this.isSelected});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 95.w,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.graphite.withAlpha(100),
        borderRadius: BorderRadius.circular(20),
        border: widget.isSelected
            ? Border.all(color: Colors.white, width: 1)
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 50.w,
              height: 50.h,
              child: Image.network(
                'https:${widget.icon}',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.error, color: Colors.red),
              )),
          SizedBox(height: 8),
          Text("${widget.temp}°",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Text(widget.condition,
              style: TextStyle(color: Colors.white, fontSize: 14)),
          SizedBox(height: 8),
          Text(widget.date,
              style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }
}
