import 'package:flutter/material.dart';
import 'package:news_monitoring/ui/design_system/app_colors.dart';
import 'package:news_monitoring/ui/design_system/font_style.dart';

class NewsSiteListCell extends StatelessWidget {
  const NewsSiteListCell({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: AppColors.darkGray,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              title,
              style:
                  AppTextStyles.captionMedium.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
