import 'package:get_it/get_it.dart';
import 'package:translator/features/translator/data/data_sources/script_data_source.dart';
import 'package:translator/features/translator/data/repositories/script_repository_impl.dart';
import 'package:translator/features/translator/domain/repositories/script_repository.dart';
import 'package:translator/features/translator/domain/usecases/convert_to_english.dart';
import 'package:translator/features/translator/domain/usecases/convert_to_morse.dart';
import 'package:translator/features/translator/presentation/bloc/script_bloc.dart';

final sl = GetIt.instance;

void init() {
  //Bloc
  sl.registerFactory(
    () => ScriptBloc(
      convertToMorse: sl(),
      convertToEnglish: sl(),
    ),
  );

  //Use Cases
  sl.registerLazySingleton(() => ConvertToEnglish(sl()));
  sl.registerLazySingleton(() => ConvertToMorse(sl()));

  //Repository
  sl.registerLazySingleton<ScriptRepository>(() => ScriptRepositoryImpl(sl()));

  //Data Sources
  sl.registerLazySingleton<ScriptDataSource>(() => ScriptDataSourceImpl());
}
