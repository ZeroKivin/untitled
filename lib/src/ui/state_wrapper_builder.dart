import 'package:flutter/widgets.dart';

import '../controller/state_wrapper.dart';

typedef StateWidgetBuilder<S> = Widget Function(
  BuildContext context,
  S state,
  Widget? child,
);

class StateWrapperBuilder<S> extends StatefulWidget {
  final StateWrapper<S> stateWrapper;
  final StateWidgetBuilder<S> builder;
  final Widget? child;

  const StateWrapperBuilder({
    required this.stateWrapper,
    required this.builder,
    this.child,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _StateWrapperBuilderState<S>();
}

class _StateWrapperBuilderState<S> extends State<StateWrapperBuilder<S>> {
  late S _state;

  @override
  void initState() {
    super.initState();
    _state = widget.stateWrapper.state;
    widget.stateWrapper.addListener(_onStateChanged);
  }

  @override
  void didUpdateWidget(StateWrapperBuilder<S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stateWrapper != widget.stateWrapper) {
      oldWidget.stateWrapper.removeListener(_onStateChanged);
      _state = widget.stateWrapper.state;
      widget.stateWrapper.addListener(_onStateChanged);
    }
  }

  @override
  void dispose() {
    widget.stateWrapper.removeListener(_onStateChanged);
    super.dispose();
  }

  void _onStateChanged() {
    setState(() {
      _state = widget.stateWrapper.state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _state, widget.child);
  }
}
