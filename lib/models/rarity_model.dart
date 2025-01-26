class RarityModel {
  final int id;
  final String name;
  final String abbreviatedName;
  final int rank;

  RarityModel({
    required this.id,
    required this.name,
    required this.abbreviatedName,
    required this.rank,
  });

  factory RarityModel.fromJson(Map<String, dynamic> json) {
    return RarityModel(
      id: json['id_rarity'],
      name: json['name'],
      abbreviatedName: json['abbreviated_name'],
      rank: json['rank'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id_rarity': id,
    'name': name,
    'abbreviatedName': abbreviatedName,
    'rank': rank,
  };
}
