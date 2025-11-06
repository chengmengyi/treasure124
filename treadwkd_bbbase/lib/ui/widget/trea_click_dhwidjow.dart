import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_voice_hep_dwidiwn.dart';

class TreaClickDhwidjow extends StatelessWidget{
  Widget? child;
  Function()? onTap;

  TreaClickDhwidjow({
    this.child,
    this.onTap,
});

  @override
  Widget build(BuildContext context) => InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: (){
      TreaVoiceHepDwidiwn.instance.playSound(SoundType.click);
      onTap?.call();
    },
    child: child??Container(),
  );
}