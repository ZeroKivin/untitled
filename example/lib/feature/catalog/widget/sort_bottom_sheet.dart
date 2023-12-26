import 'package:flutter/material.dart';

import '../../../asset/color/color_extension.dart';
import '../../../asset/typography/app_typography.dart';
import '../model/sort.dart';

class SortBottomSheet extends StatelessWidget {
  final Set<Sort> sorts;
  final ValueSetter<Sort> onSortSelect;

  const SortBottomSheet({
    required this.sorts,
    required this.onSortSelect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ...sorts.map(
              (sort) {
                return OutlinedButton(
                  onPressed: () => onSortSelect(sort),
                  child: Center(
                    child: Text(
                      sort.name,
                      style: AppTypography.normal16,
                    ),
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
