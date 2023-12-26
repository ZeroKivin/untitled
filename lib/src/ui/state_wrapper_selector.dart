import 'package:flutter/widgets.dart';

import '../controller/state_wrapper.dart';

typedef StateSelector<S, T> = T Function(S state);

typedef StateSelectorBuilder<T> = Widget Function(
  BuildContext context,
  T value,
  Widget? child,
);

class StateWrapperSelector<S, T> extends StatefulWidget {
  final StateWrapper<S> stateWrapper;
  final StateSelector<S, T> selector;
  final StateSelectorBuilder<T> builder;
  final Widget? child;

  const StateWrapperSelector({
    required this.stateWrapper,
    required this.selector,
    required this.builder,
    this.child,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _StateWrapperSelectorState<S, T>();
}

class _StateWrapperSelectorState<S, T>
    extends State<StateWrapperSelector<S, T>> {
  late T _state;

  @override
  void initState() {
    super.initState();
    _state = widget.selector(widget.stateWrapper.state);
    widget.stateWrapper.addListener(_onStateChanged);
  }

  @override
  void didUpdateWidget(StateWrapperSelector<S, T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stateWrapper != widget.stateWrapper) {
      oldWidget.stateWrapper.removeListener(_onStateChanged);
      _state = widget.selector(widget.stateWrapper.state);
      widget.stateWrapper.addListener(_onStateChanged);
    }
  }

  @override
  void dispose() {
    widget.stateWrapper.removeListener(_onStateChanged);
    super.dispose();
  }

  void _onStateChanged() {
    final selectedState = widget.selector(widget.stateWrapper.state);

    if (_state != selectedState) {
      setState(() {
        _state = selectedState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state, widget.child);
  }
}
