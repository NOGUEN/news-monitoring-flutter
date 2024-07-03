import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_monitoring/core/api/news_service.dart';
import 'package:news_monitoring/core/models/news_model.dart';
import 'package:news_monitoring/core/models/page_count_model.dart';
import 'package:news_monitoring/core/viewmodels/base_viewmodel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NewsSiteViewmodel extends BaseModel {
  NewsListModel news = NewsListModel(news: []);
  Dio dio = Dio();
  int currentIndex = 1;
  int totalPageCount = 0;
  bool canFetchPrev = false;
  bool canFetchNext = true;

  Future<void> newsSiteInitModel(int siteId) async {
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
    await fetchNews(siteId);
    await fetchTotalPageCount(siteId);
    canFetchNews();
    setBusy(false);
  }

  Future<void> fetchNews(int siteId) async {
    try {
      NewsListModel newsList =
          await NewsService(dio).getPagedNewsBySiteId(1, 10, siteId);
      news = newsList;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchTotalPageCount(int siteId) async {
    try {
      PageCountModel pageCountModel =
          await NewsService(dio).getPageCountBySiteId(siteId, 10);
      totalPageCount = pageCountModel.total_pages;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchNextNews(int siteId) async {
    try {
      currentIndex += 1;
      NewsListModel newsList =
          await NewsService(dio).getPagedNewsBySiteId(currentIndex, 10, siteId);
      news = newsList;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> fetchPreviousNews(int siteId) async {
    try {
      currentIndex -= 1;
      NewsListModel newsList =
          await NewsService(dio).getPagedNewsBySiteId(currentIndex, 10, siteId);
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
