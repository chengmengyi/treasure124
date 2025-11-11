import 'dart:convert';
import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_web_dwiodmw/trea_common_router_name_dwjidjow.dart';

extension TreaColor on String{
  Color toColordwdowfw(){
    var hexStr = replaceAll("#", "");
    return Color(int.parse(hexStr, radix: 16)).withAlpha(255);
  }
}

String getTodayTime(){
  var dateTime = DateTime.now();
  return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
}

extension StringBase64 on String{
  String base64()=>const Utf8Decoder().convert(base64Decode(this));
}

extension Strint2Double on String{
  double toDouble(){
    try{
      return double.parse(this);
    }catch(e){
      return 0.0;
    }
  }
}

double addDecimal(num1,num2){
  try{
    return (Decimal.parse("$num1")+Decimal.parse("$num2")).toDouble();
  }catch(e){
    return 0.0;
  }
}

double doubleDecimal(num1){
  try{
    return (Decimal.parse("$num1")*Decimal.fromInt(2)).toDouble();
  }catch(e){
    return 0.0;
  }
}

double mulDecimal(num1,num2){
  try{
    return (Decimal.parse("$num1")*Decimal.parse("$num2")).toDouble();
  }catch(e){
    return 0.0;
  }
}

double divDecimal(num1,num2){
  try{
    return (Decimal.parse("$num1")/Decimal.parse("$num2")).toDouble();
  }catch(e){
    return 0.0;
  }
}

showToast(String s){
  if(s.isEmpty){
    return;
  }
  Fluttertoast.showToast(
    msg: s,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black45,
    textColor: Colors.white,
    fontSize: 16,
  );
}

extension RandomList on List{
  random()=> this[Random().nextInt(length)];
}

extension Str2Int on String{
  int toInt(){
    try{
      return int.parse(this);
    }catch(e){
      return 0;
    }
  }
}

toWebPage({
  required String title,
  required String url,
  bool isMoreGame=false,
}){
  TreaRouDwjidw.toJdeidedelde(routerName: TreaCommonRouterNameDwjidjow.web,params: {"title":title,"url":url,"isMoreGame":isMoreGame});
}

//加密：“data”：原始字符串；“code”：需求文档标题前的项目编号
String encrypt(String data, int code) {
  final dataBytes = utf8.encode(data);
  List<int> xorList = [];
  for (int i = 0; i < dataBytes.length; i++) {
    xorList.add(dataBytes[i] ^ code);
  }
  return base64.encode(xorList);
}

//解密：“data”：加密字符串；“code”：需求文档标题前的项目编号
String decrypt(String data, int code) {
  final decode = base64.decode(data);
  final decode2 = decode.toList();
  List<int> xorList = [];
  for (int i = 0; i < decode2.length; i++) {
    xorList.add(decode2[i] ^ code);
  }
  return utf8.decode(xorList);
}
