import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';

class TreaTextDwihdw extends StatelessWidget{
  String data;
  double size;
  String color;
  String? lineColor;
  FontWeight? fontWeight;

  TreaTextDwihdw({
    required this.data,
    required this.size,
    required this.color,
    this.lineColor,
    this.fontWeight,
});
  @override
  Widget build(BuildContext context) => OutlinedText(
    text: Text(
      data,
      style: TextStyle(
        fontSize: size,
        color: color.toColordwdowfw(),
        height: 1.0,
        fontWeight: fontWeight,
      ),
    ),
    strokes: lineColor==null?
    []:
    [
      OutlinedTextStroke(
        color: (lineColor??"#FFFFFF").toColordwdowfw(),
        width: 2.w,
      ),
    ],
  );
}