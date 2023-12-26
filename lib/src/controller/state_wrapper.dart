import 'dart:async';

import 'package:flutter/foundation.dart';

abstract base class StateWrapper<S> extends ChangeNotifier {
  S _state;

  StreamController<S>? _controller;
  @protected
  bool isMounted = true;

  StateWrapper({
    required S initialState,
  }) : _state = initialState;

  S get state {
    if (!isMounted) {
      throwStateErrorIfDispose();
    }

    return _state;
  }

  @protected
  set state(S value) {
    if (!isMounted) {
      throwStateErrorIfDispose();
    }

    final previousState = _state;
    _state = value;

    if (!updateShouldNotify(previousState, value)) {
      return;
    }

    _controller?.add(value);
    notifyListeners();
  }

  Stream<S> get stream {
    if (!isMounted) {
      throwStateErrorIfDispose();
    }

    _controller ??= StreamController<S>.broadcast();

    return _controller!.stream;
  }

  @protected
  bool updateShouldNotify(S old, S current) => !identical(old, current);

  @override
  @mustCallSuper
  void dispose() {
    _controller?.close();
    _controller = null;
    super.dispose();
    isMounted = false;
  }

  Never throwStateErrorIfDispose() =>
      throw StateError('$runtimeType is disposed');
}
