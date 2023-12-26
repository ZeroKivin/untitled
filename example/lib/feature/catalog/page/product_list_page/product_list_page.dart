import 'package:flutter/material.dart';
import 'package:untitled/untitled.dart';

import '../../model/product.dart';
import '../../state/product_list_state.dart';
import '../../widget/filter_bar/filter_bar.dart';
import '../../widget/product_card.dart';
import 'product_list_page_presenter.dart';

class ProductListPage extends ViewWidget<IProductListPagePresenter> {
  const ProductListPage({
    super.key,
  }) : super(buildProductListPagePresenter);

  @override
  Widget build(IProductListPagePresenter presenter) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Смартфоны'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        bottom: const FilterBar(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          cacheExtent: 200,
          slivers: [
            StateWrapperSelector<ProductListState, List<Product>?>(
              stateWrapper: presenter.productListState,
              selector: (state) => state.whenOrNull(
                data: (products) => products,
              ),
              builder: (_, products, __) {
                if (products == null) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 16,
                    right: 16,
                  ),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 8,
                      childAspectRatio: ProductCard.aspectRatio,
                    ),
                    itemCount: products.length,
                    itemBuilder: (_, index) {
                      final product = products[index];

                      return ProductCard(
                        name: product.name,
                        price: product.price,
                        oldPrice: product.oldPrice,
                        imageUrl: product.imageUrl,
                        rating: product.rating,
                        feedbackCount: product.feedbackCount,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
