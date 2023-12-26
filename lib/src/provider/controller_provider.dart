import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/controller/controller.dart';

class ControllerProvider<T extends Controller> extends InheritedProvider<T> {
  ControllerProvider({
    Key? key,
    required Create<T> create,
    bool? lazy,
    TransitionBuilder? builder,
    Widget? child,
  }) : super(
          key: key,
          create: create,
          dispose: _dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  ControllerProvider.value({
    Key? key,
    required T value,
    TransitionBuilder? builder,
    Widget? child,
  }) : super.value(
          key: key,
          builder: builder,
          value: value,
          child: child,
        );

  static void _dispose(BuildContext context, Controller controller) =>
      controller.dispose();
}
