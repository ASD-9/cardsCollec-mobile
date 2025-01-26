import 'package:flutter/material.dart';
import 'package:mobile_app/providers/cards_provider.dart';
import 'package:mobile_app/themes/app_color.dart';
import 'package:provider/provider.dart';

class CardsStats extends StatelessWidget {
  const CardsStats({super.key});

  @override
  Widget build(BuildContext context) {
    final CardsProvider cardsProvider = Provider.of<CardsProvider>(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Collection",
              ),
              Column(
                children: [
                  Text(
                    "${cardsProvider.cards.where((e) => e.isInCollection).length}/${cardsProvider.cards.length}",
                  ),
                  Text(
                    cardsProvider.cards.isEmpty ? "0%" : "${(cardsProvider.cards.where((e) => e.isInCollection).length * 100) / cardsProvider.cards.length}%",
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: cardsProvider.cards.isEmpty ? 0 : cardsProvider.cards.where((e) => e.isInCollection).length / cardsProvider.cards.length
          )
        ],
      ),
    );
  }
}
