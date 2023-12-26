part of 'controller.dart';

base mixin DroppableConcurrency<S> on Controller<S> {
  @override
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
    if (!isInitialized || isProcessing) {
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
}
