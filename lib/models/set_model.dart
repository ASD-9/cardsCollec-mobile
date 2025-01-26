class SetModel {
  final int id;
  final String name;
  final String? image;

  SetModel({
    required this.id,
    required this.name,
    this.image
  });

  factory SetModel.fromJson(Map<String, dynamic> json) {
    return SetModel(
      id: json['id_set'],
      name: json['name'],
      image: json['image_path']
    );
  }

  Map<String, dynamic> toJson() => {
    'id_set': id,
    'name': name,
    if (image != null) 'image': image
  };
}
