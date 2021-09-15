import 'package:cats/domain/entities/random_cat.dart';
import 'package:cats/presentation/entities/position.dart';

///Presentation entity

class PositionedCat {
  final RandomCat cat;
  final Position position;
  final double angle;

  PositionedCat(
      {required this.cat, required this.position, required this.angle});
}
