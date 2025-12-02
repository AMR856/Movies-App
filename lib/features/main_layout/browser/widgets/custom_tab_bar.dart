import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/feature/main_layout/browser/widgets/tab_item.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.selectedTapBgColor,
    required this.selectedTapFgColor,
    required this.unSelectedTapBgColor,
    required this.unSelectedTapFgColor,
    this.initialIndex,
  });
  final Color selectedTapBgColor;
  final Color selectedTapFgColor;
  final Color unSelectedTapBgColor;
  final Color unSelectedTapFgColor;

  final int? initialIndex;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  late int isSelected = widget.initialIndex ?? 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: widget.initialIndex ?? 0,
      child: TabBar(
        indicatorWeight: 1,
        labelPadding: REdgeInsets.only(
          right: 9,
        ),
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        onTap: (index) {
          setState(() {
            isSelected = index;
          });
        },
        isScrollable: true,
        tabs: [
          TabItem(
            selectedTapBgColor: widget.selectedTapBgColor,
            selectedTapFgColor: widget.selectedTapFgColor,
            unSelectedTapFgColor: widget.unSelectedTapFgColor,
            unSelectedTapBgColor: widget.unSelectedTapBgColor,
            isSelected: true,
          ),
          TabItem(
            selectedTapBgColor: widget.selectedTapBgColor,
            selectedTapFgColor: widget.selectedTapFgColor,
            unSelectedTapFgColor: widget.unSelectedTapFgColor,
            unSelectedTapBgColor: widget.unSelectedTapBgColor,
            isSelected: false,
          ),
          TabItem(
            selectedTapBgColor: widget.selectedTapBgColor,
            selectedTapFgColor: widget.selectedTapFgColor,
            unSelectedTapFgColor: widget.unSelectedTapFgColor,
            unSelectedTapBgColor: widget.unSelectedTapBgColor,
            isSelected: false,
          ),
          TabItem(
            selectedTapBgColor: widget.selectedTapBgColor,
            selectedTapFgColor: widget.selectedTapFgColor,
            unSelectedTapFgColor: widget.unSelectedTapFgColor,
            unSelectedTapBgColor: widget.unSelectedTapBgColor,
            isSelected: false,
          ),
        ],
      ),
    );
  }
}
