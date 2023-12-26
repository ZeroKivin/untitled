import 'package:flutter/material.dart';
import 'package:untitled/untitled.dart';

import '../../../../asset/color/color_extension.dart';
import '../../../../asset/typography/app_typography.dart';
import '../../model/sort.dart';
import 'filter_bar_presenter.dart';

class FilterBar extends ViewWidget<FilterBarPresenter>
    implements PreferredSizeWidget {
  static const double _filterBarHeight = 40;
  static const double _bottomPadding = 4;

  const FilterBar({
    super.key,
  }) : super(buildFilterBarPresenter);

  @override
  Size get preferredSize => const Size.fromHeight(
        _filterBarHeight + _bottomPadding,
      );

  @override
  Widget build(IFilterBarPresenter presenter) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: _bottomPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 142,
            child: ValueListenableBuilder<Sort?>(
              valueListenable: presenter.selectedSort,
              builder: (_, selectedSort, __) {
                if (selectedSort == null) {
                  return const SizedBox.shrink();
                }

                return _FilterButton(
                  text: selectedSort.name,
                  icon: Icons.keyboard_arrow_down_outlined,
                  onTap: presenter.openSortBottomSheet,
                );
              },
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 121,
            child: _FilterButton(
              text: 'Фильтры',
              icon: Icons.arrow_forward_ios,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _FilterButton({
    required this.text,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dividerColor = context.colors.divider;
    final borderRadius = BorderRadius.circular(6);

    return InkWell(
      onTap: onTap,
      splashColor: dividerColor,
      borderRadius: borderRadius,
      child: Container(
        height: FilterBar._filterBarHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: dividerColor,
          ),
          borderRadius: borderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: AppTypography.bold13,
            ),
            Icon(
              icon,
              size: 20,
              color: context.colors.disable,
            ),
          ],
        ),
      ),
    );
  }
}
