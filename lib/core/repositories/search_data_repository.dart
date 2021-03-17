import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wikipedia/core/api_db_models/searched_data_api_model.dart';
import 'package:wikipedia/core/api_helper/api_service_helper.dart';
import 'package:wikipedia/core/repositories/search_data_repository_base.dart';
import 'package:wikipedia/core/utils/constants.dart';

class SearchDataRepository implements SearchDataRepositoryBase {
  ApiService apiServiceHelper;

  BuildContext context;
  Box _searchedDataBox;

  SearchedDataApiModel searchedDataApiModelResponse;
  List<Pages> pages = [];
  bool initialized = false;

  SearchDataRepository(this.context) {
    apiServiceHelper = Provider.of<ApiService>(context, listen: false);
  }

  @override
  Future<void> cacheSearchedQueryData(List<Pages> listOfQueries) async {
    // check if already data exists in box and then update new data
    await init();
    List<Pages> updatedPages = [];
    updatedPages.clear();
    await getCachedPages().then((value) async {
      if (value.length > 0) {
        listOfQueries.asMap().forEach((key, newPage) {
          if (value.every((item) =>
              item.title.toLowerCase() != newPage.title.toLowerCase())) {
            updatedPages.add(newPage);
          } else {}
        });
        await _searchedDataBox.addAll(updatedPages);
        print(
            "Added--${updatedPages.length}--${_searchedDataBox.values.length}");
      } else {
        await _searchedDataBox.addAll(listOfQueries);
        print(
            "Added11--${listOfQueries.length}--${_searchedDataBox.values.length}");
      }
    });
  }

  @override
  Future<void> init() async {
    if (!initialized) {
      Hive.registerAdapter(PagesAdapter());
      Hive.registerAdapter(ThumbnailAdapter());
      Hive.registerAdapter(TermsAdapter());
      initialized = true;
    }
    await initBox();
  }

  @override
  initBox() async {
    try {
      if (_searchedDataBox != null && _searchedDataBox.isOpen) {
        _searchedDataBox = Hive.box<Pages>(Constants.searchedDataHiveBoxKey);
      } else {
        _searchedDataBox =
            await Hive.openBox<Pages>(Constants.searchedDataHiveBoxKey);
      }
    } catch (e) {
      _searchedDataBox =
          await Hive.openBox<Pages>(Constants.searchedDataHiveBoxKey);
    }
  }

  @override
  Future<SearchedDataApiModel> getSearchQueryApi(
      {String searchKey = "", String pageLimit = "10"}) async {
    try {
      await apiServiceHelper.getHttp(searchKey).then((response) async {
        searchedDataApiModelResponse = SearchedDataApiModel.fromJson(response);

        await cacheSearchedQueryData(searchedDataApiModelResponse.query.pages);
      });
      return searchedDataApiModelResponse;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<Pages>> getCachedPages() async {
    if (_searchedDataBox != null) {
      pages = _searchedDataBox.values.toList();
    } else {
      pages = [];
    }
    return pages;
  }
}
