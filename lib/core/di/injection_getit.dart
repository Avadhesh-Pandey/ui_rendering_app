import 'package:get_it/get_it.dart';

import '../../features/data/datasource/local/rendering_json_local_data_source.dart';
import '../../features/data/repositories/rendering_json_repository_impl.dart';
import '../../features/domain/repositories/rendering_json_repository.dart';
import '../../features/domain/usecases/rendering_json_usecase.dart';
import '../../features/presentation/bloc/get_rendering_json_bloc/rendering_json_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //bloc
  sl.registerFactory(
    () => GetRenderingJsonBloc(getRenderingJsonUseCase: sl(),
    ),
  );

  //use cases
  sl.registerLazySingleton(() => RenderingJsonUseCase(sl()));

  //data sources
  sl.registerLazySingleton<RenderingJsonLocalDataSource>(
        () => RenderingJsonLocalDataSourceImpl(),
  );

  //repos
  sl.registerLazySingleton<RenderingJsonRepository>(
    () => RenderingJsonRepositoryImpl(localDataSource: sl()),
  );
}
