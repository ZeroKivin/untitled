import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled/untitled.dart';

import 'util/customizable_controller/customizable_controller.dart';
import 'util/customizable_controller/mock_handler.dart';
import 'util/fake/fake_stack_trace.dart';
import 'util/fake/fake_state_error.dart';

final class CounterController extends Controller<int> {
  CounterController({
    int initialState = 0,
  }) : super(initialState: initialState);

  void increase() => handle(handler: (state) => state + 1);

  @override
  void onHandleError(Object error, StackTrace stackTrace) {}
}

void main() {
  setUpAll(() {
    registerFallbackValue(FakeStateError());
    registerFallbackValue(FakeStackTrace());
  });

  group('Controller', () {
    final mockHandler = MockHandler();

    test('state returns correct value initially', () {
      const initialState = 0;
      final controller = CounterController(initialState: initialState);
      expect(controller.state, initialState);
    });

    test('correctly emits new state', () {
      final controller = CounterController();
      fakeAsync((async) {
        controller.increase();
        expect(controller.stream, emits(1));
        async.flushTimers();
        expect(controller.state, 1);
      });
    });

    test('stream is broadcast', () {
      final controller = CounterController();
      fakeAsync((async) {
        controller.increase();
        expect(controller.stream.isBroadcast, isTrue);
        expect(controller.stream, emits(1));
        expect(controller.stream, emits(1));
        async.flushTimers();
      });
    });

    test('correctly changes processing', () {
      final controller = CounterController();
      fakeAsync((async) {
        controller.increase();
        expect(controller.isProcessing, isTrue);
        async.flushTimers();
        expect(controller.isProcessing, isFalse);
      });
    });

    test('correctly dispose', () {
      final controller = CounterController();
      controller.dispose();
      expect(controller.isInitialized, isFalse);
      expect(() => controller.stream, throwsStateError);
      expect(() => controller.state, throwsStateError);
    });

    test('does not change state after dispose', () {
      final controller = CustomizableController(
        handler: mockHandler.handle,
        onError: mockHandler.onError,
      );

      when(
        () => mockHandler.handle(any()),
      ).thenReturn(0);
      when(
        () => mockHandler.onError(any(), any()),
      ).thenAnswer((_) {});

      fakeAsync((async) {
        controller.test();
        controller.dispose();
        async.flushTimers();
      });

      verify(
        () => mockHandler.onError(any<StateError>(), any()),
      ).called(1);
    });

    test('correctly handle handler error', () {
      const initialState = 0;
      final controller = CustomizableController(
        handler: mockHandler.handle,
        errorHandler: mockHandler.handleError,
        onError: mockHandler.onError,
        initialState: initialState,
      );

      when(
        () => mockHandler.handle(any()),
      ).thenThrow(StateError(''));
      when(
        () => mockHandler.handleError(any(), any(), any()),
      ).thenReturn(initialState + 1);
      when(
        () => mockHandler.onError(any(), any()),
      ).thenAnswer((_) {});

      fakeAsync((async) {
        controller.test();
        async.flushTimers();
      });

      expect(controller.state, initialState + 1);
      verify(
        () => mockHandler.handleError(any(), any<StateError>(), any()),
      ).called(1);
      verify(
        () => mockHandler.onError(any<StateError>(), any()),
      ).called(1);
    });

    test('correctly handle errorHandler error', () {
      const initialState = 0;
      final controller = CustomizableController(
        handler: mockHandler.handle,
        errorHandler: mockHandler.handleError,
        onError: mockHandler.onError,
        initialState: initialState,
      );

      when(
        () => mockHandler.handle(any()),
      ).thenThrow(StateError(''));
      when(
        () => mockHandler.handleError(any(), any(), any()),
      ).thenThrow(StateError(''));
      when(
        () => mockHandler.onError(any(), any()),
      ).thenAnswer((_) {});

      fakeAsync((async) {
        controller.test();
        async.flushTimers();
      });

      expect(controller.state, initialState);
      verify(
        () => mockHandler.handleError(any(), any<StateError>(), any()),
      ).called(1);
      verify(
        () => mockHandler.onError(any<StateError>(), any()),
      ).called(2);
    });

    test('correctly handle doneHandler error', () {
      const initialState = 0;
      final controller = CustomizableController(
        handler: mockHandler.handle,
        doneHandler: mockHandler.handleDone,
        onError: mockHandler.onError,
        initialState: initialState,
      );

      when(
        () => mockHandler.handle(any()),
      ).thenReturn(initialState + 1);
      when(
        () => mockHandler.handleDone(any()),
      ).thenThrow(StateError(''));
      when(
        () => mockHandler.onError(any(), any()),
      ).thenAnswer((_) {});

      fakeAsync((async) {
        controller.test();
        async.flushTimers();
      });

      expect(controller.state, initialState + 1);
      verify(
        () => mockHandler.onError(any<StateError>(), any()),
      ).called(1);
    });
  });
}
