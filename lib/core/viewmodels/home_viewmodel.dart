import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_monitoring/core/api/news_service.dart';
import 'package:news_monitoring/core/models/news_model.dart';
import 'package:news_monitoring/core/models/news_site_model.dart';
import 'package:news_monitoring/core/models/page_count_model.dart';
import 'package:news_monitoring/core/viewmodels/base_viewmodel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HomeViewModel extends BaseModel {
  NewsSiteListModel newsSites = NewsSiteListModel(news_sites: []);
  NewsListModel news = NewsListModel(news: []);
  int currentIndex = 1;
  int totalPageCount = 0;
  bool canFetchPrev = false;
  bool canFetchNext = true;
  Dio dio = Dio();

  @override
  Future<void> initModel() async {
    setBusy(true);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    await fetchNewsSites();
    await fetchNews();
    await fetchTotalPageCount();
    setBusy(false);
  }

  Future<void> fetchNewsSites() async {
    try {
      NewsSiteListModel newsSiteList = await NewsService(dio).getNewsSites();
      newsSites = newsSiteList;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchNews() async {
    try {
      NewsListModel newsList = await NewsService(dio).getPagedNews(1, 10);
      news = newsList;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchTotalPageCount() async {
    try {
      PageCountModel pageCountModel = await NewsService(dio).getPageCount(10);
      totalPageCount = pageCountModel.total_pages;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchNextNews() async {
    try {
      currentIndex += 1;
      NewsListModel newsList =
          await NewsService(dio).getPagedNews(currentIndex, 10);
      news = newsList;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchPrevNews() async {
    try {
      currentIndex -= 1;
      NewsListModel newsList =
          await NewsService(dio).getPagedNews(currentIndex, 10);
      news = newsList;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void canFetchNews() {
    if (currentIndex - 1 <= 0) {
      canFetchPrev = false;
    } else {
      canFetchPrev = true;
    }

    if (currentIndex + 1 > totalPageCount) {
      canFetchNext = false;
    } else {
      canFetchNext = true;
    }
    notifyListeners();
  }
}
