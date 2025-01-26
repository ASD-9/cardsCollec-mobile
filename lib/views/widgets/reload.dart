import 'package:flutter/material.dart';
import 'package:mobile_app/themes/app_color.dart';

class Reload extends StatelessWidget {
  final String error;
  final Function() onTap;

  const Reload({
    super.key,
    required this.error,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(error),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.refresh),
                const SizedBox(width: 5),
                const Text("Recharger", style: TextStyle(color: AppColor.primaryTextColor)),
              ],
            )
          )
        ],
      ),
    );
  }
}
