import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_app/themes/app_color.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imagePath;
  final double width;

  const CustomNetworkImage({
    super.key,
    required this.imagePath,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "${dotenv.env["API_BASE_URL"]!}/$imagePath",
      width: width,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: LoadingAnimationWidget.progressiveDots(
            color: AppColor.primaryAccentColor,
            size: width / 2
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Icon(Icons.error_outline, color: AppColor.errorColor),
        );
      },
    );
  }
}
