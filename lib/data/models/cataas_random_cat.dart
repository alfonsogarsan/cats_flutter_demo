import 'package:cats/domain/entities/random_cat.dart';

const baseUrl = "https://cataas.com/cat/";

class CataasRandomCat {
  String id;
  String url;

  CataasRandomCat({required this.id, required this.url});

  factory CataasRandomCat.fromJson(Map<String, dynamic> json) {
    return CataasRandomCat(
      id: json['id'],
      url: json['url'],
    );
  }

  RandomCat toDomain({required String title}) {
    return RandomCat(
      url: "$baseUrl$id",
      title: title,
    );
  }
}
