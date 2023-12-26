part of 'presenter.dart';

final class ViewElement extends ComponentElement {
  @override
  ViewWidget get widget => super.widget as ViewWidget;

  late Presenter _presenter;

  // private _firstBuild hack
  bool _isInitialized = false;

  ViewElement(ViewWidget widget) : super(widget);

  @override
  Widget build() => widget.build(_presenter);

  @override
  void update(ViewWidget newWidget) {
    super.update(newWidget);

    final oldWidget = _presenter.widget;
    _presenter
      .._widget = newWidget
      ..didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _presenter.didChangeDependencies();
  }

  @override
  void activate() {
    super.activate();

    _presenter.activate();
    markNeedsBuild();
  }

  @override
  void deactivate() {
    _presenter.deactivate();

    super.deactivate();
  }

  @override
  void unmount() {
    super.unmount();

    _presenter
      ..dispose()
      .._element = null
      .._widget = null;
  }

  @override
  void performRebuild() {
    // private _firstBuild hack
    if (!_isInitialized) {
      _presenter = widget.presenterFactory(this);
      _presenter
        .._element = this
        .._widget = widget
        ..init()
        ..didChangeDependencies();

      _isInitialized = true;
    }

    super.performRebuild();
  }

  @override
  void reassemble() {
    super.reassemble();

    _presenter.reassemble();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties.add(
      DiagnosticsProperty<Presenter>(
        'widget model',
        _presenter,
        defaultValue: null,
      ),
    );
  }
}
