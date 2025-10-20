import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_local_djwidj.dart';
import 'package:treadwkd_bbbb/bean/trea_value_bean_wjoomc.dart';
import 'package:treadwkd_bbbb/hep/trea_level_hep_dwifnowe.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';

class TreaValueHepJomeoc{
  static final TreaValueHepJomeoc _hepJomeoc=TreaValueHepJomeoc();
  static TreaValueHepJomeoc get instance => _hepJomeoc;

  TreaValueBeanWjoomc? _bean;

  init(){
    TreaFirebaseHepNievnie.instance.valueCallback=(String s){
      if(bValueConfig.getData().isEmpty){
        bValueConfig.saveData(s);
      }
      _startInitValue();
    };
    _startInitValue();
  }

  bool getKey()=>kDebugMode?true:Random().nextInt(100)<(_bean?.spinWheelPrizes?.keyPoint??30);

  bool get7()=>Random().nextInt(100)<(_bean?.lucky7Reward?.point??25);
  double get7Reward()=>_getReward(_bean?.lucky7Reward?.reward??[]);

  int getWealthWinNum(){
    var collectorWinReward = _bean?.collectorWinReward;
    var point1 = collectorWinReward?.point1??30;
    var point2 = collectorWinReward?.point2??30;
    var point3 = collectorWinReward?.point3??20;
    var point4 = collectorWinReward?.point4??10;
    var point0 = 100-point1-point2-point3-point4;
    if(point0<0){
      point0=0;
    }
    var index = Random().nextInt(100);
    if(index<point0){
      return 0;
    }else if(index>=point0&&index<(point0+point1)){
      return 1;
    }else if(index>=(point0+point1)&&index<(point0+point1+point2)){
      return 2;
    }else if(index>=(point0+point1+point2)&&index<(point0+point1+point2+point3)){
      return 3;
    }else{
      return 4;
    }
  }
  double getWealthReward()=>_getReward(_bean?.collectorWinReward?.reward??[]);

  int getKittenNum(){
    var dogWinningReward = _bean?.dogWinningReward;
    var point3 = dogWinningReward?.point3??10;
    var point4 = dogWinningReward?.point4??20;
    var point5 = dogWinningReward?.point5??20;
    var point6 = dogWinningReward?.point6??20;
    var point7 = dogWinningReward?.point7??2;
    var point8 = dogWinningReward?.point8??1;
    var point9 = dogWinningReward?.point9??0.2;
    var point10 = dogWinningReward?.point10??0.1;
    var point0 = 100-point3-point4-point5-point6-point7-point8-point9-point10;
    if(point0<0){
      point0=0;
    }
    var index = Random().nextDouble()*100;
    if(index<point0){
      return 0;
    }else if(index>=point0&&index<(point0+point3)){
      return 3;
    }else if(index>=(point0+point3)&&index<(point0+point3+point4)){
      return 4;
    }else if(index>=(point0+point3+point4)&&index<(point0+point3+point4+point5)){
      return 5;
    }else if(index>=(point0+point3+point4+point5)&&index<(point0+point3+point4+point5+point6)){
      return 6;
    }else if(index>=(point0+point3+point4+point5+point6)&&index<(point0+point3+point4+point5+point6+point7)){
      return 7;
    }else if(index>=(point0+point3+point4+point5+point6+point7)&&index<(point0+point3+point4+point5+point6+point7+point8)){
      return 8;
    }else if(index>=(point0+point3+point4+point5+point6+point7+point8)&&index<(point0+point3+point4+point5+point6+point7+point8+point9)){
      return 9;
    }else{
      return 10;
    }
  }

  double getKittenReward()=>_getReward(_bean?.dogWinningReward?.reward??[]);

  int getKittenMultiple(int winNum){
    switch(winNum){
      case 3: return 1;
      case 4: return 2;
      case 5: return 3;
      case 6: return 4;
      case 7: return 5;
      case 8: return 10;
      case 9: return 20;
      case 10: return 50;
      default: return 0;
    }
  }

  int getMagicWinNum(){
    var collectorWinReward = _bean?.cardKingReward;
    var point1 = collectorWinReward?.point1??30;
    var point2 = collectorWinReward?.point2??30;
    var point3 = collectorWinReward?.point3??20;
    var point4 = collectorWinReward?.point4??10;
    var point0 = 100-point1-point2-point3-point4;
    if(point0<0){
      point0=0;
    }
    var index = Random().nextInt(100);
    if(index<point0){
      return 0;
    }else if(index>=point0&&index<(point0+point1)){
      return 1;
    }else if(index>=(point0+point1)&&index<(point0+point1+point2)){
      return 2;
    }else if(index>=(point0+point1+point2)&&index<(point0+point1+point2+point3)){
      return 3;
    }else{
      return 4;
    }
  }

  double getMagicReward()=>_getReward(_bean?.cardKingReward?.reward??[]);

  int getSweetWinNum(){
    var collectorWinReward = _bean?.fruitLineupReward;
    var point1 = collectorWinReward?.point1??30;
    var point2 = collectorWinReward?.point2??30;
    var point3 = collectorWinReward?.point3??20;
    var point4 = collectorWinReward?.point4??10;
    var point0 = 100-point1-point2-point3-point4;
    if(point0<0){
      point0=0;
    }
    var index = Random().nextInt(100);
    if(index<point0){
      return 0;
    }else if(index>=point0&&index<(point0+point1)){
      return 1;
    }else if(index>=(point0+point1)&&index<(point0+point1+point2)){
      return 2;
    }else if(index>=(point0+point1+point2)&&index<(point0+point1+point2+point3)){
      return 3;
    }else{
      return 4;
    }
  }

  double getSweetReward()=>_getReward(_bean?.fruitLineupReward?.reward??[]);

  int getNumberWinNum(){
    var dogWinningReward = _bean?.numberWinnerReward;
    var point1 = dogWinningReward?.point1??20;
    var point2 = dogWinningReward?.point2??20;
    var point3 = dogWinningReward?.point3??30;
    var point4 = dogWinningReward?.point4??20;
    var point5 = dogWinningReward?.point5??10;
    var point0 = 100-point3-point4-point5-point1-point2;
    if(point0<0){
      point0=0;
    }
    var index = Random().nextDouble()*100;
    if(index<point0){
      return 0;
    }else if(index>=point0&&index<(point0+point1)){
      return 1;
    }else if(index>=(point0+point1)&&index<(point0+point1+point2)){
      return 2;
    }else if(index>=(point0+point1+point2)&&index<(point0+point1+point2+point3)){
      return 3;
    }else if(index>=(point0+point1+point2+point3)&&index<(point0+point1+point2+point3+point4)){
      return 4;
    }else{
      return 5;
    }
  }

  double getNumberReward()=>_getReward(_bean?.numberWinnerReward?.reward??[]);

  double getLuckyCardReward()=>_getReward(_bean?.luckyCardPrizes??[]);

  double getBubbleReward()=>_getReward(_bean?.cashPop??[]);

  List<int> getCashList()=>[1000,2000,3000,5000,10000];

  int getUpLevelReward(){
    try{
      var level = TreaLevelHepDwifnowe.instance.handleLevel();
      var list = _bean?.levelUpPrizes??[];
      return list[level.level-2];
    }catch(e){
      return 0;
    }
  }

  double _getReward(List<Reward> list){
    if(list.isEmpty){
      return 0.0;
    }
    var last = list.last;
    var data = bMyMoney.getData();
    if(data>=(last.upperBound??1000)){
      return _getRandomDouble(last.reward??[]);
    }
    for (var value in list) {
      if(data>=(value.lowerBound??0)&&data<(value.upperBound??0)){
        return _getRandomDouble(value.reward??[]);
      }
    }
    return 0.0;
  }

  double _getRandomDouble(List<int> list) {
    if(list.isEmpty){
      return 0.0;
    }
    if(list.length==1){
      return list.first.toDouble();
    }
    var min = list.first;
    var max = list.last;
    final random = Random();
    double value = min + random.nextDouble() * (max - min);
    return value.toStringAsFixed(2).toDouble();
  }

  _startInitValue(){
    try{
      var data = bValueConfig.getData();
      if(data.isEmpty){
        data=TreaLocalDjwidj.localBase64.base64();
      }
      _bean=TreaValueBeanWjoomc.fromJson(jsonDecode(data));
    }catch(e){
      _bean=TreaValueBeanWjoomc.fromJson(jsonDecode(TreaLocalDjwidj.localBase64.base64()));
    }
  }
}