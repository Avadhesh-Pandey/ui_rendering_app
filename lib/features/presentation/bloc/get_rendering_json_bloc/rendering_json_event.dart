part of 'rendering_json_bloc.dart';

abstract class RenderingJsonEvent extends Equatable {
  const RenderingJsonEvent();

  @override
  List<Object> get props => [];
}

class GetRenderingJsonEvent extends RenderingJsonEvent {}
