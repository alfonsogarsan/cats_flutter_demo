import 'package:cats/data/auth/cataas_auth.dart';
import 'package:cats/data/auth/token_auth.dart';
import 'package:cats/data/repos/cats_repo_cataas_impl.dart';
import 'package:cats/data/services/cataas_service.dart';
import 'package:cats/domain/repos_interfaces/cats_repo.dart';
import 'package:cats/domain/use_cases/get_random_cat_uc.dart';
import 'package:cats/presentation/providers/cats_provider.dart';
import 'package:get_it/get_it.dart';

final _locator = GetIt.instance;

void serviceLocatorSetUp() {
  //Auth
  _locator.registerLazySingleton<TokenAuth>(() => CataasAuth());

  // Services
  _locator.registerLazySingleton<CataasService>(
      () => CataasService(_locator<TokenAuth>()));

  // Repos
  _locator.registerLazySingleton<CatsRepository>(
      () => CatsRepoCataasImpl(_locator<CataasService>()));

  // Use Cases
  _locator.registerLazySingleton<GetRandomCatUC>(
      () => GetRandomCatUC(_locator<CatsRepository>()));

  // Providers

  _locator.registerLazySingleton<CatsProvider>(
      () => CatsProvider(_locator<GetRandomCatUC>()));
}
