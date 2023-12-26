import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'view.dart';

part 'view_element.dart';

typedef PresenterFactory<P extends Presenter> = P Function(
  BuildContext context,
);

abstract interface class IPresenter {}

abstract base class Presenter<V extends ViewWidget>
    with Diagnosticable
    implements IPresenter {
  @protected
  V get widget => _widget!;

  @protected
  BuildContext get context {
    assert(() {
      if (_element == null) {
        throw FlutterError('This widget has been unmounted');
      }
      return true;
    }());
    return _element!;
  }

  @protected
  bool get isMounted => _element != null;

  BuildContext? _element;
  V? _widget;

  @protected
  void init() {}

  @protected
  void didUpdateWidget(V oldWidget) {}

  @protected
  void didChangeDependencies() {}

  @protected
  void deactivate() {}

  @protected
  void activate() {}

  @protected
  void dispose() {}

  @protected
  void reassemble() {}
}
