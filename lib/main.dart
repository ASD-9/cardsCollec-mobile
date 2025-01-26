import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app/providers/cards_provider.dart';
import 'package:mobile_app/providers/collections_provider.dart';
import 'package:mobile_app/providers/sets_provider.dart';
import 'package:mobile_app/routes/app_routes.dart';
import 'package:mobile_app/services/cards_service.dart';
import 'package:mobile_app/services/collections_service.dart';
import 'package:mobile_app/services/sets_service.dart';
import 'package:mobile_app/themes/app_theme.dart';
import 'package:mobile_app/utils/dio_client.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();

  DioClient.addInterceptors();
  final Dio dio = DioClient.dio;

  final CardsService cardsService = CardsService(dio);
  final SetsService setsService = SetsService(dio);
  final CollectionsService collectionsService = CollectionsService(dio);

  runApp(
    MultiProvider(
      providers: [
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
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
