// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:mobile_app/models/card_model.dart';
import 'package:mobile_app/providers/cards_provider.dart';
import 'package:mobile_app/views/widgets/custom_network_image.dart';
import 'package:provider/provider.dart';

class CardsList extends StatelessWidget {
  const CardsList({super.key});

  @override
  Widget build(BuildContext context) {
    final CardsProvider cardsProvider = Provider.of<CardsProvider>(context);
    return GridView(
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 15,
        crossAxisCount: 3
      ),
      children: List.generate(
        cardsProvider.cards.length,
        (index) {
          final CardModel card = cardsProvider.cards[index];
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      cardsProvider.selectedCard = index;
                      Navigator.pushNamed(context, "/card-details");
                    },
                    child: CustomNetworkImage(
                      imagePath: card.image,
                      width: MediaQuery.of(context).size.width / 5,
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    right: -10,
                    child: Checkbox(
                      value: card.isInCollection,
                      onChanged: (value) async {
                        if (value!) {
                          await cardsProvider.addCardToCollection(card.id);
                        } else {
                          await cardsProvider.removeCardFromCollection(card.id);
                        }
                        if (cardsProvider.addOrRemoveCardError != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(cardsProvider.addOrRemoveCardError!),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      }
                    )
                  )
                ],
              ),
              Text("#${card.number} \n ${card.rarity.abbreviatedName}", textAlign: TextAlign.center,)
            ],
          );
        }
      ),
    );
  }
}
