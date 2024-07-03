import 'package:flutter/material.dart';
import 'package:news_monitoring/core/constants/app_constants.dart';
import 'package:news_monitoring/core/models/news_site_model.dart';
import 'package:news_monitoring/ui/widgets/news_site_list_cell.dart';

class NewsSiteListView extends StatelessWidget {
  const NewsSiteListView({super.key, required this.newsSites});

  final NewsSiteListModel newsSites;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newsSites.news_sites.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: NewsSiteListCell(
            title: newsSites.news_sites[index].name,
            onTap: () {
              Navigator.of(context).pushNamed(RoutePaths.NewsSite,
                  arguments: newsSites.news_sites[index].id);
            },
          ),
        );
      },
    );
  }
}
