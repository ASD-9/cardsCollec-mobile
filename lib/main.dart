import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app/providers/auth_provider.dart';
import 'package:mobile_app/providers/cards_provider.dart';
import 'package:mobile_app/providers/collections_provider.dart';
import 'package:mobile_app/providers/sets_provider.dart';
import 'package:mobile_app/routes/app_routes.dart';
import 'package:mobile_app/services/auth_service.dart';
import 'package:mobile_app/services/cards_service.dart';
import 'package:mobile_app/services/collections_service.dart';
import 'package:mobile_app/services/sets_service.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/utils/dio_client.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  await dotenv.load();

  final Dio dio = DioClient.dio;

  final AuthService authService = AuthService(dio);
  final CardsService cardsService = CardsService(dio);
  final SetsService setsService = SetsService(dio);
  final CollectionsService collectionsService = CollectionsService(dio);

  DioClient.addInterceptors(authService: authService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider(authService)),
        ChangeNotifierProvider<CardsProvider>(create: (_) => CardsProvider(cardsService)),
        ChangeNotifierProvider<SetsProvider>(create: (_) => SetsProvider(setsService)),
        ChangeNotifierProvider<CollectionsProvider>(create: (_) => CollectionsProvider(collectionsService)),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
