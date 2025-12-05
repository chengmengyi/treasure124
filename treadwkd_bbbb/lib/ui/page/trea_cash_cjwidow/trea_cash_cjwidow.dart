import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_p.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/bean/trea_amount_bean.dart';
import 'package:treadwkd_bbbb/bean/trea_cash_task_info_bean_wiodow.dart';
import 'package:treadwkd_bbbb/hep/trea_hep_dnwidi.dart';
import 'package:treadwkd_bbbb/hep/trea_storage_dhwudhiw.dart';
import 'package:treadwkd_bbbb/hep/trea_value_hep_jomeoc.dart';
import 'package:treadwkd_bbbb/ui/page/trea_cash_cjwidow/trea_cash_cjwidow_c.dart';

class TreaCashCjwidow extends TreaFaP<TreaCashCjwidowC>{
  @override
  TreaCashCjwidowC cccDiheiwidow() => TreaCashCjwidowC();

  @override
  Widget wwwdwjidwo() => WillPopScope(
    child: Stack(
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
    ),
    onWillPop: ()async{
      treaC.clickBack();
      return false;
    },
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
            var bean = treaC.amountList[index];
            if(null==bean.cashTaskInfoBeanWiodow){
              return _amountItemWidget(bean);
            }
            return _amountTaskItemWidget(bean);
          },
        ),
      ),
    ),
  );

  _amountItemWidget(TreaAmountBean bean)=>Container(
    width: double.infinity,
    height: 76.h,
    margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 16.h),
    child: Stack(
      alignment: Alignment.center,
      children: [
        TreaImageDhwudhiw(name: treaC.getAmountItemBg(),width: double.infinity,height: double.infinity,),
        Row(
          children: [
            SizedBox(width: 20.w,),
            TreaTextDwihdw(data: "\$${bean.money}", size: 24.sp, color: "#000000",fontWeight: FontWeight.bold,),
            Spacer(),
            TreaClickDhwidjow(
              onTap: (){
                treaC.clickCashBtn(bean);
              },
              child: Container(
                width: 118.w,
                height: 34.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.w),
                  color: treaC.getCashBtnColor().toColordwdowfw(),
                ),
                child: TreaTextDwihdw(data: "withdraw", size: 20.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
              ),
            ),
            SizedBox(width: 16.w,),
          ],
        ),
      ],
    ),
  );

  _amountTaskItemWidget(TreaAmountBean bean)=> TreaClickDhwidjow(
    onTap: (){
      treaC.clickCashBtn(bean);
    },
    child: Container(
      width: double.infinity,
      height: 104.h,
      margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 16.h),
      child: Stack(
        children: [
          TreaImageDhwudhiw(name: treaC.getAmountTaskBg(),width: double.infinity,height: double.infinity,),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20.w),
              child: TreaTextDwihdw(data: "\$${bean.cashTaskInfoBeanWiodow?.cashMoney}", size: 24.sp, color: "#000000",fontWeight: FontWeight.bold,),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 140.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: treaC.getCashItemTopRightColor().toColordwdowfw(),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.w),
                  bottomLeft: Radius.circular(12.w),
                )
              ),
              child: TreaTextDwihdw(data: treaC.getTaskTopRightStr(bean.cashTaskInfoBeanWiodow), size: 15.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
            ),
          ),
          Positioned(
            right: 14.w,
            bottom: 8.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TreaTextDwihdw(data: treaC.getTaskStr(bean.cashTaskInfoBeanWiodow), size: 15.sp, color: "#000000",fontWeight: FontWeight.bold,),
                SizedBox(height: 10.h,),
                Visibility(
                  visible: bean.cashTaskInfoBeanWiodow?.isRank!=1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 184.w,
                        height: 20.h,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 2.w,right: 2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.w),
                          color: "#272B2F".toColordwdowfw(),
                        ),
                        child: Container(
                          width: (180.w)*treaC.getTaskProgress(bean.cashTaskInfoBeanWiodow),
                          height: 16.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.w),
                            color: "#77FF8B".toColordwdowfw(),
                          ),
                        ),
                      ),
                      TreaTextDwihdw(data: "${bean.cashTaskInfoBeanWiodow?.currentProgress??0}/${bean.cashTaskInfoBeanWiodow?.totalProgress??0}", size: 15.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#000000",)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  _topWidget()=>SizedBox(
    width: double.infinity,
    height: 210.h,
    child: Stack(
      children: [
        GetBuilder<TreaCashCjwidowC>(
          id: "top_bg",
          builder: (_)=>TreaImageDhwudhiw(name: treaC.getTopBg(),width: double.infinity,height: double.infinity,),
        ),
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
            treaC.clickBack();
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
    child: PopupMenuButton<String>(
      offset: Offset(0, 35.h),
      onSelected: (value) {
        treaC.changeCashType(value);
      },
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context){
        var typeList = TreaValueHepJomeoc.instance.getCashTypeList();
        return typeList.map((value)=>_cashTypeItemWidget(value)).toList();
      },
      child: Container(
        padding: EdgeInsets.only(left: 10.w,top: 3.h,bottom: 3.h,right: 3.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.w),
          color: "#7797FF".toColordwdowfw().withOpacity(0.3),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GetBuilder<TreaCashCjwidowC>(
              id: "cash_type",
              builder: (_)=>TreaImageDhwudhiw(name: TreaHepDnwidi.getTopCashTypeIconByType(treaC.cashType),height: 24.h,boxFit: BoxFit.fitHeight,),
            ),
            SizedBox(width: 8.w,),
            TreaImageDhwudhiw(name: "mdiowmdow",width: 28.w,height: 28.h,),
            SizedBox(width: 4.w,),
          ],
        ),
      ),
    ),
  );

  PopupMenuItem<String> _cashTypeItemWidget(String cashType)=>PopupMenuItem(
    value: cashType,
    padding: EdgeInsets.zero,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 147.w),
      child: Center(
        child: TreaImageDhwudhiw(name: TreaHepDnwidi.getTopCashTypeIconByType(cashType),height: 24.h,boxFit: BoxFit.fitHeight,),
      ),
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