//import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const DemoApp(),
    );
  }
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  Pads createState() => Pads();
}

class Pads extends State<DemoApp> {
  final CountDownController _controller = CountDownController();

  bool _isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CHESS APP'),
          leading: const Icon(Icons.image_aspect_ratio),
          toolbarHeight: 50,
        ),
        body: Column(children: <Widget>[
          SizedBox(
            height: 360,
            width: 500,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (_isPause) {
                    _isPause = true;
                    _controller.pause();
                  } else {
                    _isPause = false;
                    _controller.resume();
                  }
                });
              },
              onDoubleTap: () => _controller.restart(),
              child: Card(
                // ignore: sort_child_properties_last
                child: NeonCircularTimer(
                  width: 200,
                  duration: 300,
                  isReverse: true,
                  isReverseAnimation: true,
                  controller: _controller,
                  isTimerTextShown: true,
                  neumorphicEffect: true,
                  innerFillColor: Colors.black12,
                  backgroudColor: Colors.blueAccent,
                  innerFillGradient: LinearGradient(colors: [
                    Colors.greenAccent.shade200,
                    Colors.blueAccent.shade400
                  ]),
                  neonGradient: LinearGradient(colors: [
                    Colors.greenAccent.shade200,
                    Colors.blueAccent.shade400
                  ]),
                ),
                elevation: 20,
                shadowColor: Colors.blueGrey,
                color: Colors.blueAccent,
                margin: const EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                clipBehavior: Clip.hardEdge,
              ),
            ),
          ),
          SizedBox(
              height: 360,
              width: 500,
              child: GestureDetector(
                onTap: () => _controller.pause(),
                onDoubleTap: () => _controller.restart(),
                child: Card(
                  // ignore: sort_child_properties_last
                  child: NeonCircularTimer(
                    width: 200,
                    duration: 300,
                    isReverse: true,
                    isReverseAnimation: true,
                    controller: _controller,
                    isTimerTextShown: true,
                    neumorphicEffect: true,
                    innerFillColor: Colors.black12,
                    backgroudColor: Colors.green,
                    innerFillGradient: LinearGradient(colors: [
                      Colors.greenAccent.shade200,
                      Colors.blueAccent.shade400
                    ]),
                    neonGradient: LinearGradient(colors: [
                      Colors.greenAccent.shade200,
                      Colors.blueAccent.shade400
                    ]),
                  ),
                  elevation: 20,
                  shadowColor: Colors.blueGrey,
                  color: Colors.green,
                  margin: const EdgeInsets.all(10),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  clipBehavior: Clip.hardEdge,
                ),
              )),
        ]));
  }
}
