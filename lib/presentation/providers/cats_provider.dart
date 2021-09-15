import 'package:cats/domain/entities/random_cat.dart';
import 'package:cats/domain/use_cases/get_random_cat_uc.dart';
import 'package:cats/presentation/providers/util.dart';
import 'package:cats/presentation/entities/positioned_cat.dart';
import 'package:cats/presentation/entities/position.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CatsProvider with ChangeNotifier {
  final GetRandomCatUC _getRandomCatUC;

  CatsProvider(
    this._getRandomCatUC,
  );

  /// fields
  GetData<RandomCat> _currentCatGet = GetData<RandomCat>();
  List<PositionedCat> _loadedCats = [];
  int _countLoadedCats = 0;

  /// Counter variable is reassigned every time which is needed in order observers will be notified.
  /// Array variable is not reassigned.

  /// getters
  GetData<RandomCat> get currentCatGet => _currentCatGet;
  List<PositionedCat> get loadedCats => _loadedCats;
  int get countLoadedCats => _countLoadedCats;

  /// public methods

  void getRandomCat(int maxTop, int maxLeft) async {
    _currentCatGet = GetData(state: CallState.inProgress);
    notifyListeners();

    await _getRandomCatUC.call().then((randomCat) {
      _setDataIfOk(randomCat, maxTop, maxLeft);
      notifyListeners();
    }).catchError((error) {
      _setDataIfFails(error, maxTop, maxLeft);
      notifyListeners();
    });
  }

  /// private methods

  void _setDataIfOk(RandomCat randomCat, int maxTop, int maxLeft) {
    _currentCatGet = GetData(state: CallState.completed, data: randomCat);
    _loadedCats.add(_getPositionedCat(randomCat, maxTop, maxLeft));
    _countLoadedCats = _countLoadedCats + 1;
  }

  void _setDataIfFails(dynamic error, int maxTop, int maxLeft) {
    _currentCatGet =
        GetData(state: CallState.error, errorMsg: error.toString());
    _loadedCats.add(_getPositionedCat(
        RandomCat(url: "", title: "Error getting cat"), maxTop, maxLeft));
    _countLoadedCats = _countLoadedCats + 1;
  }

  PositionedCat _getPositionedCat(
      RandomCat randomCat, int maxTop, int maxLeft) {
    var rand = new Random();
    return PositionedCat(
      cat: randomCat,
      position: Position(
        top: rand.nextInt(maxTop).toDouble(),
        left: rand.nextInt(maxLeft).toDouble(),
      ),
      angle: rand.nextDouble(),
    );
  }
}
