import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_gradient_text_dhwiodw.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/hep/trea_box_hep_whidowmd.dart';

class TreaBoxWidgetDjwidjow extends TreaFaW{
  @override
  State<StatefulWidget> createState() => _TreaBoxWidgetDjwidjowState();
}

class _TreaBoxWidgetDjwidjowState extends TreaFaWState<TreaBoxWidgetDjwidjow>{
  var boxNum=0;

  @override
  void initState() {
    super.initState();
    _queryBoxNum();
  }

  @override
  Widget wwwdwjidwo() => SizedBox(
    width: 61.w,
    height: 61.w,
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "mdiwjdiw",width: 61.w,height: 61.w,),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 4.h),
            child: TreaGradientTextDhwiodw(
              data: "Treasure",
              size: 13.sp,
              lineColor: "#000000",
              fontWeight: FontWeight.bold,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: ["#FFFF00".toColordwdowfw(),"#FFF6ED".toColordwdowfw(),]
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 18.w,
            height: 18.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: "#FF4949".toColordwdowfw(),
              borderRadius: BorderRadius.circular(9.w),
              border: Border.all(
                width: 2.w,
                color: "#FFFFFF".toColordwdowfw(),
              ),
            ),
            child: TreaTextDwihdw(data: "$boxNum", size: 12.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
          ),
        )
      ],
    ),
  );

  _queryBoxNum()async{
    boxNum = await TreaBoxHepWhidowmd.instance.queryTodayBoxNum();
    setState(() {});
  }
}