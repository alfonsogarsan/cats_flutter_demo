import 'package:cats/domain/entities/random_cat.dart';

abstract class CatsRepository {
  Future<RandomCat> getRandomCatUrl();
}
