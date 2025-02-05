import 'package:mobile_app/models/rarity_model.dart';
import 'package:mobile_app/models/set_model.dart';

class CardModel {
  final int id;
  final String image;
  final int number;
  final RarityModel rarity;
  final SetModel set;
  bool isInCollection;

  CardModel({
    required this.id,
    required this.image,
    required this.number,
    required this.rarity,
    required this.set,
    required this.isInCollection,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id_card'],
      image: json['image_path'],
      number: json['number'],
      rarity: RarityModel.fromJson(json['rarity']),
      set: SetModel.fromJson(json['set']),
      isInCollection: json['is_in_collection'] == 1,
    );
  }

  Map<String, dynamic> toJson() => {
    'id_card': id,
    'image': image,
    'number': number,
    'rarity': rarity.toJson(),
    'set': set.toJson(),
    'isInCollection': isInCollection,
  };
}
