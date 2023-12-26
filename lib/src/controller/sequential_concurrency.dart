part of 'controller.dart';

base mixin SequentialConcurrency<S> on Controller<S> {
  Future<void>? _previous;

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
        final previous = _previous;
        final completer = Completer.sync();
        _previous = completer.future;

        if (previous != null) {
          await previous;
        }

        state = await _handle(
          handler: handler,
          errorHandler: errorHandler,
          doneHandler: doneHandler,
        );

        if (identical(_previous, completer.future)) {
          _previous = null;
        }

        completer.complete();
      },
      (error, stackTrace) {
        state = currentState;
        onHandleError(error, stackTrace);
      },
    );
  }
}
