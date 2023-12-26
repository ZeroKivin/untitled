import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled/untitled.dart';

import '../../controller/product_list_controller.dart';
import '../../state/product_list_state.dart';
import 'product_list_page.dart';

ProductListPagePresenter buildProductListPagePresenter(BuildContext context) {
  return ProductListPagePresenter(
    productListController: context.read<ProductListController>(),
  );
}

abstract interface class IProductListPagePresenter implements IPresenter {
  StateWrapper<ProductListState> get productListState;
}

final class ProductListPagePresenter extends Presenter<ProductListPage>
    implements IProductListPagePresenter {
  final ProductListController _productListController;

  ProductListPagePresenter({
    required ProductListController productListController,
  }) : _productListController = productListController;

  @override
  StateWrapper<ProductListState> get productListState => _productListController;

  @override
  void init() {
    _productListController.updateProducts();
  }
}
