import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:treadwkd_bbbase/ui/trea_spine_dwjoidjow.dart';

class TreaFingerWidgetDjiwji extends StatelessWidget{
  double? width;
  double? height;
  TreaFingerWidgetDjiwji({
    this.width,
    this.height,
});
  @override
  Widget build(BuildContext context) => TreaSpineDwjoidjow(
    atlasFile: "hand",
    skeletonFile: "skeleton",
    animatorName: "animation",
    folder: "finger",
    width: width??100.w,
    height: height??100.w,
  );

}