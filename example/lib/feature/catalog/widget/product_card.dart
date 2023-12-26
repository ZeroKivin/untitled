import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../asset/color/color_extension.dart';
import '../../../../../asset/typography/app_typography.dart';
import '../../../asset/image/image_asset.dart';
import '../../../util/money_extension.dart';

class ProductCard extends StatelessWidget {
  static const double aspectRatio = 163 / 300;

  final String name;
  final String imageUrl;
  final int price;
  final int? oldPrice;
  final double rating;
  final int feedbackCount;

  const ProductCard({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.feedbackCount,
    this.oldPrice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain,
                      errorWidget: (_, __, ___) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            ImageAsset.fallbackProductImage,
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _Price(price: price, oldPrice: oldPrice),
                  if (feedbackCount > 0)
                    _Rating(
                      rating: rating,
                      feedbackCount: feedbackCount,
                    ),
                  Text(
                    name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.normal16.withColor(
                      context.colors.mainText,
                    ),
                  ),
                  const Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButtonTheme.of(context).style?.copyWith(
                          fixedSize: const MaterialStatePropertyAll(
                            Size(100, 35),
                          ),
                        ),
                    child: Center(
                      child: Text(
                        'В корзину',
                        style: AppTypography.bold13.withColor(
                          context.colors.mainText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Price extends StatelessWidget {
  final int price;
  final int? oldPrice;

  const _Price({
    required this.price,
    required this.oldPrice,
  });

  @override
  Widget build(BuildContext context) {
    final oldPrice = this.oldPrice;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          price.asMoney,
          style: AppTypography.bold20.withColor(
            context.colors.mainText,
          ),
        ),
        if (oldPrice != null)
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 2,
            ),
            child: Text(
              oldPrice.asMoney,
              style: AppTypography.bold14
                  .withColor(
                    context.colors.minorText,
                  )
                  .copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: context.colors.stroke,
                  ),
            ),
          ),
      ],
    );
  }
}

class _Rating extends StatelessWidget {
  final double rating;
  final int feedbackCount;

  const _Rating({
    required this.rating,
    required this.feedbackCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RatingBarIndicator(
          rating: rating,
          itemSize: 16,
          unratedColor: context.colors.minorText,
          itemBuilder: (context, _) => Icon(
            Icons.star_rate_rounded,
            color: context.colors.mainPrimary,
          ),
        ),
        Text(
          feedbackCount.toString(),
          style: AppTypography.normal14.withColor(
            context.colors.minorText,
          ),
        ),
      ],
    );
  }
}
