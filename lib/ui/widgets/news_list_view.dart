import 'package:flutter/material.dart';
import 'package:news_monitoring/core/models/news_model.dart';
import 'package:news_monitoring/ui/widgets/news_list_cell.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.news});

  final NewsListModel news;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: news.news.length,
      itemBuilder: (BuildContext context, int index) {
        Uri uri = Uri.parse(news.news[index].link);

        return Padding(
          padding: const EdgeInsets.all(8),
          child: NewsListCell(
            title: news.news[index].title,
            date: news.news[index].published_at,
            onTap: () async {
              if (await canLaunchUrl(uri)) {
                await launchUrl(
                  uri,
                  webOnlyWindowName: '_blank',
                );
              } else {
                throw 'Could not launch $uri';
              }
            },
          ),
        );
      },
    );
  }
}
