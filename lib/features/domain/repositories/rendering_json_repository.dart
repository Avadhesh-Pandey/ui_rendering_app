import 'package:dartz/dartz.dart';
import 'package:ui_rendering_app/core/error/failure.dart';

abstract class RenderingJsonRepository {
  Future<Either<Failure, Map<String,dynamic>>> getUIRenderingJson();
}
