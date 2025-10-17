import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_sql_dwhidhwo.dart';

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
}