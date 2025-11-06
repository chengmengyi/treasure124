import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_firebase_hep_nievnie.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_d.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/dialog/trea_set_dialog_djojow/trea_set_dialog_djojow_c.dart';

class TreaSetDialogDjojow extends TreaFaD<TreaSetDialogDjojowC>{
  @override
  TreaSetDialogDjojowC cccDiheiwidow() => TreaSetDialogDjojowC();

  @override
  Widget wwwdwjidwo() => Container(
    width: double.infinity,
    height: 300.h,
    margin: EdgeInsets.only(left: 30.w,right: 30.w,),
    child: Stack(
      children: [
        TreaImageDhwudhiw(name: "ndiwimw",width: double.infinity,height: 300.h,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 8.h),
            child: TreaTextDwihdw(data: "SETTING", size: 20.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#2974D6",),
          ),
        ),
        _contentWidget(),
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
      ],
    ),
  );

  _contentWidget()=>Container(
    margin: EdgeInsets.only(left: 40.w,right: 40.w,top: 70.h),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _musicWidget(),
        SizedBox(height: 16.h,),
        _soundWidget(),
        SizedBox(height: 38.h,),
        // _contactWidget(),
        // SizedBox(height: 16.h,),
        _privacyWidget(),
      ],
    ),
  );

  _musicWidget()=>GetBuilder<TreaSetDialogDjojowC>(
    id: "music",
    builder: (_)=>Row(
      children: [
        TreaImageDhwudhiw(name: "djiwoow",width: 24.w,height: 24.w,),
        SizedBox(width: 16.w,),
        TreaTextDwihdw(data: "Music", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#393075",),
        Spacer(),
        TreaClickDhwidjow(
          onTap: (){
            treaC.clickMusic();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              TreaImageDhwudhiw(name: bPlayMusic.getData()?"switch_on":"switch_off",width: 79.w,height: 21.h,),
              TreaTextDwihdw(data: bPlayMusic.getData()?"ON":"OFF", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#3B3178",),
            ],
          ),
        ),
      ],
    ),
  );

  _soundWidget()=>GetBuilder<TreaSetDialogDjojowC>(
    id: "sound",
    builder: (_)=>Row(
      children: [
        TreaImageDhwudhiw(name: "wdiwio",width: 24.w,height: 24.w,),
        SizedBox(width: 16.w,),
        TreaTextDwihdw(data: "Sound", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#393075",),
        Spacer(),
        TreaClickDhwidjow(
          onTap: (){
            treaC.clickSound();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              TreaImageDhwudhiw(name: bPlaySound.getData()?"switch_on":"switch_off",width: 79.w,height: 21.h,),
              TreaTextDwihdw(data: bPlaySound.getData()?"ON":"OFF", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#3B3178",),
            ],
          ),
        ),
      ],
    ),
  );

  _contactWidget()=>TreaClickDhwidjow(
    onTap: (){

    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        TreaImageDhwudhiw(name: "dwidnow",width: double.infinity,height: 32.h,),
        TreaTextDwihdw(data: "Contact us", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#2C5993",),
      ],
    ),
  );

  _privacyWidget()=>TreaClickDhwidjow(
    onTap: (){
      treaC.clickPrivacy();
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        TreaImageDhwudhiw(name: "dwidnow",width: double.infinity,height: 32.h,),
        TreaTextDwihdw(data: "Privacy Policy", size: 16.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,lineColor: "#2C5993",),
      ],
    ),
  );
}