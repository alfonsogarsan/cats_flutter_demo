import 'package:cats/data/services/cataas_service.dart';

import 'package:cats/domain/entities/random_cat.dart';
import 'package:cats/domain/repos_interfaces/cats_repo.dart';

class CatsRepoCataasImpl extends CatsRepository {
  final CataasService _cataasService;

  CatsRepoCataasImpl(this._cataasService);

  @override
  Future<RandomCat> getRandomCatUrl() async {
    return await _cataasService.getRandomCatUrl();
  }
}
