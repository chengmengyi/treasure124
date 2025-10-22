import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/hep/trea_cash_hep_cneimdi.dart';
import 'package:treadwkd_bbbb/hep/trea_hep_dnwidi.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_input_account_dialog_dmwidow/trea_input_account_dialog_dmwidow_c.dart';

class TreaInputAccountDialogDmwidow extends TreaFaD<TreaInputAccountDialogDmwidowC>{
  String cashType;
  int money;
  Function(String cashType,int cashMoney,String account) sureCallback;
  TreaInputAccountDialogDmwidow({
    required this.cashType,
    required this.money,
    required this.sureCallback,
});

  @override
  TreaInputAccountDialogDmwidowC cccDiheiwidow() => TreaInputAccountDialogDmwidowC();

  @override
  Widget wwwdwjidwo() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 34.w,right: 34.w),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.h),
              decoration: BoxDecoration(
                color: "#F2FAFF".toColordwdowfw(),
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _topWidget(),
                  SizedBox(height: 20.h,),
                  _moneyWidget(),
                  SizedBox(height: 12.h,),
                  _inputWidget(),
                  SizedBox(height: 40.h,),
                  _btnWidget(),
                  SizedBox(height: 12.h,),
                ],
              ),
            ),
            Positioned(
              right: 5.w,
              child: TreaImageDhwudhiw(name: "odkowodwj",width: 80.w,height: 80.w,),
            ),
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
  
  _moneyWidget()=>TreaTextDwihdw(data: "\$$money", size: 36.sp, color: "#000000",fontWeight: FontWeight.bold,);

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
              hintText: treaC.getInputTips(cashType),
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
      treaC.clickCash(cashType,money,sureCallback);
    },
    child: Container(
      width: double.infinity,
      height: 50.h,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 30.w,right: 30.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        gradient: LinearGradient(
          colors: treaC.getBtnColors(cashType),
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
        ),
      ),
      child: TreaTextDwihdw(data: "Confirm", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
    ),
  );

  _topWidget()=>Container(
    width: double.infinity,
    height: 60.h,
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: 24.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12.w),
        topRight: Radius.circular(12.w),
      ),
      color: _getTopColorByType().toColordwdowfw(),
    ),
    child: TreaImageDhwudhiw(name: TreaHepDnwidi.getTopCashTypeIconByType(cashType),height: 22.h,boxFit: BoxFit.fitHeight,),
  );

  String _getTopColorByType(){
    switch(cashType){
      case TreaCashType.paypal: return "#1363AE";
      case TreaCashType.cashapp: return "#2FA642";
      case TreaCashType.pagbank: return "#52B5B7";
      case TreaCashType.pix: return "#008E7E";
      default: return "#1363AE";
    }
  }
}