import 'package:flutter/widgets.dart';

import 'presenter.dart';

abstract class ViewWidget<I extends IPresenter> extends Widget {
  final PresenterFactory presenterFactory;

  const ViewWidget(
    this.presenterFactory, {
    Key? key,
  }) : super(key: key);

  @override
  ViewElement createElement() => ViewElement(this);

  Widget build(I presenter);
}
