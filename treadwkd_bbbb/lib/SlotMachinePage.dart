import 'dart:math';
import 'package:flutter/material.dart';

class WheelSlotMachine extends StatefulWidget {
  const WheelSlotMachine({super.key});

  @override
  State<WheelSlotMachine> createState() => _WheelSlotMachineState();
}

class _WheelSlotMachineState extends State<WheelSlotMachine>
    with TickerProviderStateMixin {
  final List<FixedExtentScrollController> controllers =
  List.generate(3, (_) => FixedExtentScrollController());
  final List<IconData> icons = [Icons.favorite, Icons.star, Icons.cake];
  bool isSpinning = false;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    // 默认显示第二个图标（index = 1）
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final c in controllers) {
        c.jumpToItem(1);
      }
    });
  }

  void startSpin() async {
    if (isSpinning) return;
    setState(() => isSpinning = true);

    for (int i = 0; i < controllers.length; i++) {
      final controller = controllers[i];

      // 模拟多圈滚动 + 最后停在第二个图标（index = 1）
      final extraRounds = random.nextInt(10) + 10; // 随机滚动圈数
      final targetIndex = icons.length * extraRounds + 1;

      // 每列停下时增加一点延迟，形成顺序效果
      Future.delayed(Duration(milliseconds: i * 400), () async {
        await controller.animateToItem(
          targetIndex,
          duration: const Duration(milliseconds: 2500),
          curve: Curves.easeOutCubic,
        );

        if (i == controllers.length - 1) {
          setState(() => isSpinning = false);
        }
      });
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double itemExtent = 80.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Wheel 老虎机')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 老虎机主体
          SizedBox(
            height: itemExtent * 3, // 显示三行（上淡出 + 中间 + 下淡出）
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (col) {
                return SizedBox(
                  width: itemExtent,
                  child: ListWheelScrollView.useDelegate(
                    controller: controllers[col],
                    physics: const FixedExtentScrollPhysics(),
                    itemExtent: itemExtent,
                    perspective: 0.002,
                    diameterRatio: 2.5,
                    overAndUnderCenterOpacity: 0.3, // 上下淡出效果
                    squeeze: 1.0,
                    renderChildrenOutsideViewport: false,
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        final icon = icons[index % icons.length];
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white,
                          ),
                          child: Icon(icon, size: 40, color: Colors.pink),
                        );
                      },
                      childCount: icons.length * 100,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: startSpin,
            child: Text(isSpinning ? '滚动中...' : '开始滚动'),
          ),
        ],
      ),
    );
  }
}