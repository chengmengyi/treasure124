import 'dart:async';
import 'package:flutter/material.dart';

class SlotMachineListView extends StatefulWidget {
  const SlotMachineListView({super.key});

  @override
  State<SlotMachineListView> createState() => _SlotMachineListViewState();
}

class _SlotMachineListViewState extends State<SlotMachineListView> {
  final List<ScrollController> controllers = List.generate(3, (_) => ScrollController());
  final List<IconData> icons = [Icons.favorite, Icons.star, Icons.cake];

  bool isSpinning = false;

  @override
  void initState() {
    super.initState();

    // 初始化显示第二个图标
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var controller in controllers) {
        controller.jumpTo(80.0); // 每个item高80，第二个位置
      }
    });
  }

  void startSpin() {
    if (isSpinning) return;
    isSpinning = true;

    for (int i = 0; i < controllers.length; i++) {
      final controller = controllers[i];
      Timer? columnTimer;

      // 启动每列的滚动计时器
      columnTimer = Timer.periodic(const Duration(milliseconds: 16), (t) {
        if (!mounted) return;
        final newOffset = controller.offset + 25;
        controller.jumpTo(newOffset > 100000 ? 0 : newOffset);
      });

      // 每列依次停止（间隔 0.5 秒）
      Future.delayed(Duration(milliseconds: 2000 + i * 500), () {
        columnTimer?.cancel();
        controller.animateTo(
          80.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        if (i == controllers.length - 1) isSpinning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('老虎机滚动')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            child: SizedBox(
              height: 240,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (col) {
                  return SizedBox(
                    width: 80,
                    child: ListView.builder(
                      controller: controllers[col],
                      physics: const NeverScrollableScrollPhysics(),
                      itemExtent: 80,
                      itemCount: 3000, // 模拟无限滚动
                      itemBuilder: (context, index) {
                        final icon = icons[index % 3];
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: Colors.white,
                          ),
                          child: Icon(icon, size: 36, color: Colors.pink),
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: startSpin,
            child: const Text('开始滚动'),
          ),
        ],
      ),
    );
  }
}