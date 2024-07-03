import 'package:dio/dio.dart';
import 'package:news_monitoring/core/api/news_service.dart';
import 'package:news_monitoring/core/models/news_site_model.dart';
import 'package:news_monitoring/core/viewmodels/base_viewmodel.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HomeViewModel extends BaseModel {
  // HomeViewModel({
  //   required this.postApi,
  // });

  // final PostApi postApi;

  //List<DilemmaModel> popularDillemas = List.empty(growable: true);

  NewsSiteListModel newsSites = NewsSiteListModel(news_sites: []);
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
    setBusy(false);
  }

  Future<void> fetchNewsSites() async {
    try {
      NewsSiteListModel newsSiteList = await NewsService(dio).getNewsSites();
      newsSites = newsSiteList;
    } catch (e) {}
  }
}
