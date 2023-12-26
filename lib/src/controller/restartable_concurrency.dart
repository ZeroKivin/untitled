part of 'controller.dart';

base mixin RestartableConcurrency<S> on Controller<S> {
  CancelableOperation? _previous;

  @override
  bool get isProcessing => _previous != null;

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
    if (!isInitialized) {
      return;
    }

    final currentState = state;
    if (whileHandleState != null) {
      state = whileHandleState;
    }

    runZonedGuarded(
      () async {
        _previous?.cancel();

        final operation = CancelableOperation.fromFuture(
          _handle(
            handler: handler,
            errorHandler: errorHandler,
            doneHandler: doneHandler,
          ),
        );

        _previous = operation;
        state = await operation.value;
        _previous = null;
      },
      (error, stackTrace) {
        state = currentState;
        onHandleError(error, stackTrace);
      },
    );
  }
}
