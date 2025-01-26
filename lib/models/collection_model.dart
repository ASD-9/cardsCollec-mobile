class CollectionModel {
  final int id;
  final String name;
  final String image;

  CollectionModel({
    required this.id,
    required this.name,
    required this.image
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      id: json['id_collection'],
      name: json['name'],
      image: json['image_path']
    );
  }

  Map<String, dynamic> toJson() => {
    'id_collection': id,
    'name': name,
    'image': image
  };
}
