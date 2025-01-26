// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:mobile_app/providers/cards_provider.dart';
import 'package:mobile_app/themes/app_color.dart';
import 'package:mobile_app/views/widgets/cards_list.dart';
import 'package:mobile_app/views/widgets/cards_stats.dart';
import 'package:mobile_app/views/widgets/main_layout.dart';
import 'package:mobile_app/views/widgets/reload.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key, required this.idSet});

  final int idSet;

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() => Provider.of<CardsProvider>(context, listen: false).fetchCards(widget.idSet));
  }

  @override
  Widget build(BuildContext context) {
    final CardsProvider cardsProvider = Provider.of<CardsProvider>(context);
    return MainLayout(
      title: "Cards", // TODO: Replace with the name of the set
      actions: [
        IconButton(
          icon: Icon(
            cardsProvider.sortBy == "number" ? Icons.hotel_class : Icons.pin,
          ),
          onPressed: () {
            cardsProvider.sortCards(cardsProvider.sortBy == "number" ? "rarity" : "number");
          },
        )
      ],
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => cardsProvider.isInCollectionFilter = null,
            child: Text(
              "Toutes",
              style: TextStyle(
                color: cardsProvider.isInCollectionFilter == null ? AppColor.primaryAccentColor : AppColor.secondaryAccentColor
              ),
            ),
          ),
          TextButton(
            onPressed: () => cardsProvider.isInCollectionFilter = false,
            child: Text(
              "Manquantes",
              style: TextStyle(
                color: cardsProvider.isInCollectionFilter != null && !cardsProvider.isInCollectionFilter! ? AppColor.primaryAccentColor : AppColor.secondaryAccentColor
              ),
            ),
          ),
          TextButton(
            onPressed: () => cardsProvider.isInCollectionFilter = true,
           child: Text(
              "Possédées",
              style: TextStyle(
                color: cardsProvider.isInCollectionFilter != null && cardsProvider.isInCollectionFilter! ? AppColor.primaryAccentColor : AppColor.secondaryAccentColor
              ),
            ),
          )
        ],
      ),
      body: cardsProvider.isLoading
        ? Center(
          child: LoadingAnimationWidget.fourRotatingDots(
            color: AppColor.primaryAccentColor,
            size: MediaQuery.of(context).size.width / 5
          )
        )
        : cardsProvider.error != null
          ? Reload(
            error: cardsProvider.error!,
            onTap: () => Provider.of<CardsProvider>(context, listen: false).fetchCards(widget.idSet)
          )
          : Column(
            children: [
              CardsStats(),
              Expanded(
                child: CardsList()
              ),
            ],
          )
    );
  }
}
