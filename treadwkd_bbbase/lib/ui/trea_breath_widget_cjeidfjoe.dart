import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';

class TreaBreathWidgetCjeidfjoe extends TreaFaW{
  bool start;
  Widget child;

  TreaBreathWidgetCjeidfjoe({
    required this.start,
    required this.child,
  });


  @override
  State<StatefulWidget> createState() => _TreaBreathWidgetCjeidfjoeState();
}

class _TreaBreathWidgetCjeidfjoeState extends TreaFaWState<TreaBreathWidgetCjeidfjoe> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initAnimator();
  }

  @override
  Widget wwwdwjidwo() => AnimatedBuilder(
    animation: _animation,
    builder: (context, child) {
      return Transform.scale(
        scale: _animation.value,
        filterQuality: FilterQuality.high,
        child: child,
      );
    },
    child: widget.child,
  );


  _initAnimator(){
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.start) {
        _controller.reset();
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}