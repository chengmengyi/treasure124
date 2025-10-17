// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:treasure124/scratcher/widgets.dart';
//
// class ScratchCardPage extends StatefulWidget {
//   const ScratchCardPage({super.key});
//
//   @override
//   State<ScratchCardPage> createState() => _ScratchCardPageState();
// }
//
// class _ScratchCardPageState extends State<ScratchCardPage> {
//   final GlobalKey<ScratcherState> _scratchKey = GlobalKey<ScratcherState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('刮刮卡 Demo')),
//       body: Center(
//         child: Scratcher(
//           brushSize: 30,
//           key: _scratchKey,
//           threshold: 70, // 刮开百分比达到 40% 自动触发 onThreshold
//           image: Image.asset('assets/images_treasure124/pic.png'),
//           onThreshold: () {
//             _scratchKey.currentState?.reveal();
//           },
//           child: Container(
//             width: 300,
//             height: 200,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: Colors.yellow.shade100,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Text(
//               '🎉 恭喜你中奖了 🎉',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: (){
//           _startAutoZScratch();
//         },
//         label: const Text("自动刮开"),
//         icon: const Icon(Icons.auto_awesome),
//       ),
//     );
//   }
//
//   _startAutoZScratch()async{
//
//     // Offset(78.9, 36.3)  Offset(229.1, 39.5)
//     //Offset(229.1, 39.5)  Offset(77.3, 83.7)
//     //Offset(77.3, 83.7)  Offset(222.2, 100.8)
//     // Offset(222.2, 100.8)   Offset(70.9, 142.3)
//     //Offset(70.9, 142.3)   Offset(251.5, 167.9)
//
//
//     // final List<Offset> pathPoints = const [
//     //   Offset(78.9, 36.3),
//     //   Offset(229.1, 39.5),
//     //   Offset(77.3, 83.7),
//     //   Offset(222.2, 100.8),
//     //   Offset(70.9, 142.3),
//     //   Offset(251.5, 167.9),
//     // ];
//     // const int stepsPerSegment = 25;
//     // const Duration delay = Duration(milliseconds: 5);
//     //
//     // for (int i = 0; i < pathPoints.length - 1; i++) {
//     //   final start = pathPoints[i];
//     //   final end = pathPoints[i + 1];
//     //   final dx = (end.dx - start.dx) / stepsPerSegment;
//     //   final dy = (end.dy - start.dy) / stepsPerSegment;
//     //
//     //   for (int j = 0; j <= stepsPerSegment; j++) {
//     //     if (!mounted) return;
//     //     final px = start.dx + dx * j;
//     //     final py = start.dy + dy * j;
//     //     _scratchKey.currentState?.addPoint(Offset(px, py));
//     //     await Future.delayed(delay);
//     //   }
//     // }
//     //
//     // // 刮完后展示
//     // await Future.delayed(const Duration(milliseconds: 300));
//     // _scratchKey.currentState?.reveal(duration: const Duration(milliseconds: 500));
//
//
//     //Offset(35.2, 167.9)  Offset(74.6, 33.6)
//     //Offset(74.6, 33.6)  Offset(118.3, 171.1)
//     // Offset(118.3, 171.1)  Offset(187.5, 50.7)
//     //Offset(187.5, 50.7)  Offset(213.1, 157.8)
//     //Offset(213.1, 157.8) Offset(256.3, 55.5)
//
//
//     final List<Offset> pathPoints = const [
//       Offset(35.2, 167.9),
//       Offset(74.6, 33.6),
//       Offset(118.3, 171.1),
//       Offset(187.5, 50.7),
//       Offset(213.1, 157.8),
//       Offset(256.3, 55.5),
//     ];
//
//     const int stepsPerSegment = 30; // 插值步数
//     const Duration delay = Duration(milliseconds: 10); // 每步延时
//
//     for (int i = 0; i < pathPoints.length - 1; i++) {
//       final start = pathPoints[i];
//       final end = pathPoints[i + 1];
//       final dx = (end.dx - start.dx) / stepsPerSegment;
//       final dy = (end.dy - start.dy) / stepsPerSegment;
//
//       for (int j = 0; j <= stepsPerSegment; j++) {
//         if (!mounted) return;
//         final px = start.dx + dx * j;
//         final py = start.dy + dy * j;
//         _scratchKey.currentState?.addPoint(Offset(px, py));
//         await Future.delayed(delay);
//       }
//     }
//
//     // 刮完后 reveal
//     await Future.delayed(const Duration(milliseconds: 400));
//     _scratchKey.currentState?.reveal(duration: const Duration(milliseconds: 600));
//
//   }
// }