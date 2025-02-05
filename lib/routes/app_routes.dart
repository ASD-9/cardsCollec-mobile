import 'package:flutter/material.dart';
import 'package:mobile_app/utils/page_transition.dart';
import 'package:mobile_app/views/screens/card_details_screen.dart';
import 'package:mobile_app/views/screens/cards_screen.dart';
import 'package:mobile_app/views/screens/collections_screen.dart';
import 'package:mobile_app/views/screens/login_screen.dart';
import 'package:mobile_app/views/screens/sets_screen.dart';
import 'package:mobile_app/views/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case "/cards":
        return PageTransition.slideTransition(page: CardsScreen(idSet: settings.arguments as int,));
      case "/card-details":
        return PageTransition.slideTransition(page: const CardDetailsScreen(), fromBottom: true);
      case "/sets":
        return PageTransition.slideTransition(page: SetsScreen(idCollection: settings.arguments as int));
      case "/collections":
        return MaterialPageRoute(
          builder: (context) => const CollectionsScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
