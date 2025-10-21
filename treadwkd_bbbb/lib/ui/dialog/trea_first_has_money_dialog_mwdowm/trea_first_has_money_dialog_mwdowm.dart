import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_first_has_money_dialog_mwdowm/trea_first_has_money_dialog_mwdowm_c.dart';

class TreaFirstHasMoneyDialogMwdowm extends TreaFaD<TreaFirstHasMoneyDialogMwdowmC>{
  Function(String cashType,int cashMoney,String account) sureCallback;
  TreaFirstHasMoneyDialogMwdowm({
    required this.sureCallback,
});

  @override
  TreaFirstHasMoneyDialogMwdowmC cccDiheiwidow() => TreaFirstHasMoneyDialogMwdowmC();

  @override
  Widget wwwdwjidwo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        margin: EdgeInsets.only(left: 34.w,right: 34.w),
        decoration: BoxDecoration(
          color: "#F2FAFF".toColordwdowfw(),
          borderRadius: BorderRadius.circular(28.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TreaTextDwihdw(data: "Cash Out", size: 24.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
            SizedBox(height: 16.h,),
            _moneyWidget(),
            SizedBox(height: 16.h,),
            _inputWidget(),
            SizedBox(height: 23.h,),
            _btnWidget(),
          ],
        ),
      ),
      SizedBox(height: 33.h,),
      TreaClickDhwidjow(
        onTap: (){
          treaC.clickClose();
        },
        child: TreaImageDhwudhiw(name: "icon_close",width: 30.w,height: 30.w,),
      ),
    ],
  );

  _moneyWidget()=>Stack(
    alignment: Alignment.bottomCenter,
    children: [
      TreaImageDhwudhiw(name: treaC.getCashBg(),width: 193.w,height: 104.h,),
      Container(
        margin: EdgeInsets.only(bottom: 13.h),
        child: TreaTextDwihdw(data: "\$${TreaValueHepJomeoc.instance.getCashList().first}", size: 24.sp, color: "#000000",fontWeight: FontWeight.bold,),
      ),
    ],
  );

  _inputWidget()=>Container(
    width: double.infinity,
    height: 28.h,
    padding: EdgeInsets.only(left: 8.w,right: 8.w,),
    margin: EdgeInsets.only(left: 12.w,right: 12.w),
    decoration: BoxDecoration(
      color: "#FFFFFF".toColordwdowfw(),
      borderRadius: BorderRadius.circular(26.w),
    ),
    child: Row(
      children: [
        TreaTextDwihdw(data: "Account", size: 14.sp, color: "#535B60",fontWeight: FontWeight.bold,),
        SizedBox(width: 16.w,),
        Expanded(
          child: TextField(
            enabled: true,
            maxLength: 30,
            textAlign: TextAlign.right,
            controller: treaC.textEditingController,
            textInputAction: TextInputAction.done,
            style: TextStyle(
              fontSize: 14.sp,
              color: "#000000".toColordwdowfw(),
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              counterText: '',
              isCollapsed: true,
              hintText: treaC.getInputTips(),
              hintStyle: TextStyle(
                fontSize: 14.sp,
                color: "#9EA9B2".toColordwdowfw(),
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );


  _btnWidget()=>TreaClickDhwidjow(
    onTap: (){
      treaC.clickCash(sureCallback);
    },
    child: Container(
      width: 120.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        gradient: LinearGradient(
            colors: treaC.getBtnColors(),
            begin: Alignment.centerLeft,
            end: Alignment.centerRight
        ),
      ),
      child: TreaTextDwihdw(data: "Submit", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
    ),
  );
}