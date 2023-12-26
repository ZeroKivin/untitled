import 'package:untitled/untitled.dart';

final class CustomizableController extends Controller<int> {
  final int Function(int) handler;
  final int Function(int, Object, StackTrace)? errorHandler;
  final int Function(int)? doneHandler;
  final void Function(Object, StackTrace)? onError;

  CustomizableController({
    required this.handler,
    this.errorHandler,
    this.doneHandler,
    this.onError,
    int initialState = 0,
  }) : super(initialState: initialState);

  void test() => handle(
    handler: handler,
    errorHandler: errorHandler,
    doneHandler: doneHandler,
  );

  @override
  void onHandleError(Object error, StackTrace stackTrace) {
    onError?.call(error, stackTrace);
  }
}