class GameModel {
  String? name;
  String? img;
  double? ratings;
  double? price;

  GameModel({
    this.name,
    this.img,
    this.ratings,
    this.price,
  });

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      name: map['name'] as String?,
      img: map['img'] as String?,
      ratings: map['ratings'] as double?,
      price: map['price'] as double?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'img': img,
      'ratings': ratings,
      'price': price,
    };
  }
}
