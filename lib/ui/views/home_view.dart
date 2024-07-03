// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:news_monitoring/core/viewmodels/home_viewmodel.dart';
import 'package:news_monitoring/ui/design_system/app_colors.dart';
import 'package:news_monitoring/ui/widgets/base_widget.dart';
import 'package:news_monitoring/ui/widgets/news_list_view.dart';
import 'package:news_monitoring/ui/widgets/news_site_list_view.dart';
import 'package:news_monitoring/ui/widgets/page_button.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double listViewHeight = MediaQuery.of(context).size.height - 310;

    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(),
      onModelReady: (HomeViewModel model) => model.initModel(),
      builder: (BuildContext context, HomeViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "뉴스사 목록",
              style: TextStyle(
                fontFamily: "Pretendard",
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            centerTitle: false,
          ),
          body: model.newsSites.news_sites.isEmpty
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: NewsSiteListView(
                        newsSites: model.newsSites,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "실시간으로  업데이트 되는 뉴스 목록",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: listViewHeight,
                      child: NewsListView(
                        news: model.news,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          PageButton(
                            icon: Icons.arrow_back_ios,
                            onTapFunction: () {
                              model.fetchPrevNews();
                              model.canFetchNews();
                            },
                            canTap: model.canFetchPrev,
                          ),
                          const Spacer(),
                          Text(
                            model.currentIndex.toString(),
                            style: const TextStyle(
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.white,
                            ),
                          ),
                          const Spacer(),
                          PageButton(
                            icon: Icons.arrow_forward_ios,
                            onTapFunction: () {
                              model.fetchNextNews();
                              model.canFetchNews();
                            },
                            canTap: model.canFetchNext,
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
