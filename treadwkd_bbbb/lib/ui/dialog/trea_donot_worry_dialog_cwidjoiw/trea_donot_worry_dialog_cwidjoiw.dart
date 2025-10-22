import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_hep_dhwidhiw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_donot_worry_dialog_cwidjoiw/trea_donot_worry_dialog_cwidjoiw_c.dart';

class TreaDonotWorryDialogCwidjoiw extends TreaFaD<TreaDonotWorryDialogCwidjoiwC>{
  Function() dismissCallback;
  TreaDonotWorryDialogCwidjoiw({
    required this.dismissCallback,
});

  @override
  TreaDonotWorryDialogCwidjoiwC cccDiheiwidow() => TreaDonotWorryDialogCwidjoiwC();

  @override
  Widget wwwdwjidwo() =>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        margin: EdgeInsets.only(left: 34.w,right: 34.w),
        decoration: BoxDecoration(
          color: "#F2FAFF".toColordwdowfw(),
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TreaTextDwihdw(data: "Don't Worry", size: 20.sp, color: "#272A2F",fontWeight: FontWeight.bold,),
            SizedBox(height: 12.h,),
            TreaImageDhwudhiw(name: "teuwuwh",width: 128.w,height: 130.h,),
            SizedBox(height: 12.h,),
            TreaTextDwihdw(data: "We will assist you with completing your withdrawal—simply follow the steps below to finalize the process.", size: 16.sp, color: "#5F727A",fontWeight: FontWeight.bold,),
            SizedBox(height: 12.h,),
            TreaClickDhwidjow(
              onTap: (){
                treaC.click(dismissCallback);
              },
              child: Container(
                width: 173.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: ["#192B67".toColordwdowfw(),"#3256CD".toColordwdowfw(),],
                    )
                ),
                child: TreaTextDwihdw(data: "Go", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 27.h,),
      TreaClickDhwidjow(
        onTap: (){
          treaC.click(dismissCallback);
        },
        child: TreaImageDhwudhiw(name: "icon_close",width: 30.w,height: 30.w,),
      ),
    ],
  );
}