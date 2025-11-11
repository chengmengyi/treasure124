import 'package:flutter/foundation.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_hep_dhwidw.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_sql_dwhidhwo.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';

class TreaBoxHepWhidowmd{
  static final TreaBoxHepWhidowmd _whidowmd=TreaBoxHepWhidowmd();
  static TreaBoxHepWhidowmd get instance => _whidowmd;

  initTodayNum()async{
    var todayTime = getTodayTime();
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bBoxNum,where: 'todayTime = ?',whereArgs: [todayTime]);
    if(list.isNotEmpty){
      return;
    }
    await database.insert(TreaSqlNamewdhiw.bBoxNum, {"todayTime":todayTime,"todayNum":3});
  }

  Future<int> queryTodayBoxNum()async{
    var todayTime = getTodayTime();
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bBoxNum,where: 'todayTime = ?',whereArgs: [todayTime]);
    if(list.isEmpty){
      return 0;
    }
    return list.first["todayNum"] as int;
  }

  updateBoxNum(int addNum)async{
    var todayTime = getTodayTime();
    var database = await TreaSqlDwhidhwo.instance.initSql();
    var list = await database.query(TreaSqlNamewdhiw.bBoxNum,where: 'todayTime = ?',whereArgs: [todayTime]);
    if(list.isEmpty){
      return;
    }
    var todayNum = (list.first["todayNum"] as int)+addNum;
    if(todayNum<0){
      todayNum=0;
    }
    await database.update(TreaSqlNamewdhiw.bBoxNum, {"todayTime":todayTime,"todayNum":todayNum},where: ' id = ?',whereArgs: [list.first["id"]]);
    TreaEventHepDhwidw.instance.send(code: TreaEventCodeDhwdhwi.updateBoxNum);
  }
}