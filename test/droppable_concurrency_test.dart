import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/untitled.dart';

final class EmitController extends Controller<int>
    with DroppableConcurrency {
  EmitController({
    int initialState = 0,
  }) : super(initialState: initialState);

  void emit(int value) => handle(handler: (_) => value);

  @override
  void onHandleError(Object error, StackTrace stackTrace) {}
}

void main() {
  test('DroppableConcurrency', () {
    fakeAsync((async) {
      final controller = EmitController();
      controller.emit(1);
      controller.emit(2);
      controller.emit(3);

      expect(controller.isProcessing, isTrue);
      expect(controller.stream, emits(1));
      async.flushTimers();
      expect(controller.state, 1);
      expect(controller.isProcessing, isFalse);
    });
  });
}
