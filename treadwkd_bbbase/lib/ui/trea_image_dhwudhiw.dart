import 'package:flutter/material.dart';

class TreaImageDhwudhiw extends StatelessWidget{
  String name;
  double? width;
  double? height;
  BoxFit? boxFit;
  TreaImageDhwudhiw({
    required this.name,
    this.width,
    this.height,
    this.boxFit,
});
  @override
  Widget build(BuildContext context) => Image.asset(
    "assets/images_treasure124/$name.webp",
    width: width,
    height: height,
    fit: boxFit??BoxFit.fill,
  );
}