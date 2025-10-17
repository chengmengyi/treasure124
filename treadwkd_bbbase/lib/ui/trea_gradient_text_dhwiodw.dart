import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';

class TreaGradientTextDhwiodw extends StatelessWidget{
  String data;
  double size;
  Gradient gradient;
  String? lineColor;
  FontWeight? fontWeight;

  TreaGradientTextDhwiodw({
    required this.data,
    required this.size,
    required this.gradient,
    this.lineColor,
    this.fontWeight,
});

  @override
  Widget build(BuildContext context) => ShaderMask(
    shaderCallback: (bounds) {
      return gradient.createShader(Offset.zero & bounds.size);
    },
    child: TreaTextDwihdw(
      data: data,
      size: size,
      color: "#FFFFFF",
      lineColor: lineColor,
      fontWeight: fontWeight,
    ),
  );
}