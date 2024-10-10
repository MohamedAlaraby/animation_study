import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation<AlignmentGeometry> greenAnimatedAlignment;
  late Animation<AlignmentGeometry> yellowAnimatedAlignment;
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      reverseDuration: const Duration(seconds: 4),
    );
    greenAnimatedAlignment = Tween<AlignmentGeometry>(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(_animationController);
    yellowAnimatedAlignment = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.centerRight)
        .animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _stackWidget(),
          _controllWidgets(),
        ],
      ),
    );
  }

  Widget _stackWidget() {
    return Expanded(
      child: Stack(
        children: [
          AlignTransition(
            alignment: greenAnimatedAlignment,
            child: const CircleAvatar(
              backgroundColor: Colors.green,
            ),
          ),
          AlignTransition(
            alignment: yellowAnimatedAlignment,
            child: const CircleAvatar(
              backgroundColor: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }

  Widget _controllWidgets() {
    return Wrap(
      children:   [
        ElevatedButton(
          onPressed: () {
            _animationController.forward();
          },
          child: const Text("forward"),
        ),
        ElevatedButton(
          onPressed: () {
            _animationController.reverse();
          },
          child: const Text("reverse"),
        ),
        ElevatedButton(
          onPressed: () {
            _animationController.stop();
          },
          child: const Text("stop"),
        ),
        ElevatedButton(
          onPressed: () {
            _animationController.reset();
          },
          child: const Text("reset"),
        ),
        ElevatedButton(
          onPressed: () {
            _animationController.repeat(reverse: false);
          },
          child: const Text("repeat (false)"),
        ),
        ElevatedButton(
          onPressed: () {
            _animationController.repeat(reverse: true);
          },
          child: const Text("repeat (true)"),
        ),
      ],
    );
  }
}
