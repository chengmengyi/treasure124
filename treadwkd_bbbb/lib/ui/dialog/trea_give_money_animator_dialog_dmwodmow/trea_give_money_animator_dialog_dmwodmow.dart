import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_give_money_animator_dialog_dmwodmow/trea_give_money_animator_dialog_dmwodmow_c.dart';

class TreaGiveMoneyAnimatorDialogDmwodmow extends TreaFaD<TreaGiveMoneyAnimatorDialogDmwodmowC>{
  String cashType;
  int cashMoney;
  Function() dismissCallback;
  TreaGiveMoneyAnimatorDialogDmwodmow({
    required this.cashType,
    required this.cashMoney,
    required this.dismissCallback,
});
  @override
  TreaGiveMoneyAnimatorDialogDmwodmowC cccDiheiwidow() => TreaGiveMoneyAnimatorDialogDmwodmowC();

  @override
  Widget wwwdwjidwo() => TreaClickDhwidjow(
    onTap: (){
      TreaRouDwjidw.backdwhudie();
    },
    child: GetBuilder<TreaGiveMoneyAnimatorDialogDmwodmowC>(
      id: "content",
      builder: (_)=>Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(18.w),
            margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 45.h),
            decoration: BoxDecoration(
              color: "#F2FAFF".toColordwdowfw(),
              borderRadius: BorderRadius.circular(12.w),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _topWidget(),
                SizedBox(height: 12.h,),
                _moneyWidget(),
                SizedBox(height: 12.h,),
                _progressWidget(),
                SizedBox(height: 12.h,),
                TreaImageDhwudhiw(name: "weyuwhu",width: 189.w,height: 107.h,),
                TreaImageDhwudhiw(name: "wjiwmos",width: double.infinity,height: 1.h,),
                SizedBox(height: 40.h,),
              ],
            ),
          ),
          TreaImageDhwudhiw(name: treaC.showSuccess?"shiwi":"uwye8h",width: 90.w,height: 90.w,),
        ],
      ),
    ),
  );

  _topWidget()=>TreaTextDwihdw(data: "Processing payment", size: 24.sp, color: "#000000",fontWeight: FontWeight.bold,);

  _moneyWidget()=>Stack(
    alignment: Alignment.bottomCenter,
    children: [
      TreaImageDhwudhiw(name: treaC.getCashBg(cashType),width: 193.w,height: 104.h,),
      Container(
        margin: EdgeInsets.only(bottom: 13.h),
        child: TreaTextDwihdw(data: "\$$cashMoney", size: 24.sp, color: "#000000",fontWeight: FontWeight.bold,),
      ),
    ],
  );
  
  //weyuwyu
  _progressWidget(){
    if(!treaC.showSuccess){
      return TreaImageDhwudhiw(name: "weyuwyu",width: 50.w,height: 50.h,);
    }
    return SizedBox(
      width: 50.w,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context,index)=>TreaImageDhwudhiw(name: treaC.progressIndex==index?"iwninwe":"dyuwhidw",width: 50.w,height: 30.h,),
        ),
      ),
    );
  }
}