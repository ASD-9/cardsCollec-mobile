import 'package:flutter/material.dart';
import 'package:mobile_app/models/card_model.dart';
import 'package:mobile_app/providers/cards_provider.dart';
import 'package:mobile_app/themes/app_color.dart';
import 'package:mobile_app/views/widgets/rotate_card.dart';
import 'package:provider/provider.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CardsProvider cardsProvider = Provider.of<CardsProvider>(context);
    final CardModel card = cardsProvider.cards[cardsProvider.selectedCard!];
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.secondaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
              cardsProvider.selectedCard = null;
            },
            iconSize: 32,
          ),
        ],
      ),
      body: Column(
        children: [
          RotateCard(imagePath: card.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("#${card.number.toString()}"),
                  Text("${card.rarity.name} (${card.rarity.abbreviatedName})")
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (card.isInCollection) {
                    cardsProvider.removeCardFromCollection(card.id);
                  } else {
                    cardsProvider.addCardToCollection(card.id);
                  }
                },
                child: Row(
                  children: [
                    Icon(
                      card.isInCollection ?  Icons.remove_circle_outline : Icons.add_circle_outline
                    ),
                    const SizedBox(width: 5),
                    Text(
                      card.isInCollection ? "Retirer de la collection" : "Ajouter à la collection",
                      style: TextStyle(color: AppColor.primaryTextColor)
                    ),
                  ],
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
