import 'package:flutter/material.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key, this.isPressedLike}) : super(key: key);
  final isPressedLike;

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (widget.isPressedLike) {
              _controller.forward();
            }
          },
          child: AnimatedOpacity(
            opacity: widget.isPressedLike ? 1.0 : 0.0,
            duration: Duration(milliseconds: 500),
            child: Icon(
              Icons.favorite,
              size: 100,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
