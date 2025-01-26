import 'package:flutter/material.dart';
import 'package:mobile_app/utils/page_transition.dart';
import 'package:mobile_app/views/screens/card_details_screen.dart';
import 'package:mobile_app/views/screens/cards_screen.dart';

class AppRoutes {
  static const initialRoute = "/cards";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/cards":
        return PageTransition.slideTransition(page: const CardsScreen(idSet: 2,)); // TODO: make the idSet dynamic
      case "/card-details":
        return PageTransition.slideTransition(page: const CardDetailsScreen(), fromBottom: true);
      default:
        return PageTransition.slideTransition(page: const CardsScreen(idSet: 2,)); // TODO: to replace
    }
  }
}
