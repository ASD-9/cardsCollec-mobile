// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mobile_app/providers/auth_provider.dart';
import 'package:mobile_app/themes/app_color.dart';
import 'package:mobile_app/views/widgets/main_layout.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isAuthenticated = await Provider.of<AuthProvider>(context, listen: false).checkAuthStatus();
      final String route = isAuthenticated ? "/collections" : "/login";
      Navigator.pushReplacementNamed(context, route);
    });

    return MainLayout(
      title: "",
      body: Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: AppColor.primaryAccentColor,
          size: MediaQuery.of(context).size.width / 5
        ),
      )
    );
  }
}
