import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/ui/trea_finger_widget_djiwji.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_click_dhwidjow.dart';
import 'package:treadwkd_bbbb/ui/widget/trea_box_widget_djwidjow.dart';

class TreaOldUserGuideView extends StatelessWidget{
  Offset offset;
  Function() clickCallback;
  TreaOldUserGuideView({
    required this.offset,
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
              child: TreaBoxWidgetDjwidjow(),
            ),
            Positioned(
              top: offset.dy,
              left: offset.dx,
              child: TreaFingerWidgetDjiwji(),
            ),
          ],
        ),
      ),
    ),
  );
}