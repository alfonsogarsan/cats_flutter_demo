import 'package:cats/domain/entities/random_cat.dart';
import 'package:cats/domain/repos_interfaces/cats_repo.dart';

class GetRandomCatUC {
  final CatsRepository _repo;

  GetRandomCatUC(this._repo);

  Future<RandomCat> call() async {
    return await _repo.getRandomCatUrl();
  }
}
