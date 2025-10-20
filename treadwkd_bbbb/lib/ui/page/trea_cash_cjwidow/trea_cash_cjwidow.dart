import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_p.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/ui/page/trea_cash_cjwidow/trea_cash_cjwidow_c.dart';

class TreaCashCjwidow extends TreaFaP<TreaCashCjwidowC>{
  @override
  TreaCashCjwidowC cccDiheiwidow() => TreaCashCjwidowC();

  @override
  Widget wwwdwjidwo() => Stack(
    children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        color: "#E7EEF3".toColordwdowfw(),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topWidget(),
          SizedBox(height: 36.h,),
          Container(
            margin: EdgeInsets.only(left: 16.w),
            child: TreaTextDwihdw(data: "Select Withdrawal Amount", size: 16.sp, color: "#000000",fontWeight: FontWeight.bold,),
          ),
          SizedBox(height: 12.h,),
          _amountListWidget(),
        ],
      ),
    ],
  );

  _amountListWidget()=>Expanded(
    child: GetBuilder<TreaCashCjwidowC>(
      id: "amount",
      builder: (_)=>MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: ListView.builder(
          itemCount: treaC.amountList.length,
          itemBuilder: (context,index){
            return Container(
              width: double.infinity,
              height: 76.h,
              margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 16.h),
              child: Stack(
                children: [
                  TreaImageDhwudhiw(name: treaC.getAmountItemBg(),width: double.infinity,height: double.infinity,),
                ],
              ),
            );
          },
        ),
      ),
    ),
  );

  _topWidget()=>SizedBox(
    width: double.infinity,
    height: 210.h,
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: treaC.getTopBg(),width: double.infinity,height: double.infinity,),
        SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleWidget(),
              SizedBox(height: 4.h,),
              _cashTypeWidget(),
              SizedBox(height: 10.h,),
              _myMoneyWidget(),
            ],
          ),
        ),
      ],
    ),
  );

  _titleWidget()=>SizedBox(
    width: double.infinity,
    height: 44.h,
    child: Stack(
      children: [
        TreaClickDhwidjow(
          onTap: (){

          },
          child: SizedBox(
            width: 44.w,
            height: 44.h,
            child: Icon(Icons.arrow_back,color: Colors.white,),
          ),
        ),
        Align(
          child: TreaTextDwihdw(data: "Cash", size: 20.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
        )
      ],
    ),
  );

  _cashTypeWidget()=>Container(
    margin: EdgeInsets.only(left: 16.w),
    padding: EdgeInsets.only(left: 10.w,top: 3.h,bottom: 3.h,right: 3.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40.w),
      color: "#7797FF".toColordwdowfw().withOpacity(0.3),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TreaImageDhwudhiw(name: treaC.getTopCashTypeIcon(),height: 24.h,boxFit: BoxFit.fitHeight,),
        SizedBox(width: 8.w,),
        TreaImageDhwudhiw(name: "mdiowmdow",width: 28.w,height: 28.h,),
      ],
    ),
  );

  _myMoneyWidget()=>Container(
    margin: EdgeInsets.only(left: 16.w),
    child: GetBuilder<TreaCashCjwidowC>(
      id: "money",
      builder: (_){
        var data = bOpenEyeSwitch.getData();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TreaTextDwihdw(data: "My Balance", size: 10.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
                SizedBox(width: 5.w,),
                TreaClickDhwidjow(
                  onTap: (){
                    treaC.clickOpenMoneySwitch(data);
                  },
                  child: TreaImageDhwudhiw(name: data?"mwomswm":"mdowmowm",width: 16.w,height: 10.h,),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TreaTextDwihdw(data: "\$", size: 28.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
                TreaTextDwihdw(data: data?"${bMyMoney.getData()}":"******", size: 28.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
              ],
            ),
          ],
        );
      },
    ),
  );
}