import 'dart:async';

import 'package:async/async.dart';

import 'state_wrapper.dart';

part 'droppable_concurrency.dart';
part 'restartable_concurrency.dart';
part 'sequential_concurrency.dart';

abstract base class Controller<S> extends StateWrapper<S> {
  int _processCount = 0;

  Controller({
    required super.initialState,
  });

  bool get isInitialized => isMounted;

  bool get isProcessing => _processCount > 0;

  void handle({
    required FutureOr<S> Function(S state) handler,
    FutureOr<S> Function(
      S state,
      Object error,
      StackTrace stackTrace,
    )? errorHandler,
    FutureOr<S> Function(S state)? doneHandler,
    S? whileHandleState,
  }) {
    if (!isInitialized) {
      return;
    }

    final currentState = state;
    if (whileHandleState != null) {
      state = whileHandleState;
    }

    runZonedGuarded(
      () async => state = await _handle(
          handler: handler,
          errorHandler: errorHandler,
          doneHandler: doneHandler,
        ),
      (error, stackTrace) {
        state = currentState;
        onHandleError(error, stackTrace);
      },
    );
  }

  FutureOr<void> onHandleError(Object error, StackTrace stackTrace);

  Future<S> _handle({
    required FutureOr<S> Function(S state) handler,
    FutureOr<S> Function(
      S state,
      Object error,
      StackTrace stackTrace,
    )? errorHandler,
    FutureOr<S> Function(S state)? doneHandler,
  }) async {
    var state = this.state;

    try {
      _processCount++;
      state = await handler(state);
    } on Object catch (error, stackTrace) {
      await onHandleError(error, stackTrace);
      await Future<void>.sync(() async {
        final newState = await errorHandler?.call(state, error, stackTrace);

        if (newState != null) {
          state = newState;
        }
      }).catchError(onHandleError);
    } finally {
      await Future<void>.sync(() async {
        final newState = await doneHandler?.call(state);

        if (newState != null) {
          state = newState;
        }
      }).catchError(onHandleError);
      _processCount--;
    }

    return state;
  }
}
