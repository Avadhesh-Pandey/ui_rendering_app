import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../domain/usecases/rendering_json_usecase.dart';

part 'rendering_json_event.dart';

part 'rendering_json_state.dart';

class GetRenderingJsonBloc extends Bloc<RenderingJsonEvent, RenderingJsonState> {
  final RenderingJsonUseCase getRenderingJsonUseCase;

  GetRenderingJsonBloc({
    required this.getRenderingJsonUseCase,
  }) : super(GettingRenderingJsonInitialStatus()) {
    on<RenderingJsonEvent>((event, emit) async {
      if (event is GetRenderingJsonEvent) {
        emit(LoadingRenderingJsonStatus());
        final failureOrSuccessGettingRenderingJsonStatus = await getRenderingJsonUseCase(NoParams());
        failureOrSuccessGettingRenderingJsonStatus.fold(
          (failure) => emit(ErrorGettingRenderingJsonStatus()),
          (json) => emit(RenderingJsonRetrievedSuccessfullyStatus(json)),
        );
      }
    });
  }
}
