// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:news_monitoring/core/viewmodels/home_viewmodel.dart';
import 'package:news_monitoring/ui/design_system/app_colors.dart';
import 'package:news_monitoring/ui/widgets/base_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(),
      onModelReady: (HomeViewModel model) => model.initModel(),
      builder: (BuildContext context, HomeViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "뉴스 모니터링",
              style: TextStyle(
                fontFamily: "Pretendard",
                color: AppColors.black,
              ),
            ),
            centerTitle: false,
          ),
          body: Container(),
        );
      },
    );
  }
}
