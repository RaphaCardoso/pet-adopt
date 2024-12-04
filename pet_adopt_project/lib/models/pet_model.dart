class PetModel {
  final String name;
  final int age;
  final int weight;
  final String color;
  final List<String> images;

  PetModel(
      {required this.name,
      required this.age,
      required this.weight,
      required this.color,
      required this.images});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'color': color,
      'images': images,
    };
  }

  PetModel.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        age = map['age'],
        weight = map['weight'],
        color = map['color'],
        images = List<String>.from((map['images'] as List));
}
