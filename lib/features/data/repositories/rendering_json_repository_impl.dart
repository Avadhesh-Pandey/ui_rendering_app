import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../domain/repositories/rendering_json_repository.dart';
import '../datasource/local/rendering_json_local_data_source.dart';

class RenderingJsonRepositoryImpl implements RenderingJsonRepository {
  final RenderingJsonLocalDataSource localDataSource;

  RenderingJsonRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Map<String, dynamic>>> getUIRenderingJson() async {
    try {
      var response = await localDataSource.getUIRenderingJson();
      return right(response);
    } catch (e) {
      throw JsonParseFailure("JSON failure");
    }
  }
}
