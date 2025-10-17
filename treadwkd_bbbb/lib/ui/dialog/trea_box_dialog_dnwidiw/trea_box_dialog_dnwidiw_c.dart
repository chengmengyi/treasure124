import 'dart:async';

import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';
import 'package:treadwkd_bbbb/hep/trea_box_hep_whidowmd.dart';

class TreaBoxDialogDnwidiwC extends TreaFaC{
  var boxNum=0,itemHeight=94.w,isSpinning = false;
  final List<ScrollController> controllers = List.generate(3, (_) => ScrollController());
  final List<String> iconList1=["dmeimd","dmeodmoe","dmeimd"];
  final List<String> iconList2=["mdiwemodwm","dmeodmoe","dmeodmoe"];
  final List<String> iconList3=["dnwijdim","dmeodmoe","mdiwemodwm"];

  @override
  void onReady() {
    super.onReady();
    _queryBoxNum();
  }

  clickSpin(){
    if(boxNum<=0){
      showToast("Attempts Exhausted. Please Try Again Tomorrow.");
      return;
    }
    if (isSpinning) return;
    isSpinning = true;

    for (int i = 0; i < controllers.length; i++) {
      final controller = controllers[i];
      Timer? columnTimer;

      // 启动每列的滚动计时器
      columnTimer = Timer.periodic(const Duration(milliseconds: 16), (t) {
        // if (!mounted) return;
        final newOffset = controller.offset + 25;
        controller.jumpTo(newOffset > 100000 ? 0 : newOffset);
      });

      // 每列依次停止（间隔 0.5 秒）
      Future.delayed(Duration(milliseconds: 2000 + i * 500), () {
        columnTimer?.cancel();
        controller.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        if (i == controllers.length - 1) isSpinning = false;
      });
    }
  }

  clickClose(){
    TreaRouDwjidw.backdwhudie();
  }

  _queryBoxNum()async{
    boxNum = await TreaBoxHepWhidowmd.instance.queryTodayBoxNum();
    update(["btn"]);
  }
}