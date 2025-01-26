import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_app/views/widgets/custom_network_image.dart';

class RotateCard extends StatefulWidget {
  final String imagePath;

  const RotateCard({required this.imagePath, super.key});

  @override
  State<RotateCard> createState() => _RotateCardState();
}

class _RotateCardState extends State<RotateCard> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animationY;
  late Animation<double> _animationX;
  double dragPositionY = 0;
  double dragPositionX = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this
    );

    _controller.addListener(() {
      setState(() {
        dragPositionY = _animationY.value;
        dragPositionX = _animationX.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final angleY = dragPositionY / 180 * pi;
    final angleX = dragPositionX / 180 * pi;
    final transform = Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateY(angleY)
      ..rotateX(angleX);

    return GestureDetector(
      onPanUpdate: (details) {
        double dragY = dragPositionY - details.delta.dx * 0.3;
        double dragX = dragPositionX + details.delta.dy * 0.3;
        if (dragY < 30 && dragY > -30) {
          setState(() {
            dragPositionY = dragY;
          });
        }
        if (dragX < 20 && dragX > -20) {
          setState(() {
            dragPositionX = dragX;
          });
        }
      },
      onPanEnd: (details) {
        _animationX = Tween<double>(
          begin: dragPositionX,
          end: 0,
        ).animate(_controller);
        _animationY = Tween<double>(
          begin: dragPositionY,
          end: 0,
        ).animate(_controller);
        _controller.forward(from: 0);
      },
      child: Transform(
        transform: transform,
        alignment: Alignment.center,
        child: CustomNetworkImage(
          imagePath: widget.imagePath,
          width: MediaQuery.of(context).size.width
        )
      ),
    );
  }
}
