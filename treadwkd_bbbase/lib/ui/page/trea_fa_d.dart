import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_c.dart';

import '../../hep/trea_ex.dart';

abstract class TreaFaD<K extends TreaFaC> extends StatelessWidget{
  late K treaC;
  bool _dwhidw=false;
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    _iiiii(context);
    return WillPopScope(
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: wwwdwjidwo(),
        ),
      ),
      onWillPop: ()async{
        return false;
      },
    );
  }

  K cccDiheiwidow();

  Widget wwwdwjidwo();

  _iiiii(BuildContext context){
    if(!_dwhidw){
      _dwhidw=true;
      treaC=Get.put(cccDiheiwidow());
    }
    this.context=context;
    treaC.context=context;
  }
}