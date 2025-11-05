import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/ui/trea_image_dhwudhiw.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_auto_gua_animator_djwidjomw.dart';

class TreaNewUserGuide2View extends StatelessWidget{
  Offset offset;
  Size size;
  Function() clickCallback;
  TreaNewUserGuide2View({
    required this.offset,
    required this.size,
    required this.clickCallback,
});

  @override
  Widget build(BuildContext context) => Material(
    type: MaterialType.transparency,
    child: TreaClickDhwidjow(
      onTap: (){
        clickCallback.call();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.7),
        child: Stack(
          children: [
            Positioned(
              top: offset.dy,
              left: offset.dx,
              child: TreaImageDhwudhiw(name: "diwdowmo",width: size.width,height: size.height,),
            ),
            Positioned(
              top: offset.dy,
              left: offset.dx,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: TreaAutoGuaAnimatorDjwidjomw(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}