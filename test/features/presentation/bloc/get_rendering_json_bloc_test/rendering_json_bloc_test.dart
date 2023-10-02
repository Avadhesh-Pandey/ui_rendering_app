import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ui_rendering_app/core/di/injection_getit.dart';
import 'package:ui_rendering_app/features/domain/usecases/rendering_json_usecase.dart';
import 'package:ui_rendering_app/features/presentation/bloc/get_rendering_json_bloc/rendering_json_bloc.dart';
import 'package:ui_rendering_app/core/di/injection_getit.dart' as di;


import 'rendering_json_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetRenderingJsonBloc>()])
void main() async {
  await di.init();
  RenderingJsonUseCase? renderingJsonUseCase;

  group("Rendering json bloc test", () {
    setUpAll(() {
      renderingJsonUseCase = sl<RenderingJsonUseCase>();
    });

    test('should load Initial State', () {
      // Assert that the initial state is correct.
      // expect(counterBloc.state, equals(0));
      final bloc = GetRenderingJsonBloc(getRenderingJsonUseCase: renderingJsonUseCase!);

      expect(bloc.state, GettingRenderingJsonInitialStatus());
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => GetRenderingJsonBloc(getRenderingJsonUseCase: renderingJsonUseCase!),
      expect: () => [],
    );

    test("Checking the sequence of the streams", () {
      final bloc = MockGetRenderingJsonBloc();

      // Stub the listen with a fake Stream
      when(bloc.state).thenReturnInOrder([
        GettingRenderingJsonInitialStatus(),
        LoadingRenderingJsonStatus(),
        const RenderingJsonRetrievedSuccessfullyStatus({})
      ]);

      // Expect that the bloc instance emitted the stubbed Stream of
      // states
      expect(bloc.state, GettingRenderingJsonInitialStatus());
      expect(bloc.state, LoadingRenderingJsonStatus());
      expect(bloc.state, const RenderingJsonRetrievedSuccessfullyStatus({}));
    });

    test("Checking the error state of the streams", () {
      final bloc = MockGetRenderingJsonBloc();

      // Stub the listen with a fake Stream
      when(bloc.state).thenReturnInOrder([
        GettingRenderingJsonInitialStatus(),
        LoadingRenderingJsonStatus(),
        ErrorGettingRenderingJsonStatus()
      ]);

      // Expect that the bloc instance emitted the stubbed Stream of
      // states
      expect(bloc.state, GettingRenderingJsonInitialStatus());
      expect(bloc.state, LoadingRenderingJsonStatus());
      expect(bloc.state, ErrorGettingRenderingJsonStatus());
    });
  });
}
