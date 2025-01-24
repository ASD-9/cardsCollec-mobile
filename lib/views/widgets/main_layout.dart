import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  final String title;
  final bool hasReturnButton;
  final List<Widget>? actions;

  const MainLayout({
    super.key,
    required this.body,
    required this.title,
    required this.hasReturnButton,
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: hasReturnButton
          ? IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          )
          : null,
        title: Text(title),
        actions: actions,
      ),
      body: body,
    );
  }
}
