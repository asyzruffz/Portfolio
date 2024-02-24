import 'package:flutter/material.dart';
import 'package:portfolio/constants/palette.dart';

class SplitTabBar extends StatefulWidget {
  final TabController controller;
  final void Function(int)? onTap;
  final List<String> tabLabels;
  final Widget? middle;

  const SplitTabBar({
    super.key,
    required this.controller,
    required this.tabLabels,
    this.middle,
    this.onTap,
  });

  @override
  State<SplitTabBar> createState() => _SplitTabBarState();
}

class _SplitTabBarState extends State<SplitTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    int halfTabCount = (widget.tabLabels.length / 2) as int;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (int i = 0; i < halfTabCount; i++)
          _SplitTab(
            index: i,
            label: widget.tabLabels[i],
            onPressed: () => _select(i),
            selected: selectedIndex == i,
          ),
        Expanded(child: widget.middle != null ? widget.middle! : Container()),
        for (int i = halfTabCount; i < widget.tabLabels.length; i++)
          _SplitTab(
            index: i,
            label: widget.tabLabels[i],
            onPressed: () => _select(i),
            selected: selectedIndex == i,
          ),
      ],
    );
  }

  void _select(int index) {
    widget.onTap?.call(index);
    setState(() {
      selectedIndex = index;
    });
  }
}

class _SplitTab extends StatelessWidget {
  final int index;
  final String label;
  final bool selected;
  final VoidCallback? onPressed;

  const _SplitTab({
    super.key,
    required this.index,
    required this.label,
    this.selected = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder?>(
          const RoundedRectangleBorder(),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          color: selected ? Palette.primary : Palette.onSurface,
        ),
      ),
    );
  }
}
