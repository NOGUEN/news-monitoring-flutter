import 'package:dio/dio.dart';
import 'package:news_monitoring/core/models/news_model.dart';
import 'package:news_monitoring/core/models/news_site_model.dart';
import 'package:news_monitoring/core/models/page_count_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_service.g.dart';

@RestApi(
    baseUrl: 'http://ec2-43-200-192-75.ap-northeast-2.compute.amazonaws.com')
abstract class NewsService {
  factory NewsService(Dio dio, {String baseUrl}) = _NewsService;

  @GET('/')
  Future<NewsSiteListModel> getNewsSites();

  @GET('/news/{siteId}')
  Future<NewsListModel> getNewsBySiteId(
    @Path('siteId') siteId,
  );

  @GET('/news/page/default')
  Future<NewsListModel> getPagedNews(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  @GET('/news/page/site')
  Future<NewsListModel> getPagedNewsBySiteId(
    @Query('page') int page,
    @Query('limit') int limit,
    @Query('siteId') int siteId,
  );

  @GET('/news/page/count')
  Future<PageCountModel> getPageCount(
    @Query('limit') int limit,
  );

  @GET('/news/page/count/site')
  Future<PageCountModel> getPageCountBySiteId(
    @Query('siteId') int siteId,
    @Query('limit') int limit,
  );
}
