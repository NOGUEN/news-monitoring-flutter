import 'package:news_monitoring/core/view_models/base_viewmodel.dart';

class HomeViewModel extends BaseModel {
  // HomeViewModel({
  //   required this.postApi,
  // });

  // final PostApi postApi;

  //List<DilemmaModel> popularDillemas = List.empty(growable: true);

  @override
  Future<void> initModel() async {
    setBusy(true);

    await fetchPopularDilemma();

    setBusy(false);
  }

  Future<void> fetchPopularDilemma() async {}
}
