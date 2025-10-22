import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_lucky_card_dialog_dwodo/trea_lucky_card_dialog_dwodo_c.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_luck_card_item_widget_cwodjow.dart';

class TreaLuckyCardDialogDwodo extends TreaFaD<TreaLuckyCardDialogDwodoC>{
  Function(bool played) dismissDialogCallback;
  TreaLuckyCardDialogDwodo({
    required this.dismissDialogCallback,
});
  @override
  TreaLuckyCardDialogDwodoC cccDiheiwidow() => TreaLuckyCardDialogDwodoC(
    dismissDialogCallback: dismissDialogCallback,
  );

  @override
  Widget wwwdwjidwo() => Container(
    width: double.infinity,
    height: 362.h,
    margin: EdgeInsets.only(left: 35.w,right: 35.w),
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "ciwdiw",width: double.infinity,height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 8.h),
            child: TreaTextDwihdw(data: "Wealth Card", size: 20.sp, color: "#FFFFFF",lineColor: "#2974D6",fontWeight: FontWeight.w900,),
          ),
        ),
        Positioned(
          top: 0,
          right: 12.w,
          child: TreaClickDhwidjow(
            onTap: (){
              treaC.clickClose();
            },
            child: TreaImageDhwudhiw(name: "icon_close",width: 24.w,height: 24.w,),
          ),
        ),
        _contentWidget(),
      ],
    ),
  );

  _contentWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      height: 290.h,
      margin: EdgeInsets.only(left: 11.w,right: 11.w,bottom: 21.h),
      child: Stack(
        children: [
          TreaImageDhwudhiw(name: "dmwidjiw",width: double.infinity,height: 290.h,),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TreaTextDwihdw(data: "The max prize per card is up to", size: 12.sp, color: "#000000",fontWeight: FontWeight.bold,),
                  SizedBox(width: 2.w,),
                  TreaTextDwihdw(data: "\$500", size: 16.sp, color: "#000000",fontWeight: FontWeight.bold,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 244.h,
              margin: EdgeInsets.only(left: 12.w,right: 12.w,bottom: 10.h,),
              child: Stack(
                children: [
                  TreaImageDhwudhiw(name: "dwidjow",width: double.infinity,height: 244.h,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(left: 16.w,right: 16.w,bottom: 11.h),
                      child: MasonryGridView.count(
                        padding: const EdgeInsets.all(0),
                        itemCount: treaC.rewardList.length,
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 14.w,
                        itemBuilder: (context,index)=>TreaClickDhwidjow(
                          onTap: (){
                            treaC.clickCardItem(index);
                          },
                          child: TreaLuckCardItemWidgetCwodjow(
                            index: index,
                            reward: treaC.rewardList[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 8.h),
                      child: TreaTextDwihdw(data: "Tap a card - test your luck", size: 12.sp, color: "#9DACC4",fontWeight: FontWeight.w900,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}