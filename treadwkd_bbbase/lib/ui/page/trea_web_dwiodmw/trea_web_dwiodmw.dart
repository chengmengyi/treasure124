import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_ex.dart';
import 'package:treadwkd_bbbase/hep/trea_rou_dwjidw.dart';
import 'package:treadwkd_bbbase/ui/page/trea_fa_p.dart';
import 'package:treadwkd_bbbase/ui/page/trea_web_dwiodmw/trea_web_dwiodmw_c.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/trea_text_dwihdw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';

class TreaWebDwiodmw extends TreaFaP<TreaWebDwiodmwC>{
  @override
  TreaWebDwiodmwC cccDiheiwidow() => TreaWebDwiodmwC();

  @override
  Widget wwwdwjidwo() => Stack(
    children: [
      TreaImageDhwudhiw(name: "fkoek",width: double.infinity,height: double.infinity,),
      Column(
        children: [
          _titleWidget(),
          Expanded(child: WebViewWidget(controller: treaC.controller)),
        ],
      ),
    ],
  );

  _titleWidget()=>Container(
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images_treasure124/fjeijdie.webp'),
        fit: BoxFit.fill,
      ),
    ),
    child: SafeArea(
      top: true,
      child: Container(
        padding: EdgeInsets.only(left: 16.w,bottom: 16.h,right: 16.w),
        child: Row(
          children: [
            TreaClickDhwidjow(
              onTap: (){
                TreaRouDwjidw.backdwhudie();
              },
              child: TreaImageDhwudhiw(name: "dwodow",width: 38.w,height: 26.h,),
            ),
            Spacer(),
            TreaTextDwihdw(data: treaC.title, size: 20.sp, color: "#FFFFFF",fontWeight: FontWeight.bold,),
            Spacer(),
            SizedBox(width: 38.w,),
          ],
        ),
      ),
    ),
  );
}