import 'package:event_bus/event_bus.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';

class TreaEventHepDhwidw{
  static final TreaEventHepDhwidw _dhwidw=TreaEventHepDhwidw();
  static TreaEventHepDhwidw get instance => _dhwidw;

  final EventBus _event=EventBus();

  EventBus getEvent()=>_event;

  send({
    required int code,
    String? str,
    int? i,
    Map? map,
  }){
    _event.fire(TreaEventBeanDjwid(code: code,str: str,i: i,map: map));
  }
}