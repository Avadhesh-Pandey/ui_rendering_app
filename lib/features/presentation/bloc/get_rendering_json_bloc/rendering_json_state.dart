part of 'rendering_json_bloc.dart';

abstract class RenderingJsonState extends Equatable {
  const RenderingJsonState();

  @override
  List<Object> get props => [];
}

class GettingRenderingJsonInitialStatus extends RenderingJsonState {}

class LoadingRenderingJsonStatus extends RenderingJsonState {}

class ErrorGettingRenderingJsonStatus extends RenderingJsonState {}

class RenderingJsonRetrievedSuccessfullyStatus extends RenderingJsonState {
  final Map<String,dynamic> renderingJson;
  const RenderingJsonRetrievedSuccessfullyStatus(this.renderingJson);
  @override
  List<Object> get props => [renderingJson];

}
