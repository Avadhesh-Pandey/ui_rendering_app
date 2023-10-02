import 'package:dartz/dartz.dart';
import 'package:ui_rendering_app/core/usecases/usecase.dart';

import '../../../core/error/failure.dart';
import '../repositories/rendering_json_repository.dart';

class RenderingJsonUseCase implements UseCase<Map<String,dynamic>, NoParams> {
  final RenderingJsonRepository repository;

  RenderingJsonUseCase(this.repository);

  @override
  Future<Either<Failure, Map<String,dynamic>>> call(NoParams params) async {
    return repository.getUIRenderingJson();
  }
}
