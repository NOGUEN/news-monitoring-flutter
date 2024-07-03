// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:news_monitoring/core/viewmodels/news_site_viewmodel.dart';
import 'package:news_monitoring/ui/design_system/app_colors.dart';
import 'package:news_monitoring/ui/widgets/base_widget.dart';
import 'package:news_monitoring/ui/widgets/news_list_view.dart';
import 'package:news_monitoring/ui/widgets/page_button.dart';

class NewsSiteView extends StatelessWidget {
  const NewsSiteView({
    super.key,
    required this.siteId,
  });

  final int siteId;

  @override
  Widget build(BuildContext context) {
    double listViewHeight = MediaQuery.of(context).size.height - 160;
    return BaseWidget<NewsSiteViewmodel>(
      model: NewsSiteViewmodel(),
      onModelReady: (NewsSiteViewmodel model) =>
          model.newsSiteInitModel(siteId),
      builder: (BuildContext context, NewsSiteViewmodel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "",
              style: TextStyle(
                fontFamily: "Pretendard",
                color: AppColors.black,
              ),
            ),
            centerTitle: false,
          ),
          body: Column(children: [
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
                      model.fetchPreviousNews(siteId);
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
                      model.fetchNextNews(siteId);
                      model.canFetchNews();
                    },
                    canTap: model.canFetchNext,
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}
