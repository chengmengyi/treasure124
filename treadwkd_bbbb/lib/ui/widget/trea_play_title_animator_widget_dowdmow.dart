import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';

class TreaPlayTitleAnimatorWidgetDowdmow extends TreaFaW{
  Widget  child;
  TreaPlayTitleAnimatorWidgetDowdmow({
    required this.child,
});

  @override
  State<StatefulWidget> createState() => _TreaPlayTitleAnimatorWidgetDowdmowState();
}

class _TreaPlayTitleAnimatorWidgetDowdmowState extends TreaFaWState<TreaPlayTitleAnimatorWidgetDowdmow> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initAnimator();
  }

  @override
  Widget wwwdwjidwo() => ScaleTransition(
    scale: _animation,
    child: widget.child,
  );

  _initAnimator()async{
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 0.8, end: 1.0)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}