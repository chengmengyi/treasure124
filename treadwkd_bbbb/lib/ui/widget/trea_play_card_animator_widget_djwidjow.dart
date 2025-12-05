import 'package:flutter/material.dart';
import 'package:treadwkd_bbbase/hep/trea_event_dwhidw/trea_event_bean_djwid.dart';
import 'package:treadwkd_bbbase/ui/widget/trea_fa_w.dart';
import 'package:treadwkd_bbbb/hep/trea_event_code_dhwdhwi.dart';

class TreaPlayCardAnimatorWidgetDjwidjow extends TreaFaW{
  Widget child;
  TreaPlayCardAnimatorWidgetDjwidjow({
    required this.child,
  });
  @override
  State<StatefulWidget> createState() => _TreaPlayCardAnimatorWidgetDjwidjowState();
}

class _TreaPlayCardAnimatorWidgetDjwidjowState extends TreaFaWState<TreaPlayCardAnimatorWidgetDjwidjow>  with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  Offset _startOffset = Offset.zero;
  Offset _endOffset = Offset.zero;
  bool _isFlyingOut = false;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget wwwdwjidwo() => AnimatedBuilder(
    animation: _animation,
    builder: (_, __) {
      if (!_isVisible) return const SizedBox.shrink();
      // 正在飞行中
      if (_controller.isAnimating) {
        final offset = _getParabolaOffset(_animation.value);
        return Transform.translate(
          offset: offset,
          child: widget.child,
        );
      }
      // 飞入后，停在原位显示
      if (!_isFlyingOut) {
        return widget.child;
      }
      return const SizedBox.shrink();
    },
  );


  Offset _getParabolaOffset(double t) {
    double x = _startOffset.dx + (_endOffset.dx - _startOffset.dx) * t;
    double y = _startOffset.dy + (_endOffset.dy - _startOffset.dy) * t - 50 * t * (1 - t);
    return Offset(x, y);
  }

  void _flyOut() {
    final screenWidth = MediaQuery.of(context).size.width;
    setState(() {
      _isFlyingOut = true;
      _isVisible = true;
      _startOffset = const Offset(0, 0);
      // _endOffset = Offset(-screenWidth, -200);
      _endOffset = Offset(-screenWidth, 0);
    });
    _controller.forward().then((value) {
      setState(() {
        _isVisible = false;
        _controller.reset();
      });
      _flyIn();
    });
  }

  void _flyIn() {
    final screenWidth = MediaQuery.of(context).size.width;
    setState(() {
      _isFlyingOut = false;
      _isVisible = true;
      // _startOffset = Offset(screenWidth, -200);
      _startOffset = Offset(screenWidth, 0);
      _endOffset = const Offset(0, 0);
    });
    _controller.forward().then((_) {
      _controller.reset();
    });
  }

  @override
  bool initEventjdiwjdiow() => true;

  @override
  handleEventwhudwhi(TreaEventBeanDjwid bean) {
    switch(bean.code){
      case TreaEventCodeDhwdhwi.startPlayCardAnimator:
        _flyOut();
        break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}