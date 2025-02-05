import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? bottomSheet;
  final Widget body;

  const MainLayout({
    super.key,
    required this.title,
    this.actions,
    this.bottomSheet,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: body,
      bottomSheet: bottomSheet,
    );
  }
}
