import 'package:get_it/get_it.dart';
import 'package:letsattend/view_models/auth_model.dart';

import 'package:letsattend/view_models/theme_model.dart';
import 'package:letsattend/view_models/speakers_model.dart';
import 'package:letsattend/services/speakers_service.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {

  locator.registerLazySingleton(() => ThemeModel());
  locator.registerLazySingleton(() => AuthModel());

  locator.registerFactory(() => SpeakersModel());
  locator.registerLazySingleton(() => SpeakersService());

}