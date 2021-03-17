import 'package:wikipedia/core/api_db_models/searched_data_api_model.dart';

abstract class SearchDataRepositoryBase {
  Future<void> init();

  initBox();

  Future<void> getSearchQueryApi(
      {String searchKey = "", String pageLimit = "10"});

  Future<void> cacheSearchedQueryData(List<Pages> pages);

  Future<List<Pages>> getCachedPages();
}
