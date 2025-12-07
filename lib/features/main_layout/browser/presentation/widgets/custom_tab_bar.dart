import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/main_layout/browser/presentation/cubit/genre_tab_cubit.dart';
import 'package:movies_app/features/main_layout/browser/presentation/widgets/tab_item.dart';
class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.selectedTapBgColor,
    required this.selectedTapFgColor,
    required this.unSelectedTapBgColor,
    required this.unSelectedTapFgColor,
    this.initialIndex,
    required this.genres,
    this.onTapGenre,
  });

  final Color selectedTapBgColor;
  final Color selectedTapFgColor;
  final Color unSelectedTapBgColor;
  final Color unSelectedTapFgColor;

  final int? initialIndex;
  final List<String> genres;
  final Function(String)? onTapGenre;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreTabCubit, int>(
      builder: (context, selectedIndex) {
        return SizedBox(
          height: 50.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  context.read<GenreTabCubit>().selectTab(index);
                  if (onTapGenre != null) {
                    onTapGenre!(genres[index]);
                  }
                },
                child: TabItem(
                  label: genres[index],
                  selectedTapBgColor: selectedTapBgColor,
                  selectedTapFgColor: selectedTapFgColor,
                  unSelectedTapBgColor: unSelectedTapBgColor,
                  unSelectedTapFgColor: unSelectedTapFgColor,
                  isSelected: isSelected,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
