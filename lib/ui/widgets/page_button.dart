import 'package:flutter/material.dart';
import 'package:news_monitoring/ui/design_system/app_colors.dart';

class PageButton extends StatefulWidget {
  const PageButton({
    super.key,
    required this.icon,
    required this.onTapFunction,
    required this.canTap,
  });

  final IconData icon;
  final void Function() onTapFunction;
  final bool canTap;

  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.canTap ? widget.onTapFunction : null,
      child: Icon(
        size: 20,
        widget.icon,
        color: widget.canTap ? AppColors.white : AppColors.darkGray,
      ),
    );
  }
}
