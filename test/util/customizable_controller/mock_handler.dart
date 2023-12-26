import 'package:mocktail/mocktail.dart';

abstract interface class IHandler {
  int handle(int state);

  int handleError(int state, Object error, StackTrace stackTrace);

  int handleDone(int state);

  void onError(Object error, StackTrace stackTrace);
}

class MockHandler extends Mock implements IHandler {}
